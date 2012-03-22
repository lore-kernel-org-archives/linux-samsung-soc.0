From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v4 05/12] ARM: EXYNOS: add support uart for EXYNOS4 and
 EXYNOS5
Date: Thu, 22 Mar 2012 16:31:46 +0100
Message-ID: <084601cd0840$e4a414a0$adec3de0$%szyprowski@samsung.com>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
 <1331736138-28964-6-git-send-email-kgene.kim@samsung.com>
 <CAJuYYwTJsA1M1Qj2P1-1K=pWzi0BPo8YJNDSx4NqGC7NX0030g@mail.gmail.com>
 <074401cd074f$c2946b90$47bd42b0$%szyprowski@samsung.com>
 <4F6B3256.40304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:10896 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758196Ab2CVPbw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Mar 2012 11:31:52 -0400
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M1A00985LT5OY00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Mar 2012 15:31:53 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M1A008Q3LT2GZ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Mar 2012 15:31:50 +0000 (GMT)
In-reply-to: <4F6B3256.40304@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, olof@lixom.net, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org

Hello,

On Thursday, March 22, 2012 3:08 PM Kukjin Kim wrote:

> On 03/21/12 03:45, Marek Szyprowski wrote:
> > Hello,
> >
> > On Wednesday, March 21, 2012 10:14 AM Thomas Abraham wrote:
> >
> >> On 14 March 2012 20:12, Kukjin Kim<kgene.kim@samsung.com>  wrote:
> >>> Actually, the base address of uart is different between EXYNOS4
> >>> and EXYNOS5 and this patch enables to support uart for EXYNOS4
> >>> and EXYNOS5 SoCs at runtime.
> >>>
> >>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S b/arch/arm/mach-
> >> exynos/include/mach/debug-macro.S
> >>> index 6cacf16..6c857ff 100644
> >>> --- a/arch/arm/mach-exynos/include/mach/debug-macro.S
> >>> +++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
> >>> @@ -21,8 +21,13 @@
> >>>          */
> >>>
> >>>         .macro addruart, rp, rv, tmp
> >>> -               ldr     \rp, = S3C_PA_UART
> >>> -               ldr     \rv, = S3C_VA_UART
> >>> +               mov     \rp, #0x10000000
> >>
> >> This is physical address of Exynos4/5 CPUID register which cannot be
> >> used here. And virtual address S5P_VA_CPUID also cannot be used here
> >> since this will be called before paging_init when earlyprintk boot
> >> param is used. So, with this change, earlyprintk does not work for
> >> both Exynos4 and Exynos5.
> >
> > I confirm, printascii freeze the system on EXYNOS4 after that patch,
> > tested on Exynos4210 Nuri board.
> >
> Hi,
> 
> I think, it can be solved with following and if no problems, it will be
> fixed during v3.4-rcX.
> 
> diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S
> b/arch/arm/mach-exynos/in
> index 6c857ff..a865417 100644
> --- a/arch/arm/mach-exynos/include/mach/debug-macro.S
> +++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
> @@ -21,10 +21,10 @@
>           */
> 
>          .macro addruart, rp, rv, tmp
> -               mov     \rp, #0x10000000
> -               ldr     \rp, [\rp, #0x0]
> -               and     \rp, \rp, #0xf00000
> -               teq     \rp, #0x500000          @@ EXYNOS5
> +               mrc     p15, 0, \tmp, c0, c0, 0
> +               and     \tmp, \tmp, #0xf0
> +               teq     \tmp, #0xf0             @@ A15
> +
>                  ldreq   \rp, =EXYNOS5_PA_UART
>                  movne   \rp, #EXYNOS4_PA_UART   @@ EXYNOS4
>                  ldr     \rv, =S3C_VA_UART
> 

The above patch solved the problem on Exynos4.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
