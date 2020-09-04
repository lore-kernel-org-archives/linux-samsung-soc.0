Return-Path: <SRS0=fnc5=CN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F91C43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Sep 2020 08:31:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BB07207EA
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Sep 2020 08:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="smHWnRp6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgIDIbR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Sep 2020 04:31:17 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39111 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgIDIbM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 04:31:12 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200904083110euoutp02b33213c016affe2300fa0a39305d692a~xh3Lhep122369923699euoutp02I
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Sep 2020 08:31:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200904083110euoutp02b33213c016affe2300fa0a39305d692a~xh3Lhep122369923699euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599208270;
        bh=zUOaeA0/5D+g0PtTKoEg6Y+5003Wa90hiS/BeGle5eg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=smHWnRp6a2IyXj+8uf61FUFZpX8xcBvXjRy4TX3ezOKsAhKrPTeruTGk6+W6LDjSl
         7YwedgfNmN9GGfXgut0PKx3GNYgyDnJIJdQ2mp9sDswPBPrW832norNQNwH7zk+2PN
         i4ogTMB8TIPs+Xr8uYGLIblEwtaMCjABGJvEZIuo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200904083109eucas1p133a44d1f23cf6dbf1461cbaa91791680~xh3LFF0O40315703157eucas1p1K;
        Fri,  4 Sep 2020 08:31:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 58.18.05997.D4BF15F5; Fri,  4
        Sep 2020 09:31:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200904083109eucas1p16ce0fbba2caf7882979423324554a2ed~xh3KlU70y1198611986eucas1p1M;
        Fri,  4 Sep 2020 08:31:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200904083109eusmtrp13322513ccd85c11543bb967f2bad892b~xh3KkhSq50386703867eusmtrp1C;
        Fri,  4 Sep 2020 08:31:09 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-f8-5f51fb4dcd70
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DC.72.06314.D4BF15F5; Fri,  4
        Sep 2020 09:31:09 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200904083108eusmtip24e38ecaa3566500f6fcd888bb2b955d5~xh3J61NIT2997129971eusmtip2R;
        Fri,  4 Sep 2020 08:31:08 +0000 (GMT)
Subject: Re: [PATCH 00/16] drm/exynos: Convert driver to drm bridge
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Cc:     dri-devel@lists.freedesktop.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, kernel@pengutronix.de,
        Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <cb6d3ced-5bd2-443f-674e-b4c9acb8c021@samsung.com>
Date:   Fri, 4 Sep 2020 10:31:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPcJCfFL43OLXC_DAowU0o_jW2rZ7qX-m8ePcPEMo0PEgQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjt3b3brqPF62b6YJIwrEjI1CJuX9LXj0tRGGQ/lLJVNxXd1N20
        rD+RZrqVmfYxr6gVfdiytDWtCRmtcKm1ZSaYaCvNasVapUKlVm63D/+d57znOec58FKEoksc
        SqVp97I6rTpDJZGRTa3fnQs2jm1Ojr5rnkP33nCI6ZvGejH9fNQroctcpST9/mUnSZtOW0na
        6WyQ0sUnL0ppo7NFRDfVToptJUm0sdwtoauHraJVcsbbc0TKWPl+KVNZVCFmzKZiCeMy2EXM
        iYlopsRiQsyweXY8lShbsZvNSMtldQvjdshS737NzjLE7G+sfyU6hNoj9YiiAC8GvStEj2SU
        AtciqJg4goRhBIHj8xApDMMI6ko6xXoU4N8oKzRIfFiBryA4+emgIPIiGKw7L/bZKvFaKD6j
        9PFBeEIET1pG/E4EfoDA/WAA+bYlOAb0Hr3fSY7joPJyDfItkzgC7rwN99Ez8XZobR8gBUkg
        tFW88eMAvBmajvJ+TOBwyG+sJAQcAr1vakS+LMCjUrBariKh5zpw85xQQAkf7BapgMOgo/wY
        KejzEbx2XJcKwzEEXYeNSFAthz7HD4nPiMDzob55oUCvBvuF7j/+M6DHEyjcMAPKms4SAi2H
        okKFoJ4LvP3Gv9j7T58RpUjFT2nGT2nDT2nD/889h0gTCmFzOE0Ky8Vq2X1RnFrD5WhTonZl
        asxo8qt1/LSP3EHN4zttCFNINV3e441PVojVuVyexoaAIlRB8jVPOrYr5LvVeQdYXWayLieD
        5WxoFkWqQuSLLri3KXCKei+bzrJZrO7vq4gKCD2ELAeqo97vKvj+MSjwobJ4yNL9LunLi6XN
        wd6I/be7O9cXbvim1RcUpWktLWhZWO/WnEf2sFxD4solx+WZVZp7exyPB68NLQOb/VS6MyEv
        P2h8fF5337TouP5fnriNrsebPEwpkT7HuIWLdNtbY5ThLVWjODa6vC1h7FV2w9zgW5dUJJeq
        jokkdJz6N1iNcUpmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsVy+t/xe7q+vwPjDdbcYre4te4cq8XGGetZ
        La58fc9mMen+BBaLF/cuslismrqTxeL8+Q3sFp0Tl7BbzDi/j8li2wqg4kN90RYzJr9ks5j3
        eSeTA6/H+xut7B47Z91l95jdMZPVY9OqTjaP+93HmTz6/xp49G1ZxejxeZNcAEeUnk1RfmlJ
        qkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbeT4UF3YYVW9c/
        YGpgPKXVxcjJISFgIjGprZuti5GLQ0hgKaPE8/cH2CESMhInpzWwQtjCEn+udbGB2EICbxkl
        Vs3K6mLk4BAWcJbonCYM0isi8JdJ4vyM7ewgDrPAUUaJOQsfsEBMvcUo0XfxPhNIN5uAoUTX
        W4hJvAJ2ErOXzWcEmcQioCKx45k8SFhUIE7iTM8LqBJBiZMzn7CA2JwCgRLb2meB2cwCZhLz
        Nj9khrDlJZq3zoayxSVuPZnPNIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi
        0rx0veT83E2MwEjeduzn5h2MlzYGH2IU4GBU4uG98T4gXog1say4MvcQowQHs5IIr9PZ03FC
        vCmJlVWpRfnxRaU5qcWHGE2BfpvILCWanA9MMnkl8YamhuYWlobmxubGZhZK4rwdAgdjhATS
        E0tSs1NTC1KLYPqYODilGhiVT7C5GBbXSJ+xTJ3AM3+V3RZVo6PbTtUfPZSV7p79UylYefUO
        67OMtyrryh5o2C3W5Lar/XVJ/QNf8YcZygpfHO0iggsm37MpO7BjRUmZ0t34vqXTry8Ii1Tv
        WvPg8/XbyzQZvvsnHsgqS9bz+d7EtuvIgwWJTJuu//7FsSLrurxA0+nDu2qVWIozEg21mIuK
        EwHQM9Ny+gIAAA==
