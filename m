From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V5 16/20] ARM: exynos: cpuidle: Move the power sequence
 call in the cpu_pm notifier
Date: Thu, 26 Jun 2014 11:48:24 +0200
Message-ID: <53ABEC68.7060500@samsung.com>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
 <1397212815-16068-17-git-send-email-daniel.lezcano@linaro.org>
 <CADWw7Ojjk9U95-Sh3WfK+OuKBJk4_XAJgGNrNmt7gcaAjxwVKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:32209 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753358AbaFZJsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 05:48:53 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7R00E5ESL70A60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jun 2014 10:48:43 +0100 (BST)
In-reply-to: <CADWw7Ojjk9U95-Sh3WfK+OuKBJk4_XAJgGNrNmt7gcaAjxwVKQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <k.chander@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linaro-kernel@lists.linaro.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>

Hi Chander,

On 26.06.2014 11:07, Chander Kashyap wrote:
> On Fri, Apr 11, 2014 at 4:10 PM, Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:

[snip]

>> @@ -359,6 +373,7 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
>>         switch (cmd) {
>>         case CPU_PM_ENTER:
>>                 if (cpu == 0) {
>> +                       exynos_pm_central_suspend();
>>                         exynos_cpu_save_register();
>>                 }
>>                 break;
>> @@ -368,6 +383,7 @@ static int exynos_cpu_pm_notifier(struct notifier_block *self,
>>                         if (!soc_is_exynos5250())
>>                                 scu_enable(S5P_VA_SCU);
>>                         exynos_cpu_restore_register();
>> +                       exynos_pm_central_resume();
> 
> This notifier is called for system wide suspend and cpuidle.
> 
> In case of Exynos cpuidle only AFTR and LPA state need to program
> central_sequencer and store/restore the registers.
> 
> But in 5420 (core-power-down), this is not required, and causing the regression.
> 
> Hence need to remove this notifier, or need to find a way to
> differentiate the cpuidle state.

This patch is already present in v3.16. Moreover, Exynos5420 cpuidle has
not been merged yet. This means that this issue is not a regression and
I believe any further work on this should be carried out as further
patches on top of this change.

Anyway, this change has introduced a regression, though, but in another
area - it broke suspend, at least on Exynos4-based devices, because now
certain steps are performed twice. I've sent a patch for 3.16-rc3 to fix
this by dropping custom suspend-specific syscore ops, effectively moving
most of the handling to CPU PM notifier, which also matches requirements
of AFTR and lower power states. See [1].

[1]
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg32935.html

However, in this case, moving back to suspend-specific syscore_ops and
simply duplicating some code for lower cpuidle states might be a better
option. Care to send a patch (fix for 3.16, replacing mine) or I should
do it?

Best regards,
Tomasz
