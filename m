From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Odroid XU4 deadlock
Date: Sat, 9 Apr 2016 13:00:25 +0200
Message-ID: <CAJKOXPcRDyTzYnbpkvmi9anb_cOHoayj72-CC9+eZ5uCuhJNhw@mail.gmail.com>
References: <CANAwSgS6thDjwt_Q03ddn+9QCaPxfMLsBYRYmfn103gRYmvRPg@mail.gmail.com>
	<5707C673.9010404@osg.samsung.com>
	<CANAwSgSF45Qb1rf5gNQ=Js4woiuGNRSTb253Fm=x1S1w5AOLMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35271 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752298AbcDILA1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 9 Apr 2016 07:00:27 -0400
In-Reply-To: <CANAwSgSF45Qb1rf5gNQ=Js4woiuGNRSTb253Fm=x1S1w5AOLMw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Fri, Apr 8, 2016 at 5:36 PM, Anand Moon <linux.amoon@gmail.com> wrote:
> hi Javier,
>
> On 8 April 2016 at 20:25, Javier Martinez Canillas
> <javier@osg.samsung.com> wrote:
>> Hello Anand,
>>
>> On 04/08/2016 09:51 AM, Anand Moon wrote:
>>> Hi All,
>>>
>>> I am observing this deadlock or warning on my Odroid XU4.
>>> I thinks the is related to clk from exynos5_i2c_xfer .... clk_prepare_enable
>>> but I am not able to figure out which clk.
>>>
>>
>> By reading your logs, it seems the problem is a possible ABBA deadlock since
>> the S3C RTC driver grabs the prepare_lock and then the regmap->lock, and the
>> CPUFreq driver leads to the locks being grabbed in the inverse order.

First of all this is not a deadlock. Yet. :) This is just lockdep
report of possible deadlock. This is deadlock:
http://www.krzk.eu/builders/boot-odroid-xu3-multi_v7/builds/13/steps/Boot%20odroid/logs/serial

...and I believe it is the same as the report from lockdep. Which
means that this report truly a predicted deadlock. There are minor
differences between deadlock on my board and report from Anand but
still the same devices are involved. In Anands report the involved
S2MPS11 regulator and S2MPS11 clock use the same regmap. In my case
one path comes from S5M RTC which uses different regmap than S2MPS11
clock. This is the difference which puzzles me.

Anyway this is known issue. In case of my board mentioned deadlock
happens only on multi_v7 on around 15% of boots. I noticed it around
v4.4 and it happens still.

