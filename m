From: Gustavo Padovan <gustavo@padovan.org>
Subject: [BUG 3.18-rc3] kernel BUG at drivers/iommu/exynos-iommu.c:481!
Date: Wed, 5 Nov 2014 19:09:06 -0200
Message-ID: <20141105210906.GA30193@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f41.google.com ([209.85.216.41]:45668 "EHLO
	mail-qa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750706AbaKEVJN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Nov 2014 16:09:13 -0500
Received: by mail-qa0-f41.google.com with SMTP id s7so1159625qap.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Nov 2014 13:09:13 -0800 (PST)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Cho KyongHo <pullip.cho@samsung.com>, Shaik Ameer Basha <shaik.ameer@samsung.com>

Hi,

I'm seeing the following bug running the current linus tree of today,
it seems this was introduced by the following commit:

commit 6b21a5db36427d54a94091fc26b5890c3d6a8af3
Author: Cho KyongHo <pullip.cho@samsung.com>
Date:   Mon May 12 11:45:02 2014 +0530

    iommu/exynos: Support for device tree
    
    This commit adds device tree support for System MMU.
    
    Also, system mmu handling is improved. Previously, an IOMMU domain is
    bound to a System MMU which is not correct. This patch binds an IOMMU
    domain with the master device of a System MMU.
    
    Signed-off-by: Cho KyongHo <pullip.cho@samsung.com>
    Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
    Signed-off-by: Joerg Roedel <jroedel@suse.de>


It is failing on a BUG_ON(!has_sysmmu(dev));

	Gustavo


[    3.188618] ------------[ cut here ]------------
[    3.188622] kernel BUG at drivers/iommu/exynos-iommu.c:481!
[    3.188626] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
[    3.188633] Modules linked in:
[    3.188639] CPU: 0 PID: 18 Comm: kworker/u4:1 Not tainted
3.18.0-rc3-00061-ga1cff6e #3
[    3.188650] Workqueue: deferwq deferred_probe_work_func
[    3.188654] task: ee09bc00 ti: ee110000 task.ti: ee110000
[    3.188661] PC is at __exynos_sysmmu_enable+0x174/0x180
[    3.188665] LR is at exynos_iommu_attach_device+0x44/0xb0
[    3.188670] pc : [<c0380024>]    lr : [<c0380074>]    psr: 60000193
[    3.188670] sp : ee111d00  ip : 00000000  fp : 6d444000
[    3.188674] r10: ed488080  r9 : a0000113  r8 : ed4880d0
[    3.188678] r7 : ee194e10  r6 : ee194e10  r5 : ed488080  r4 : 00000000
[    3.188683] r3 : 6d444000  r2 : ed488080  r1 : 6d444000  r0 : ee194e10
[    3.188687] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment
kernel
[    3.188691] Control: 10c5387d  Table: 4000406a  DAC: 00000015
[    3.188695] Process kworker/u4:1 (pid: 18, stack limit = 0xee110240)
[    3.188699] Stack: (0xee111d00 to 0xee112000)
[    3.188705] 1d00: 6d444000 ed4880c0 ed488080 00000000 ee194e10 ed4880d0
a0000113 00000001
[    3.188710] 1d20: 00000000 c0380074 ed81d410 6d444000 ed488000 ee194e10
ed81d410 eda54400
[    3.188715] 1d40: c0668444 ed81d410 00000001 c037e28c ed4885d0 c0016624
ed4885d0 ee194e10
[    3.188719] 1d60: ee24a010 ed81d410 eda54400 c026c310 00000001 00000005
ed81d410 c026e0d0
[    3.188724] 1d80: c026dfc0 ed8dc840 ee3fe480 ed48cf80 eda54400 00000001
c0692738 00000003
[    3.188729] 1da0: ee00fc00 c0285678 eda54400 eda54400 eda54400 00000000
ed48cf80 ed8dcbd0
[    3.188733] 1dc0: ed48c500 c0268908 eda54400 00000000 00000000 c02551e8
ee24a000 eda54400
[    3.188738] 1de0: c0691a30 c0256e68 ed48c580 c028c408 ed8dc840 ed8dcbf0
ed8dcbf0 00000004
[    3.188743] 1e00: ed8dc840 c0285960 ed8dc840 c06930e0 ed48c500 c048c964
c06922a0 c0285b48
[    3.188748] 1e20: 00000000 ee217a10 ee01f810 00000000 ee217a00 c0277cfc
00002003 c05aecf4
[    3.188753] 1e40: ee01f810 ed9828c0 00000000 0000000c fffffffe ee217a10
fffffdfb c06926d4
[    3.188757] 1e60: 00000001 00000000 00000000 c028ac84 c028ac3c ee217a10
c06e5774 00000000
[    3.188762] 1e80: c06926d4 c0289838 00000000 ee217a10 c02899e8 ee110000
ed93a900 c0287fdc
[    3.188767] 1ea0: ee005298 ee176ec4 ee217a10 ee217a44 c06932c0 c02896f4
ee217a10 ee217a10
[    3.188772] 1ec0: c06932c0 c0288e4c ee217a10 c0693240 c0693218 c0289220
ee0f2880 c0693268
[    3.188776] 1ee0: ee00fc00 c0032c38 ee00fc00 c065f5c0 c065f5c0 c065f5c0
00000001 ee00fc20
[    3.188781] 1f00: ee110000 ee110000 ee0f2898 ee0f2880 ee00fc00 00000088
ee00fc00 c0032e90
[    3.188786] 1f20: ee110000 ee00fc54 00000000 ee051b80 00000000 ee0f2880
c0032e54 00000000
[    3.188791] 1f40: 00000000 00000000 00000000 c0037630 00000000 00000000
00000000 ee0f2880
[    3.188795] 1f60: 00000000 00000000 dead4ead ffffffff ffffffff ee111f74
ee111f74 00000000
[    3.188800] 1f80: 00000000 dead4ead ffffffff ffffffff ee111f90 ee111f90
ee111fac ee051b80
[    3.188805] 1fa0: c0037564 00000000 00000000 c000e878 00000000 00000000
00000000 00000000
[    3.188809] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[    3.188814] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
00000000 00000000
[    3.188824] [<c0380024>] (__exynos_sysmmu_enable) from [<c0380074>]
(exynos_iommu_attach_device+0x44/0xb0)
[    3.188830] [<c0380074>] (exynos_iommu_attach_device) from [<c037e28c>]
(iommu_attach_device+0x18/0x24)
[    3.188839] [<c037e28c>] (iommu_attach_device) from [<c0016624>]
(arm_iommu_attach_device+0x18/0xa0)
[    3.188849] [<c0016624>] (arm_iommu_attach_device) from [<c026c310>]
(drm_iommu_attach_device+0x4c/0xc8)
[    3.188857] [<c026c310>] (drm_iommu_attach_device) from [<c026e0d0>]
(fimd_bind+0x110/0x17c)
[    3.188866] [<c026e0d0>] (fimd_bind) from [<c0285678>]
(component_bind_all+0xb0/0x1cc)
[    3.188873] [<c0285678>] (component_bind_all) from [<c0268908>]
(exynos_drm_load+0x98/0x148)
[    3.188882] [<c0268908>] (exynos_drm_load) from [<c02551e8>]
(drm_dev_register+0xa0/0x100)
[    3.188890] [<c02551e8>] (drm_dev_register) from [<c0256e68>]
(drm_platform_init+0x40/0xd0)
[    3.188898] [<c0256e68>] (drm_platform_init) from [<c0285960>]
(try_to_bring_up_master.part.2+0xc8/0x104)
[    3.188905] [<c0285960>] (try_to_bring_up_master.part.2) from [<c0285b48>]
(component_add+0x84/0xec)
[    3.188912] [<c0285b48>] (component_add) from [<c0277cfc>]
(hdmi_probe+0x4cc/0x684)
[    3.188919] [<c0277cfc>] (hdmi_probe) from [<c028ac84>]
(platform_drv_probe+0x48/0xa4)
[    3.188926] [<c028ac84>] (platform_drv_probe) from [<c0289838>]
(driver_probe_device+0x10c/0x22c)
[    3.188933] [<c0289838>] (driver_probe_device) from [<c0287fdc>]
(bus_for_each_drv+0x44/0x8c)
[    3.188940] [<c0287fdc>] (bus_for_each_drv) from [<c02896f4>]
(device_attach+0x70/0x88)
[    3.188946] [<c02896f4>] (device_attach) from [<c0288e4c>]
(bus_probe_device+0x84/0xa8)
[    3.188952] [<c0288e4c>] (bus_probe_device) from [<c0289220>]
(deferred_probe_work_func+0x5c/0x88)
[    3.188960] [<c0289220>] (deferred_probe_work_func) from [<c0032c38>]
(process_one_work+0x12c/0x314)
[    3.188967] [<c0032c38>] (process_one_work) from [<c0032e90>]
(worker_thread+0x3c/0x4b0)
[    3.188975] [<c0032e90>] (worker_thread) from [<c0037630>]
(kthread+0xcc/0xe8)
[    3.188983] [<c0037630>] (kthread) from [<c000e878>]
(ret_from_fork+0x14/0x3c)
[    3.188990] Code: e3403110 11a02001 01a02003 eaffffe4 (e7f001f2)
[    3.188996] ---[ end trace 3a0df6418f18791c ]---
[    3.189003] note: kworker/u4:1[18] exited with preempt_count 1
[    3.189046] Unable to handle kernel paging request at virtual address
ffffffe0
[    3.189049] pgd = c0004000
[    3.189060] [ffffffe0] *pgd=6f7fd821, *pte=00000000, *ppte=00000000
[    3.189065] Internal error: Oops: 17 [#2] PREEMPT SMP ARM
[    3.189071] Modules linked in:
[    3.189076] CPU: 0 PID: 18 Comm: kworker/u4:1 Tainted: G      D
3.18.0-rc3-00061-ga1cff6e #3
[    3.189084] task: ee09bc00 ti: ee110000 task.ti: ee110000
[    3.189089] PC is at kthread_data+0x4/0xc
[    3.189093] LR is at wq_worker_sleeping+0xc/0xd0
[    3.189098] pc : [<c0037ba0>]    lr : [<c0033b58>]    psr: 20000193
[    3.189098] sp : ee111b60  ip : 00000800  fp : ee111b9c
[    3.189101] r10: ee7b85c0  r9 : ee09bc00  r8 : c06687d0
[    3.189105] r7 : ee110000  r6 : c065f5c0  r5 : ee09be7c  r4 : 00000000
[    3.189109] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : ee09bc00
[    3.189113] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment
user
[    3.189117] Control: 10c5387d  Table: 4000406a  DAC: 00000015
[    3.189121] Process kworker/u4:1 (pid: 18, stack limit = 0xee110240)
[    3.189124] Stack: (0xee111b60 to 0xee112000)
[    3.189129] 1b60: 00000000 c04578c0 ee13dd20 c065f5c0 c065f5c0 c065f5c0
00000000 00000001
[    3.189135] 1b80: ee09bbf8 ee09bc00 ee09bbf8 ee110000 ee00e400 ee09bdf8
ee09bdf8 c0022e30
[    3.189139] 1ba0: ee111bb0 00000001 ee09bc00 ee09be40 ee111bb0 ee111bb0
00000001 c066bf90
[    3.189144] 1bc0: c06a8644 0000000b c055dc6c 00000000 ee110000 60000193
ee09bc00 c0011134
[    3.189149] 1be0: ee110240 0000000b ee111cb8 00000004 c066bfa4 e7f001f2
ee111cb8 c0380024
[    3.189153] 1c00: c0011aac 00000000 6d444000 c0008320 00000006 00000002
00000004 00000000
[    3.189159] 1c20: 00030001 c0380024 00000141 00000000 00000000 c0460b28
00000000 00000001
[    3.189164] 1c40: 000280d0 fffffffe 00000000 c06a7fcc 00020805 00000000
ee09bc48 ee7b8618
[    3.189168] 1c60: 2ac8f691 00000001 2e159000 ee09bc00 ee09bc48 00000000
ee09be78 00000000
[    3.189173] 1c80: ee7b85c0 c06687d0 00000001 ee7b8618 c000997c ffffffff
00000000 c0380028
[    3.189178] 1ca0: 00000000 c0011e58 00000000 e7100000 ee110000 c0011aac
ee194e10 6d444000
[    3.189182] 1cc0: ed488080 6d444000 00000000 ed488080 ee194e10 ee194e10
ed4880d0 a0000113
[    3.189187] 1ce0: ed488080 6d444000 00000000 ee111d00 c0380074 c0380024
60000193 ffffffff
[    3.189192] 1d00: 6d444000 ed4880c0 ed488080 00000000 ee194e10 ed4880d0
a0000113 00000001
[    3.189197] 1d20: 00000000 c0380074 ed81d410 6d444000 ed488000 ee194e10
ed81d410 eda54400
[    3.189202] 1d40: c0668444 ed81d410 00000001 c037e28c ed4885d0 c0016624
ed4885d0 ee194e10
[    3.189206] 1d60: ee24a010 ed81d410 eda54400 c026c310 00000001 00000005
ed81d410 c026e0d0
[    3.189211] 1d80: c026dfc0 ed8dc840 ee3fe480 ed48cf80 eda54400 00000001
c0692738 00000003
[    3.189216] 1da0: ee00fc00 c0285678 eda54400 eda54400 eda54400 00000000
ed48cf80 ed8dcbd0
[    3.189219] 1dc0: ed48c500 c0268908 eda54400 00000000 00000000 c02551e8
ee24a000 eda54400
[    3.189222] 1de0: c0691a30 c0256e68 ed48c580 c028c408 ed8dc840 ed8dcbf0
ed8dcbf0 00000004
[    3.189225] 1e00: ed8dc840 c0285960 ed8dc840 c06930e0 ed48c500 c048c964
c06922a0 c0285b48
[    3.189229] 1e20: 00000000 ee217a10 ee01f810 00000000 ee217a00 c0277cfc
00002003 c05aecf4
[    3.189232] 1e40: ee01f810 ed9828c0 00000000 0000000c fffffffe ee217a10
fffffdfb c06926d4
[    3.189236] 1e60: 00000001 00000000 00000000 c028ac84 c028ac3c ee217a10
c06e5774 00000000
[    3.189239] 1e80: c06926d4 c0289838 00000000 ee217a10 c02899e8 ee110000
ed93a900 c0287fdc
[    3.189243] 1ea0: ee005298 ee176ec4 ee217a10 ee217a44 c06932c0 c02896f4
ee217a10 ee217a10
[    3.189246] 1ec0: c06932c0 c0288e4c ee217a10 c0693240 c0693218 c0289220
ee0f2880 c0693268
[    3.189250] 1ee0: ee00fc00 c0032c38 ee00fc00 c065f5c0 c065f5c0 c065f5c0
00000001 ee00fc20
[    3.189254] 1f00: ee110000 ee110000 ee0f2898 ee0f2880 ee00fc00 00000088
ee00fc00 c0032e90
[    3.189257] 1f20: ee110000 ee00fc54 00000000 ee051b80 00000000 ee0f2880
c0032e54 00000000
[    3.189260] 1f40: 00000000 00000000 00000000 c0037630 00000000 00000000
00000000 ee0f2880
[    3.189264] 1f60: 00000000 00000000 dead4ead ffffffff ffffffff ee111f74
ee111f74 00000001
[    3.189268] 1f80: 00010001 dead4ead ffffffff ffffffff ee111f90 ee111f90
ee111fac ee051b80
[    3.189271] 1fa0: c0037564 00000000 00000000 c000e878 00000000 00000000
00000000 00000000
[    3.189274] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[    3.189278] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
00000000 00000000
[    3.189283] [<c0037ba0>] (kthread_data) from [<c0033b58>]
(wq_worker_sleeping+0xc/0xd0)
[    3.189290] [<c0033b58>] (wq_worker_sleeping) from [<c04578c0>]
(__schedule+0x300/0x4d4)
[    3.189298] [<c04578c0>] (__schedule) from [<c0022e30>]
(do_exit+0x5a8/0x8b0)
[    3.189306] [<c0022e30>] (do_exit) from [<c0011134>] (die+0x204/0x2cc)
[    3.189311] [<c0011134>] (die) from [<c0008320>] (do_undefinstr+0x9c/0x1cc)
[    3.189318] [<c0008320>] (do_undefinstr) from [<c0011aac>]
(__und_svc_finish+0x0/0x34)
[    3.189320] Exception stack(0xee111cb8 to 0xee111d00)
[    3.189323] 1ca0:
ee194e10 6d444000
[    3.189326] 1cc0: ed488080 6d444000 00000000 ed488080 ee194e10 ee194e10
ed4880d0 a0000113
[    3.189330] 1ce0: ed488080 6d444000 00000000 ee111d00 c0380074 c0380024
60000193 ffffffff
[    3.189336] [<c0011aac>] (__und_svc_finish) from [<c0380024>]
(__exynos_sysmmu_enable+0x174/0x180)
[    3.189341] [<c0380024>] (__exynos_sysmmu_enable) from [<c0380074>]
(exynos_iommu_attach_device+0x44/0xb0)
[    3.189346] [<c0380074>] (exynos_iommu_attach_device) from [<c037e28c>]
(iommu_attach_device+0x18/0x24)
[    3.189351] [<c037e28c>] (iommu_attach_device) from [<c0016624>]
(arm_iommu_attach_device+0x18/0xa0)
[    3.189357] [<c0016624>] (arm_iommu_attach_device) from [<c026c310>]
(drm_iommu_attach_device+0x4c/0xc8)
[    3.189362] [<c026c310>] (drm_iommu_attach_device) from [<c026e0d0>]
(fimd_bind+0x110/0x17c)
[    3.189369] [<c026e0d0>] (fimd_bind) from [<c0285678>]
(component_bind_all+0xb0/0x1cc)
[    3.189374] [<c0285678>] (component_bind_all) from [<c0268908>]
(exynos_drm_load+0x98/0x148)
[    3.189380] [<c0268908>] (exynos_drm_load) from [<c02551e8>]
(drm_dev_register+0xa0/0x100)
[    3.189386] [<c02551e8>] (drm_dev_register) from [<c0256e68>]
(drm_platform_init+0x40/0xd0)
[    3.189392] [<c0256e68>] (drm_platform_init) from [<c0285960>]
(try_to_bring_up_master.part.2+0xc8/0x104)
[    3.189398] [<c0285960>] (try_to_bring_up_master.part.2) from [<c0285b48>]
(component_add+0x84/0xec)
[    3.189403] [<c0285b48>] (component_add) from [<c0277cfc>]
(hdmi_probe+0x4cc/0x684)
[    3.189408] [<c0277cfc>] (hdmi_probe) from [<c028ac84>]
(platform_drv_probe+0x48/0xa4)
[    3.189414] [<c028ac84>] (platform_drv_probe) from [<c0289838>]
(driver_probe_device+0x10c/0x22c)
[    3.189418] [<c0289838>] (driver_probe_device) from [<c0287fdc>]
(bus_for_each_drv+0x44/0x8c)
[    3.189423] [<c0287fdc>] (bus_for_each_drv) from [<c02896f4>]
(device_attach+0x70/0x88)
[    3.189427] [<c02896f4>] (device_attach) from [<c0288e4c>]
(bus_probe_device+0x84/0xa8)
[    3.189432] [<c0288e4c>] (bus_probe_device) from [<c0289220>]
(deferred_probe_work_func+0x5c/0x88)
[    3.189437] [<c0289220>] (deferred_probe_work_func) from [<c0032c38>]
(process_one_work+0x12c/0x314)
[    3.189442] [<c0032c38>] (process_one_work) from [<c0032e90>]
(worker_thread+0x3c/0x4b0)
[    3.189448] [<c0032e90>] (worker_thread) from [<c0037630>]
(kthread+0xcc/0xe8)
[    3.189454] [<c0037630>] (kthread) from [<c000e878>]
(ret_from_fork+0x14/0x3c)
[    3.189458] Code: e5130028 e7e00150 e12fff1e e5903250 (e5130020)
[    3.189461] ---[ end trace 3a0df6418f18791d ]---
[    3.189463] Fixing recursive fault but reboot is needed!
[    5.815351] BUG: spinlock lockup suspected on CPU#0, kworker/u4:1/18
[    5.822758]  lock: 0xee7b85c0, .magic: dead4ead, .owner: kworker/u4:1/18,
.owner_cpu: 0
[    5.831792] CPU: 0 PID: 18 Comm: kworker/u4:1 Tainted: G      D
3.18.0-rc3-00061-ga1cff6e #3
[    5.841895] [<c0013dcc>] (unwind_backtrace) from [<c0010f2c>]
(show_stack+0x10/0x14)
[    5.850724] [<c0010f2c>] (show_stack) from [<c0456b00>]
(dump_stack+0x70/0xbc)
[    5.859036] [<c0456b00>] (dump_stack) from [<c0051c8c>]
(do_raw_spin_lock+0x120/0x1a0)
[    5.868047] [<c0051c8c>] (do_raw_spin_lock) from [<c0457644>]
(__schedule+0x84/0x4d4)
[    5.876941] [<c0457644>] (__schedule) from [<c00230fc>]
(do_exit+0x874/0x8b0)
[    5.885146] [<c00230fc>] (do_exit) from [<c0011134>] (die+0x204/0x2cc)
[    5.892760] [<c0011134>] (die) from [<c0454058>]
(__do_kernel_fault.part.8+0x54/0x74)
[    5.901672] [<c0454058>] (__do_kernel_fault.part.8) from [<c001774c>]
(do_page_fault+0x158/0x274)
[    5.911679] [<c001774c>] (do_page_fault) from [<c0008520>]
(do_DataAbort+0x34/0x9c)
[    5.920445] [<c0008520>] (do_DataAbort) from [<c0011998>]
(__dabt_svc+0x38/0x60)
[    5.928970] Exception stack(0xee111b18 to 0xee111b60)
[    5.935092] 1b00:
ee09bc00 00000000
[    5.944354] 1b20: 00000000 00000000 00000000 ee09be7c c065f5c0 ee110000
c06687d0 ee09bc00
[    5.953623] 1b40: ee7b85c0 ee111b9c 00000800 ee111b60 c0033b58 c0037ba0
20000193 ffffffff
[    5.962887] [<c0011998>] (__dabt_svc) from [<c0037ba0>]
(kthread_data+0x4/0xc)
[    5.971218] [<c0037ba0>] (kthread_data) from [<c0033b58>]
(wq_worker_sleeping+0xc/0xd0)
[    5.980330] [<c0033b58>] (wq_worker_sleeping) from [<c04578c0>]
(__schedule+0x300/0x4d4)
[    5.989571] [<c04578c0>] (__schedule) from [<c0022e30>]
(do_exit+0x5a8/0x8b0)
[    5.997815] [<c0022e30>] (do_exit) from [<c0011134>] (die+0x204/0x2cc)
[    6.005472] [<c0011134>] (die) from [<c0008320>] (do_undefinstr+0x9c/0x1cc)
[    6.013506] [<c0008320>] (do_undefinstr) from [<c0011aac>]
(__und_svc_finish+0x0/0x34)
[    6.022533] Exception stack(0xee111cb8 to 0xee111d00)
[    6.028652] 1ca0:
ee194e10 6d444000
[    6.037877] 1cc0: ed488080 6d444000 00000000 ed488080 ee194e10 ee194e10
ed4880d0 a0000113
[    6.047114] 1ce0: ed488080 6d444000 00000000 ee111d00 c0380074 c0380024
60000193 ffffffff
[    6.056345] [<c0011aac>] (__und_svc_finish) from [<c0380024>]
(__exynos_sysmmu_enable+0x174/0x180)
[    6.066388] [<c0380024>] (__exynos_sysmmu_enable) from [<c0380074>]
(exynos_iommu_attach_device+0x44/0xb0)
[    6.077160] [<c0380074>] (exynos_iommu_attach_device) from [<c037e28c>]
(iommu_attach_device+0x18/0x24)
[    6.087645] [<c037e28c>] (iommu_attach_device) from [<c0016624>]
(arm_iommu_attach_device+0x18/0xa0)
[    6.097913] [<c0016624>] (arm_iommu_attach_device) from [<c026c310>]
(drm_iommu_attach_device+0x4c/0xc8)
[    6.108563] [<c026c310>] (drm_iommu_attach_device) from [<c026e0d0>]
(fimd_bind+0x110/0x17c)
[    6.118146] [<c026e0d0>] (fimd_bind) from [<c0285678>]
(component_bind_all+0xb0/0x1cc)
[    6.127209] [<c0285678>] (component_bind_all) from [<c0268908>]
(exynos_drm_load+0x98/0x148)
[    6.136805] [<c0268908>] (exynos_drm_load) from [<c02551e8>]
(drm_dev_register+0xa0/0x100)
[    6.146226] [<c02551e8>] (drm_dev_register) from [<c0256e68>]
(drm_platform_init+0x40/0xd0)
[    6.155703] [<c0256e68>] (drm_platform_init) from [<c0285960>]
(try_to_bring_up_master.part.2+0xc8/0x104)
[    6.166395] [<c0285960>] (try_to_bring_up_master.part.2) from [<c0285b48>]
(component_add+0x84/0xec)
[    6.176686] [<c0285b48>] (component_add) from [<c0277cfc>]
(hdmi_probe+0x4cc/0x684)
[    6.185450] [<c0277cfc>] (hdmi_probe) from [<c028ac84>]
(platform_drv_probe+0x48/0xa4)
[    6.194503] [<c028ac84>] (platform_drv_probe) from [<c0289838>]
(driver_probe_device+0x10c/0x22c)
[    6.204473] [<c0289838>] (driver_probe_device) from [<c0287fdc>]
(bus_for_each_drv+0x44/0x8c)
[    6.214115] [<c0287fdc>] (bus_for_each_drv) from [<c02896f4>]
(device_attach+0x70/0x88)
[    6.223258] [<c02896f4>] (device_attach) from [<c0288e4c>]
(bus_probe_device+0x84/0xa8)
[    6.232415] [<c0288e4c>] (bus_probe_device) from [<c0289220>]
(deferred_probe_work_func+0x5c/0x88)
[    6.242589] [<c0289220>] (deferred_probe_work_func) from [<c0032c38>]
(process_one_work+0x12c/0x314)
[    6.252957] [<c0032c38>] (process_one_work) from [<c0032e90>]
(worker_thread+0x3c/0x4b0)
[    6.262278] [<c0032e90>] (worker_thread) from [<c0037630>]
(kthread+0xcc/0xe8)
[    6.270717] [<c0037630>] (kthread) from [<c000e878>]
(ret_from_fork+0x14/0x3c)
[    9.643855] s3c-i2c 12ca0000.i2c: timeout waiting for bus idle
[    9.650898] tps65090-charger tps65090-charger: tps65090_charger_isr():
Error in reading reg 0xa
[   16.663852] s3c-i2c 12ca0000.i2c: timeout waiting for bus idle
[   16.670945] tps65090-charger tps65090-charger: tps65090_charger_isr():
Error in reading reg 0xa
[   23.683856] s3c-i2c 12ca0000.i2c: timeout waiting for bus idle
[   23.691001] tps65090-charger tps65090-charger: tps65090_charger_isr():
Error in reading reg 0xa
