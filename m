From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 4/4] PM / devfreq: Consider hibernation in pm notifier
Date: Tue, 19 Nov 2013 15:50:05 +0100
Message-ID: <27161890.Zx6CiZOMr8@amdc1032>
References: <1384867831-15383-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57031 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752427Ab3KSOuM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Nov 2013 09:50:12 -0500
In-reply-to: <1384867831-15383-1-git-send-email-jhbird.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonghwan Choi <jhbird.choi@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>


Hi,

Are you planning to add hibernation support to ARM?

If so then this should be stated somewhere in the patch description.

OTOH if you are not going to add hibernation support to ARM I see
a little sense in adding hibernation support to ARM-only drivers..

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

On Tuesday, November 19, 2013 10:30:31 PM Jonghwan Choi wrote:
> Frequency lock should be considered in suspend/hibernation.
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  drivers/devfreq/exynos/exynos5_bus.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/devfreq/exynos/exynos5_bus.c b/drivers/devfreq/exynos/exynos5_bus.c
> index a60da3c..bd672de0 100644
> --- a/drivers/devfreq/exynos/exynos5_bus.c
> +++ b/drivers/devfreq/exynos/exynos5_bus.c
> @@ -268,6 +268,7 @@ static int exynos5_busfreq_int_pm_notifier_event(struct notifier_block *this,
>  	int err = 0;
>  
>  	switch (event) {
> +	case PM_HIBERNATION_PREPARE:
>  	case PM_SUSPEND_PREPARE:
>  		/* Set Fastest and Deactivate DVFS */
>  		mutex_lock(&data->lock);
> @@ -300,6 +301,7 @@ unlock:
>  		if (err)
>  			return NOTIFY_BAD;
>  		return NOTIFY_OK;
> +	case PM_POST_HIBERNATION:
>  	case PM_POST_RESTORE:
>  	case PM_POST_SUSPEND:
>  		/* Reactivate */
