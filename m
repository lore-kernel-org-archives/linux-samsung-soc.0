From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: 4.7 kernel panic with EXYNOS_IOMMU
Date: Wed, 03 Aug 2016 09:31:49 +0200
Message-ID: <048b209b-dd6a-ec99-8894-3287a466e831@samsung.com>
References: <CAM3PiRxgKLsZJb4qZSZEvXVpeWB_Mqx2N-2VKqfocdTotB14LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34130 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753780AbcHCHmz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Aug 2016 03:42:55 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBB006VPOX2H830@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Aug 2016 08:31:50 +0100 (BST)
In-reply-to: <CAM3PiRxgKLsZJb4qZSZEvXVpeWB_Mqx2N-2VKqfocdTotB14LA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marian Mihailescu <marian.mihailescu@adelaide.edu.au>, linux-samsung-soc@vger.kernel.org

Hi Marian,

On 2016-08-03 08:40, Marian Mihailescu wrote:

> http://paste.debian.net/786704

 > [   19.053848] exynos-sysmmu 11200000.sysmmu:: PAGE FAULT occurred at 
0x51000000 (page table base: 0x6eb04000)
 > [   19.053854] exynos-sysmmu 11200000.sysmmu::  Lv1 entry: 0x6e81b001
 > [   19.053909] ------------[ cut here ]------------
 > [   19.053915] kernel BUG at drivers/iommu/exynos-iommu.c:410!
 > [   19.053920] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
 > [   19.053951] Modules linked in: s5p_mfc exynos_gsc v4l2_mem2mem 
v4l2_common videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 
videodev videobuf2_core
 > [   19.053959] CPU: 0 PID: 336 Comm: setfont Not tainted 4.7.0-1 #2
 > [   19.053963] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
 > [   19.053968] task: c24e1900 ti: e3838000 task.ti: e3838000
 > [   19.053980] PC is at exynos_sysmmu_irq+0x1f4/0x210
 > [   19.053985] LR is at exynos_sysmmu_irq+0x100/0x210
 > [   19.053990] pc : [<c03eaa38>]    lr : [<c03ea944>]    psr: 600e0193
 > [   19.053990] sp : e3839a50  ip : ee870f80  fp : 00000510
 > [   19.053994] r10: 00000000  r9 : 0000001c  r8 : ee86adb0
 > [   19.053998] r7 : ee86ad90  r6 : 51000000  r5 : 00000000  r4 : c074a838
 > [   19.054003] r3 : 6e81b001  r2 : 00000000  r1 : 6e81b001  r0 : 00000036
 > [   19.054009] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  
Segment none
 > [   19.054013] Control: 10c5387d  Table: 6d9a806a  DAC: 00000051
 > [   19.054017] Process setfont (pid: 336, stack limit = 0xe3838210)

> the same config, but without EXYNOS_IOMMU boots fine.

This is a known issue - a page fault from MFC driver, which needs 
special handling
of IOMMU. It exists since adding DT support to Exynos IOMMU driver in 
v4.2 (earlier
Exynos IOMMU wasn't even initialized due to lack of DT support). This is 
one of the
reasons, why Exynos IOMMU is not enabled yet in exynos_defconfig.

Proper support for IOMMU in MFC driver will be available in v4.8-rc1 
(patches are
already queued for merging).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
