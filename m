From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable CROS_EC_PROTO for ChromeOS
 EC mfd driver
Date: Tue, 18 Aug 2015 16:57:29 +0900
Message-ID: <55D2E569.3000800@samsung.com>
References: <1439881281-22054-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33610 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302AbbHRH5k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Aug 2015 03:57:40 -0400
In-reply-to: <1439881281-22054-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Gwendal Grignou <gwendal@chromium.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 18.08.2015 16:01, Javier Martinez Canillas wrote:
> The ChromeOS mfd driver (MFD_CROS_EC) select the CROS_EC_PROTO config
> symbol because the driver uses some communication helper functions in
> drivers/platform/chrome/cros_ec_proto.c but other drivers depends on
> CROS_EC_PROTO instead. Mixing select and depends can lead to circular
> Kconfig dependencies so the MFD_CROS_EC select should be changed to a
> depends on CROS_EC_PROTO instead.
> 
> But doing so will break git bisect-ability since MFD_CROS_EC will not
> be enabled anymore unless the default configs first explicitly enable
> the CROS_EC_PROTO dependency.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)

I saw the discussion about circular dependency but I wasn't following
it. Currently the CROS_EC_PROTO is not user-selectable. How can you
depend on it? How can be enabled on different configs (customized by user)?

Maybe the questions are answered by code in different patches?

Best regards,
Krzysztof


> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 1ff2bfa2e183..537391ea37ac 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -177,6 +177,7 @@ CONFIG_DMADEVICES=y
>  CONFIG_PL330_DMA=y
>  CONFIG_CHROME_PLATFORMS=y
>  CONFIG_CROS_EC_CHARDEV=y
> +CONFIG_CROS_EC_PROTO=y
>  CONFIG_COMMON_CLK_MAX77686=y
>  CONFIG_COMMON_CLK_MAX77802=y
>  CONFIG_COMMON_CLK_S2MPS11=y
> 
