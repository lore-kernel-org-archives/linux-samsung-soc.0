From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Issues with "Reimplement IDR and IDA using the radix tree"
Date: Thu, 15 Dec 2016 15:55:39 +0100
Message-ID: <3c3ae989-7910-0b13-eaa3-e5367aa753e0@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:39712 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752237AbcLOOzx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Dec 2016 09:55:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>

Hi,

with next-20161215
since
commit d60c3e64ea7d0eb3187db2d8fce49f74de62fdd3
Author: Matthew Wilcox <willy@linux.intel.com>
Date:   Thu Dec 15 11:36:25 2016 +1100
Reimplement IDR and IDA using the radix tree

I get the following sysfs warnings on boot with ARM boards Odroid XU3 and XU4 (exynos_defconfig)
regarding tmu and dma:

 ------------[ cut here ]------------
[    0.866406] WARNING: CPU: 0 PID: 1 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x64/0x74
[    0.866451] sysfs: cannot create duplicate filename '/devices/virtual/thermal/thermal_zone1'
[    0.866495] Modules linked in:
[    0.866535] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.9.0-12215-gd60c3e6 #60
[    0.866578] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    0.866639] [<c010e2e8>] (unwind_backtrace) from [<c010afd4>] (show_stack+0x10/0x14)
[    0.866695] [<c010afd4>] (show_stack) from [<c0333c2c>] (dump_stack+0x88/0x9c)
[    0.866748] [<c0333c2c>] (dump_stack) from [<c011b068>] (__warn+0xe8/0x100)
[    0.866790] [<c011b068>] (__warn) from [<c011b0b8>] (warn_slowpath_fmt+0x38/0x48)
[    0.866843] [<c011b0b8>] (warn_slowpath_fmt) from [<c024925c>] (sysfs_warn_dup+0x64/0x74)
[    0.866898] [<c024925c>] (sysfs_warn_dup) from [<c024933c>] (sysfs_create_dir_ns+0x88/0x98)
[    0.866954] [<c024933c>] (sysfs_create_dir_ns) from [<c033573c>] (kobject_add_internal+0xa0/0x2f8)
[    0.867008] [<c033573c>] (kobject_add_internal) from [<c0335b20>] (kobject_add+0x48/0x94)
[    0.867063] [<c0335b20>] (kobject_add) from [<c0417224>] (device_add+0xd8/0x5a0)
[    0.867120] [<c0417224>] (device_add) from [<c051e518>] (thermal_zone_device_register+0x178/0x580)
[    0.867179] [<c051e518>] (thermal_zone_device_register) from [<c0b21ad8>] (of_parse_thermal_zones+0x1b0/0x68c)
[    0.867234] [<c0b21ad8>] (of_parse_thermal_zones) from [<c0b218c8>] (thermal_init+0x7c/0xdc)
[    0.867287] [<c0b218c8>] (thermal_init) from [<c01017b0>] (do_one_initcall+0x40/0x170)
[    0.867345] [<c01017b0>] (do_one_initcall) from [<c0b00dcc>] (kernel_init_freeable+0x160/0x200)
[    0.867408] [<c0b00dcc>] (kernel_init_freeable) from [<c06fb4c8>] (kernel_init+0x8/0x114)
[    0.867464] [<c06fb4c8>] (kernel_init) from [<c0107978>] (ret_from_fork+0x14/0x3c)
[    0.867518] ---[ end trace 6cf0ba6d4e965368 ]---
[    0.867549] ------------[ cut here ]------------
[    0.867584] WARNING: CPU: 0 PID: 1 at lib/kobject.c:240 kobject_add_internal+0x280/0x2f8
[    0.867630] kobject_add_internal failed for thermal_zone1 with -EEXIST, don't try to register things with the same name in the same directory.
[    0.867679] Modules linked in:
[    0.867715] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.9.0-12215-gd60c3e6 #60
[    0.867760] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    0.867802] [<c010e2e8>] (unwind_backtrace) from [<c010afd4>] (show_stack+0x10/0x14)
[    0.867854] [<c010afd4>] (show_stack) from [<c0333c2c>] (dump_stack+0x88/0x9c)
[    0.867903] [<c0333c2c>] (dump_stack) from [<c011b068>] (__warn+0xe8/0x100)
[    0.867944] [<c011b068>] (__warn) from [<c011b0b8>] (warn_slowpath_fmt+0x38/0x48)
[    0.867995] [<c011b0b8>] (warn_slowpath_fmt) from [<c033591c>] (kobject_add_internal+0x280/0x2f8)
[    0.868048] [<c033591c>] (kobject_add_internal) from [<c0335b20>] (kobject_add+0x48/0x94)
[    0.868100] [<c0335b20>] (kobject_add) from [<c0417224>] (device_add+0xd8/0x5a0)
[    0.868152] [<c0417224>] (device_add) from [<c051e518>] (thermal_zone_device_register+0x178/0x580)
[    0.868207] [<c051e518>] (thermal_zone_device_register) from [<c0b21ad8>] (of_parse_thermal_zones+0x1b0/0x68c)
[    0.868261] [<c0b21ad8>] (of_parse_thermal_zones) from [<c0b218c8>] (thermal_init+0x7c/0xdc)
[    0.868313] [<c0b218c8>] (thermal_init) from [<c01017b0>] (do_one_initcall+0x40/0x170)
[    0.868365] [<c01017b0>] (do_one_initcall) from [<c0b00dcc>] (kernel_init_freeable+0x160/0x200)
[    0.868420] [<c0b00dcc>] (kernel_init_freeable) from [<c06fb4c8>] (kernel_init+0x8/0x114)
[    0.868474] [<c06fb4c8>] (kernel_init) from [<c0107978>] (ret_from_fork+0x14/0x3c)
[    0.868518] ---[ end trace 6cf0ba6d4e965369 ]---
[    0.868551] Failed to build cpu2-thermal zone -17
[    0.868655] ------------[ cut here ]------------
.
.
.
[    1.065466] ------------[ cut here ]------------
[    1.065521] WARNING: CPU: 0 PID: 1 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x64/0x74
[    1.065565] sysfs: cannot create duplicate filename '/class/dma/dma1chan0'
[    1.065598] Modules linked in:
[    1.065638] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.9.0-12215-gd60c3e6 #60
[    1.065683] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    1.065742] [<c010e2e8>] (unwind_backtrace) from [<c010afd4>] (show_stack+0x10/0x14)
[    1.065798] [<c010afd4>] (show_stack) from [<c0333c2c>] (dump_stack+0x88/0x9c)
[    1.065851] [<c0333c2c>] (dump_stack) from [<c011b068>] (__warn+0xe8/0x100)
[    1.065893] [<c011b068>] (__warn) from [<c011b0b8>] (warn_slowpath_fmt+0x38/0x48)
[    1.065945] [<c011b0b8>] (warn_slowpath_fmt) from [<c024925c>] (sysfs_warn_dup+0x64/0x74)
[    1.066000] [<c024925c>] (sysfs_warn_dup) from [<c02495b0>] (sysfs_do_create_link_sd+0xb4/0xbc)
[    1.066058] [<c02495b0>] (sysfs_do_create_link_sd) from [<c04173c0>] (device_add+0x274/0x5a0)
[    1.066115] [<c04173c0>] (device_add) from [<c038f728>] (dma_async_device_register+0x1e4/0x4e0)
[    1.066172] [<c038f728>] (dma_async_device_register) from [<c0393090>] (pl330_probe+0x6e8/0xa10)
[    1.066232] [<c0393090>] (pl330_probe) from [<c03841c4>] (amba_probe+0xd4/0x158)
[    1.066289] [<c03841c4>] (amba_probe) from [<c0419e50>] (driver_probe_device+0x238/0x2d8)
[    1.066343] [<c0419e50>] (driver_probe_device) from [<c0419f9c>] (__driver_attach+0xac/0xb0)
[    1.066396] [<c0419f9c>] (__driver_attach) from [<c0418198>] (bus_for_each_dev+0x6c/0xa0)
[    1.066449] [<c0418198>] (bus_for_each_dev) from [<c0419430>] (bus_add_driver+0x1a0/0x218)
[    1.066502] [<c0419430>] (bus_add_driver) from [<c041a818>] (driver_register+0x78/0xf8)
[    1.066556] [<c041a818>] (driver_register) from [<c01017b0>] (do_one_initcall+0x40/0x170)
[    1.066616] [<c01017b0>] (do_one_initcall) from [<c0b00dcc>] (kernel_init_freeable+0x160/0x200)
[    1.066679] [<c0b00dcc>] (kernel_init_freeable) from [<c06fb4c8>] (kernel_init+0x8/0x114)
[    1.066735] [<c06fb4c8>] (kernel_init) from [<c0107978>] (ret_from_fork+0x14/0x3c)
[    1.066780] ---[ end trace 6cf0ba6d4e96536e ]---
[    1.066859] dma-pl330 10800000.mdma: unable to register DMAC
[    1.066957] dma-pl330: probe of 10800000.mdma failed with error -17
.
.
.
Regards,
--
Markus Reichl
