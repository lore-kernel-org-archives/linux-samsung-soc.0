From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: Chromebook snow issues
Date: Tue, 29 Sep 2015 11:42:56 -0300
Message-ID: <20150929114256.40994f49@recife.lan>
References: <20150929094358.584e862c@recife.lan>
	<560A942F.2030206@samsung.com>
	<20150929110140.24724c04@recife.lan>
	<560AA11A.6000904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39884 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756520AbbI2OnB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Sep 2015 10:43:01 -0400
In-Reply-To: <560AA11A.6000904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kamil Debski <k.debski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Em Tue, 29 Sep 2015 16:32:58 +0200
Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:

> Adding linux-samsung-soc mailing list at Cc.


Never mind. My mistake: I forgot to reinstall the modules (mwifiex and mfc
drivers were compiled as such).

It is working.

I guess the only remaining thing is to add the dependency of EXYNOS_IOMMU
to the MFC driver.

Regards,
Mauro

> 
> On 29/09/15 16:01, Mauro Carvalho Chehab wrote:
> > Em Tue, 29 Sep 2015 15:37:51 +0200
> > Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:
> > 
> >> Hi Mauro,
> >>
> >> On 29/09/15 14:43, Mauro Carvalho Chehab wrote:
> >>> Hi Sylwester,
> >>>
> >>> I'm c/c Javier. Javier is working with us at the Open Souce Group and he
> >>> has been working on making sure that Chromebooks are supported with vanilla
> >>> upstream Kernels.
> >>>
> >>> That's said, while testing the latest upstream Kernel (4.3-rc3) on a
> >>> Chromebook snow, I noticed this error message:
> >>>
> >>> [  211.116975] s5p_mfc_alloc_memdevs:1045: Failed to declare coherent memory for
> >>>                MFC device
> >>> [  211.117039] s5p-mfc: probe of 11000000.codec failed with error -12
> >>>
> >>> Do you have any idea about how to fix? Btw, do I need any firmware to test
> >>> the MFC driver there?
> >>
> >> You can get v4.1 based kernel with MFC working (e.g. on Odroid XU3) here:
> >>
> >> https://USER@review.tizen.org/gerrit/p/platform/kernel/linux-exynos.git
> >> ssh://USER@review.tizen.org:29418/platform/kernel/linux-exynos.git
> >> branch: tizen
> >>
> >> I'm adding at Cc Marek who knows more details. AFAIU you may need patches
> >> like these on top of current mainline kernel:
> >>
> >> https://review.tizen.org/gerrit/gitweb?p=platform/kernel/linux-exynos.git;a=commitdiff;h=dcbf130658cdd1731b8a219ecedd867af0b2670e
> >>
> >> https://review.tizen.org/gerrit/gitweb?p=platform/kernel/linux-exynos.git;a=commitdiff;h=b82fd3408fd58476da79996d4a3bcbbb72174961
> >>
> >> And Exynos IOMMU needs to be enabled in kernel config.
> > 
> > If this is a requirement, we should enforce it at s5p-mfc Kconfig entry,
> > like:
> > 
> > 	depends on EXYNOS_IOMMU if !COMPILE_TEST
> 
> In general s5p-mfc doesn't depend on IOMMU, some SoC revisions don't
> even have SYSMMU. Thus we can't add such constraint.
> 
> > Just enabled Exynos IOMMU here to see what would happen:
> > 
> > [   19.461839] ------------[ cut here ]------------
> > [   19.464264] kernel BUG at net/core/dev.c:6513!
> > [   19.466648] Internal error: Oops - BUG: 0 [#2] PREEMPT SMP ARM
> > [   19.469039] Modules linked in: mwifiex_sdio mwifiex exynos_gsc(+) v4l2_mem2mem s5p_mfc(+) videobuf2_dma_contig videobuf2_memops videobuf2_core v4l2_common videodev media
> > [   19.474158] CPU: 1 PID: 1390 Comm: kworker/1:2 Tainted: G      D         4.3.0-rc3-00492-g397ead8befa9 #10
> > [   19.476753] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> > [   19.479326] Workqueue: events request_firmware_work_func
> > [   19.481887] task: edb06d00 ti: ee18a000 task.ti: ee18a000
> > [   19.484445] PC is at register_netdevice+0x23c/0x41c
> > [   19.487013] LR is at register_netdevice+0x28/0x41c
> > [   19.489572] pc : [<c047a184>]    lr : [<c0479f70>]    psr: 60010013
> > [   19.489572] sp : ee18be00  ip : 0000000e  fp : ed4629a0
> > [   19.494692] r10: bf102940  r9 : 00000000  r8 : ed462000
> > [   19.497218] r7 : 00000002  r6 : ed462000  r5 : edbee000  r4 : ed738000
> > [   19.499741] r3 : 00000000  r2 : 00000146  r1 : 000003e8  r0 : 00000001
> > [   19.502253] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > [   19.504768] Control: 10c5387d  Table: 6d5bc06a  DAC: 00000051
> > [   19.507247] Process kworker/1:2 (pid: 1390, stack limit = 0xee18a210)
> > [   19.509717] Stack: (0xee18be00 to 0xee18c000)
> > [   19.512150] be00: 0000ffff 00000001 00000000 00000000 ed4629a0 ed738000 edbee000 ed462000
> > [   19.514615] be20: 00000002 ed7392fc ed739000 bf0fab4c 00000004 00000001 edbef000 ffffffff
> > [   19.517072] be40: c086697c edbee000 bf10b400 edbef000 bf12d784 00000000 00000000 ed9a4800
> > [   19.519518] be60: ee7b58c0 bf0d95b0 00000000 00000000 00000000 00000000 f1694000 0006fd7c
> > [   19.521959] be80: 00000000 ec118e00 ec118dc0 c02f711c f1694000 0006fd7c ed43a390 ec118d40
> > [   19.524396] bea0: 00000003 ee18bee4 edbbf208 c0834674 ec118dc0 c08ba8bc 00000002 ec118d80
> > [   19.526827] bec0: ed9a4800 ec118d80
> > 
> > Unfortunately, the serial console didn't got everything. It _seems_ that the
> > bug happens during a mwifiex kthread, when it calls mwifiex_add_virtual_intf,
> > but even at the device's screen the message is truncated.
> 
> Unfortunately this doesn't ring any bells here, we don't work with Chromebooks
> in general and I'm not sure how to address this issue. Maybe someone subscribed
> to the mailing list can help.
> 
> > I didn't apply those two patches you pointed from Tizen.org. Not sure if
> > this is related or not.
> 
> It's possible the issue is caused by some other device (driver) that also
> has a sysmmu assigned to it, like display controller, etc. I'm not sure.
> 
> >> Required firmware is already available the linux-firmware git repository,
> >> the driver will select proper version if the firmware files (s5p-mfc*.fw)
> >> are copied to /lib/firmware.
> > 
> > Ah, OK!
> >>
> >>> Thanks!
> >>> Mauro
> 
