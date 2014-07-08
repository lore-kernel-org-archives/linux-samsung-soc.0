From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 6/6] ARM: EXYNOS: Register cpuidle device only on
 Exynos4210 and 5250
Date: Tue, 08 Jul 2014 17:45:55 +0200
Message-ID: <156099171.AcKbd1QIut@amdc1032>
References: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
 <1403618235-19353-7-git-send-email-t.figa@samsung.com>
 <038b01cf9ab7$0de5a440$29b0ecc0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55292 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751656AbaGHPqX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 11:46:23 -0400
In-reply-to: <038b01cf9ab7$0de5a440$29b0ecc0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>


Hi,

On Tuesday, July 08, 2014 11:15:21 PM Kukjin Kim wrote:
> Tomasz Figa wrote:
> > 
> > Currently, the Exynos cpuidle driver works correctly only on Exynos4210
> > and 5250. Trying to use it with just one CPU online on any other Exynos
> > SoC will lead to system failure, due to unsupported AFTR mode on other
> > SoCs. This patch fixes the problem by registering the driver only on
> > supported SoCs and letting others simply use default WFI mode until
> > support for them is added.
> > 
> Hmm...I thought other SoCs have no problem on cpuidle except exynos5420 and
> exynos5440....something like this would be helpful to avoid system failure.
> But unfortunately this conflicts with Pankaj's cleanup cpufreq_init() and
> cpuidle_init() patch you've reviewed and I've applied in my local...
> 
> I'm going to check which exynos is ok on cpuidle and then sort them out.

Tomasz's patch is correct - currently only Exynos4210 and Exynos5250 work
fine with AFTR mode and upstream kernel (AFTR gets triggered by offlining
CPUs other than CPU0).

[ Exynos4x12 and Exynos3250 need secure firmware support (patches for this
  need to be reworked on top of recent PM/firmware/cpuidle changes).

  Exynos5410 should use big_little cpuidle driver. ]

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
