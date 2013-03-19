From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] drm/exynos: enable FIMD clocks
Date: Tue, 19 Mar 2013 15:31:50 +0530
Message-ID: <CAKohpo=wJLq+wZ_yTB_q11440qfpfbA7RJX7OwmWVCGSRXJ4Sg@mail.gmail.com>
References: <1363687193-30893-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:56399 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758Ab3CSKBv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Mar 2013 06:01:51 -0400
Received: by mail-ob0-f182.google.com with SMTP id va7so233297obc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2013 03:01:51 -0700 (PDT)
In-Reply-To: <1363687193-30893-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, jy0922.shim@samsung.com, joshi@samsung.com, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-media@vger.kernel.org

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

Ideally you should check return values here.
