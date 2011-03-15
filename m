From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Fix section mismatch from cpufreq init
Date: Tue, 15 Mar 2011 21:04:36 +0900
Message-ID: <010e01cbe309$29e73460$7db59d20$%kim@samsung.com>
References: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37389 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757200Ab1COMEm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 08:04:42 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LI300NZ3LJS06C0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 21:04:40 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LI3002KRLJS8V@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 21:04:40 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Kukjin Kim wrote:
> 
> Mark Brown wrote:
> >
> > The cpufreq init function is referenced from the driver structure and
> > we don't appear to have annotations which allow us to mark that it'll
> > never be called after system init, causing the linker consistency
> > infrastructure to complain. Just remove the __init annotation to avoid
> > noise from the build.
> >
> > Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> > ---
> >  arch/arm/mach-s3c64xx/cpufreq.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/arch/arm/mach-s3c64xx/cpufreq.c b/arch/arm/mach-
> > s3c64xx/cpufreq.c
> > index 74c0e83..4375b97 100644
> > --- a/arch/arm/mach-s3c64xx/cpufreq.c
> > +++ b/arch/arm/mach-s3c64xx/cpufreq.c
> > @@ -181,7 +181,7 @@ static void __init
> s3c64xx_cpufreq_config_regulator(void)
> >  }
> >  #endif
> >
> > -static int __init s3c64xx_cpufreq_driver_init(struct cpufreq_policy
> *policy)
> > +static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
> >  {
> >  	int ret;
> >  	struct cpufreq_frequency_table *freq;
> > --
> 
> Looks ok, applied into s5p-fixes-for-linus for 38 :)
> Thanks.
> 
Oops, I missed 'pull request' before 38 :(
So will apply this into for-next...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
