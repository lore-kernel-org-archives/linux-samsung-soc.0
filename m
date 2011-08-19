From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v3] ARM: Samsung: fix watchdog reset issue with clk_get()
Date: Fri, 19 Aug 2011 19:44:33 +0900
Message-ID: <CAH9JG2XW1OaK=_cYHsKpXBfFCpmGMAFg=pC5HsK=-z6D-W6bqg@mail.gmail.com>
References: <1313663117-29191-1-git-send-email-m.szyprowski@samsung.com>
	<4E4E2EE6.70503@linaro.org>
	<002601cc5e5a$5f3f3ff0$1dbdbfd0$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:45108 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752904Ab1HSKoe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 06:44:34 -0400
Received: by qyk34 with SMTP id 34so1033868qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 03:44:33 -0700 (PDT)
In-Reply-To: <002601cc5e5a$5f3f3ff0$1dbdbfd0$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

Interesting. there's no s5p_reset_hook at exynos4.
Anyway, after implement the s5p_reset_hook, it's working without
hacking of v7-fin.

Send it another mail.

Thank you,
Kyungmin Park

On Fri, Aug 19, 2011 at 7:25 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On Friday, August 19, 2011 11:38 AM Tushar Behera wrote:
>
>> Hi,
>>
>> On Thursday 18 August 2011 03:55 PM, Marek Szyprowski wrote:
>> > clkdev framework uses global mutex to protect clock tree, so it is=
 not
>> > possible to call clk_get() in interrupt context. This patch fixes =
this
>> > issue and makes system reset by watchdog call working again.
>> >
>> > Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
>> > Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> > ---
>> > =A0 arch/arm/plat-samsung/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 11 +++++++++++
>> > =A0 arch/arm/plat-samsung/include/plat/clock.h =A0 =A0 =A0 =A0 | =A0=
 =A03 +++
>> > =A0 .../arm/plat-samsung/include/plat/watchdog-reset.h | =A0 10 ++=
+-------
>> > =A0 3 files changed, 17 insertions(+), 7 deletions(-)
>> >
>> >
>> > history:
>> > v3:
>> > - moved initialization to arch_initcall, cleaned the code
>> >
>> > v2:
>> > - added missing '__init' section modifiers
>> (snip)
>>
>> I tried to test this patch with ORIGEN board.
>>
>> I took the ORIGEN board support patch from kgene's
>> next-samsung-board-v3.1 branch and rebased it onto the for-next bran=
ch
>> for testing.
>>
>> The system reboot stops at a message saying "Restarting system" and =
hangs.
>>
>> However applying below patch reboots the system without even applyin=
g
>> Marek's patch.
>>
>> Is there something wrong with mach-origen.c or u-boot [1]?
>>
>> [1] git://git.linaro.org/people/angus/u-boot.git (origen)
>>
>> =A0>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=
>>>>>>
>>
>> From: Tushar Behera <tushar.behera@linaro.org>
>> Date: Fri, 19 Aug 2011 14:47:04 +0530
>> Subject: [PATCH] [TEST] ARM: Disabling cache operation during system=
 reset
