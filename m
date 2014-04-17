From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCHv3 1/5] drm: exynos: hdmi: remove usage of struct
 s5p_hdmi_platform_data
Date: Thu, 17 Apr 2014 10:54:47 +0900
Message-ID: <534F3467.1070707@samsung.com>
References: <1397661178-6016-1-git-send-email-t.stanislaws@samsung.com>
 <1397661178-6016-2-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22600 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbaDQByk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 21:54:40 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4500AALJZ2L6A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Apr 2014 10:54:38 +0900 (KST)
In-reply-to: <1397661178-6016-2-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: m.chehab@samsung.com, robh+dt@kernel.org, inki.dae@samsung.com, kyungmin.park@samsung.com, sw0312.kim@samsung.com, t.figa@samsung.com, b.zolnierkie@samsung.com, rahul.sharma@samsung.com, pawel.moll@arm.com, l.stach@pengutronix.de

Hi Tomasz,

On 04/17/2014 12:12 AM, Tomasz Stanislawski wrote:
> This patch continues shift of DRM EXYNOS to DT-only configuration.
> The usage of the old structure for HDMI's platform data is
> removed.
>
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> ---
>   drivers/gpu/drm/exynos/exynos_hdmi.c |   30 ++++++++----------------------
>   1 file changed, 8 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 9a6d652..482ca77 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -43,7 +43,6 @@
>   #include "exynos_mixer.h"
>   
>   #include <linux/gpio.h>
> -#include <media/s5p_hdmi.h>
>   
>   #define get_hdmi_display(dev)	platform_get_drvdata(to_platform_device(dev))
>   #define ctx_from_connector(c)	container_of(c, struct hdmi_context, connector)
> @@ -2011,28 +2010,18 @@ fail:
>   	return -ENODEV;
>   }
>   
> -static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
> -					(struct device *dev)
> +static int drm_hdmi_dt_parse(struct hdmi_context *hdata, struct device_node *np)
>   {
> -	struct device_node *np = dev->of_node;
> -	struct s5p_hdmi_platform_data *pd;
>   	u32 value;
>   
> -	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> -	if (!pd)
> -		goto err_data;
> -
>   	if (!of_find_property(np, "hpd-gpio", &value)) {
>   		DRM_ERROR("no hpd gpio property found\n");
> -		goto err_data;
> +		return -ENOENT;
>   	}
>   
> -	pd->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
> -
> -	return pd;
> +	hdata->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
>   
> -err_data:
> -	return NULL;
> +	return 0;
>   }
>   
>   static struct of_device_id hdmi_match_types[] = {
> @@ -2051,7 +2040,6 @@ static int hdmi_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct hdmi_context *hdata;
> -	struct s5p_hdmi_platform_data *pdata;
>   	struct resource *res;
>   	const struct of_device_id *match;
>   	struct device_node *ddc_node, *phy_node;
> @@ -2061,14 +2049,14 @@ static int hdmi_probe(struct platform_device *pdev)
>   	 if (!dev->of_node)
>   		return -ENODEV;
>   
> -	pdata = drm_hdmi_dt_parse_pdata(dev);
> -	if (!pdata)
> -		return -EINVAL;
> -
>   	hdata = devm_kzalloc(dev, sizeof(struct hdmi_context), GFP_KERNEL);
>   	if (!hdata)
>   		return -ENOMEM;
>   
> +	ret = drm_hdmi_dt_parse(hdata, dev->of_node);
> +	if (ret)
> +		return -EINVAL;

It's better to return ret value.
