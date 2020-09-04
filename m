Return-Path: <SRS0=fnc5=CN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59054C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Sep 2020 12:20:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29B7420791
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Sep 2020 12:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbgIDMUi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Sep 2020 08:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729932AbgIDMUf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 08:20:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A49C061244
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Sep 2020 05:20:33 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kEAhU-0007Vg-I5; Fri, 04 Sep 2020 14:20:16 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kEAhS-0007Fc-P3; Fri, 04 Sep 2020 14:20:14 +0200
Date:   Fri, 4 Sep 2020 14:20:14 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        dri-devel@lists.freedesktop.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, kernel@pengutronix.de,
        Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com
Subject: Re: [PATCH 00/16] drm/exynos: Convert driver to drm bridge
Message-ID: <20200904122014.GA7459@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
 <CGME20200903200844eucas1p1e3829942daec8a49d7a8ec3cd2e09038@eucas1p1.samsung.com>
 <CAJKOXPcJCfFL43OLXC_DAowU0o_jW2rZ7qX-m8ePcPEMo0PEgQ@mail.gmail.com>
 <cb6d3ced-5bd2-443f-674e-b4c9acb8c021@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb6d3ced-5bd2-443f-674e-b4c9acb8c021@samsung.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:06:05 up 197 days, 19:36, 134 users,  load average: 0.48, 0.62,
 0.37
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Fri, 04 Sep 2020 10:31:12 +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 03.09.2020 22:08, Krzysztof Kozlowski wrote:
> > On Thu, 3 Sep 2020 at 18:57, Michael Tretter <m.tretter@pengutronix.de> wrote:
> >> the Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
> >> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
> >> the Exynos Decon. The driver for the LCDIF does not use the component
> >> framework, but uses drm bridges.
> >>
> >> This series converts the Exynos MIPI DSI into a drm bridge and makes it usable
> >> with such drivers. Although the driver is converted, it still supports the
> >> component framework API to stay compliant with the Exynos DRM driver.
> >>
> >> Unfortunately, I don't have any Exynos SoC to actually test the series.  I
> >> tested the driver with a few additional unfinished patches on the i.MX8M Mini
> >> EVK, but somebody should definitely verify that the driver is still working on
> >> Exynos hardware.
> > Hi Michael,
> >
> > +Cc maintainers and folks in Samsung.
> >
> > Please follow the script/get_maintainers.pl to get the list of
> > maintainers of the Exynos DRM drivers. First they could provide you
> > with testing, second they might be the people merging the driver.
> >
> > Unfortunately I cannot provide proper testing as none of my boards
> > have a display attached. :)
> 
> Thanks for adding cc to me. Sadly this patchset crashed badly on Samsung 
> Exnyos based boards. Here is the log from Exynos3250-based Rinato:

Thanks for testing.

