From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/5] drm: mediatek: add CONFIG_OF dependency
Date: Thu, 19 May 2016 16:55:53 +0200
Message-ID: <573DD3F9.5010702@gmail.com>
References: <1463587653-3035181-1-git-send-email-arnd@arndb.de>
 <1463587653-3035181-3-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33575 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754321AbcESO4B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2016 10:56:01 -0400
In-Reply-To: <1463587653-3035181-3-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org



On 18/05/16 18:07, Arnd Bergmann wrote:
> The mediatek DRM driver can be configured for compile testing with
> CONFIG_OF disabled, but then fails to link:
>
> drivers/gpu/built-in.o: In function `mtk_drm_bind':
> analogix_dp_reg.c:(.text+0x52888): undefined reference to `of_find_device_by_node'
> analogix_dp_reg.c:(.text+0x52930): undefined reference to `of_find_device_by_node'
>
> This adds an explicit Kconfig dependency.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index 545973f6b743..67183e26971d 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -3,6 +3,7 @@ config DRM_MEDIATEK
>   	depends on DRM
>   	depends on ARCH_MEDIATEK || (ARM && COMPILE_TEST)
>   	depends on COMMON_CLK
> +	depends on OF
>   	select DRM_GEM_CMA_HELPER
>   	select DRM_KMS_HELPER
>   	select DRM_MIPI_DSI
>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
