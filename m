From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH] drm/exynos: Make exynos_drm_init() call late during the bootup
Date: Wed, 21 May 2014 12:09:37 +0530
Message-ID: <CAHfPSqAEF=1Ky81=AWqGeR8kxQ=vyNfb6SLzZubDds2EmEmtGg@mail.gmail.com>
References: <1400067585-31236-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:41241 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbaEUGj6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 02:39:58 -0400
Received: by mail-qg0-f42.google.com with SMTP id q107so2538740qgd.29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 May 2014 23:39:58 -0700 (PDT)
In-Reply-To: <1400067585-31236-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: dri-devel@lists.freedesktop.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, seanpaul@chromium.org, inki.dae@samsung.com, dianders@chromium.org, sjg@chromium.org, Kukjin Kim <kgene.kim@samsung.com>, broonie@kernel.org

Hello Everyone,

On 14 May 2014 17:09, Naveen Krishna Chatradhi <ch.naveen@samsung.com> wrote:
> exynos_drm_init() does probing of various drivers like dp_panel,
> hdmi, fimd, mixer, etc in an order and finally binds them together.
>
> Some of the drm devices (Eg: dp_panel) try to do regulator_get()
> and enable few supplies during their probe.
> Chances are that, these devices may get probed before the respective
> supply/PMIC is hooked.  In such cases, dp_panel would continue with
> "dummy regulator". Which is not what the system wants.
>
> Lets give the core connectivity and regulators modules some time
> to hookup the supplies before Exynos DRM devices comes into picture.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> This change is proposed after
> 1. Discussing with I2C/SPI & DMA subsystem maintainers and Others
>    @ https://lkml.org/lkml/2014/5/9/333
>    Trying to change the I2C, SPI and DMA drivers as subsys_initcall()
>    Which was strictly opposed, as a flaw was found in DRM subsystem.
>
> 2. -EPROBE_DEFER won't work well with the current sequency of
>     platform_driver_register()s in exynos_drm_init()
>
> 3. bridge_panel mechanism is under RFC and no conclusions were drawn yet.
>
> We should be able to probe each DRM device independently and let PROBE_DEFER
> take care of dependencies. But, this could cause lot of bootup time.
>
> late_initcall() of DRM works well and fixes all the above issues for now.
> Kindly suggest, if an alternative/better mechanism is out there.
>
> Thanks,
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 4cef88f..78c185a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -692,7 +692,7 @@ static void exynos_drm_exit(void)
>         platform_driver_unregister(&exynos_drm_platform_driver);
>  }
>
> -module_init(exynos_drm_init);
> +late_initcall(exynos_drm_init);
>  module_exit(exynos_drm_exit);
>
>  MODULE_AUTHOR("Inki Dae <inki.dae@samsung.com>");
Kindly, show some light on this change.
Also adding more reviewers.
> --
> 1.7.9.5
>



-- 
Shine bright,
(: Nav :)
