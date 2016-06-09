From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig add CONFIG_EXYNOS_IOMMU in not set
 mode
Date: Thu, 09 Jun 2016 07:04:06 +0200
Message-ID: <5758F8C6.2090700@samsung.com>
References: <1465406523-7075-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40206 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354AbcFIFEN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2016 01:04:13 -0400
In-reply-to: <1465406523-7075-1-git-send-email-shuahkh@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>, linux@armlinux.org.uk, kgene@kernel.org, javier@osg.samsung.com, linux.amoon@gmail.com, m.szyprowski@samsung.com, treding@nvidia.com, b.zolnierkie@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/08/2016 07:22 PM, Shuah Khan wrote:
> Add CONFIG_EXYNOS_IOMMU in not set mode to make it easier to enable it.

Hmmm... How does it make it easier? Enabling such item is just adding
new line, so what is the problem solved here?

Anyway the line will disappear on first savedefconfig (because it should
not be there...) so there is really no point of it.

Best regards,
Krzysztof

> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index daf9762..16c2957 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -218,6 +218,7 @@ CONFIG_CROS_EC_CHARDEV=y
>  CONFIG_COMMON_CLK_MAX77686=y
>  CONFIG_COMMON_CLK_MAX77802=y
>  CONFIG_COMMON_CLK_S2MPS11=y
> +# CONFIG_EXYNOS_IOMMU is not set
>  CONFIG_EXTCON=y
>  CONFIG_EXTCON_MAX14577=y
>  CONFIG_EXTCON_MAX77693=y
