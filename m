From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Warnings on boot since: usb: dwc3: use bus->sysdev for DMA
 configuration
Date: Thu, 15 Dec 2016 10:19:37 +0100
Message-ID: <a99add8f-9c38-a3e7-0c8e-972137d411bc@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:58398 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755384AbcLOJ6a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Dec 2016 04:58:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, krzk@kernel.org

Hi,

since commit d64ff406e51e4f359afedbf2468a10440d6d8cef
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Nov 17 17:13:47 2016 +0530
usb: dwc3: use bus->sysdev for DMA configuration

I get the following warning on boot with Odroid XU3 and XU4:


[    2.637677] ------------[ cut here ]------------
[    2.637703] WARNING: CPU: 2 PID: 112 at drivers/usb/host/xhci-plat.c:159 xhci_plat_probe+0x198/0x41c
[    2.637714] Modules linked in:
[    2.637726] CPU: 2 PID: 112 Comm: kworker/2:1 Not tainted 4.9.0-rc3-00164-gd64ff40 #45
[    2.637730] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    2.637758] Workqueue: events deferred_probe_work_func
[    2.637807] [<c010e228>] (unwind_backtrace) from [<c010af08>] (show_stack+0x10/0x14)
[    2.637830] [<c010af08>] (show_stack) from [<c032de2c>] (dump_stack+0x88/0x9c)
[    2.637844] [<c032de2c>] (dump_stack) from [<c011abec>] (__warn+0xe8/0x100)
[    2.637855] [<c011abec>] (__warn) from [<c011acb4>] (warn_slowpath_null+0x20/0x28)
[    2.637865] [<c011acb4>] (warn_slowpath_null) from [<c04ce0d0>] (xhci_plat_probe+0x198/0x41c)
[    2.637878] [<c04ce0d0>] (xhci_plat_probe) from [<c0411c60>] (platform_drv_probe+0x4c/0xb0)
[    2.637891] [<c0411c60>] (platform_drv_probe) from [<c04103ac>] (driver_probe_device+0x210/0x2bc)
[    2.637903] [<c04103ac>] (driver_probe_device) from [<c040e81c>] (bus_for_each_drv+0x64/0x98)
[    2.637914] [<c040e81c>] (bus_for_each_drv) from [<c04100c0>] (__device_attach+0xb0/0x110)
[    2.637924] [<c04100c0>] (__device_attach) from [<c040f75c>] (bus_probe_device+0x84/0x8c)
[    2.637935] [<c040f75c>] (bus_probe_device) from [<c040db3c>] (device_add+0x3ec/0x574)
[    2.637946] [<c040db3c>] (device_add) from [<c041198c>] (platform_device_add+0xac/0x208)
[    2.637965] [<c041198c>] (platform_device_add) from [<c0494840>] (dwc3_host_init+0x11c/0x278)
[    2.637977] [<c0494840>] (dwc3_host_init) from [<c0494690>] (dwc3_probe+0x948/0x974)
[    2.637986] [<c0494690>] (dwc3_probe) from [<c0411c60>] (platform_drv_probe+0x4c/0xb0)
[    2.637996] [<c0411c60>] (platform_drv_probe) from [<c04103ac>] (driver_probe_device+0x210/0x2bc)
[    2.638007] [<c04103ac>] (driver_probe_device) from [<c040e81c>] (bus_for_each_drv+0x64/0x98)
[    2.638017] [<c040e81c>] (bus_for_each_drv) from [<c04100c0>] (__device_attach+0xb0/0x110)
[    2.638027] [<c04100c0>] (__device_attach) from [<c040f75c>] (bus_probe_device+0x84/0x8c)
[    2.638037] [<c040f75c>] (bus_probe_device) from [<c040db3c>] (device_add+0x3ec/0x574)
[    2.638050] [<c040db3c>] (device_add) from [<c0565a7c>] (of_platform_device_create_pdata+0x84/0xb8)
[    2.638062] [<c0565a7c>] (of_platform_device_create_pdata) from [<c0565bac>] (of_platform_bus_create+0xf0/0x334)
[    2.638071] [<c0565bac>] (of_platform_bus_create) from [<c0565f1c>] (of_platform_populate+0x5c/0xac)
[    2.638082] [<c0565f1c>] (of_platform_populate) from [<c049ac90>] (dwc3_exynos_probe+0x40c/0x468)
[    2.638092] [<c049ac90>] (dwc3_exynos_probe) from [<c0411c60>] (platform_drv_probe+0x4c/0xb0)
[    2.638102] [<c0411c60>] (platform_drv_probe) from [<c04103ac>] (driver_probe_device+0x210/0x2bc)
[    2.638112] [<c04103ac>] (driver_probe_device) from [<c040e81c>] (bus_for_each_drv+0x64/0x98)
[    2.638122] [<c040e81c>] (bus_for_each_drv) from [<c04100c0>] (__device_attach+0xb0/0x110)
[    2.638133] [<c04100c0>] (__device_attach) from [<c040f75c>] (bus_probe_device+0x84/0x8c)
[    2.638143] [<c040f75c>] (bus_probe_device) from [<c040fbec>] (deferred_probe_work_func+0x68/0x98)
[    2.638168] [<c040fbec>] (deferred_probe_work_func) from [<c0130b4c>] (process_one_work+0x124/0x328)
[    2.638181] [<c0130b4c>] (process_one_work) from [<c0130f44>] (worker_thread+0x1f4/0x4d4)
[    2.638199] [<c0130f44>] (worker_thread) from [<c01360b4>] (kthread+0xdc/0xf4)
[    2.638212] [<c01360b4>] (kthread) from [<c0107978>] (ret_from_fork+0x14/0x3c)
[    2.638298] ---[ end trace 0b4434e674922aea ]---


Regards,
--
Markus Reichl
