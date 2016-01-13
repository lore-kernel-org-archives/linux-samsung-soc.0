From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: Various warnings and oops on Odroid U3
Date: Wed, 13 Jan 2016 12:08:02 +0100
Message-ID: <56963012.4000900@samsung.com>
References: <CAE-5t2sRB21s=PoYw5fcngPn1L8LtLct1oShwvo+OcXB+YwsLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37907 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755324AbcAMLIF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jan 2016 06:08:05 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0W0099G1LFU270@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Jan 2016 11:08:03 +0000 (GMT)
In-reply-to: <CAE-5t2sRB21s=PoYw5fcngPn1L8LtLct1oShwvo+OcXB+YwsLw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Pietrowski <thopiekar@gmail.com>, linux-samsung-soc@vger.kernel.org

Dear Thomas,

On 2016-01-10 18:12, Thomas Pietrowski wrote:
> Hello everyone,
>
> as I'm trying to build a kernel with support on different boards, I
> found different problems. I'm writing here to samsung-soc first,
> because I'm not sure whether it is just a Odroid-U3 or Samsung SoC
> related problem.
>
> So first there is .config.working.old:
> This .config is working very well and has (as far as I remember) no
> other boards except Samsung SoC's enabled.
>
> Then I noticed when using .config.warn.skbuff the warning in dmesg.
> I'm not sure (100%) whether it appeared before, but I appeared while
> transferring a lot of small data.
>
> Additonally I also got another warning when enabled more boards
> (resulting in .config.warn.ftrace).

I confirm this warning. Please report it to ARM kernel mailing list. It is
not really related to Samsung Exynos SoC support.

> After enabling all boards by different vendors in the menu at xconfig.
> I started enabling other targets at "System Type", where you can find
> Rockchip for example. Enabling Rockchip* or Xilinx* was no problem,
> but then I enabled "WonderMedia WM8850 (ARCH_WM8850)", see
> .config.broken.no_ttySAC1_mmcblk0p1.first, and during boot an oops
> appears. The same symptom appears when enabling "Annapurna Labs Alpine
> platform (ARCH_ALPINE)", where autofs4 oops's
> (.config.broken.no_ttySAC1_mmcblk0p1.autofs4.tty).
>
> Can someone at least confirm these problems?
> Are they related to our platform? If not you can redirect this mail to
> a more general mailing-list of course :)

Those problems also don't look like related to Exynos platform. I suspect
that enabling those platforms adds support for a driver, which is not
multi-platform friendly and it messes in the system when no hardware
has been detected. I've checked .config.broken.no_ttySAC1_mmcblk0p1.first
config and I also got a panic message (although a bit different):

