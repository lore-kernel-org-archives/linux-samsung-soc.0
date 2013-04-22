From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 00/10] ARM: exynos multiplatform series, part 1
Date: Mon, 22 Apr 2013 19:06:24 +0530
Message-ID: <CAJuYYwQS8HJ5gdH7-YxJ+x72Jfn-stP3DSiU=fUObc=RJfbb6w@mail.gmail.com>
References: <1365716245-99231-1-git-send-email-arnd@arndb.de>
	<201304191536.17796.arnd@arndb.de>
	<CAK9yfHwEZUPs70j3rS7V44RWxpZShEP8uxo3fFW54=L3NG-bDA@mail.gmail.com>
	<201304221512.25920.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:61138 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466Ab3DVNgZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 09:36:25 -0400
Received: by mail-ia0-f174.google.com with SMTP id h23so745318iae.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 06:36:24 -0700 (PDT)
In-Reply-To: <201304221512.25920.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>

On 22 April 2013 18:42, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 22 April 2013, Sachin Kamat wrote:
>>
>> With this branch now available (merged) in linux-next (20130422),
>> looks like exynos4 DT support is broken on it. Tested on Origen 4210
>> and 4412 and I get the following warnings on 4412 Origen board with
>> exynos_defconfig (Note that clocks are all 0). However, it boots fine
>> on Arndale board.
>
> I think this issue should be fixed with the patch that Thomas Abraham
> just sent. Thomas, can you confirm?

Yes, this issue is resolved with chip-id dt support patches, without
which the parent of fin_pll clock is set as xxti (which is set to 0Hz
for Origen4210) instead of xusbxti.

Thomas.

>
>> SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
>> Preemptible hierarchical RCU implementation.
>> NR_IRQS:549
>> Exynos4x12 clocks: sclk_apll = 0, sclk_mpll = 0
>>         sclk_epll = 0, sclk_vpll = 0, arm_clk = 0
>> Division by zero in kernel.
>> CPU: 0 PID: 0 Comm: swapper/0 Not tainted
>> 3.9.0-rc8-next-20130422-00038-g20ff84f #50
>> [<c0013fc8>] (unwind_backtrace+0x0/0xf8) from [<c0010ee4>]
>> (show_stack+0x10/0x14)
>> [<c0010ee4>] (show_stack+0x10/0x14) from [<c0190704>] (Ldiv0_64+0x8/0x18)
>> [<c0190704>] (Ldiv0_64+0x8/0x18) from [<c00549c4>]
>> (__clocksource_updatefreq_scale+0x44/0x19c)
>> [<c00549c4>] (__clocksource_updatefreq_scale+0x44/0x19c) from
>> [<c0054b28>] (__clocksource_register_scale+0xc/0x44)
>> [<c0054b28>] (__clocksource_register_scale+0xc/0x44) from [<c04895b0>]
>> (exynos4_clocksource_init+0x20/0x40)
>> [<c04895b0>] (exynos4_clocksource_init+0x20/0x40) from [<c0489638>]
>> (mct_init_dt+0x68/0x74)
>> [<c0489638>] (mct_init_dt+0x68/0x74) from [<c0489384>]
>> (clocksource_of_init+0x30/0x58)
>> [<c0489384>] (clocksource_of_init+0x30/0x58) from [<c0473ae0>]
>> (time_init+0x1c/0x30)
>> [<c0473ae0>] (time_init+0x1c/0x30) from [<c04706a0>] (start_kernel+0x1a0/0x37c)
>> [<c04706a0>] (start_kernel+0x1a0/0x37c) from [<40008074>] (0x40008074)
>> Division by zero in kernel.
>
>         Arnd
