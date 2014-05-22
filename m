From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Thu, 22 May 2014 11:51:26 +0530
Message-ID: <CAK9yfHz4DxG-Ey7HieMU9t32arXMDGYn1JXe0g8LNGpNYV6KaQ@mail.gmail.com>
References: <1400735767-5905-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:54363 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751946AbaEVGV1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 02:21:27 -0400
Received: by mail-ob0-f179.google.com with SMTP id vb8so3351004obc.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 23:21:26 -0700 (PDT)
In-Reply-To: <1400735767-5905-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

Hi Rahul,

On 22 May 2014 10:46, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
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
> Rebased on exynos-drm-next branch.
>
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 173ee97..a79ba0a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -891,9 +891,15 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>         if (ctx->display)
>                 exynos_drm_create_enc_conn(drm_dev, ctx->display);
>
> +       clk_prepare_enable(ctx->bus_clk);

Probably a check for its success?

> +       clk_prepare_enable(ctx->lcd_clk);

ditto.

-- 
With warm regards,
Sachin
