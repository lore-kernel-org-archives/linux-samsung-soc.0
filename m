From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH] phy: samsung-usb2: Remove NULL terminating entry from phys
 array
Date: Wed, 04 Mar 2015 15:47:28 +0100
Message-ID: <07b201d0568a$234c4160$69e4c420$%debski@samsung.com>
References: <1425344923.4315.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43509 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755514AbbCDOrb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Mar 2015 09:47:31 -0500
In-reply-to: <1425344923.4315.3.camel@phoenix>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Axel Lin' <axel.lin@ingics.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>
Cc: 'Kukjin Kim' <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

From: Axel Lin [mailto:axel.lin@ingics.com]
Sent: Tuesday, March 03, 2015 2:09 AM
> 
> Current code uses num_phys settings to tell the number of entries in
> phys.
> Thus remove the NULL terminating entry from phys array which is not
> necessary.

The patch looks good.

> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Kamil Debski <k.debski@samsung.com>

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland

> ---
>  drivers/phy/phy-exynos4210-usb2.c | 1 -  drivers/phy/phy-exynos4x12-
> usb2.c | 1 -  drivers/phy/phy-exynos5250-usb2.c | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/phy/phy-exynos4210-usb2.c b/drivers/phy/phy-
> exynos4210-usb2.c
> index 236a52a..f30bbb0 100644
> --- a/drivers/phy/phy-exynos4210-usb2.c
> +++ b/drivers/phy/phy-exynos4210-usb2.c
> @@ -250,7 +250,6 @@ static const struct samsung_usb2_common_phy
> exynos4210_phys[] = {
>  		.power_on	= exynos4210_power_on,
>  		.power_off	= exynos4210_power_off,
>  	},
> -	{},
>  };
> 
>  const struct samsung_usb2_phy_config exynos4210_usb2_phy_config = {
> diff --git a/drivers/phy/phy-exynos4x12-usb2.c b/drivers/phy/phy-
> exynos4x12-usb2.c
> index 0b9de88..765da90 100644
> --- a/drivers/phy/phy-exynos4x12-usb2.c
> +++ b/drivers/phy/phy-exynos4x12-usb2.c
> @@ -361,7 +361,6 @@ static const struct samsung_usb2_common_phy
> exynos4x12_phys[] = {
>  		.power_on	= exynos4x12_power_on,
>  		.power_off	= exynos4x12_power_off,
>  	},
> -	{},
>  };
> 
>  const struct samsung_usb2_phy_config exynos3250_usb2_phy_config = {
> diff --git a/drivers/phy/phy-exynos5250-usb2.c b/drivers/phy/phy-
> exynos5250-usb2.c
> index 1c139aa..2ed1735 100644
> --- a/drivers/phy/phy-exynos5250-usb2.c
> +++ b/drivers/phy/phy-exynos5250-usb2.c
> @@ -391,7 +391,6 @@ static const struct samsung_usb2_common_phy
> exynos5250_phys[] = {
>  		.power_on	= exynos5250_power_on,
>  		.power_off	= exynos5250_power_off,
>  	},
> -	{},
>  };
> 
>  const struct samsung_usb2_phy_config exynos5250_usb2_phy_config = {
> --
> 1.9.1
> 
