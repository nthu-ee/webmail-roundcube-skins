<?php

$version = '20191014a';

$docRoot = $_SERVER['DOCUMENT_ROOT'] ?? '';
$rcRoot = \realpath(__DIR__ . '/../../..');
$manualRoot = \realpath(__DIR__ . '/..');

/**
 * Make a URL versionized for preventing from being cached.
 *
 * @param string $url the url
 *
 * @return string
 */
function assetVersioned(string $url): string
{
    global $version, $docRoot, $manualRoot;

    // local file
    if (\strpos($url, '//') === false) {
        $v = \strpos($url, '/') !== 0
            // relative to manual root dir
            ? @\filemtime("{$manualRoot}/{$url}")
            // relative to doc root dir
            : @\filemtime("{$docRoot}/{$url}");

        // fail to get file modified time
        $v = $v ?: $version;
    }
    // remote file
    else {
        $v = $version;
    }

    $parts = \parse_url($url);

    $queries = proper_parse_str($parts['query'] ?? '');
    $queries['v'] = $v;

    $parts['query'] = \http_build_query($queries);

    return build_url($parts);
}

/**
 * Parse the query string into an associated map.
 *
 * @param string $str         the string
 * @param bool   $ignoreEmpty ignore empty value
 *
 * @return array
 */
function proper_parse_str(string $str, bool $ignoreEmpty = true): array
{
    $arr = [];

    foreach (\explode('&', $str) as $pair) {
        $kv = \explode('=', $pair, 2);

        // only has key but no value
        if (\count($kv) < 2) {
            if (!$ignoreEmpty && $kv[0] !== '') {
                $arr[$kv[0]] = '';
            }

            continue;
        }

        [$k, $v] = $kv;

        if (isset($arr[$k])) {
            if (\is_array($arr[$k])) {
                $arr[$k][] = $v;
            } else {
                $arr[$k] = [$arr[$k], $v];
            }
        } else {
            $arr[$k] = $v;
        }
    }

    return $arr;
}

/**
 * Builds an url. Doing the reverse job of parse_url().
 *
 * @param array $parts the parts
 *
 * @return string the url
 */
function build_url(array $parts): string
{
    return
        (isset($parts['scheme']) ? "{$parts['scheme']}:" : '') .
        (isset($parts['user']) || isset($parts['host']) ? '//' : '') .
        ($parts['user'] ?? '') .
        (isset($parts['pass']) ? ":{$parts['pass']}" : '') .
        (isset($parts['user']) ? '@' : '') .
        ($parts['host'] ?? '') .
        (isset($parts['port']) ? ":{$parts['port']}" : '') .
        ($parts['path'] ?? '') .
        (isset($parts['query']) ? "?{$parts['query']}" : '') .
        (isset($parts['fragment']) ? "#{$parts['fragment']}" : '');
}
