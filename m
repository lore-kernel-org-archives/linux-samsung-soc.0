From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCHv2 3/3] ARM: EXYNOS: Enable PMUs for exynos4/5
Date: Sat, 28 Jul 2012 13:26:43 +0900
Message-ID: <01c601cd6c79$30f508e0$92df1aa0$@samsung.com>
References: <1343376509-5881-1-git-send-email-chanho61.park@samsung.com>
 <1343376509-5881-4-git-send-email-chanho61.park@samsung.com>
 <20120727090201.GD559@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10513 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138Ab2G1EZ7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Jul 2012 00:25:59 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7U008UUSB9SR50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 Jul 2012 13:25:57 +0900 (KST)
Received: from DOCHANHO61P01 ([10.90.51.44])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7U00C6XSB9UK10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 28 Jul 2012 13:25:57 +0900 (KST)
In-reply-to: <20120727090201.GD559@mudshark.cambridge.arm.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Will Deacon' <will.deacon@arm.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, linux@arm.linux.org.uk, 'Kyungmin Park' <kyungmin.park@samsung.com>

> -----Original Message-----
> From: Will Deacon [mailto:will.deacon@arm.com]
> Sent: Friday, July 27, 2012 6:02 PM
> To: Chanho Park
> Cc: kgene.kim@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; sachin.kamat@linaro.org;
> linux@arm.linux.org.uk; Kyungmin Park
> Subject: Re: [PATCHv2 3/3] ARM: EXYNOS: Enable PMUs for exynos4/5
> 
> On Fri, Jul 27, 2012 at 09:08:29AM +0100, Chanho Park wrote:
> > This patch define irq numbers of ARM performance monitoring unit for
> exynos4/5.
> > The number of CPU cores and PMU irq numbers are vary according to soc
> types.
> > So we need to identify each soc type using soc_is_xxx function and
> > define the pmu irqs dynamically. In case of exynos4412, there are 4 cpu
> cores and pmus.
> 
> We have devicetree bindings for the PMU -- why can't you use those instead
> of probing the SoC all the time?

Hi Will,
Exynos4 isn't fully supported the DT yet. Thus, we should support legacy probing.
I'll support the DT for PMU after applied this patch.
Thank you

Best regards,
Chanho Park

> 
> Will
