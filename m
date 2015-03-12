From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] ARM: exynos_defconfig: Enable ChromeOS EC chardev
 driver
Date: Thu, 12 Mar 2015 20:51:22 +0900
Message-ID: <028e01d05cba$dc874770$9595d650$@kernel.org>
References: <1425741262-8278-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43990 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753519AbbCLLvc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Mar 2015 07:51:32 -0400
In-reply-to: <1425741262-8278-1-git-send-email-javier.martinez@collabora.co.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Kukjin Kim' <kgene@kernel.org>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Doug Anderson' <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Javier Martinez Canillas wrote:
> 
> Exynos Chromebooks have an Embedded Controller known as the ChromeOS EC
> Enable the driver that provides an interface to access from user-space.
> 
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/configs/exynos_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 3d22aae39a83..14fa9f05f768 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -173,6 +173,8 @@ CONFIG_RTC_DRV_S5M=y
>  CONFIG_RTC_DRV_S3C=y
>  CONFIG_DMADEVICES=y
>  CONFIG_PL330_DMA=y
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC_CHARDEV=y
>  CONFIG_COMMON_CLK_MAX77686=y
>  CONFIG_COMMON_CLK_MAX77802=y
>  CONFIG_COMMON_CLK_S2MPS11=y
> --

OK, will apply.

Thanks,
Kukjin
