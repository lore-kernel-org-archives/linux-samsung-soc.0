From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 2/7] drm/exynos: remove dummy hdmiphy clock
Date: Tue, 3 Sep 2013 11:58:02 -0400
Message-ID: <CAOw6vbKT9R2Cyz8F0ND2K71MvBJ3Zu1y8uCw6Cka2iLxgB54QA@mail.gmail.com>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com> <1377845974-28373-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:50791 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756945Ab3ICP6Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 11:58:25 -0400
Received: by mail-ob0-f174.google.com with SMTP id wd6so5986665obb.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 08:58:25 -0700 (PDT)
Received: by mail-ob0-f173.google.com with SMTP id ta17so6002868obb.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 08:58:22 -0700 (PDT)
In-Reply-To: <1377845974-28373-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, InKi Dae <inki.dae@samsung.com>, l.stach@pengutronix.de, Tomasz Figa <tomasz.figa@gmail.com>, s.nawrocki@samsung.com, sunil joshi <joshi@samsung.com>, "r.sh.open" <r.sh.open@gmail.com>

On Fri, Aug 30, 2013 at 2:59 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> hdmiphy is a dummy clock which actually controls the PMU bit
> to enable/disbale hdmiphy (before CCF). This clock is cleaned

s/disbale/disable/

> from the hdmi driver.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c |    8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 3af4e4c..cd1d921 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -84,7 +84,6 @@ struct hdmi_resources {
>         struct clk                      *sclk_hdmi;
>         struct clk                      *sclk_pixel;
>         struct clk                      *sclk_hdmiphy;
> -       struct clk                      *hdmiphy;
>         struct clk                      *mout_hdmi;
>         struct regulator_bulk_data      *regul_bulk;
>         int                             regul_count;
> @@ -1431,7 +1430,6 @@ static void hdmi_poweron(struct hdmi_context *hdata)
>         if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
>                 DRM_DEBUG_KMS("failed to enable regulator bulk\n");
>
> -       clk_prepare_enable(res->hdmiphy);
>         clk_prepare_enable(res->hdmi);
>         clk_prepare_enable(res->sclk_hdmi);
>
> @@ -1456,7 +1454,6 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
>
>         clk_disable_unprepare(res->sclk_hdmi);
>         clk_disable_unprepare(res->hdmi);
> -       clk_disable_unprepare(res->hdmiphy);
>         regulator_bulk_disable(res->regul_count, res->regul_bulk);
>
>         mutex_lock(&hdata->hdmi_mutex);
> @@ -1549,11 +1546,6 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>                 DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
>                 goto fail;
>         }
> -       res->hdmiphy = devm_clk_get(dev, "hdmiphy");
> -       if (IS_ERR(res->hdmiphy)) {
> -               DRM_ERROR("failed to get clock 'hdmiphy'\n");
> -               goto fail;
> -       }
>         res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
>         if (IS_ERR(res->mout_hdmi)) {
>                 DRM_ERROR("failed to get clock 'mout_hdmi'\n");
> --
> 1.7.10.4
>
