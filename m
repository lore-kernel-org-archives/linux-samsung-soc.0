From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] drm/exynos: enable FIMD clocks
Date: Tue, 19 Mar 2013 17:27:15 +0530
Message-ID: <CAK9yfHws6SMuYJN6Vw9MLWf_USK13GHRdtW+e1H8XH4oDDJd=A@mail.gmail.com>
References: <1363687193-30893-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:48551 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071Ab3CSL5P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 07:57:15 -0400
Received: by mail-ob0-f173.google.com with SMTP id dn14so321194obc.32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2013 04:57:15 -0700 (PDT)
In-Reply-To: <1363687193-30893-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, kgene.kim@samsung.com, joshi@samsung.com, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, jy0922.shim@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org

On 19 March 2013 15:29, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> While migrating to common clock framework (CCF), found that the FIMD clocks
> were pulled down by the CCF.
> If CCF finds any clock(s) which has NOT been claimed by any of the
> drivers, then such clock(s) are PULLed low by CCF.
>
> By calling clk_prepare_enable() for FIMD clocks fixes the issue.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 9537761..d93dd8a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -934,6 +934,9 @@ static int fimd_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       clk_prepare_enable(ctx->lcd_clk);
> +       clk_prepare_enable(ctx->bus_clk);
> +

You also need to do clk_disable_unprepare during exit.
