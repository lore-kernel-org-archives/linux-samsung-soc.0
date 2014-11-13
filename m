From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: fix typo in static struct name
 "exynos5_list_diable_wfi_wfe"
Date: Thu, 13 Nov 2014 09:57:29 +0530
Message-ID: <000d01cffefa$3688d550$a39a7ff0$@samsung.com>
References: <1414489832-28011-1-git-send-email-pankaj.dubey@samsung.com>
 <CABxcv=nJ7-NoF-0EqCL=rk6hX2688iV98g=CiDADKT7QTNWBrw@mail.gmail.com>
 <CABxcv==Hjfi+-Mt63YQaCtC3Wj12WFfU6biwmiVEFQvqAp3DBA@mail.gmail.com>
 <54641A05.9030107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:46314 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753579AbaKME2D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 23:28:03 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEY00ABIN2M0700@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 13:27:58 +0900 (KST)
In-reply-to: <54641A05.9030107@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Javier Martinez Canillas' <javier@dowhile0.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, thomas.ab@samsung.com, linux-arm-kernel@lists.infradead.org

Hi Kukijin,

On Thursday, November 13, 2014 8:10 AM, Kukjin Kim wrote:
> Subject: Re: [PATCH] ARM: EXYNOS: fix typo in static struct name
> "exynos5_list_diable_wfi_wfe"
> 
> On 11/11/14 18:54, Javier Martinez Canillas wrote:
> > Hello Kukjin,
> >
> >>
> >> After this patch, "[PATCH v9 1/2] ARM: EXYNOS: Add platform driver
> >> support for Exynos PMU" [0] does not apply cleanly anymore.
> >>
> >
> > I see that you already picked all the Exynos S2R patches on your
> > v3.19-next/mach-exynos branch and also resolved that conflict.
> >
> Yes, but I couldn't merge it into -next because of some conflicts between
for-next and
> mach-exynos branch at that time.
> 
> Note I've merged into -next just now, so if any problems in -next, please
let us know.
> 

I just checked and your for-next failed to compile for exynos_defconfig. I
got following error:
----------
<stdin>:1247:2: warning: #warning syscall bpf not implemented [-Wcpp]
  CHK     include/generated/compile.h
  CC      arch/arm/mach-exynos/platsmp.o
arch/arm/mach-exynos/platsmp.c:448:13: error: static declaration of
'exynos_cpu_die' follows non-static declaration
 static void exynos_cpu_die(unsigned int cpu)
             ^
In file included from arch/arm/mach-exynos/platsmp.c:32:0:
arch/arm/mach-exynos/common.h:142:13: note: previous declaration of
'exynos_cpu_die' was here
 extern void exynos_cpu_die(unsigned int cpu);
             ^
make[1]: *** [arch/arm/mach-exynos/platsmp.o] Error 1
make: *** [arch/arm/mach-exynos] Error 2
make: *** Waiting for unfinished jobs....
--------------------------

With following fix I am able to build the for-next. 
----------------------------------------------------------------------------
--
diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 2ce225b..472417c 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -139,7 +139,6 @@ extern struct smp_operations exynos_smp_ops;
 extern void exynos_cpu_resume(void);
 extern void exynos_cpu_resume_ns(void);
 
-extern void exynos_cpu_die(unsigned int cpu);
 extern void exynos_cpu_power_down(int cpu);
 extern void exynos_cpu_power_up(int cpu);
 extern int  exynos_cpu_power_state(int cpu);
-------------------------------------------------------------------------

Let me know if I have to do something? else please update according to 
above change.

Thanks,
Pankaj Dubey

> > Is just that this branch was not merged in your for-next branch and
> > that's why I didn't see the patches in linux-next.
> >
> > Sorry for the noise.
> 
> No problem, thanks.
> 
> - Kukjin
