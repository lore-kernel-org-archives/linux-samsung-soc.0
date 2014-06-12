From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: Crash during S2R on Arndale if CONFIG_SAMSUNG_PM_CHECK enabled
Date: Thu, 12 Jun 2014 11:54:29 +0200
Message-ID: <539978D5.6080800@samsung.com>
References: <CAGm_ybgakzE3MbQQduBZZ6WFkFm_bFFSyHDzJUXm5ajgQqKFRA@mail.gmail.com>
 <CAGm_ybi-UeJnDxpJvZwpfX_XrvieR2+SgXhhaCHLzGB29RnZ5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27294 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933046AbaFLJyr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 05:54:47 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7100B3AVJ8AW70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jun 2014 10:54:44 +0100 (BST)
In-reply-to: <CAGm_ybi-UeJnDxpJvZwpfX_XrvieR2+SgXhhaCHLzGB29RnZ5g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>

Hi Vikas,

To me it looks like wrong address range is used for calculating
checksums. Unfortunately I don't have time right now to investigate this.

Best regards,
Tomasz

On 12.06.2014 11:28, Vikas Sajjan wrote:
> Any thoughts on this.
> 
> 
> On Fri, May 23, 2014 at 5:44 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>> Hi,
>>
>> I notice that if CONFIG_SAMSUNG_PM_CHECK is enabled, we get a crash in
>> function "crc32_le(), as below.
>>
>> wanted to know, if anyone of you came across this.
>>
>> Tested on Arndale5250 on kgene's 'for-next' branch
>>
>> 19307a0b41ef10a20712827430e1f2074efab3c4 Merge branch
>> 'v3.16-next/dt-samsung-2' into for-next
>> 3c8977f17796f0b8816a1a283b0b80b71c83d416 ARM: dts: enable usb nodes
>> for exynos4412-trats2
>> ef14d94cdc41c0af1c2713e1ddced903d9d68768 ARM: dts: add hsotg device
>> node for exynos4
>> 26bbd41fe1b3b75bb075eaddf26571c7573c4c01 ARM: dts: add exynos_usbphy
>> node for exynos4
>> 7b9613aca42a5522d269f89496fef7df10934335 ARM: dts: add PMU syscon node
>> for exynos4
>> e8af308549178271bccaa7886f429a7c0b1d8514 ARM: dts: enable usb nodes
>> for exynos4412-trats2
>>
>>
>> <-------------------------------------------------------------------------------------------------------------->
>>
>> / $ echo mem > /sys/power/state
>> [    9.874440] PM: Syncing filesystems ...
>> [   10.518085] random: nonblocking pool is initialized
>> [   10.645255] done.
>> [   10.646561] Freezing user space processes ... (elapsed 0.000 seconds) done.
>> [   10.652642] Freezing remaining freezable tasks ... (elapsed 0.001
>> seconds) done.
>> [   10.713454] wake enabled for irq 187
>> [   10.715575] wake enabled for irq 188
>> [   10.719117] wake enabled for irq 189
>> [   10.722686] wake enabled for irq 190
>> [   10.726244] wake enabled for irq 191
>> [   10.729793] wake enabled for irq 192
>> [   10.745154] PM: suspend of devices complete after 83.460 msecs
>> [   10.751576] PM: late suspend of devices complete after 2.051 msecs
>> [   10.758449] PM: noirq suspend of devices complete after 2.155 msecs
>> [   10.763253] Disabling non-boot CPUs ...
>> [   10.767496] IRQ153 no longer affine to CPU1
>> [   10.767623] CPU1: shutdown
>> [   10.774637] Unable to handle kernel paging request at virtual
>> address f0001000
>> [   10.774637] pgd = edb18000
>> [   10.774637] [f0001000] *pgd=6e006811, *pte=00000000, *ppte=00000000
>> [   10.774637] Internal error: Oops: 7 [#1] PREEMPT SMP ARM
>> [   10.774637] Modules linked in:
>> [   10.774637] CPU: 0 PID: 1 Comm: sh Not tainted 3.15.0-rc4-00197-g0cb752a #43
>> [   10.774637] task: ee00e800 ti: ee078000 task.ti: ee078000
>> [   10.774637] PC is at crc32_le+0x2c/0x13c
>> [   10.774637] LR is at 0x1e00
>> [   10.774637] pc : [<c01cb3a0>]    lr : [<00001e00>]    psr: 20000093
>> [   10.774637] sp : ee079e6c  ip : 700de3b6  fp : efa06222
>> [   10.774637] r10: 840510ee  r9 : 00000000  r8 : 00002000
>> [   10.774637] r7 : c05086ac  r6 : 00000000  r5 : 9e16d8c3  r4 : f0000ffc
>> [   10.774637] r3 : c05083c0  r2 : 00000000  r1 : effffffc  r0 : 20706046
>> [   10.774637] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
>> Segment user
>> [   10.774637] Control: 10c5387d  Table: 6db1806a  DAC: 00000015
>> [   10.774637] Process sh (pid: 1, stack limit = 0xee078240)
>> [   10.774637] Stack: (0xee079e6c to 0xee07a000)
>> [   10.774637] 9e60:                            70000000 ed9cba00
>> ef7fccc0 00000000 c050f036
>> [   10.774637] 9e80: 00000000 ee3ca60c beb7da40 c001a8c8 ef7fccc0
>> ed9cba00 c001a894 c001a880
>> [   10.774637] 9ea0: c05128a0 ed9c0000 c001a894 c001a850 c05125f0
>> c05439bc 00000003 c001a0ec
>> [   10.774637] 9ec0: c05439bc c0057044 beb7da40 c03841a4 c044e1d0
>> ee079eec 00000000 ee079eec
>> [   10.774637] 9ee0: 00000003 00000003 00000000 c038f360 00000003
>> ed899d40 00000004 c00572a0
>> [   10.774637] 9f00: 0000006d 00000003 c04465bc c00562c4 00000004
>> 00000000 00000000 ee079f80
>> [   10.774637] 9f20: ed899d40 00000004 ee3ca600 c0110534 00000000
>> 00000000 ee203900 b6f3b000
>> [   10.774637] 9f40: ee079f80 00000004 00000004 b6f3b000 00000000
>> c00b7ca0 ee00e800 c00d1570
>> [   10.774637] 9f60: 00000001 00000000 00000000 ee203900 ee203900
>> 00000004 b6f3b000 c00b8284
>> [   10.774637] 9f80: 00000000 00000000 ee203900 00000004 b6f3b000
>> b6e265f8 00000004 c000e4e4
>> [   10.774637] 9fa0: ee078000 c000e360 00000004 b6f3b000 00000001
>> b6f3b000 00000004 00000000
>> [   10.774637] 9fc0: 00000004 b6f3b000 b6e265f8 00000004 00000004
>> 000ad848 00000974 beb7da40
>> [   10.774637] 9fe0: b6f3b000 beb7d7c0 b6d6d124 b6dba43c 60000010
>> 00000001 ffffffff ffffffff
>> [   10.774637] [<c01cb3a0>] (crc32_le) from [<c001a8c8>]
>> (s3c_pm_makecheck+0x34/0x54)
>> [   10.774637] [<c001a8c8>] (s3c_pm_makecheck) from [<c001a880>]
>> (s3c_pm_run_res+0x6c/0x80)
>> [   10.774637] [<c001a880>] (s3c_pm_run_res) from [<c001a850>]
>> (s3c_pm_run_res+0x3c/0x80)
>> [   10.774637] [<c001a850>] (s3c_pm_run_res) from [<c001a0ec>]
>> (exynos_suspend_enter+0xa8/0x144)
>> [   10.774637] [<c001a0ec>] (exynos_suspend_enter) from [<c0057044>]
>> (suspend_devices_and_enter+0x25c/0x304)
>> [   10.774637] [<c0057044>] (suspend_devices_and_enter) from
>> [<c00572a0>] (pm_suspend+0x1b4/0x214)
>> [   10.774637] [<c00572a0>] (pm_suspend) from [<c00562c4>]
>> (state_store+0x68/0xb8)
>> [   10.774637] [<c00562c4>] (state_store) from [<c0110534>]
>> (kernfs_fop_write+0xc0/0x180)
>> [   10.774637] [<c0110534>] (kernfs_fop_write) from [<c00b7ca0>]
>> (vfs_write+0xac/0x188)
>> [   10.774637] [<c00b7ca0>] (vfs_write) from [<c00b8284>] (SyS_write+0x40/0x94)
>> [   10.774637] [<c00b8284>] (SyS_write) from [<c000e360>]
>> (ret_fast_syscall+0x0/0x30)
>> [   10.774637] Code: e30833c0 e1a04001 e34c3050 e1a0e008 (e5945004)
>> [   10.774637] ---[ end trace 2ba1a0948b7498ef ]---
>> [   10.774637] ------------[ cut here ]------------
>> [   10.774637] WARNING: CPU: 0 PID: 0 at kernel/time/timekeeping.c:345
>> ktime_get+0x110/0x11c()
>> [   10.774637] Modules linked in:
>> [   10.774637] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D
>> 3.15.0-rc4-00197-g0cb752a #43
>> [   10.774637] [<c0013fe8>] (unwind_backtrace) from [<c00112d4>]
>> (show_stack+0x10/0x14)
>> [   10.774637] [<c00112d4>] (show_stack) from [<c0386488>]
>> (dump_stack+0x80/0xc0)
>> [   10.774637] [<c0386488>] (dump_stack) from [<c001d2a0>]
>> (warn_slowpath_common+0x6c/0x88)
>> [   10.774637] [<c001d2a0>] (warn_slowpath_common) from [<c001d358>]
>> (warn_slowpath_null+0x1c/0x24)
>> [   10.774637] [<c001d358>] (warn_slowpath_null) from [<c0065ff8>]
>> (ktime_get+0x110/0x11c)
>> [   10.774637] [<c0065ff8>] (ktime_get) from [<c006f330>]
>> (__tick_nohz_idle_enter+0x1c/0x44c)
>> [   10.774637] [<c006f330>] (__tick_nohz_idle_enter) from [<c006f7a0>]
>> (tick_nohz_idle_enter+0x40/0x78)
>> [   10.774637] [<c006f7a0>] (tick_nohz_idle_enter) from [<c00500d8>]
>> (cpu_startup_entry+0x48/0x160)
>> [   10.774637] [<c00500d8>] (cpu_startup_entry) from [<c04caae4>]
>> (start_kernel+0x344/0x350)
>> [   10.774637] ---[ end trace 2ba1a0
>>
>>
>> Regards
>> Vikas Sajjan
> 
