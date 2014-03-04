From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [REGRESSION] Arndale Octa panics when booting 3.14-rc1
Date: Tue, 04 Mar 2014 11:30:19 +0100
Message-ID: <5315AB3B.5080207@samsung.com>
References: <20140303185755.GA11460@e102654-lin.cambridge.arm.com>
 <5314D239.7090001@gmail.com> <5314EBCB.3060400@gmail.com>
 <20140304101608.GA3852@e102654-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62888 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756651AbaCDKaX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Mar 2014 05:30:23 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N1W006NRQILRS70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Mar 2014 10:30:21 +0000 (GMT)
In-reply-to: <20140304101608.GA3852@e102654-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javi Merino <javi.merino@arm.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Chander Kashyap <chander.kashyap@linaro.org>

On 04/03/14 11:16, Javi Merino wrote:
> Yes, with [1] applied I don't get a kernel panic but the kernel fails
> to boot later on with an Imprecise external abort.  Removing the mdma
> nodes from the dts gets rid of that.  I guess what's missing is what
> you said: clocks for the mdma devices.

Is removing mdm0 node enough to fix the boot failure, or both have to be
removed ?

Unfortunately I don't access to exynos5420 datasheet at the moment, I've
added guys from Samsung Linaro Landing Team at cc, hopefully they can
provide a patch for the clocks driver to fix this.

> 8<---
> [    8.060000] mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 52000000Hz, actual 50000000HZ d)
> [    8.070000] Registering SWP/SWPB emulation handler
> [    8.075000] s3c-rtc 101e0000.rtc: setting system clock to 2000-01-01 00:00:00 UTC (946684800)
> [    8.080000] mmc_host mmc0: Bus speed (slot 0) = 100000000Hz (slot req 52000000Hz, actual 50000000HZ )
> [    8.090000] Freeing unused kernel memory: 220K (c04c1000 - c04f8000)
> [    8.100000] Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> [    8.105000] mmc0: new high speed DDR MMC card at address 0001
> [    8.110000] mmcblk0: mmc0:0001 M4G1FB 3.64 GiB 
> [    8.115000] mmcblk0boot0: mmc0:0001 M4G1FB partition 1 1.00 MiB
> [    8.120000] mmcblk0boot1: mmc0:0001 M4G1FB partition 2 1.00 MiB
> [    8.125000] mmcblk0rpmb: mmc0:0001 M4G1FB partition 3 128 KiB
> [    8.135000]  mmcblk0: p1 p2 p3 p4
> [    8.140000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
> [    8.140000] 
> [    8.140000] CPU: 0 PID: 1 Comm: init Not tainted 3.14.0-rc5-00002-g691b10f #189
> [    8.140000] [<c0013e24>] (unwind_backtrace) from [<c0011238>] (show_stack+0x10/0x14)
> [    8.140000] [<c0011238>] (show_stack) from [<c038218c>] (dump_stack+0x64/0xb4)
> [    8.140000] [<c038218c>] (dump_stack) from [<c037f6f4>] (panic+0x8c/0x1dc)
> [    8.140000] [<c037f6f4>] (panic) from [<c001f178>] (do_exit+0x80c/0x8b8)
> [    8.140000] [<c001f178>] (do_exit) from [<c001f310>] (do_group_exit+0x3c/0xb0)
> [    8.140000] [<c001f310>] (do_group_exit) from [<c00298a0>] (get_signal_to_deliver+0x278/0x500)
> [    8.140000] [<c00298a0>] (get_signal_to_deliver) from [<c001076c>] (do_signal+0x78/0x398)
> [    8.140000] [<c001076c>] (do_signal) from [<c0010db4>] (do_work_pending+0x64/0xac)
> [    8.140000] [<c0010db4>] (do_work_pending) from [<c000e460>] (work_pending+0xc/0x20)
> 8<---
> 
> [1] https://git.linaro.org/people/mike.turquette/linux.git/commit/00efcb1c8e1c3c5e5d3ce6f0682d66402911a84f

--
Regards,
Sylwester
