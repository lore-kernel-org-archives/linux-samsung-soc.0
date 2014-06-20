From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V4 01/10] drm/exynos: Move DP setup out of hotplug workqueue
Date: Fri, 20 Jun 2014 13:37:03 +0530
Message-ID: <CAEC9eQOfUw+oiNh8UzTRCyZ1yzuNgc9GVLTHDnJJUqJY7iw07w@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<1402511228-18945-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:54514 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934828AbaFTIHE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 04:07:04 -0400
In-Reply-To: <1402511228-18945-2-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>

ping.

On Wed, Jun 11, 2014 at 11:56 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Move the DP training and video enable from the hotplug handler into
> a seperate function and call the same during dpms ON.
>
> With existing code, DP HPD should be generated just few ms before
> calling enable_irq in dp_poweron.
>
> This patch removes that stringent time constraint.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 5e05dbc..96b4e82 100644
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
