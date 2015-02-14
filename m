From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Sat, 14 Feb 2015 19:14:33 +0100
Message-ID: <54DF9089.8050204@math.uni-bielefeld.de>
References: <54D779FB.9070306@math.uni-bielefeld.de> <54D86913.2050109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:53574 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754177AbbBNSOm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Feb 2015 13:14:42 -0500
In-Reply-To: <54D86913.2050109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>

Hello!

Marek Szyprowski wrote:
>> 4) Spinlock BUGs triggered by the sdhci subsystem (so for the people
>> using the system with a SD card). This is also a known problem, I think
>> first mentioned here:
>> http://www.spinics.net/lists/linux-mmc/msg27277.html
>> Currently fixing this with this patch:
>> https://github.com/tobiasjakobi/linux-odroid/commit/abc749843dd7022d01322dca3db0181211a30cd8
>>
> 
> The fix for this issue has been queued to mmc-next:
> https://git.linaro.org/people/ulf.hansson/mmc.git/commit/017210d1c0dc2e2d3b142985cb31d90b98dc0f0f
This fix doesn't work for me. I have it applied, but encountered this
just now:

[   33.159544] BUG: scheduling while atomic: mmcqd/0/789/0x00000002
[   33.159558] Modules linked in: bridge stp llc bnep btrfs xor xor_neon
zlib_inflate zlib_deflate raid6_pq ecb btusb bluetooth usb_storage
[   33.159625] Preemption disabled at:[<c037de64>]
sdhci_do_set_ios+0x24/0x6a0

