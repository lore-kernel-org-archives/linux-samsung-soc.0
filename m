From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix possible null pointer dereference.
Date: Mon, 16 May 2011 13:56:37 +0900
Message-ID: <000c01cc1385$a60782f0$f21688d0$%kim@samsung.com>
References: <1305270186-7722-1-git-send-email-kgene.kim@samsung.com>
 <4DCD197A.9020900@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39426 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912Ab1EPE4p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 May 2011 00:56:45 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LL9003C9V2FXR50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 13:56:43 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LL9007FXV2IDM@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 13:56:43 +0900 (KST)
In-reply-to: <4DCD197A.9020900@ru.mvista.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sergei Shtylyov' <sshtylyov@mvista.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jonghwan Choi' <jhbird.choi@samsung.com>, ben-linux@fluff.org

Sergei Shtylyov wrote:
> 
> Hello.
> 
Hi ;)

> On 13-05-2011 11:03, Kukjin Kim wrote:
> 
> > From: Jonghwan Choi<jhbird.choi@samsung.com>
> 
> > Signed-off-by: Jonghwan Choi<jhbird.choi@samsung.com>
> > Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> > ---
> >   arch/arm/mach-s5pv210/cpufreq.c |    4 +++-
> >   1 files changed, 3 insertions(+), 1 deletions(-)
> 
> > diff --git a/arch/arm/mach-s5pv210/cpufreq.c b/arch/arm/mach-
> s5pv210/cpufreq.c
> > index 22046e2..58340ee 100644
> > --- a/arch/arm/mach-s5pv210/cpufreq.c
> > +++ b/arch/arm/mach-s5pv210/cpufreq.c
> > @@ -105,8 +105,10 @@ static void s5pv210_set_refresh(enum
> s5pv210_dmc_port ch, unsigned long freq)
> >   		reg = (S5P_VA_DMC0 + 0x30);
> >   	else if (ch == DMC1)
> >   		reg = (S5P_VA_DMC1 + 0x30);
> > -	else
> > +	else {
> >   		printk(KERN_ERR "Cannot find DMC port\n");
> > +		return;
> > +	}
> 
>     According to CodingStyle, other branches should now have {} too.
> 
Yes, you're right.

I updated its commit in my tree like following.

---
diff --git a/arch/arm/mach-s5pv210/cpufreq.c
b/arch/arm/mach-s5pv210/cpufreq.c
index 22046e2..153af8b 100644
--- a/arch/arm/mach-s5pv210/cpufreq.c
+++ b/arch/arm/mach-s5pv210/cpufreq.c
@@ -101,12 +101,14 @@ static void s5pv210_set_refresh(enum s5pv210_dmc_port
ch, unsigned long freq)
        unsigned long tmp, tmp1;
        void __iomem *reg = NULL;

-       if (ch == DMC0)
+       if (ch == DMC0) {
                reg = (S5P_VA_DMC0 + 0x30);
-       else if (ch == DMC1)
+       } else if (ch == DMC1) {
                reg = (S5P_VA_DMC1 + 0x30);
-       else
+       } else {
                printk(KERN_ERR "Cannot find DMC port\n");
+               return;
+       }

        /* Find current DRAM frequency */
        tmp = s5pv210_dram_conf[ch].freq;
---

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