>>
>> On ORIGEN/SMDKV310 board, system reboot hangs during cache disabling
>> call in arm_machine_restart()=3D>cpu_proc_fin(). Applying given patc=
h
>> enables the system to reboot properly.
>>
>> This patch is no way a proposed solution. It is intended for further
>> investigation.
>
> My patch solves the following issue on all Samsung platforms:
>
> [ =A0 32.636689] SysRq : Resetting
> [ =A0 32.638319] arch_reset: attempting watchdog reset
> [ =A0 32.642864] BUG: sleeping function called from invalid context a=
t
> kernel/mutex.c:271
> [ =A0 32.650589] in_atomic(): 1, irqs_disabled(): 128, pid: 0, name: =
swapper
> [ =A0 32.657183] INFO: lockdep is turned off.
> [ =A0 32.661090] irq event stamp: 6363
> [ =A0 32.664388] hardirqs last =A0enabled at (6363): [<c0395ae4>]
> _raw_spin_unlock_irq+0x24/0x50
> [ =A0 32.672547] hardirqs last disabled at (6362): [<c0395370>]
> _raw_spin_lock_irq+0x18/0x58
> [ =A0 32.680532] softirqs last =A0enabled at (6358): [<c002d4f0>] irq=
_exit+0x58/0x68
> [ =A0 32.687650] softirqs last disabled at (6291): [<c002d4f0>] irq_e=
xit+0x58/0x68
> [ =A0 32.694782] [<c0012fd0>] (unwind_backtrace+0x0/0xf0) from [<c039=
42e0>]
> (mutex_lock_nested+0x30/0x324)
> [ =A0 32.703980] [<c03942e0>] (mutex_lock_nested+0x30/0x324) from [<c=
0280d2c>]
> (clk_get_sys+0x28/0xd0)
> [ =A0 32.712834] [<c0280d2c>] (clk_get_sys+0x28/0xd0) from [<c000f0a0=
>]
> (arm_machine_restart+0x68/0x120)
> [ =A0 32.721859] [<c000f0a0>] (arm_machine_restart+0x68/0x120) from [=
<c000ea38>]
> (machine_restart+0x18/0x20)
> [ =A0 32.731233] [<c000ea38>] (machine_restart+0x18/0x20) from [<c01c=
475c>]
> (__handle_sysrq+0xc0/0x16c)
> [ =A0 32.740175] [<c01c475c>] (__handle_sysrq+0xc0/0x16c) from [<c01d=
7c50>]
> (s3c24xx_serial_rx_chars+0x1c0/0x2d0)
> [ =A0 32.749985] [<c01d7c50>] (s3c24xx_serial_rx_chars+0x1c0/0x2d0) f=
rom
> [<c005f3ac>] (handle_irq_event_percpu+0x30/0x178)
> [ =A0 32.760572] [<c005f3ac>] (handle_irq_event_percpu+0x30/0x178) fr=
om
> [<c005f530>] (handle_irq_event+0x3c/0x5c)
> [ =A0 32.770380] [<c005f530>] (handle_irq_event+0x3c/0x5c) from [<c00=
615bc>]
> (handle_level_irq+0xc4/0xf4)
> [ =A0 32.779494] [<c00615bc>] (handle_level_irq+0xc4/0xf4) from [<c00=
5f0a0>]
> (generic_handle_irq+0x28/0x3c)
> [ =A0 32.788782] [<c005f0a0>] (generic_handle_irq+0x28/0x3c) from [<c=
001cf24>]
> (s3c_irq_demux_uart+0x68/0xc0)
> [ =A0 32.798242] [<c001cf24>] (s3c_irq_demux_uart+0x68/0xc0) from [<c=
005f0a0>]
> (generic_handle_irq+0x28/0x3c)
> [ =A0 32.807704] [<c005f0a0>] (generic_handle_irq+0x28/0x3c) from [<c=
000e94c>]
> (handle_IRQ+0x60/0x84)
> [ =A0 32.816470] [<c000e94c>] (handle_IRQ+0x60/0x84) from [<c000d58c>=
]
> (__irq_svc+0x4c/0xb0)
> [ =A0 32.824457] [<c000d58c>] (__irq_svc+0x4c/0xb0) from [<c001a2a0>]
> (exynos4_idle+0x28/0x2c)
> [ =A0 32.832615] [<c001a2a0>] (exynos4_idle+0x28/0x2c) from [<c000efe=
8>]
> (cpu_idle+0x48/0x98)
> [ =A0 32.840689] [<c000efe8>] (cpu_idle+0x48/0x98) from [<c04ca740>]
> (start_kernel+0x268PMIC:ONOFF1 (LSB=3DLDO5):0
>
> It looks that there is at least one more issue related to system rese=
t
> call, which is fixed or worked around by your patch.
>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
