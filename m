From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] drivers: phy: exynos4x12-phy: Add missing MODULE_DEVICE_TABLE
Date: Wed, 2 Jul 2014 14:20:27 +0530
Message-ID: <53B3C7D3.2010108@ti.com>
References: <1404287322-25730-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:39856 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752814AbaGBIux (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 04:50:53 -0400
In-Reply-To: <1404287322-25730-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-samsung-soc@vger.kernel.org
Cc: Kamil Debski <k.debski@samsung.com>

Hi,

On Wednesday 02 July 2014 01:18 PM, Sjoerd Simons wrote:

Please add a commit log here describing what your patch does and why you need it.

Cheers
Kishon
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>  drivers/phy/phy-samsung-usb2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-samsung-usb2.c
> index 8a8c6bc..1e69a32 100644
> --- a/drivers/phy/phy-samsung-usb2.c
> +++ b/drivers/phy/phy-samsung-usb2.c
> @@ -107,6 +107,7 @@ static const struct of_device_id samsung_usb2_phy_of_match[] = {
>  #endif
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, samsung_usb2_phy_of_match);
>  
>  static int samsung_usb2_phy_probe(struct platform_device *pdev)
>  {
> 
