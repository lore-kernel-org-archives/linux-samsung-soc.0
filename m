From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] phy: phy-exynos-pcie: fix the wrong error return
Date: Thu, 9 Mar 2017 13:43:47 +0530
Message-ID: <58C10EBB.1030107@ti.com>
References: <CGME20170308082244epcas1p4e6509812a97b0bc9912b3deb296bae38@epcas1p4.samsung.com>
 <20170308082242.15915-1-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:34123 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752526AbdCIIOA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Mar 2017 03:14:00 -0500
In-Reply-To: <20170308082242.15915-1-jh80.chung@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, linux-kernel@vger.kernel.org
Cc: krzk@kernel.org, kgene@kernel.org, javier@osg.samsung.com, linux-samsung-soc@vger.kernel.org



On Wednesday 08 March 2017 01:52 PM, Jaehoon Chung wrote:
> When it doesn't get the blk_base's resource, it was returned
> the error about phy_base, not blk_base.
> This patch is for fixing the wrong error return about blk_base.
> 
> Fixes: cf0adb8e281b ("phy: phy-exynos-pcie: Add support for Exynos PCIe PHY")
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>

merged, thanks.

-Kishon
> ---
>  drivers/phy/phy-exynos-pcie.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/phy-exynos-pcie.c b/drivers/phy/phy-exynos-pcie.c
> index 4f60b83..60baf25 100644
> --- a/drivers/phy/phy-exynos-pcie.c
> +++ b/drivers/phy/phy-exynos-pcie.c
> @@ -254,8 +254,8 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	exynos_phy->blk_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(exynos_phy->phy_base))
> -		return PTR_ERR(exynos_phy->phy_base);
> +	if (IS_ERR(exynos_phy->blk_base))
> +		return PTR_ERR(exynos_phy->blk_base);
>  
>  	exynos_phy->drv_data = drv_data;
>  
> 
