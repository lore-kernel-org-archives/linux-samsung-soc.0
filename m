From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] ARM: exynos_defconfig: Enable max77802 rtc and clock
 drivers
Date: Tue, 28 Oct 2014 20:06:40 +0900
Message-ID: <04e101cff29f$4021ea00$c065be00$@kernel.org>
References: <1414401440-10972-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63186 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753425AbaJ1LGn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 07:06:43 -0400
In-reply-to: <1414401440-10972-1-git-send-email-javier.martinez@collabora.co.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Kevin Hilman' <khilman@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Javier Martinez Canillas wrote:
> 
Hi,

> Commit 6e80e3d87549 ("ARM: exynos_defconfig: Enable MAX77802")
> enabled support for the max77802 regulators but the PMIC also
> has a Real-Time-Clock (RTC) and 2-channel 32kHz clock outputs.
> 
Yes, right.

> Enable the kernel config options to have the drivers for these
> devices built-in since they are present in many Exynos boards.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Acked-by: Kevin Hilman <khilman@linaro.org>
> Tested-by: Kevin Hilman <khilman@linaro.org>
> ---
> 
> This patch supersedes [0] since commit "ARM: exynos_defconfig: savedefconfig"
> is not present in linux-next anymore which disabled among other options, the
> max77802 support.
> 
Yeah, I talked about savedefconfig with Bart and I decided to revert it at that
time.

> However, support for the max77802 rtc and clocks were not enabled on exynos
> defconfig so $subject is still needed.
> 
> Kevin, I carried your tags from [0] since $subject enables the options you
> needed to get RTC wakeup from suspend working on exynos5800-peach-pi. Please
> let me know if they no longer applies.
> 
> Best regards,
> Javier
> 
> [0]: https://lkml.org/lkml/2014/10/9/413
> 
>  arch/arm/configs/exynos_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 72058b8..e21ef83 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -142,11 +142,13 @@ CONFIG_MMC_DW_IDMAC=y
>  CONFIG_MMC_DW_EXYNOS=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_MAX77686=y
> +CONFIG_RTC_DRV_MAX77802=y
>  CONFIG_RTC_DRV_S5M=y
>  CONFIG_RTC_DRV_S3C=y
>  CONFIG_DMADEVICES=y
>  CONFIG_PL330_DMA=y
>  CONFIG_COMMON_CLK_MAX77686=y
> +CONFIG_COMMON_CLK_MAX77802=y
>  CONFIG_COMMON_CLK_S2MPS11=y
>  CONFIG_EXYNOS_IOMMU=y
>  CONFIG_IIO=y
> --
> 2.1.0

I'll apply this, thanks.

- Kukjin