[    2.702200] Freeing unused kernel memory: 1084K (c0c03000 - c0d12000)
[    2.733048] Internal error: Oops - undefined instruction: 0 [#1] 
PREEMPT SMP THUMB2
[    2.739301] Modules linked in:
[    2.742339] CPU: 3 PID: 29 Comm: kworker/u8:1 Tainted: G W       
4.4.0-testing #10983
[    2.750757] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    2.756844] Workqueue: deferwq deferred_probe_work_func
[    2.762039] task: ee688600 ti: ee69e000 task.ti: ee69e000
[    2.767425] PC is at mvebu_soc_device+0x2e/0x9c
[    2.771937] LR is at __device_attach_driver+0x1f/0x4c
[    2.776970] pc : [<c0c0c0c2>]    lr : [<c05831a3>] psr: a0000053
[    2.776970] sp : ee69fe70  ip : c058318d  fp : c0e12e34
[    2.788426] r10: 00000001  r9 : 00000000  r8 : c0d15588
[    2.793637] r7 : c0583185  r6 : edc1a210  r5 : ee69feac  r4 : c0c908dc
[    2.800146] r3 : c0c0c0c0  r2 : 00000000  r1 : c0c908dc  r0 : edc1a210
[    2.806657] Flags: NzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM 
Segment none
[    2.813862] Control: 50c5387d  Table: 4020404a  DAC: 00000051
[    2.819592] Process kworker/u8:1 (pid: 29, stack limit = 0xee69e220)
[    2.825927] Stack: (0xee69fe70 to 0xee6a0000)
[    2.830265] fe60:                                     c0c908dc 
00000000 ee69feac c05818cf
[    2.838427] fe80: 40000053 ee4b8c70 edc1ecb8 dc8ba600 edc1a210 
c0d15588 edc1a210 edc1a244
[    2.846589] fea0: 00000001 c0582d05 ee556000 edc1a210 00000001 
dc8ba600 edc1a210 c0dc9978
[    2.854746] fec0: edc1a210 c0dc9b70 ed946e00 c05824ff 00000000 
edc1a210 c0dc9978 c0dc9990
[    2.862902] fee0: c0e1a328 c0582863 c0582831 c0dc99ac ee59b100 
ee43b814 ee43b800 c02549a1
[    2.871061] ff00: ee69ff10 ee43b848 ee43b800 ee43b800 ee59b118 
ee43b814 ee69e000 ee43b848
[    2.879221] ff20: c0e12a82 ee43b800 ee59b100 c0254cd3 c07b2581 
c0d15100 ee43b964 00000000
[    2.887379] ff40: 00000000 00000000 ee5ca0c0 ee59b100 c0254bd9 
00000000 00000000 00000000
[    2.895539] ff60: 00000000 c0258d27 00000000 c0c0c0c0 ee59b100 
00000000 00000000 ee69ff7c
[    2.903698] ff80: ee69ff7c 00000000 00000000 ee69ff8c ee69ff8c 
dc8ba600 ee69ffa0 ee5ca0c0
[    2.911857] ffa0: c0258c79 00000000 00000000 c02100f5 00000000 
00000000 00000000 00000000
[    2.920016] ffc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    2.928176] ffe0: 00000000 00000000 00000000 00000000 00000013 
00000000 c0c0c0c0 c0c0c0c0
[    2.936344] [<c05831a3>] (__device_attach_driver) from [<c05818cf>] 
(bus_for_each_drv+0x4f/0x7c)
[    2.945103] [<c05818cf>] (bus_for_each_drv) from [<c0582d05>] 
(__device_attach+0x81/0xe8)
[    2.953261] [<c0582d05>] (__device_attach) from [<c05824ff>] 
(bus_probe_device+0x5b/0x60)
[    2.961421] [<c05824ff>] (bus_probe_device) from [<c0582863>] 
(deferred_probe_work_func+0x33/0xa4)
[    2.970367] [<c0582863>] (deferred_probe_work_func) from [<c02549a1>] 
(process_one_work+0xe1/0x318)
[    2.979391] [<c02549a1>] (process_one_work) from [<c0254cd3>] 
(worker_thread+0xfb/0x388)
[    2.987463] [<c0254cd3>] (worker_thread) from [<c0258d27>] 
(kthread+0xaf/0xc4)
[    2.994669] [<c0258d27>] (kthread) from [<c02100f5>] 
(ret_from_fork+0x11/0x1c)
[    3.001870] Code: def0e7fd def0e7fd def0e7fd def0e7fd (def0e7fd)
[    3.007946] ---[ end trace f24b6c88ae00fa9c ]---
[    3.012651] Unable to handle kernel paging request at virtual address 
ffffffec
[    3.019747] pgd = c0204000
[    3.022437] [ffffffec] *pgd=6fffd861, *pte=00000000, *ppte=00000000
[    3.028690] Internal error: Oops: 37 [#2] PREEMPT SMP THUMB2
[    3.034329] Modules linked in:
[    3.037370] CPU: 3 PID: 29 Comm: kworker/u8:1 Tainted: G      D 
W       4.4.0-testing #10983
[    3.045786] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    3.051869] task: ee688600 ti: ee69e000 task.ti: ee69e000
[    3.057247] PC is at kthread_data+0xa/0x10
[    3.061327] LR is at wq_worker_sleeping+0xf/0x9c
[    3.065926] pc : [<c025923a>]    lr : [<c025556b>] psr: 000000f3
[    3.065926] sp : ee69fc10  ip : c0259237  fp : 00000003
[    3.077381] r10: ee688904  r9 : c0d160e0  r8 : c0d102c0
[    3.082590] r7 : ee69fc30  r6 : 00000000  r5 : eedbc2c0  r4 : 00000003
[    3.089099] r3 : 00000000  r2 : 00000000  r1 : 00000003  r0 : ee688600
[    3.095611] Flags: nzcv  IRQs off  FIQs off  Mode SVC_32  ISA Thumb  
Segment none
[    3.103075] Control: 50c5387d  Table: 4020404a  DAC: 00000051
[    3.108803] Process kworker/u8:1 (pid: 29, stack limit = 0xee69e220)
[    3.115140] Stack: (0xee69fc10 to 0xee6a0000)
[    3.119482] fc00:                                     00000020 
ee688600 eedbc2c0 c07b2133
[    3.127642] fc20: edd5dc80 c024559b c0d160e0 ee69e000 00009b33 
c07b257b 00000001 ee69e000
[    3.135801] fc40: ee69f9dc ee69fc74 ee69fc60 ee68887c 00000000 
c0c0c0c6 ee528000 c07b257b
[    3.143960] fc60: 0420806c ee688600 ee69fc74 c02455f1 ee69fde0 
ee69fc74 ee69fc74 dc8ba600
[    3.152120] fc80: c0e27404 c0e27404 c0d1b00c c0d15588 ee69fde0 
200000d3 0000000b c0c0c0c6
[    3.160278] fca0: 00000001 c0213e03 ee69e220 0000000b c0e100c8 
c0d1b00c 00000000 ee69e000
[    3.168438] fcc0: 00000000 00000008 00000000 64000400 65306665 
20646637 30666564 64663765
[    3.176597] fce0: 66656420 66376530 65642064 37653066 28206466 
30666564 64663765 00002029
[    3.184756] fd00: c07b5193 dc8ba600 ee69fd18 00000000 00030001 
00000004 ee69fde0 c0d15588
[    3.192915] fd20: c0c0c0c2 00000001 c0e12e34 c020a171 00000006 
00000000 c0d1606c 00000004
[    3.201075] fd40: 00000000 00030001 c0c0c0c2 00000001 c0339ab3 
eeda2300 edf16648 c02692b5
[    3.209234] fd60: eeda2300 edf16648 00079bb9 00079bb9 00000000 
c02692b5 000000b3 00000000
[    3.217393] fd80: a269731b 00000000 ee69fd98 00000000 eedbc300 
00000000 ee69fdc0 c0277157
[    3.225552] fda0: 00000000 ee688648 eedbc300 c0267a97 ee688648 
c0267a97 eeda2300 dc8ba600
[    3.233711] fdc0: c0c0c0c4 c0c0c0c4 a0000053 ffffffff ee69fe14 
c0d15588 00000000 c07b5835
[    3.241870] fde0: edc1a210 c0c908dc 00000000 c0c0c0c0 c0c908dc 
ee69feac edc1a210 c0583185
[    3.250030] fe00: c0d15588 00000000 00000001 c0e12e34 c058318d 
ee69fe70 c05831a3 c0c0c0c2
[    3.258189] fe20: a0000053 ffffffff 00000051 00000001 c07b4ded 
00000000 ee69fe48 00000000
[    3.266348] fe40: 00000000 c0262189 edc1ecb8 ee69fe84 edc1ec38 
c07b4ded edc1ecc4 c07b1245
[    3.274507] fe60: 00000070 c0d4608c 00000000 c05818cf c0c908dc 
00000000 ee69feac c05818cf
[    3.282667] fe80: 40000053 ee4b8c70 edc1ecb8 dc8ba600 edc1a210 
c0d15588 edc1a210 edc1a244
[    3.290826] fea0: 00000001 c0582d05 ee556000 edc1a210 00000001 
dc8ba600 edc1a210 c0dc9978
[    3.298985] fec0: edc1a210 c0dc9b70 ed946e00 c05824ff 00000000 
edc1a210 c0dc9978 c0dc9990
[    3.307144] fee0: c0e1a328 c0582863 c0582831 c0dc99ac ee59b100 
ee43b814 ee43b800 c02549a1
[    3.315303] ff00: ee69ff10 ee43b848 ee43b800 ee43b800 ee59b118 
ee43b814 ee69e000 ee43b848
[    3.323463] ff20: c0e12a82 ee43b800 ee59b100 c0254cd3 c07b2581 
c0d15100 ee43b964 00000000
[    3.331622] ff40: 00000000 00000000 ee5ca0c0 ee59b100 c0254bd9 
00000000 00000000 00000000
[    3.339781] ff60: 00000000 c0258d27 00000000 c0c0c0c0 ee59b100 
00000000 00000000 ee69ff7c
[    3.347940] ff80: ee69ff7c 00000001 00010001 ee69ff8c ee69ff8c 
dc8ba600 ee69ffa0 ee5ca0c0
[    3.356099] ffa0: c0258c79 00000000 00000000 c02100f5 00000000 
00000000 00000000 00000000
[    3.364258] ffc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    3.372418] ffe0: 00000000 00000000 00000000 00000000 00000013 
00000000 c0c0c0c0 c0c0c0c0
[    3.380581] [<c025923a>] (kthread_data) from [<c025556b>] 
(wq_worker_sleeping+0xf/0x9c)
[    3.388569] [<c025556b>] (wq_worker_sleeping) from [<c07b2133>] 
(__schedule+0x28b/0x568)
[    3.396638] [<c07b2133>] (__schedule) from [<c07b257b>] 
(schedule+0x37/0x70)
[    3.403669] [<c07b257b>] (schedule) from [<c02455f1>] 
(do_exit+0x601/0x868)
[    3.410612] [<c02455f1>] (do_exit) from [<c0213e03>] (die+0x383/0x3a0)
[    3.417121] [<c0213e03>] (die) from [<c020a171>] 
(do_undefinstr+0x15d/0x188)
[    3.424153] [<c020a171>] (do_undefinstr) from [<c07b5835>] 
(__und_svc_finish+0x1/0x4c)
[    3.432047] Exception stack(0xee69fde0 to 0xee69fe28)
[    3.437084] fde0: edc1a210 c0c908dc 00000000 c0c0c0c0 c0c908dc 
ee69feac edc1a210 c0583185
[    3.445243] fe00: c0d15588 00000000 00000001 c0e12e34 c058318d 
ee69fe70 c05831a3 c0c0c0c2
[    3.453400] fe20: a0000053 ffffffff
[    3.456878] [<c07b5835>] (__und_svc_finish) from [<c0c0c0c2>] 
(mvebu_soc_device+0x2e/0x9c)
[    3.465121] Code: f7bd fd2d f8d0 32d4 (f853) 0c14
[    3.469893] ---[ end trace f24b6c88ae00fa9d ]---

If you have some time, you may check which exactly driver or kconfig option
causes the problem by enabling them one by one. Right now I have no time to
debug this issue further. It definitely looks like a bug introduced by
non-Exynos platform.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