> 
> exynos4-fb 11c00000.fimd: Adding to iommu group 0
> OF: graph: no port node found in /soc/fimd@11c00000
> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> OF: graph: no port node found in /soc/dsi@11c80000
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 00000650
> pgd = (ptrval)
> [00000650] *pgd=00000000
> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 
> 5.9.0-rc2-next-20200824-00017-g3e9b20f7eb0d #1576
> Hardware name: Samsung Exynos (Flattened Device Tree)
> PC is at samsung_dsim_resume+0x18/0x120
> LR is at genpd_runtime_resume+0x160/0x278
> ...
> [<c064f590>] (samsung_dsim_resume) from [<c0685020>] 
> (genpd_runtime_resume+0x160/0x278)
> [<c0685020>] (genpd_runtime_resume) from [<c0677e84>] 
> (__rpm_callback+0xbc/0x124)
> [<c0677e84>] (__rpm_callback) from [<c0677f0c>] (rpm_callback+0x20/0x80)
> [<c0677f0c>] (rpm_callback) from [<c0676aec>] (rpm_resume+0x388/0x714)
> [<c0676aec>] (rpm_resume) from [<c0676edc>] (__pm_runtime_resume+0x64/0x9c)
> [<c0676edc>] (__pm_runtime_resume) from [<c0669e10>] 
> (__device_attach+0xcc/0x17c)
> [<c0669e10>] (__device_attach) from [<c0668ee8>] 
> (bus_probe_device+0x88/0x90)
> [<c0668ee8>] (bus_probe_device) from [<c06660a0>] (device_add+0x4e8/0x79c)
> [<c06660a0>] (device_add) from [<c063dc1c>] 
> (mipi_dsi_device_register_full+0xc8/0x148)
> [<c063dc1c>] (mipi_dsi_device_register_full) from [<c063dcec>] 
> (mipi_dsi_host_register+0x50/0x168)
> [<c063dcec>] (mipi_dsi_host_register) from [<c064d90c>] 
> (samsung_dsim_bind+0x368/0x40c)
> [<c064d90c>] (samsung_dsim_bind) from [<c06449f8>] 
> (exynos_dsi_bind+0x78/0x88)
> [<c06449f8>] (exynos_dsi_bind) from [<c0661ef0>] 
> (component_bind_all+0xfc/0x290)
> [<c0661ef0>] (component_bind_all) from [<c06413d0>] 
> (exynos_drm_bind+0xe4/0x19c)
> [<c06413d0>] (exynos_drm_bind) from [<c0662464>] 
> (try_to_bring_up_master+0x1e4/0x2c4)
> [<c0662464>] (try_to_bring_up_master) from [<c06629a4>] 
> (component_master_add_with_match+0xd4/0x108)
> [<c06629a4>] (component_master_add_with_match) from [<c06410f8>] 
> (exynos_drm_platform_probe+0xe4/0x110)
> [<c06410f8>] (exynos_drm_platform_probe) from [<c066cb8c>] 
> (platform_drv_probe+0x6c/0xa4)
> [<c066cb8c>] (platform_drv_probe) from [<c066a0c8>] 
> (really_probe+0x200/0x4fc)
> [<c066a0c8>] (really_probe) from [<c066a58c>] 
> (driver_probe_device+0x78/0x1fc)
> [<c066a58c>] (driver_probe_device) from [<c066a974>] 
> (device_driver_attach+0x58/0x60)
> [<c066a974>] (device_driver_attach) from [<c066aa58>] 
> (__driver_attach+0xdc/0x174)
> [<c066aa58>] (__driver_attach) from [<c0667e50>] 
> (bus_for_each_dev+0x68/0xb4)
> [<c0667e50>] (bus_for_each_dev) from [<c0669184>] 
> (bus_add_driver+0x158/0x214)
> [<c0669184>] (bus_add_driver) from [<c066b93c>] (driver_register+0x78/0x110)
> [<c066b93c>] (driver_register) from [<c06412b8>] 
> (exynos_drm_init+0xe4/0x118)
> [<c06412b8>] (exynos_drm_init) from [<c01023f4>] 
> (do_one_initcall+0x8c/0x424)
> [<c01023f4>] (do_one_initcall) from [<c10011a8>] 
> (kernel_init_freeable+0x190/0x1dc)
> [<c10011a8>] (kernel_init_freeable) from [<c0ae8e5c>] 
> (kernel_init+0x8/0x118)
> [<c0ae8e5c>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> Exception stack(0xd94a5fb0 to 0xd94a5ff8)
> ...
> ---[ end trace 1a053145d15f23dc ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> CPU0: stopping
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D 
> 5.9.0-rc2-next-20200824-00017-g3e9b20f7eb0d #1576
> Hardware name: Samsung Exynos (Flattened Device Tree)
> [<c011160c>] (unwind_backtrace) from [<c010cfc0>] (show_stack+0x10/0x14)
> [<c010cfc0>] (show_stack) from [<c0533c3c>] (dump_stack+0xbc/0xe8)
> [<c0533c3c>] (dump_stack) from [<c01104e0>] (handle_IPI+0x3e0/0x428)
> [<c01104e0>] (handle_IPI) from [<c05511dc>] (gic_handle_irq+0x98/0x9c)
> [<c05511dc>] (gic_handle_irq) from [<c0100af0>] (__irq_svc+0x70/0xb0)
> Exception stack(0xc1101f08 to 0xc1101f50)
> ...
> [<c0100af0>] (__irq_svc) from [<c01095dc>] (arch_cpu_idle+0x24/0x44)
> [<c01095dc>] (arch_cpu_idle) from [<c01635dc>] (do_idle+0x1bc/0x2bc)
> [<c01635dc>] (do_idle) from [<c0163a90>] (cpu_startup_entry+0x18/0x1c)
> [<c0163a90>] (cpu_startup_entry) from [<c1000f88>] 
> (start_kernel+0x628/0x664)
> [<c1000f88>] (start_kernel) from [<00000000>] (0x0)
> ---[ end Kernel panic - not syncing: Attempted to kill init! 
> exitcode=0x0000000b ]---

This and the other null pointer dereference look like two different problems.
I will look into both of them and send an update.

I will also try to come up with something to at least test the bind/unbind
interface and reduce the code that I cannot test.

> 
> I've didn't check the code yet, but the conversion also lacks "select 
> DRM_SAMSUNG_DSIM" in the Exynos DSI driver's Kconfig, as I wasn't even 
> able to compile it with the current exynos_defconfig.

Dang, of course. I will fix it.

Michael
