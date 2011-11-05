From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/5] [CPUFREQ] EXYNOS4210: Add DVS lock feature for other
 driver
Date: Sat, 05 Nov 2011 10:29:22 +0900
Message-ID: <02e101cc9b5a$58a593f0$09f0bbd0$%kim@samsung.com>
References: <005701cc995c$fc66d3a0$f5347ae0$%kim@samsung.com>
 <CAJ0PZbSoN-Zx16Kqh5bSAhV+rvwiZQBfwuGe9waH3HJZOg0mUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:65452 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751413Ab1KEB3X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 21:29:23 -0400
In-reply-to: <CAJ0PZbSoN-Zx16Kqh5bSAhV+rvwiZQBfwuGe9waH3HJZOg0mUA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, 'Jongpill Lee' <boyko.lee@samsung.com>, 'SangWook Ju' <sw.ju@samsung.com>, 'Jonghwan Choi' <jhbird.choi@samsung.com>, 'Jaecheol Lee' <jc.lee@samsung.com>

MyungJoo Ham wrote:
> 
> On Wed, Nov 2, 2011 at 9:43 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > From: Jongpill Lee <boyko.lee@samsung.com>
> >
> > This patch adds DVS lock feature for other driver and pm/
> > reboot notifier to enhance stability.
> >
(snip)
> 
Same, following is from Jaecheol Lee.

> Except for the case of PM (suspend/reset), it appears that this
> feature is something that is meant to be supported by qos
> (<linux/pm_qos.h>).
> Couldn't we simply use the QoS feature to support locking frequency
> above some specific levels? With QoS, I guess the implementation
> becomes more general and straightforward.
> Although we will probably need to use "CPU_DMA_LATENCY" for this case,
> I think it isn't awefully difficult to use DMA-Latency as the metric.
> 
Our goal is removal of using this cpufreq lock, but now some device driver
which is not fully optimized need to use this lock temporary. If there is no
request of this API from device driver, we will remove this feature or
support this feature with different manner as you mentioned.

> One concern about this is that we are hereby enforcing all the related
> device drivers stuck with Exynos4210 only unless others also use
> "cpufreq_lock_ID" and its friends.

We recommend this feature in only rare instances (performance issue). After
resolving that problem, the device driver which is using lock should be
modified with removing lock. Actually, there is no device driver that using
lock now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
