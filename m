From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/4] cpufreq: exynos: Consider hibernation in pm notifier
Date: Tue, 19 Nov 2013 20:02:56 +0530
Message-ID: <CAKohpo=kELQ+7pcWkTYnDOds8YktQMD4F-=gL3jywaWfNe6CNA@mail.gmail.com>
References: <1384867758-15276-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:37687 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752199Ab3KSOc5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Nov 2013 09:32:57 -0500
Received: by mail-ob0-f170.google.com with SMTP id wp18so3989990obc.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Nov 2013 06:32:56 -0800 (PST)
In-Reply-To: <1384867758-15276-1-git-send-email-jhbird.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonghwan Choi <jhbird.choi@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kukjin Kim <kgene.kim@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jonghwan Choi <jhbird.choi@samsung.com>

On 19 November 2013 18:59, Jonghwan Choi <jhbird.choi@gmail.com> wrote:
> Frequency lock should be considered in suspend/hibernation.

These could turn out to be important logs for future. Please write
with more effort..

> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  drivers/cpufreq/exynos-cpufreq.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
> index f3c2287..cd05b0a 100644
> --- a/drivers/cpufreq/exynos-cpufreq.c
> +++ b/drivers/cpufreq/exynos-cpufreq.c
> @@ -187,6 +187,7 @@ static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
>         int ret;
>
>         switch (pm_event) {
> +       case PM_HIBERNATION_PREPARE:
>         case PM_SUSPEND_PREPARE:
>                 mutex_lock(&cpufreq_lock);
>                 frequency_locked = true;
> @@ -198,6 +199,8 @@ static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
>
>                 break;
>
> +       case PM_POST_HIBERNATION:
> +       case PM_POST_RESTORE:
>         case PM_POST_SUSPEND:
>                 mutex_lock(&cpufreq_lock);
>                 frequency_locked = false;

@Rafael: So we have few more drivers which are already doing such
stuff (even tegra as well)..
