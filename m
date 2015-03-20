From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Fri, 20 Mar 2015 02:20:52 +0100
Message-ID: <550B75F4.2000901@gmx.net>
References: <54D779FB.9070306@math.uni-bielefeld.de> <54D86913.2050109@samsung.com> <54DF9089.8050204@math.uni-bielefeld.de> <CAJKOXPcSRjO__ywh0QVDex8zKZ2FEvgCt4JsPs78_kHzCtqZBA@mail.gmail.com> <71afa85252e1c95251e696749172757b@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:50147 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750890AbbCTBVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Mar 2015 21:21:03 -0400
In-Reply-To: <71afa85252e1c95251e696749172757b@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, k.kozlowski.k@gmail.com

Hello!

Tobias Jakobi wrote:
> Hello Krzysztof,
> 
> On 2015-02-17 14:24, Krzysztof Kozlowski wrote:
>> Looking at the backtrace this seems very likely however I have
>> troubles reproducing this. Any special tree or config is required
>> (except MMC_CLKGATE and DEBUG_ATOMIC_SLEEP)?
>>
>> Best regards,
>> Krzysztof
> The kernel was build with this config:
> https://github.com/tobiasjakobi/odroid-environment/blob/master/sourcecode/system/vanilla-3.19-debug.conf
> 
> 
> I didn't have DEBUG_ATOMIC_SLEEP enabled back then, but I could try to
> reproduce it again.
This issue is still happening with 4.0.0-rc4.

[    7.336824] BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:97
[    7.336832] in_atomic(): 1, irqs_disabled(): 128, pid: 796, name: mmcqd/0
[    7.336838] Preemption disabled at:[<c038ce44>]
sdhci_do_set_ios+0x24/0x6a0
[    7.336883] CPU: 0 PID: 796 Comm: mmcqd/0 Not tainted 4.0.0-rc4-debug+ #3
[    7.336889] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    7.336894] Backtrace:
[    7.336921] [<c0012444>] (dump_backtrace) from [<c001265c>]
(show_stack+0x18/0x1c)
[    7.336925]  r6:c06cd554 r5:ffffffff r4:00000000 r3:dc8ba200
[    7.336951] [<c0012644>] (show_stack) from [<c04d1d0c>]
(dump_stack+0x88/0xc8)
[    7.336966] [<c04d1c84>] (dump_stack) from [<c00491bc>]
(___might_sleep+0x14c/0x1cc)
[    7.336970]  r6:00000000 r5:ffff1b58 r4:00000000 r3:ed9fe000
[    7.336983] [<c0049070>] (___might_sleep) from [<c00492a4>]
(__might_sleep+0x68/0xa0)
[    7.336987]  r5:00000061 r4:c05e0440
[    7.337002] [<c004923c>] (__might_sleep) from [<c04d6bb4>]
(mutex_lock+0x24/0x44)
[    7.337006]  r7:ed9ba668 r6:00000002 r5:02faf080 r4:c06dc3c0
[    7.337031] [<c04d6b90>] (mutex_lock) from [<c03b0870>]
(clk_prepare_lock+0x58/0x100)
[    7.337035]  r4:c071b574 r3:ee0e5f00
[    7.337047] [<c03b0818>] (clk_prepare_lock) from [<c03b1620>]
(clk_round_rate+0x1c/0x40)
[    7.337051]  r5:02faf080 r4:ed9a4080
[    7.337064] [<c03b1604>] (clk_round_rate) from [<c038eb68>]
(sdhci_s3c_set_clock+0x1d8/0x1fc)
[    7.337068]  r5:ed9ba3c0 r4:02faf080
[    7.337078] [<c038e990>] (sdhci_s3c_set_clock) from [<c038ebe8>]
(sdhci_cmu_set_clock+0x5c/0x1cc)
[    7.337082]  r9:eda48c14 r8:60010053 r7:ee294e00 r6:ed9ba000
r5:02faf080 r4:ed9ba3c0
[    7.337098] [<c038eb8c>] (sdhci_cmu_set_clock) from [<c038cf04>]
(sdhci_do_set_ios+0xe4/0x6a0)
[    7.337102]  r9:eda48c14 r8:60010053 r7:ed9ba4d8 r6:ed9ba000
r5:ed9ba2b8 r4:ed9ba3c0
[    7.337118] [<c038ce20>] (sdhci_do_set_ios) from [<c038d4f0>]
(sdhci_set_ios+0x30/0x3c)
[    7.337122]  r10:ed9ffe8c r9:eda48c14 r8:ee118820 r7:eda48d5c
r6:02faf080 r5:ed9ba2b8
[    7.337135]  r4:ed9ba000 r3:c06e73e8
[    7.337158] [<c038d4c0>] (sdhci_set_ios) from [<c0377e9c>]
(__mmc_set_clock+0x74/0x78)
[    7.337162]  r5:ed9ba2b8 r4:ed9ba000
[    7.337173] [<c0377e28>] (__mmc_set_clock) from [<c0377ef8>]
(mmc_ungate_clock+0x28/0x30)
[    7.337177]  r6:ed9ba258 r5:ed9ba248 r4:ed9ba000 r3:00000000
[    7.337194] [<c0377ed0>] (mmc_ungate_clock) from [<c037a5b4>]
(mmc_host_clk_hold+0x50/0x7c)
[    7.337202] [<c037a564>] (mmc_host_clk_hold) from [<c03760a8>]
(mmc_pre_req+0x2c/0x50)
[    7.337206]  r6:eda48c4c r5:00000001 r4:ed9ba000 r3:c0389aac
[    7.337220] [<c037607c>] (mmc_pre_req) from [<c0376f90>]
(mmc_start_req+0x38/0x368)
[    7.337224]  r6:ee118820 r5:00000000 r4:ed9ba000 r3:eda48c48
[    7.337238] [<c0376f58>] (mmc_start_req) from [<c0386a14>]
(mmc_blk_issue_rw_rq+0xcc/0xaf4)
[    7.337242]  r10:eda39000 r9:eda48c14 r8:ee118820 r7:00000000
r6:ee118820 r5:00000000
[    7.337255]  r4:eda48c4c
[    7.337263] [<c0386948>] (mmc_blk_issue_rw_rq) from [<c0387540>]
(mmc_blk_issue_rq+0x104/0x4d8)
[    7.337267]  r10:24590000 r9:eda48c14 r8:eda48c00 r7:eda48c00
r6:ee118820 r5:eda39000
[    7.337279]  r4:eda48c14
[    7.337287] [<c038743c>] (mmc_blk_issue_rq) from [<c0388854>]
(mmc_queue_thread+0xd0/0x18c)
[    7.337291]  r10:ed9fe000 r9:eda48c14 r8:00000001 r7:ee118820
r6:24590000 r5:00000000
[    7.337304]  r4:eda60000
[    7.337319] [<c0388784>] (mmc_queue_thread) from [<c0044084>]
(kthread+0xf4/0x110)
[    7.337322]  r10:00000000 r9:00000000 r8:00000000 r7:c0388784
r6:eda48c14 r5:00000000
[    7.337335]  r4:ee1020c0
[    7.337345] [<c0043f90>] (kthread) from [<c000eca0>]
(ret_from_fork+0x14/0x34)
[    7.337348]  r7:00000000 r6:00000000 r5:c0043f90 r4:ee1020c0


With best wishes,
Tobias
