From: Sean Paul <seanpaul@google.com>
Subject: Re: [RESEND PATCH V5 01/12] drm/exynos: Move DP setup out of hotplug workqueue
Date: Tue, 22 Jul 2014 10:59:47 -0400
Message-ID: <CAOw6vbKeUCoWutYS3ZpFdu6aKXGPyQVvBe_PbGgmTMZHGvjc=w@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com> <1405629839-12086-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:44459 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751105AbaGVPAI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 11:00:08 -0400
Received: by mail-ie0-f181.google.com with SMTP id rp18so7849242iec.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jul 2014 08:00:07 -0700 (PDT)
In-Reply-To: <1405629839-12086-2-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Ajay kumar <ajaynumb@gmail.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, javier@dowhile0.org, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@google.com>

On Thu, Jul 17, 2014 at 4:43 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Move the DP training and video enable from the hotplug handler into
> a seperate function and call the same during dpms ON.
>
> With existing code, DP HPD should be generated just few ms before
> calling enable_irq in dp_poweron.
>
> This patch removes that stringent time constraint.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>


This looks eerily familiar to:
https://chromium-review.googlesource.com/#/c/65782/

In fact, I think it's probably better to do this in commit, rather than poweron.

Sean


> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 845d766..a94b114 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -875,10 +875,18 @@ static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
>  static void exynos_dp_hotplug(struct work_struct *work)
>  {
>         struct exynos_dp_device *dp;
> -       int ret;
>
>         dp = container_of(work, struct exynos_dp_device, hotplug_work);
>
> +       if (dp->drm_dev)
> +               drm_helper_hpd_irq_event(dp->drm_dev);
> +}
> +
> +static void exynos_dp_setup(void *in_ctx)
> +{
> +       struct exynos_dp_device *dp = in_ctx;
> +       int ret;
> +
>         ret = exynos_dp_detect_hpd(dp);
>         if (ret) {
>                 /* Cable has been disconnected, we're done */
> @@ -1059,6 +1067,7 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
>         exynos_dp_phy_init(dp);
>         exynos_dp_init_dp(dp);
>         enable_irq(dp->irq);
> +       exynos_dp_setup(dp);
>  }
>
>  static void exynos_dp_poweroff(struct exynos_dp_device *dp)
> --
> 1.7.9.5
>
