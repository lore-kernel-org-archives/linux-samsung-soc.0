From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Build error at drivers/base/power/domain_governor.c when
 PM_RUNTIME is not set
Date: Thu, 12 Jan 2012 16:51:36 +0900
Message-ID: <02b301ccd0ff$02b8dfd0$082a9f70$%kim@samsung.com>
References: <018a01ccce67$a6eee850$f4ccb8f0$%kim@samsung.com>
 <201201092314.20561.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37394 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752685Ab2ALHvl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jan 2012 02:51:41 -0500
In-reply-to: <201201092314.20561.rjw@sisk.pl>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'Rafael J. Wysocki'" <rjw@sisk.pl>
Cc: linux-kernel@vger.kernel.org, 'Linus' <torvalds@linux-foundation.org>, linux-samsung-soc@vger.kernel.org

Rafael J. Wysocki wrote:
> 
> On Monday, January 09, 2012, Kukjin Kim wrote:
> > Hi Rafael,
> >
> > This is just reporting of build error.
> >
> > Current mainline happens build error at
> drivers/base/power/domain_governor.c
> > file like following when CONFIG_PM_RUNTIME is not set. For example, it
> > happens with s3c6400_defconfig now.
> >
> > drivers/base/power/domain_governor.c: In function 'default_stop_ok':
> > drivers/base/power/domain_governor.c:25: error: 'struct dev_pm_info' has
> no
> > member named 'max_time_suspended_ns'
> > drivers/base/power/domain_governor.c:29: error: 'struct dev_pm_info' has
> no
> > member named 'max_time_suspended_ns'
> > drivers/base/power/domain_governor.c: In function
> 'default_power_down_ok':
> > drivers/base/power/domain_governor.c:94: error: 'struct dev_pm_info' has
> no
> > member named 'max_time_suspended_ns'
> > drivers/base/power/domain_governor.c:98: error: 'struct dev_pm_info' has
> no
> > member named 'max_time_suspended_ns'
> > drivers/base/power/domain_governor.c:100: error: 'struct dev_pm_info'
> has no
> > member named 'suspend_time'
> 
> The appended patch fixes the problem for me, can you please test it?
> 
Hi Rafael,

Looks ok to me :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  drivers/base/power/domain_governor.c |   24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> Index: linux/drivers/base/power/domain_governor.c
> ===================================================================
> --- linux.orig/drivers/base/power/domain_governor.c
> +++ linux/drivers/base/power/domain_governor.c
> @@ -12,6 +12,8 @@
>  #include <linux/pm_qos.h>
>  #include <linux/hrtimer.h>
> 
> +#ifdef CONFIG_PM_RUNTIME
> +
>  /**
>   * default_stop_ok - Default PM domain governor routine for stopping
> devices.
>   * @dev: Device to check.
> @@ -137,16 +139,28 @@ static bool default_power_down_ok(struct
>  	return true;
>  }
> 
> -struct dev_power_governor simple_qos_governor = {
> -	.stop_ok = default_stop_ok,
> -	.power_down_ok = default_power_down_ok,
> -};
> -
>  static bool always_on_power_down_ok(struct dev_pm_domain *domain)
>  {
>  	return false;
>  }
> 
> +#else /* !CONFIG_PM_RUNTIME */
> +
> +bool default_stop_ok(struct device *dev)
> +{
> +	return false;
> +}
> +
> +#define default_power_down_ok	NULL
> +#define always_on_power_down_ok	NULL
> +
> +#endif /* !CONFIG_PM_RUNTIME */
> +
> +struct dev_power_governor simple_qos_governor = {
> +	.stop_ok = default_stop_ok,
> +	.power_down_ok = default_power_down_ok,
> +};
> +
>  /**
>   * pm_genpd_gov_always_on - A governor implementing an always-on policy
>   */
