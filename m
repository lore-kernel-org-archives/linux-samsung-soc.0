From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] drm/exynos: fix infinite loop issue incurred by no pair
Date: Tue, 18 Nov 2014 11:23:35 +0100
Message-ID: <CABxcv=kPShghFWcy_M9FxZ0m3aYghkLVex857YpCWuiM+tSp3w@mail.gmail.com>
References: <1416280832-24609-1-git-send-email-inki.dae@samsung.com>
	<1416297489.2480.5.camel@collabora.co.uk>
	<546B0169.4010602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:53359 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753020AbaKRKXh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 05:23:37 -0500
Received: by mail-wi0-f177.google.com with SMTP id l15so12057884wiw.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2014 02:23:35 -0800 (PST)
In-Reply-To: <546B0169.4010602@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>

Hello Inki,

> Right, but at least, we could avoid kernel booting failure which is very
> critical. Please know that this patch is temporary to avoid the kernel
> booting failure although deferred probe request of Exynos drm could be
> broken. For this, I will look into dd core to find out more generic way:
> I suspect that this might be incurred in case that a driver is probed in
> probe context of other driver or it might be really dd core bug.
>

I gave a try to your patch on top of today's linux-next and I still
see the same boot failure reported by Kevin on a Exynos5420 Peach Pit
so $subject does not fix the issue. The boot message is [0] fyi.

By digging a bit I noticed that this happens when the
exynos_drm_platform_probe() calls platform_driver_register() to
register the Exynos fimd platform driver. The problem is that in
__driver_attach() the call to device_lock(dev->parent) never returns
and the thread sleeps forever waiting for the device parent mutex to
be released.

Do you have any ideas why this could happen?

If I modify __driver_attach() to only grab the device lock and not its
parent lock, then the thread is able to hold its own mutex and the
platform driver registration succeeds but then I see the infinite loop
that was reported before and the workaround in $subject indeed avoids
to happen.

So we have two issues here and your patch is only a workaround for the later.

Best regards,
Javier

[0]:
[    1.324091] [drm] Initialized drm 1.1.0 20060810
[  240.158665] random: nonblocking pool is initialized
[  240.162202] INFO: task swapper/0:1 blocked for more than 120 seconds.
[  240.168493]       Not tainted 3.18.0-rc4-next-20141117-00001-g85466f9 #22
[  240.175256] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  240.183064] swapper/0       D c045bb00     0     1      0 0x00000000
[  240.189410] [<c045bb00>] (__schedule) from [<c045c230>]
(schedule_preempt_disabled+0x14/0x20)
[  240.197904] [<c045c230>] (schedule_preempt_disabled) from
[<c045e998>] (__mutex_lock_slowpath+0x19c/0x3f4)
[  240.207531] [<c045e998>] (__mutex_lock_slowpath) from [<c045ebfc>]
(mutex_lock+0xc/0x24)
[  240.215599] [<c045ebfc>] (mutex_lock) from [<c0281718>]
(__driver_attach+0x44/0x90)
[  240.223239] [<c0281718>] (__driver_attach) from [<c027ff30>]
(bus_for_each_dev+0x54/0x88)
[  240.231387] [<c027ff30>] (bus_for_each_dev) from [<c0280da0>]
(bus_add_driver+0xd8/0x1cc)
[  240.239541] [<c0280da0>] (bus_add_driver) from [<c0281d80>]
(driver_register+0x78/0xf4)
[  240.247523] [<c0281d80>] (driver_register) from [<c0274324>]
(exynos_drm_platform_probe+0x34/0x188)
[  240.256546] [<c0274324>] (exynos_drm_platform_probe) from
[<c02829d8>] (platform_drv_probe+0x48/0x98)
[  240.265739] [<c02829d8>] (platform_drv_probe) from [<c02815b4>]
(driver_probe_device+0x114/0x234)
[  240.274588] [<c02815b4>] (driver_probe_device) from [<c0281760>]
(__driver_attach+0x8c/0x90)
[  240.283003] [<c0281760>] (__driver_attach) from [<c027ff30>]
(bus_for_each_dev+0x54/0x88)
[  240.291158] [<c027ff30>] (bus_for_each_dev) from [<c0280da0>]
(bus_add_driver+0xd8/0x1cc)
[  240.299311] [<c0280da0>] (bus_add_driver) from [<c0281d80>]
(driver_register+0x78/0xf4)
[  240.307293] [<c0281d80>] (driver_register) from [<c02742a4>]
(exynos_drm_init+0x84/0xd0)
[  240.315362] [<c02742a4>] (exynos_drm_init) from [<c0008944>]
(do_one_initcall+0x80/0x1d0)
[  240.323521] [<c0008944>] (do_one_initcall) from [<c0624d3c>]
(kernel_init_freeable+0x108/0x1d4)
[  240.332191] [<c0624d3c>] (kernel_init_freeable) from [<c0457224>]
(kernel_init+0x8/0xe4)
[  240.340261] [<c0457224>] (kernel_init) from [<c000e638>]
(ret_from_fork+0x14/0x3c)