X-CMS-MailID: 20200904083109eucas1p16ce0fbba2caf7882979423324554a2ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200903200844eucas1p1e3829942daec8a49d7a8ec3cd2e09038
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200903200844eucas1p1e3829942daec8a49d7a8ec3cd2e09038
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
        <CGME20200903200844eucas1p1e3829942daec8a49d7a8ec3cd2e09038@eucas1p1.samsung.com>
        <CAJKOXPcJCfFL43OLXC_DAowU0o_jW2rZ7qX-m8ePcPEMo0PEgQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 03.09.2020 22:08, Krzysztof Kozlowski wrote:
> On Thu, 3 Sep 2020 at 18:57, Michael Tretter <m.tretter@pengutronix.de> wrote:
>> the Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
>> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
>> the Exynos Decon. The driver for the LCDIF does not use the component
>> framework, but uses drm bridges.
>>
>> This series converts the Exynos MIPI DSI into a drm bridge and makes it usable
>> with such drivers. Although the driver is converted, it still supports the
>> component framework API to stay compliant with the Exynos DRM driver.
>>
>> Unfortunately, I don't have any Exynos SoC to actually test the series.  I
>> tested the driver with a few additional unfinished patches on the i.MX8M Mini
>> EVK, but somebody should definitely verify that the driver is still working on
>> Exynos hardware.
> Hi Michael,
>
> +Cc maintainers and folks in Samsung.
>
> Please follow the script/get_maintainers.pl to get the list of
> maintainers of the Exynos DRM drivers. First they could provide you
> with testing, second they might be the people merging the driver.
>
> Unfortunately I cannot provide proper testing as none of my boards
> have a display attached. :)

Thanks for adding cc to me. Sadly this patchset crashed badly on Samsung 
Exnyos based boards. Here is the log from Exynos3250-based Rinato:

