From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v3] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Thu, 22 May 2014 23:18:51 +0530
Message-ID: <CAK9yfHxOQ56_eDK7KFgN6ZkX=E=UWqepi74O+Wt0vyzvhPyHFQ@mail.gmail.com>
References: <1400767867-8965-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:33417 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751313AbaEVRsw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 13:48:52 -0400
Received: by mail-oa0-f46.google.com with SMTP id i4so4415064oah.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 10:48:51 -0700 (PDT)
In-Reply-To: <1400767867-8965-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

Hi Rahul,

On 22 May 2014 19:41, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Fimd probe is accessing fimd Registers without enabling the fimd
> gate clocks. If FIMD clocks are kept disabled in Uboot or disbaled
> during kernel boottime, the system hangs during boottime.
>
> This issue got surfaced when verifying with sysmmu enabled. Probe of
> fimd Sysmmu enables the master clock before accessing sysmmu regs and
> then disables. Later fimd probe tries to read the register without
> enabling the clock which is wrong and hangs the system.
>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index bd30d0c..38b77ed 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -898,16 +898,31 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  {
>         struct fimd_context *ctx = fimd_manager.ctx;
>         struct drm_device *drm_dev = data;
> -       int win;
> +       int win, ret;
>
>         fimd_mgr_initialize(&fimd_manager, drm_dev);
>         exynos_drm_crtc_create(&fimd_manager);
>         if (ctx->display)
>                 exynos_drm_create_enc_conn(drm_dev, ctx->display);
>
> +       ret = clk_prepare_enable(ctx->bus_clk);
> +       if (ret) {
> +               dev_err(dev, "bus clock enable failed.\n");
> +               return ret;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->lcd_clk);
> +       if (ret) {
> +               dev_err(dev, "lcd clock enable failed.\n");

Add clk_disable_unprepare(ctx->bus_clk) before returning on error.

> +               return ret;
> +       }
> +
>         for (win = 0; win < WINDOWS_NR; win++)
>                 fimd_clear_win(ctx, win);
>
> +       clk_disable_unprepare(ctx->lcd_clk);
> +       clk_disable_unprepare(ctx->bus_clk);
> +
>         return 0;
>
>  }
> --
> 1.7.9.5
>



-- 
With warm regards,
Sachin
