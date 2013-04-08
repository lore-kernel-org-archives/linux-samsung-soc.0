From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Mon, 8 Apr 2013 16:41:54 +0530
Message-ID: <CAKohpokPKzHHML1WhhUNYMz1Q-mJmqbp49K4Jp5Na0kjtuivEQ@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:61073 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762630Ab3DHLLz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 07:11:55 -0400
Received: by mail-ob0-f175.google.com with SMTP id va7so5539212obc.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Apr 2013 04:11:55 -0700 (PDT)
In-Reply-To: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, jy0922.shim@samsung.com, patches@linaro.org, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-media@vger.kernel.org

On 8 April 2013 16:37, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> While migrating to common clock framework (CCF), I found that the FIMD clocks
> were pulled down by the CCF.
> If CCF finds any clock(s) which has NOT been claimed by any of the
> drivers, then such clock(s) are PULLed low by CCF.
>
> Calling clk_prepare() for FIMD clocks fixes the issue.
>
> This patch also replaces clk_disable() with clk_unprepare() during exit, since
> clk_prepare() is called in fimd_probe().

I asked you about fixing your commit log too.. It still looks incorrect to me.

This patch doesn't have anything to do with CCF pulling clocks down, but
calling clk_prepare() before clk_enable() is must now.. that's it..
nothing more.

> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
> Changes since v3:
>         - added clk_prepare() in fimd_probe() and clk_unprepare() in fimd_remove()
>          as suggested by Viresh Kumar <viresh.kumar@linaro.org>
> Changes since v2:
>         - moved clk_prepare_enable() and clk_disable_unprepare() from
>         fimd_probe() to fimd_clock() as suggested by Inki Dae <inki.dae@samsung.com>
> Changes since v1:
>         - added error checking for clk_prepare_enable() and also replaced
>         clk_disable() with clk_disable_unprepare() during exit.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 9537761..aa22370 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -934,6 +934,16 @@ static int fimd_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       ret = clk_prepare(ctx->bus_clk);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = clk_prepare(ctx->lcd_clk);
> +       if  (ret < 0) {
> +               clk_unprepare(ctx->bus_clk);
> +               return ret;
> +       }
> +
>         ctx->vidcon0 = pdata->vidcon0;
>         ctx->vidcon1 = pdata->vidcon1;
>         ctx->default_win = pdata->default_win;
> @@ -981,8 +991,8 @@ static int fimd_remove(struct platform_device *pdev)
>         if (ctx->suspended)
>                 goto out;
>
> -       clk_disable(ctx->lcd_clk);
> -       clk_disable(ctx->bus_clk);
> +       clk_unprepare(ctx->lcd_clk);
> +       clk_unprepare(ctx->bus_clk);

This looks wrong again.. You still need to call clk_disable() to make
clk enabled
count zero...