exynos4-fb 11c00000.fimd: Adding to iommu group 0
OF: graph: no port node found in /soc/fimd@11c00000
[drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
OF: graph: no port node found in /soc/dsi@11c80000
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000650
pgd = (ptrval)
[00000650] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 
5.9.0-rc2-next-20200824-00017-g3e9b20f7eb0d #1576
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at samsung_dsim_resume+0x18/0x120
LR is at genpd_runtime_resume+0x160/0x278
...
[<c064f590>] (samsung_dsim_resume) from [<c0685020>] 
(genpd_runtime_resume+0x160/0x278)
[<c0685020>] (genpd_runtime_resume) from [<c0677e84>] 
(__rpm_callback+0xbc/0x124)
[<c0677e84>] (__rpm_callback) from [<c0677f0c>] (rpm_callback+0x20/0x80)
[<c0677f0c>] (rpm_callback) from [<c0676aec>] (rpm_resume+0x388/0x714)
[<c0676aec>] (rpm_resume) from [<c0676edc>] (__pm_runtime_resume+0x64/0x9c)
[<c0676edc>] (__pm_runtime_resume) from [<c0669e10>] 
(__device_attach+0xcc/0x17c)
[<c0669e10>] (__device_attach) from [<c0668ee8>] 
(bus_probe_device+0x88/0x90)
[<c0668ee8>] (bus_probe_device) from [<c06660a0>] (device_add+0x4e8/0x79c)
[<c06660a0>] (device_add) from [<c063dc1c>] 
(mipi_dsi_device_register_full+0xc8/0x148)
[<c063dc1c>] (mipi_dsi_device_register_full) from [<c063dcec>] 
(mipi_dsi_host_register+0x50/0x168)
[<c063dcec>] (mipi_dsi_host_register) from [<c064d90c>] 
(samsung_dsim_bind+0x368/0x40c)
[<c064d90c>] (samsung_dsim_bind) from [<c06449f8>] 
(exynos_dsi_bind+0x78/0x88)
[<c06449f8>] (exynos_dsi_bind) from [<c0661ef0>] 
(component_bind_all+0xfc/0x290)
[<c0661ef0>] (component_bind_all) from [<c06413d0>] 
(exynos_drm_bind+0xe4/0x19c)
[<c06413d0>] (exynos_drm_bind) from [<c0662464>] 
(try_to_bring_up_master+0x1e4/0x2c4)
[<c0662464>] (try_to_bring_up_master) from [<c06629a4>] 
(component_master_add_with_match+0xd4/0x108)
[<c06629a4>] (component_master_add_with_match) from [<c06410f8>] 
(exynos_drm_platform_probe+0xe4/0x110)
[<c06410f8>] (exynos_drm_platform_probe) from [<c066cb8c>] 
(platform_drv_probe+0x6c/0xa4)
[<c066cb8c>] (platform_drv_probe) from [<c066a0c8>] 
(really_probe+0x200/0x4fc)
[<c066a0c8>] (really_probe) from [<c066a58c>] 
(driver_probe_device+0x78/0x1fc)
[<c066a58c>] (driver_probe_device) from [<c066a974>] 
(device_driver_attach+0x58/0x60)
[<c066a974>] (device_driver_attach) from [<c066aa58>] 
(__driver_attach+0xdc/0x174)
[<c066aa58>] (__driver_attach) from [<c0667e50>] 
(bus_for_each_dev+0x68/0xb4)
[<c0667e50>] (bus_for_each_dev) from [<c0669184>] 
(bus_add_driver+0x158/0x214)
[<c0669184>] (bus_add_driver) from [<c066b93c>] (driver_register+0x78/0x110)
[<c066b93c>] (driver_register) from [<c06412b8>] 
(exynos_drm_init+0xe4/0x118)
[<c06412b8>] (exynos_drm_init) from [<c01023f4>] 
(do_one_initcall+0x8c/0x424)
[<c01023f4>] (do_one_initcall) from [<c10011a8>] 
(kernel_init_freeable+0x190/0x1dc)
[<c10011a8>] (kernel_init_freeable) from [<c0ae8e5c>] 
(kernel_init+0x8/0x118)
[<c0ae8e5c>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
Exception stack(0xd94a5fb0 to 0xd94a5ff8)
...
---[ end trace 1a053145d15f23dc ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU0: stopping
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D 
5.9.0-rc2-next-20200824-00017-g3e9b20f7eb0d #1576
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c011160c>] (unwind_backtrace) from [<c010cfc0>] (show_stack+0x10/0x14)
[<c010cfc0>] (show_stack) from [<c0533c3c>] (dump_stack+0xbc/0xe8)
[<c0533c3c>] (dump_stack) from [<c01104e0>] (handle_IPI+0x3e0/0x428)
[<c01104e0>] (handle_IPI) from [<c05511dc>] (gic_handle_irq+0x98/0x9c)
[<c05511dc>] (gic_handle_irq) from [<c0100af0>] (__irq_svc+0x70/0xb0)
Exception stack(0xc1101f08 to 0xc1101f50)
...
[<c0100af0>] (__irq_svc) from [<c01095dc>] (arch_cpu_idle+0x24/0x44)
[<c01095dc>] (arch_cpu_idle) from [<c01635dc>] (do_idle+0x1bc/0x2bc)
[<c01635dc>] (do_idle) from [<c0163a90>] (cpu_startup_entry+0x18/0x1c)
[<c0163a90>] (cpu_startup_entry) from [<c1000f88>] 
(start_kernel+0x628/0x664)
[<c1000f88>] (start_kernel) from [<00000000>] (0x0)
---[ end Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b ]---

I've didn't check the code yet, but the conversion also lacks "select 
DRM_SAMSUNG_DSIM" in the Exynos DSI driver's Kconfig, as I wasn't even 
able to compile it with the current exynos_defconfig.

I've tested it on top of next-20200824, because it doesn't apply 
on current linux-next.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

