From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v5 2/2] ARM: EXYNOS: PMU: move restart code into pmu driver
Date: Wed, 19 Nov 2014 08:46:20 +0530
Message-ID: <000801d003a7$404882a0$c0d987e0$@samsung.com>
References: <1416307650-15162-1-git-send-email-pankaj.dubey@samsung.com>
 <1416307650-15162-3-git-send-email-pankaj.dubey@samsung.com>
 <546B6395.8020403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13138 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753851AbaKSDQJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 22:16:09 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF900H96NQPK0A0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Nov 2014 12:16:01 +0900 (KST)
In-reply-to: <546B6395.8020403@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, linux@roeck-us.net

On Tuesday, November 18, 2014 8:50 PM, Sylwester Nawrocki Wrote:
> On 18/11/14 11:47, Pankaj Dubey wrote:
> > diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
> > index 6c8a76d..e4c3512 100644
> > --- a/arch/arm/mach-exynos/pmu.c
> > +++ b/arch/arm/mach-exynos/pmu.c
> > @@ -11,8 +11,11 @@
> 
> > @@ -716,6 +719,13 @@ static void exynos5420_pmu_init(void)
> >  	pr_info("EXYNOS5420 PMU initialized\n");  }
> >
> > +static int pmu_restart_notify(struct notifier_block *this,
> > +		unsigned long code, void *unused)
> > +{
> > +	pmu_raw_writel(0x1, EXYNOS_SWRESET);
> 
> Is it also valid on exynos5440 ? Doesn't it cause any harm there ?
> Perhaps we could add a comment saying it has not effect on that SoC ?
> 

Seeing original code from exynos.c (restart hook) I can say it's not valid
for exynos5440.
But it should not cause any harm as of now, because for exynos54440 PMU will
not be probed.
If in future support for exynos5440 PMU gets added, that time one may need
to consider this
point. This will be applicable for any SoC which does not have same register
for restart.

Thanks,
Pankaj Dubey

> > +	return NOTIFY_DONE;
> > +}
> 
> --
> Thanks,
> Sylwester
