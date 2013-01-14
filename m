From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Early kernel hang with big DTB appended
Date: Mon, 14 Jan 2013 17:13:09 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1301141655570.6300@xanadu.home>
References: <7811936.npteFbuYu2@amdc1227> <20130111164531.GC13025@pengutronix.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:60142 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757295Ab3ANWNM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jan 2013 17:13:12 -0500
Received: by mail-qc0-f175.google.com with SMTP id j3so2845363qcs.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jan 2013 14:13:11 -0800 (PST)
In-Reply-To: <20130111164531.GC13025@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tomasz Figa <t.figa@samsung.com>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, kgene.kim@samsung.com, thomas.abraham@linaro.org, bones@secretlab.ca, linux-arm-kernel@lists.infradead.org

On Fri, 11 Jan 2013, Sascha Hauer wrote:

> On Thu, Jan 03, 2013 at 04:55:00PM +0100, Tomasz Figa wrote:
> > Hi,
> > 
> > I'm observing strange behavior when booting 3.8-rc1 and -rc2 with appended 
> > DTB. The kernel hangs very early when the DTB is bigger than some 
> > threshold somewhere around 24 KiB. With fullest possible low level UART 
> > debugging (and printk patched to use printascii) I'm receiving following 
> > output:
> > 
> > Uncompressing Linux... done, booting the kernel.
> > Booting Linux on physical CPU 0xa00
> > Linux version 3.8.0-rc1-00073-gdf6efca-dirty (t.figa@amdc1227) (gcc 
> > version 4.5.2 (Gentoo 4.5.2 p1.2, pie-0.4.5) ) #2 SMP PREEMPT Thu Jan 3 
> > 15:37:35 CET 2013
> > CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c53c7d
> > CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> > 
> > I tested on two Exynos-based boards (exynos4210-trats and one internal 
> > exynos4412-based board) and same happens on both.
> > 
> > Do you have any ideas?
> 
> Another thing besides the things already mentioned is that the dtb may
> not cross a 1MiB boundary. The Kernel uses a single 1Mib section
> (aligned to 1Mib) to initially map the dtb. Once you cross that boundary
> parts of the dtb won't be accessible for the Kernel anymore.

Crap.  You're right.  This patch should fix this issue.

@Tomasz: please could you confirm this fixes your initial problem?


diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 4eee351f46..61fcb18c7e 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -246,6 +246,7 @@ __create_page_tables:
 
 	/*
 	 * Then map boot params address in r2 if specified.
+	 * We map 2 sections in case the ATAGs/DTB crosses a section boundary.
 	 */
 	mov	r0, r2, lsr #SECTION_SHIFT
 	movs	r0, r0, lsl #SECTION_SHIFT
@@ -253,6 +254,8 @@ __create_page_tables:
 	addne	r3, r3, #PAGE_OFFSET
 	addne	r3, r4, r3, lsr #(SECTION_SHIFT - PMD_ORDER)
 	orrne	r6, r7, r0
+	strne	r6, [r3], #1 << PMD_ORDER
+	addne	r6, r6, #1 << SECTION_SHIFT
 	strne	r6, [r3]
 
 #ifdef CONFIG_DEBUG_LL
