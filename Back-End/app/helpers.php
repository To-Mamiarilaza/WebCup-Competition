<?php

if (!function_exists('custom_asset')) {
    /**
     * Generate a URL to a custom asset using index.php if needed.
     *
     * @param  string  $path
     * @return string
     */
    function custom_asset($path)
    {
        $index = env('INDEX_PHP', false);

        if ($index && $index !== 'false') {
            return asset("index.php/$path");
        }

        return asset($path);
    }
}
