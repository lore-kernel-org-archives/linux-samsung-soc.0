From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Subject: Re: [PATCH] cpufreq: exynos5440: Fix to skip when new frequency same
 as current
Date: Wed, 07 Aug 2013 12:30:10 +0100
Message-ID: <52022FC2.2010109@arm.com>
References: <1375874171-16951-1-git-send-email-amit.daniel@samsung.com> <CAKohpokp04HXau1fOA6w9K675LwRw6uCCZZKyFAJtF1_pkcC=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:60154 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757417Ab3HGL35 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 07:29:57 -0400
In-Reply-To: <CAKohpokp04HXau1fOA6w9K675LwRw6uCCZZKyFAJtF1_pkcC=Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sudeep.KarkadaNagesha@arm.com

On 07/08/13 12:22, Viresh Kumar wrote:
> On 7 August 2013 16:46, Amit Daniel Kachhap <amit.daniel@samsung.com> wrote:
>> This patch fixes the issue of un-necessary setting the clock controller
>> when the new target frequency is same as the current one. This case usually
>> occurs with governors like ondemand which passes the target frequency as the
>> percentage of average frequency. This check is present in most of the cpufreq
>> driver.
>>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: Rafael J. Wysocki <rjw@sisk.pl>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> ---
>>  drivers/cpufreq/exynos5440-cpufreq.c |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> Applied.
Hi Viresh,

Any particular reason we need this check in all drivers after your
commit: 5a1c0228 "cpufreq: Avoid calling cpufreq driver's target()
routine if target_freq == policy->cur"

I think it can removed from all drivers, am I missing something ?

Regards,
Sudeep
