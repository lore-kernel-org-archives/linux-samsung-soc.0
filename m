From: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH] drm/exynos: add CONFIG_MMU dependency
Date: Mon, 8 Jul 2019 15:09:04 +0100
Message-ID: <ea185bd7-3ac7-dc38-1c0e-78cb1cffa6a0@arm.com>
References: <20190708134707.538501-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708134707.538501-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 7/8/19 2:46 PM, Arnd Bergmann wrote:
> Compile-testing this driver on a NOMMU configuration shows a link failure:
> 
> drivers/gpu/drm/exynos/exynos_drm_gem.o: In function `exynos_drm_gem_fault':
> exynos_drm_gem.c:(.text+0x484): undefined reference to `vmf_insert_mixed'
> 
> Add a CONFIG_MMU dependency to ensure we only enable this in configurations
> that build correctly.
> 
> Many other drm drivers have the same dependency. It would be nice to
> make this work in MMU-less configurations, but evidently nobody has
> ever needed this so far.
> 
> Fixes: 156bdac99061 ("drm/exynos: trigger build of all modules")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/exynos/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 60ce4a8ad9e1..6f7d3b3b3628 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -2,6 +2,7 @@
>  config DRM_EXYNOS
>  	tristate "DRM Support for Samsung SoC EXYNOS Series"
>  	depends on OF && DRM && (ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST)
> +	depends on MMU
>  	select DRM_KMS_HELPER
>  	select VIDEOMODE_HELPERS
>  	select SND_SOC_HDMI_CODEC if SND_SOC
> 

I seen

ERROR: "vmf_insert_mixed" [drivers/gpu/drm/exynos/exynosdrm.ko] undefined!

with older kernels when driver was build as a module, so FWIW

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

Cheers
Vladimir
