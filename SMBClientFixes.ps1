Set-SmbClientConfiguration -EnableBandwidthThrottling 0 -Force
Set-SmbClientConfiguration -FileInfoCacheLifetime 0 -Force
Set-SmbClientConfiguration -DirectoryCacheLifetime 0 -Force
Set-SmbClientConfiguration -EnableLargeMtu 1 -Force