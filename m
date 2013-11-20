From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 3/4] PM / devfreq: Consider hibernation in pm notifier
Date: Wed, 20 Nov 2013 18:45:51 +0900
Message-ID: <CAJ0PZbS0WKExdEmW2yepbMQWw=eeZXL8KykTMLqvKN2rCqJDuw@mail.gmail.com>
References: <1384867809-15332-1-git-send-email-jhbird.choi@samsung.com>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:58859 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751080Ab3KTJpw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Nov 2013 04:45:52 -0500
In-Reply-To: <1384867809-15332-1-git-send-email-jhbird.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonghwan Choi <jhbird.choi@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, Jonghwan Choi <jhbird.choi@samsung.com>

On Tue, Nov 19, 2013 at 10:30 PM, Jonghwan Choi <jhbird.choi@gmail.com> wrote:
> Frequency lock should be considered in suspend/hibernation.
>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>

Applied in "driver-update" branch.

Do you want this to be synchronously merged with others (1/4, 2/4) or
is it ok to be done asynchronously?


Cheers,
MyungJoo.

> ---
>  drivers/devfreq/exynos/exynos4_bus.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/devfreq/exynos/exynos4_bus.c b/drivers/devfreq/exynos/exynos4_bus.c
> index cede6f7..dd6947e 100644
> --- a/drivers/devfreq/exynos/exynos4_bus.c
> +++ b/drivers/devfreq/exynos/exynos4_bus.c
> @@ -962,6 +962,7 @@ static int exynos4_busfreq_pm_notifier_event(struct notifier_block *this,
>         int err = 0;
>
>         switch (event) {
> +       case PM_HIBERNATION_PREPARE:
>         case PM_SUSPEND_PREPARE:
>                 /* Set Fastest and Deactivate DVFS */
>                 mutex_lock(&data->lock);
> @@ -1005,6 +1006,7 @@ unlock:
>                 if (err)
>                         return err;
>                 return NOTIFY_OK;
> +       case PM_POST_HIBERNATION:
>         case PM_POST_RESTORE:
>         case PM_POST_SUSPEND:
>                 /* Reactivate */
> --
> 1.8.1.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
MyungJoo Ham, Ph.D.
System S/W Lab, S/W Center, Samsung Electronics