>>
>>> [   11.640221] ======================================================
>>> [   11.646343] [ INFO: possible circular locking dependency detected ]
>>> [   11.652590] 4.6.0-rc2-xu4ml #35 Not tainted
>>> [   11.656749] -------------------------------------------------------
>>> [   11.662992] kworker/1:1/85 is trying to acquire lock:
>>> [   11.668010]  (prepare_lock){+.+...}, at: [<c05bfed8>]
>>> clk_prepare_lock+0x50/0xf8
>>> [   11.675375]
>>> [   11.675375] but task is already holding lock:
>>> [   11.681185]  (sec_core:428:(regmap)->lock){+.+...}, at:
>>> [<c0481aec>] regmap_read+0x2c/0x5c
>>> [   11.689417]
>>> [   11.689417] which lock already depends on the new lock.
>>> [   11.689417]
>>> [   11.697561]
>>> [   11.697561] the existing dependency chain (in reverse order) is:
>>> [   11.705008]
>>> [   11.705008] -> #1 (sec_core:428:(regmap)->lock){+.+...}:
>>> [   11.710467]        [<c0482d30>] regmap_update_bits_base+0x30/0x70
>>> [   11.716545]        [<c05c617c>] s2mps11_clk_prepare+0x30/0x38
>>> [   11.722262]        [<c05c01f0>] clk_core_prepare+0x98/0xbc
>>> [   11.727711]        [<c05c12bc>] clk_prepare+0x1c/0x2c
>>> [   11.732734]        [<c0556fe4>] s3c_rtc_probe+0x2d0/0x43c
>>
>> the S3C RTC driver tries to prepare the RTC source clock S2MPS11_CLK_AP
>> and that leads to the prepare_lock to be held and then the regmap->lock
>> since s2mps11_clk_prepare() calls regmap_update_bits().
>>
>>> [   11.738108]        [<c046b9fc>] platform_drv_probe+0x4c/0xb0
>>> [   11.743749]        [<c046a1fc>] driver_probe_device+0x20c/0x2b8
>>> [   11.749641]        [<c0468594>] bus_for_each_drv+0x60/0x94
>>> [   11.755103]        [<c0469f10>] __device_attach+0xb4/0x118
>>> [   11.760558]        [<c04693b4>] bus_probe_device+0x88/0x90
>>> [   11.766020]        [<c0469850>] deferred_probe_work_func+0x6c/0x9c
>>> [   11.772169]        [<c013b52c>] process_one_work+0x1a8/0x514
>>> [   11.777806]        [<c013b8d0>] worker_thread+0x38/0x56c
>>> [   11.783082]        [<c0141d14>] kthread+0xf4/0x10c
>>> [   11.787847]        [<c0107950>] ret_from_fork+0x14/0x24
>>> [   11.793050]
>>> [   11.793050] -> #0 (prepare_lock){+.+...}:
>>> [   11.797212]        [<c0768dd8>] mutex_lock_nested+0x78/0x4dc
>>> [   11.802845]        [<c05bfed8>] clk_prepare_lock+0x50/0xf8
>>> [   11.808304]        [<c05c19c4>] clk_unprepare+0x1c/0x2c
>>> [   11.813499]        [<c055d720>] exynos5_i2c_xfer+0x1dc/0x304
>>
>> and here the locks are grabbed in the inverse order, since the regulator
>> driver uses regmap read (grabbing the regmap->lock) and then a clock is
>> prepared in exynos5_i2c_xfer.
>>
>>> [   11.819129]        [<c0559620>] __i2c_transfer+0x13c/0x278
>>> [   11.824589]        [<c05597f0>] i2c_transfer+0x94/0xc4
>>> [   11.829701]        [<c04868f0>] regmap_i2c_read+0x48/0x64
>>> [   11.835074]        [<c0482048>] _regmap_raw_read+0xb4/0x114
>>> [   11.840630]        [<c04820cc>] _regmap_bus_read+0x24/0x58
>>> [   11.846084]        [<c0481a68>] _regmap_read+0x60/0xb8
>>> [   11.851201]        [<c0481afc>] regmap_read+0x3c/0x5c
>>> [   11.856224]        [<c03e2354>] regulator_get_voltage_sel_regmap+0x20/0x54
>>> [   11.863109]        [<c03dc5d4>] _regulator_get_voltage+0x20/0xb8
>>> [   11.863141]        [<c03df058>] _regulator_do_set_voltage+0x240/0x370
>>> [   11.863173]        [<c03df254>] regulator_set_voltage_unlocked+0xcc/0x230
>>> [   11.863205]        [<c03df3e0>] regulator_set_voltage+0x28/0x54
>>> [   11.863234]        [<c0478a94>] _set_opp_voltage+0x30/0x98
>>> [   11.863264]        [<c0479ba8>] dev_pm_opp_set_rate+0x1e0/0x540
>>> [   11.863337]        [<c0580824>] __cpufreq_driver_target+0x168/0x290
>>> [   11.863375]        [<c0583b48>] od_dbs_timer+0xdc/0x164
>>> [   11.863407]        [<c0584114>] dbs_work_handler+0x30/0x58
>>> [   11.863437]        [<c013b52c>] process_one_work+0x1a8/0x514
>>> [   11.863465]        [<c013b8d0>] worker_thread+0x38/0x56c
>>> [   11.863496]        [<c0141d14>] kthread+0xf4/0x10c
>>> [   11.863528]        [<c0107950>] ret_from_fork+0x14/0x24
>>> [   11.863538]
>>> [   11.863538] other info that might help us debug this:
>>> [   11.863538]
>>> [   11.863548]  Possible unsafe locking scenario:
>>> [   11.863548]
>>> [   11.863557]        CPU0                    CPU1
>>> [   11.863565]        ----                    ----
>>> [   11.863589]   lock(sec_core:428:(regmap)->lock);
>>> [   11.863612]                                lock(prepare_lock);
>>> [   11.863634]                                lock(sec_core:428:(regmap)->lock);
>>> [   11.863655]   lock(prepare_lock);
>>> [   11.863664]
>>> [   11.863664]  *** DEADLOCK ***
>>> [   11.863664]
>>
>> I should take a look in deep to the regmap and clock subsystems to better
>> understand the issue on how to solve it. But AFAICT the problem is that
>> the prepare_lock is a global mutex and the same regmap is used for both
>> the s2mps11 clocks and regulators, so the ABBA deadlock described below
>> can happen.

Exactly. One of ideas I remember was to make clocks mutex more
granular but I did not see any patches doing that. Another interesting
point is (in my case) deadlock itself (not lockdep report) happens
only on multi_v7, not on exynos defconfig.

BTW, Anand, if you report please provide more details for
reproduction: kernel config and reproduction steps.

Best regards,
Krzysztof
