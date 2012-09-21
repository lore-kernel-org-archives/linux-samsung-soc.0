From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: Re: [PATCH V2] drm/exynos: Add match table for drm platform device
Date: Fri, 21 Sep 2012 13:20:55 +0100
Message-ID: <505C5BA7.6020302@st.com>
References: <1348252661-6983-1-git-send-email-l.krishna@samsung.com>
Reply-To: srinivas.kandagatla@st.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137]:36230 "EHLO
	eu1sys200aog114.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752084Ab2IUMYZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 08:24:25 -0400
In-Reply-To: <1348252661-6983-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, kgene.kim@samsung.com, jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org

On 21/09/12 19:37, Leela Krishna Amudala wrote:
> This patch is a part of moving the driver to support DT style probing
> of exynos drm device. The compatible name should match with the
> entry in the dtsi file.
>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index d070719..495be89 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -294,12 +294,23 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id drm_device_dt_match[] = {
> +	{ .compatible = "samsung,exynos-drm-device"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, drm_device_dt_match);
> +#else
> +#define drm_device_dt_match NULL
> +#endif

No need of else here as you are using of_match_ptr.

> +
>  static struct platform_driver exynos_drm_platform_driver = {
>  	.probe		= exynos_drm_platform_probe,
>  	.remove		= __devexit_p(exynos_drm_platform_remove),
>  	.driver		= {
>  		.owner	= THIS_MODULE,
>  		.name	= "exynos-drm",
> +		.of_match_table = of_match_ptr(drm_device_dt_match),
>  	},
>  };
>  
