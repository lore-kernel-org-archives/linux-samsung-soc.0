Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB7CC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:01:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 251E9208DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgINUB4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 16:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgINUBy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 16:01:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E62C06174A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2020 13:01:54 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kHufe-0004qK-Lt; Mon, 14 Sep 2020 22:01:50 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kHufZ-0002Ii-Hz; Mon, 14 Sep 2020 22:01:45 +0200
Date:   Mon, 14 Sep 2020 22:01:45 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com
Subject: Re: [PATCH v2 10/16] drm/exynos: implement a drm bridge
Message-ID: <20200914200145.GA8098@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <CGME20200911164817eucas1p2a0907a3d4c5c0a8d8dc4bc97301f1517@eucas1p2.samsung.com>
 <20200911135413.3654800-11-m.tretter@pengutronix.de>
 <381a553a-5bc6-d070-fc40-7d48fdb89ca9@samsung.com>
 <650db263-df3f-17fa-0298-62cd821b5274@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <650db263-df3f-17fa-0298-62cd821b5274@samsung.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:45:02 up 208 days,  1:15, 148 users,  load average: 0.91, 0.50,
 0.25
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, 14 Sep 2020 14:31:19 +0200, Marek Szyprowski wrote:
> On 14.09.2020 10:29, Marek Szyprowski wrote:
> > On 11.09.2020 15:54, Michael Tretter wrote:
> >> Make the exynos_dsi driver a full drm bridge that can be found and used
> >> from other drivers.
> >>
> >> Other drivers can only attach to the bridge, if a mipi dsi device
> >> already attached to the bridge. This allows to defer the probe of the
> >> display pipe until the downstream bridges are available, too.
> >>
> >> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > This one (and the whole series applied) still fails on Exynos boards:
> >
> > [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> > exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> > OF: graph: no port node found in /soc/dsi@11c80000
> > 8<--- cut here ---
> > Unable to handle kernel NULL pointer dereference at virtual address 00000084
> > pgd = (ptrval)
> > [00000084] *pgd=00000000
> > Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> > Modules linked in:
> > CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> > 5.9.0-rc4-next-20200911-00010-g417dc70d70ec #1608
> > Hardware name: Samsung Exynos (Flattened Device Tree)
> > PC is at drm_bridge_attach+0x18/0x164
> > LR is at exynos_dsi_bind+0x88/0xa8
> > pc : [<c0628c08>]    lr : [<c064d560>]    psr: 20000013
> > sp : ef0dfca8  ip : 00000002  fp : c13190e0
> > r10: 00000000  r9 : ee46d580  r8 : c13190e0
> > r7 : ee438800  r6 : 00000018  r5 : ef253810  r4 : ef39e840
> > r3 : 00000000  r2 : 00000018  r1 : ef39e888  r0 : ef39e840
> > Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > Control: 10c5387d  Table: 4000404a  DAC: 00000051
> > Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> > Stack: (0xef0dfca8 to 0xef0e0000)
> > ...
> > [<c0628c08>] (drm_bridge_attach) from [<c064d560>]
> > (exynos_dsi_bind+0x88/0xa8)
> > [<c064d560>] (exynos_dsi_bind) from [<c066a800>]
> > (component_bind_all+0xfc/0x290)
> > [<c066a800>] (component_bind_all) from [<c0649dc0>]
> > (exynos_drm_bind+0xe4/0x19c)
> > [<c0649dc0>] (exynos_drm_bind) from [<c066ad74>]
> > (try_to_bring_up_master+0x1e4/0x2c4)
> > [<c066ad74>] (try_to_bring_up_master) from [<c066b2b4>]
> > (component_master_add_with_match+0xd4/0x108)
> > [<c066b2b4>] (component_master_add_with_match) from [<c0649ae8>]
> > (exynos_drm_platform_probe+0xe4/0x110)
> > [<c0649ae8>] (exynos_drm_platform_probe) from [<c0674e6c>]
> > (platform_drv_probe+0x6c/0xa4)
> > [<c0674e6c>] (platform_drv_probe) from [<c067242c>]
> > (really_probe+0x200/0x4fc)
> > [<c067242c>] (really_probe) from [<c06728f0>]
> > (driver_probe_device+0x78/0x1fc)
> > [<c06728f0>] (driver_probe_device) from [<c0672cd8>]
> > (device_driver_attach+0x58/0x60)
> > [<c0672cd8>] (device_driver_attach) from [<c0672dbc>]
> > (__driver_attach+0xdc/0x174)
> > [<c0672dbc>] (__driver_attach) from [<c06701b4>]
> > (bus_for_each_dev+0x68/0xb4)
> > [<c06701b4>] (bus_for_each_dev) from [<c06714e8>]
> > (bus_add_driver+0x158/0x214)
> > [<c06714e8>] (bus_add_driver) from [<c0673c1c>] (driver_register+0x78/0x110)
> > [<c0673c1c>] (driver_register) from [<c0649ca8>]
> > (exynos_drm_init+0xe4/0x118)
> > [<c0649ca8>] (exynos_drm_init) from [<c0102484>]
> > (do_one_initcall+0x8c/0x42c)
> > [<c0102484>] (do_one_initcall) from [<c11011c0>]
> > (kernel_init_freeable+0x190/0x1dc)
> > [<c11011c0>] (kernel_init_freeable) from [<c0af7880>]
> > (kernel_init+0x8/0x118)
> > [<c0af7880>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> > Exception stack(0xef0dffb0 to 0xef0dfff8)
> > ...
> > ---[ end trace ee27f313f9ed9da1 ]---
> >
> > # arm-linux-gnueabi-addr2line -e vmlinux c0628c08
> > drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)
> >
> > I will try to debug it a bit more today.
> 
> The above crash has been caused by lack of in_bridge initialization to 
> NULL in exynos_dsi_bind() in this patch. However, fixing it reveals 
> another issue:
> 
> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> OF: graph: no port node found in /soc/dsi@11c80000
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 00000280
> pgd = (ptrval)
> [00000280] *pgd=00000000
> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 
> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec-dirty #1613
> Hardware name: Samsung Exynos (Flattened Device Tree)
> PC is at __mutex_lock+0x54/0xb18
> LR is at lock_is_held_type+0x80/0x138
> pc : [<c0afc920>]    lr : [<c0af63e8>]    psr: 60000013
> sp : ef0dfd30  ip : 33937b74  fp : c13193c8
> r10: c1208eec  r9 : 00000000  r8 : ee45f808
> r7 : c19561a4  r6 : 00000000  r5 : 00000000  r4 : 0000024c
> r3 : 00000000  r2 : 00204140  r1 : c124f13c  r0 : 00000000
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 4000404a  DAC: 00000051
> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> Stack: (0xef0dfd30 to 0xef0e0000)
> ...
> [<c0afc920>] (__mutex_lock) from [<c0afd400>] (mutex_lock_nested+0x1c/0x24)
> [<c0afd400>] (mutex_lock_nested) from [<c064d4b8>] 
> (__exynos_dsi_host_attach+0x20/0x6c)
> [<c064d4b8>] (__exynos_dsi_host_attach) from [<c064d914>] 
> (exynos_dsi_host_attach+0x70/0x194)
> [<c064d914>] (exynos_dsi_host_attach) from [<c0656b64>] 
> (s6e8aa0_probe+0x1b0/0x218)
> [<c0656b64>] (s6e8aa0_probe) from [<c0672530>] (really_probe+0x200/0x4fc)
> [<c0672530>] (really_probe) from [<c06729f4>] 
> (driver_probe_device+0x78/0x1fc)
> [<c06729f4>] (driver_probe_device) from [<c0672ddc>] 
> (device_driver_attach+0x58/0x60)
> [<c0672ddc>] (device_driver_attach) from [<c0672ec0>] 
> (__driver_attach+0xdc/0x174)
> [<c0672ec0>] (__driver_attach) from [<c06702b8>] 
> (bus_for_each_dev+0x68/0xb4)
> [<c06702b8>] (bus_for_each_dev) from [<c06715ec>] 
> (bus_add_driver+0x158/0x214)
> [<c06715ec>] (bus_add_driver) from [<c0673d20>] (driver_register+0x78/0x110)
> [<c0673d20>] (driver_register) from [<c0102484>] 
> (do_one_initcall+0x8c/0x42c)
> [<c0102484>] (do_one_initcall) from [<c11011c0>] 
> (kernel_init_freeable+0x190/0x1dc)
> [<c11011c0>] (kernel_init_freeable) from [<c0af7988>] 
> (kernel_init+0x8/0x118)
> [<c0af7988>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> Exception stack(0xef0dffb0 to 0xef0dfff8)
> ...
> ---[ end trace c06e996ec2e8234d ]---
> 
> This means that dsi->encoder.dev is not initialized in 
> __exynos_dsi_host_attach().
> 
> This happens, because drm_bridge_attach() in exynos_dsi_bind() returned 
> earlier -517 (deferred probe), what causes cleanup of encoder and 
> release of all drm resources.
> 
> Then however, the panel tries to register itself and 
> exynos_dsi_host_attach() tries to access the released encoder (which is 
> zeroed in drm_encoder_release) and rest of resources, what causes failure.
> 
> It looks that something is missing. Maybe mipi host has to be registered 
> later, when bridge is ready? I have no idea how it is handled before 
> this patch. Andrzej, could you comment it a bit?

I intentionally changed the order, because if another bridge follows in the
pipeline, the probe of the drm driver has to be deferred until some bridge
provides a connector. The next bridge registers itself via the host_attach
function and the deferral is ensured via the bind for the bind/unbind API or
the bridge_attach function otherwise.

On the other hand, the bridge does not have an encoder until the mipi device
has been attached.

As a solution, the exynos dsi driver must initialize the encoder in
exynos_dsi_probe instead of in exynos_dsi_bind and access the encoder via
exynos_dsi instead of the bridge.

Can you try to move everything except samsung_dsim_bind from exynos_dsi_bind
to exynos_dsi_probe (respectively for unbind) and report if it fixes the
crash.

Michael
