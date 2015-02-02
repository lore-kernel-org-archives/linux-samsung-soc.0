From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] drm/exynos: don' disable hdmi clocks for exynos5420
Date: Mon, 02 Feb 2015 14:34:46 +0900
Message-ID: <54CF0C76.1080107@samsung.com>
References: <54CB4082.1000005@samsung.com>
 <1422654311-24984-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:8446 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219AbbBBFeo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 00:34:44 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ400K53Q5TJ120@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Feb 2015 14:34:41 +0900 (KST)
In-reply-to: <1422654311-24984-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, liquid.acid@gmx.net, kgene@kernel.org, inki.dae@samsung.com, Prathyush K <prathyush.k@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

+Cc dri-devel ML,

Hi,

On 01/31/2015 06:45 AM, Gustavo Padovan wrote:
> From: Prathyush K <prathyush.k@samsung.com>
> 
> When VPLL clock of less than 140 MHz was used and all the three
> clocks - hdmiphy, hdmi, sclk_hdmi are disabled, the system hangs
> during S2R when HDMI is connected. Since we want to use a vpll
> clock of 70.5 MHz, we cannot disable these 3 clocks before suspending.
> This patch moves the clk enable/disable of hdmi and sclk_hdmi
> outside of the pm ops. Now system suspends and resumes with HDMI
> connected with VPLL set at 70.5 MHz.
> 

I think commit messages should be updated because it is different with
prior posting codes.

Thanks.

> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 6aa0d65..0be6921 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -2254,6 +2254,20 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>  	} else
>  		res->reg_hdmi_en = NULL;
>  
> +	/*
> +	 * For these two clocks exynos5420 fails to suspend if VPLL clock of
> +	 * 70.5 MHz is used and these clocks are disabled before suspend. So
> +	 * enable them here.
> +	 * Note that this will keep the clocks enabled for the entire
> +	 * lifetime of the driver and waste energy when it is suspended.
> +	 * However it prevents the system crash until a better solution is
> +	 * found
> +	 */
> +	if (of_machine_is_compatible("samsung,exynos5420")) {

I'm not sure it's ok to use SoC compatible in driver and doesn't
exynos5800 also have same issue?

How about just use driver_data?

Thanks.

> +		clk_prepare_enable(res->sclk_hdmi);
> +		clk_prepare_enable(res->hdmi);
> +	}
> +
>  	return ret;
>  fail:
>  	DRM_ERROR("HDMI resource init - failed\n");
> @@ -2516,6 +2530,11 @@ static int hdmi_remove(struct platform_device *pdev)
>  	if (hdata->res.reg_hdmi_en)
>  		regulator_disable(hdata->res.reg_hdmi_en);
>  
> +	if (of_machine_is_compatible("samsung,exynos5420")) {
> +		clk_disable_unprepare(hdata->res.sclk_hdmi);
> +		clk_disable_unprepare(hdata->res.hdmi);
> +	}
> +
>  	if (hdata->hdmiphy_port)
>  		put_device(&hdata->hdmiphy_port->dev);
>  	put_device(&hdata->ddc_adpt->dev);
> 
