From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v4 1/1] ARM: EXYNOS: Update CONFIG_ARCH_NR_GPIO for Exynos
Date: Wed, 24 Jul 2013 21:00:23 +0900
Message-ID: <0eb101ce8865$60f1d920$22d58b60$@org>
References: <1374655405-22998-1-git-send-email-sachin.kamat@linaro.org>
 <51EFB023.6090804@samsung.com>
 <CAK9yfHyMcyWJh6Jv0ZK1t=+hMhD44qE3WccaLnwFM=tK8ab6GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59277 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751276Ab3GXMAZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 08:00:25 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF003NDW0L6520@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 21:00:24 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org, 'Tomasz Figa' <t.figa@samsung.com>

Kukjin Kim wrote:
> 
> Sachin Kamat wrote:
> >
> > Hi Sylwester,
> >
> Hi all,
> 
> [...]
> 
> > >> @@ -1590,8 +1590,7 @@ config ARM_PSCI
> > >>  config ARCH_NR_GPIO
> > >>       int
> > >>       default 1024 if ARCH_SHMOBILE || ARCH_TEGRA
> > >> -     default 512 if SOC_OMAP5
> > >> -     default 512 if ARCH_KEYSTONE
> > >> +     default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5
> > >
> > > Sorry, 512 seems a bit too generous to me. Also I would rather
> > > leave each SOC/ARCH on a separate line.
> >
> > Even I had left it that way earlier. However Kukjin suggested the
> > above (single line).
> > I feel it is more of individual preference.
> >
> I know it is quite big but I think if we want to use the large number, I'd
> preferred to use enough the large number so that we don't need to update
> it soon. If so, multiple line is useless...
> 
> Note, according to git log, for omap5, 256 is the accurately right number.
> 
> > >
> > > Almost half of those 512 entries would have been unused in most
> > > cases. How about, e.g. 352 ? If anyone finds this value too low
> > > they could always submit a patch like this one. IMHO with 352 or
> > > 392 there would be sufficient margin.
> >
> Hmm...
> 
> > I agree. Again, I do not have any reservations here. I just went with
> > maintainer's choice which was a superset of your and Tomasz's
> > suggestions :)
> >
If you have another opinion on this, please let me know before sending fixes
for 3.11 probably tomorrow morning in my time.

Thanks,
Kukjin