[   33.159673] CPU: 0 PID: 789 Comm: mmcqd/0 Not tainted 3.19.0-debug+ #1
[   33.159683] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[   33.159692] Backtrace:
[   33.159724] [<c00122e0>] (dump_backtrace) from [<c00124f8>]
(show_stack+0x18/0x1c)
[   33.159734]  r6:c06b6db4 r5:ffffffff r4:00000000 r3:dc8cb100
[   33.159777] [<c00124e0>] (show_stack) from [<c04bf2cc>]
(dump_stack+0x88/0xc8)
[   33.159796] [<c04bf244>] (dump_stack) from [<c04bbc9c>]
(__schedule_bug+0xac/0xbc)
[   33.159805]  r6:00000000 r5:ee791780 r4:ee3a4b00 r3:eda18000
[   33.159841] [<c04bbbf0>] (__schedule_bug) from [<c04c0d48>]
(__schedule+0x4b8/0x600)
[   33.159859] [<c04c0890>] (__schedule) from [<c04c0ec8>]
(schedule+0x38/0x84)
[   33.159868]  r10:c06f4374 r9:c0701c4c r8:eda19c78 r7:ee3a4b00
r6:600000d3 r5:c06c5994
[   33.159898]  r4:c06c5990
[   33.159919] [<c04c0e90>] (schedule) from [<c04c1274>]
(schedule_preempt_disabled+0x18/0x24)
[   33.159939] [<c04c125c>] (schedule_preempt_disabled) from
[<c04c3c8c>] (__mutex_lock_slowpath+0x190/0x428)
[   33.159955] [<c04c3afc>] (__mutex_lock_slowpath) from [<c04c3f38>]
(mutex_lock+0x14/0x2c)
[   33.159964]  r10:ed8a295c r9:ffffffff r8:00000000 r7:ee017668
r6:00000002 r5:ee021580
[   33.159994]  r4:c06c5990
[   33.160012] [<c04c3f24>] (mutex_lock) from [<c03a16f4>]
(clk_prepare_lock+0x58/0x100)
[   33.160021]  r4:c0704bac r3:ee370a00
[   33.160044] [<c03a169c>] (clk_prepare_lock) from [<c03a2284>]
(clk_round_rate+0x18/0x34)
[   33.160053]  r5:ee021580 r4:02faf080
[   33.160078] [<c03a226c>] (clk_round_rate) from [<c037fb70>]
(sdhci_s3c_set_clock+0x1d8/0x1fc)
[   33.160088]  r5:ee017400 r4:02faf080
[   33.160113] [<c037f998>] (sdhci_s3c_set_clock) from [<c037fbf0>]
(sdhci_cmu_set_clock+0x5c/0x1cc)
[   33.160122]  r9:eda19e8c r8:60000053 r7:ee270e00 r6:ee017000
r5:02faf080 r4:ee017400
[   33.160161] [<c037fb94>] (sdhci_cmu_set_clock) from [<c037df24>]
(sdhci_do_set_ios+0xe4/0x6a0)
[   33.160171]  r9:eda19e8c r8:60000053 r7:ee017518 r6:ee017000
r5:ee0172c0 r4:ee017400
[   33.160209] [<c037de40>] (sdhci_do_set_ios) from [<c037e510>]
(sdhci_set_ios+0x30/0x40)
[   33.160218]  r10:ed8a295c r9:eda19e8c r8:ee0173bc r7:ed8a2a80
r6:02faf080 r5:ee0172c0
[   33.160248]  r4:ee017000 r3:c06d09a8
[   33.160275] [<c037e4e0>] (sdhci_set_ios) from [<c0369614>]
(__mmc_set_clock+0x74/0x78)
[   33.160285]  r5:ee0172c0 r4:ee017000
[   33.160308] [<c03695a0>] (__mmc_set_clock) from [<c0369670>]
(mmc_ungate_clock+0x28/0x30)
[   33.160317]  r6:ee01725c r5:ee01724c r4:ee017000 r3:00000000
[   33.160351] [<c0369648>] (mmc_ungate_clock) from [<c036bcf0>]
(mmc_host_clk_hold+0x50/0x7c)
[   33.160369] [<c036bca0>] (mmc_host_clk_hold) from [<c036797c>]
(mmc_start_request+0xcc/0x110)
[   33.160378]  r6:00000001 r5:ee017000 r4:ed8a2970 r3:ed8a2a0c
[   33.160409] [<c03678b0>] (mmc_start_request) from [<c03688fc>]
(mmc_start_req+0x288/0x38c)
[   33.160419]  r5:00000000 r4:ee017000
[   33.160443] [<c0368674>] (mmc_start_req) from [<c0377b48>]
(mmc_blk_issue_rw_rq+0xcc/0xaf4)
[   33.160452]  r10:eda10000 r9:ed8a2814 r8:ed965000 r7:00000000
r6:ed965000 r5:00000000
[   33.160482]  r4:ed8a2970
[   33.160500] [<c0377a7c>] (mmc_blk_issue_rw_rq) from [<c0378674>]
(mmc_blk_issue_rq+0x104/0x4d8)
[   33.160510]  r10:24590060 r9:00000001 r8:ed8a2800 r7:ed8a2800
r6:ed965000 r5:eda10000
[   33.160539]  r4:ed8a2814
[   33.160558] [<c0378570>] (mmc_blk_issue_rq) from [<c0379970>]
(mmc_queue_thread+0xb8/0x15c)
[   33.160567]  r10:ed965000 r9:00000001 r8:24590060 r7:00000000
r6:eda18000 r5:eda28000
[   33.160597]  r4:ed8a2814
[   33.160619] [<c03798b8>] (mmc_queue_thread) from [<c00435a8>]
(kthread+0xe8/0x100)
[   33.160628]  r10:00000000 r9:00000000 r8:00000000 r7:c03798b8
r6:ed8a2814 r5:00000000
[   33.160657]  r4:ee3bdbc0
[   33.160677] [<c00434c0>] (kthread) from [<c000ec60>]
(ret_from_fork+0x14/0x34)
[   33.160686]  r7:00000000 r6:00000000 r5:c00434c0 r4:ee3bdbc0




With best wishes,
Tobias
