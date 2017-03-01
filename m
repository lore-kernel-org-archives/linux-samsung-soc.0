From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: increase
 CONFIG_CMA_SIZE_MBYTES to 96
Date: Wed, 1 Mar 2017 19:09:10 +0200
Message-ID: <20170301170910.4vvn4eeolkjbgzw5@kozik-lap>
References: <20170228191221.18135-1-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170228191221.18135-1-shuahkh@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: linux@armlinux.org.uk, kgene@kernel.org, javier@osg.samsung.com, arnd@arndb.de, cw00.choi@samsung.com, rafael.j.wysocki@intel.com, robie@justgohome.co.uk, b.zolnierkie@samsung.com, viresh.kumar@linaro.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com, a.hajda@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 28, 2017 at 12:12:21PM -0700, Shuah Khan wrote:
> Current CMA size of 64 Mbytes is right on the edge of being small when
> several drivers need to allocate large CMA buffers.
> 
> For example, if the s5p-mfc driver needs to pre-allocate N MiB CMA memory

Everything looks good but I don't get this "N MiB". What do you mean by
that? If N is infinite (or not known) then how do you know that 96 MiB
will be enough?

Best regards,
Krzysztof


> to decode a H.264 1080p video, then there won't be enough CMA memory left
> for other drivers, such as the exynos-drm driver that may need to allocate
> GEM buffers for the display manager.
> 
> Increasing CMA size to 96 Mbytes in exynos_defconfig addresses use-cases
> such as these.
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
> Changes since v1:
> Fix short and long commit log.
> 
> Reason for this patch:
> With the proposed s5p_mfc patch series that pre-allocate buffers, when
> display manager starts, it fails to get GEM buffers.  Increasing the CMA
> size to 96 solved the problem.
> 
>  arch/arm/configs/exynos_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 742baf0..2541414 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -53,7 +53,7 @@ CONFIG_RFKILL_REGULATOR=y
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_DMA_CMA=y
> -CONFIG_CMA_SIZE_MBYTES=64
> +CONFIG_CMA_SIZE_MBYTES=96
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_CRYPTOLOOP=y
>  CONFIG_BLK_DEV_RAM=y
> -- 
> 2.7.4
> 
