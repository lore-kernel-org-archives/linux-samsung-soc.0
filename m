Return-Path: <SRS0=fnc5=CN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E581C43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Sep 2020 09:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB4E920770
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Sep 2020 09:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X/+iRLMr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbgIDJVg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Sep 2020 05:21:36 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59184 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbgIDJVe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 05:21:34 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200904092132euoutp0241898d2d6740d182cb77eb1bdd90a411~xijKGSqFZ2493624936euoutp02Z
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Sep 2020 09:21:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200904092132euoutp0241898d2d6740d182cb77eb1bdd90a411~xijKGSqFZ2493624936euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599211292;
        bh=gNpZjoYhg1RJ4UinTP5qJUtsYs+Akmz0Pc5iWXyWKZ0=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=X/+iRLMr03qSZOd3JeRlfU/g/9SJLMgiu1uxjomPF2QIemTJ9XEFx8GggZ226xzx+
         Pd3D8++5jxqc+RsA59kw0s46B0pjJCJy1iJReNsT6ALR0X2LDVfwL0eLpGxTgnvqvT
         mcsW1/W/WKIYvpzcqHj/Yrvr1cuwXznTf5+0WzQw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200904092131eucas1p22ee1d236863aad6703bfceaea39cc646~xijJYJdfE0449504495eucas1p2J;
        Fri,  4 Sep 2020 09:21:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id FB.AB.06456.B17025F5; Fri,  4
        Sep 2020 10:21:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200904092130eucas1p2b1869c64f61dd57d54ce8560273d6cba~xijIuZ4KN1922419224eucas1p2A;
        Fri,  4 Sep 2020 09:21:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200904092130eusmtrp14805ecffdeb9b6cb876128ce7bdc82a2~xijItzVQt0339603396eusmtrp1Y;
        Fri,  4 Sep 2020 09:21:30 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-3f-5f52071bd917
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 49.9A.06314.A17025F5; Fri,  4
        Sep 2020 10:21:30 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200904092130eusmtip243484d72403385afaccfefa135c9f0c0~xijIOOHTe3020730207eusmtip2t;
        Fri,  4 Sep 2020 09:21:30 +0000 (GMT)
Subject: Re: [PATCH 02/16] drm/exynos: extract helper functions for probe
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     krzk@kernel.org, Laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, narmstrong@baylibre.com,
        Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <fb6c7aee-d89c-8ddf-62de-088ef3af1ddd@samsung.com>
Date:   Fri, 4 Sep 2020 11:21:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c0d6aad1-5d9b-4a24-e9a5-3878fb289ac3@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87rS7EHxBqc+S1rcWneO1eLK1/ds
        Fqum7mSxOH9+A7tF58Ql7BYzzu9jsti2Aih7qC/agcPj/Y1Wdo/ZHTNZPTat6mTzuN99nMmj
        /6+BR9+WVYwenzfJBbBHcdmkpOZklqUW6dslcGXM71/PVvBevaKx0bqBcb1SFyMnh4SAicTX
        BWfYuxi5OIQEVjBKPHnwjgXC+cIosf3WQSYI5zOjxNNbx5lgWg4uf8MKkVgOVLVyNzOE855R
        4uvNg4wgVcICnhLv5i8E62ATMJToetvF1sXIwSEiUCLx5pE3SD2zQD+jxNp/bWwgNbwCdhK9
        7y6B2SwCKhKXfjWB2aICcRLHTj1igagRlDg58wmYzSlgL/Hv8V5WEJtZQF6ieetsZghbXOLW
        k/lgZ0sIHGKX+DbpMyvE2S4Sk67fZoawhSVeHd/CDmHLSJye3MMC0dDMKPHw3Fp2CKeHUeJy
        0wxGiCpriTvnfoG9wCygKbF+lz5E2FHibNcLJpCwhACfxI23ghBH8ElM2jadGSLMK9HRJgRR
        rSYx6/g6uLUHL1xinsCoNAvJa7OQvDMLyTuzEPYuYGRZxSieWlqcm55abJiXWq5XnJhbXJqX
        rpecn7uJEZieTv87/mkH49dLSYcYBTgYlXh4b7wPiBdiTSwrrsw9xCjBwawkwut09nScEG9K
        YmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tSs1NTC1KLYLJMHJxSDYxCJ9JfRmXdqAnv
        7pgkaXmMzXOBhQzz1Vez23IiazrMKxcd35Db4XRWwVxL+9dblbfOWxNZ+YsXVzy/93ZLWEh0
        Ry/nl92FvAeylK/d8tl34QrnnyUFoeqzti9mve65s02c80uRi3nBi/IJG2bOqw8Qqzvd+vFv
        Rd6X0rxdP7/OEfdu1b3KskSJpTgj0VCLuag4EQA7m+6NSwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7pS7EHxBuu2alvcWneO1eLK1/ds
        Fqum7mSxOH9+A7tF58Ql7BYzzu9jsti2Aih7qC/agcPj/Y1Wdo/ZHTNZPTat6mTzuN99nMmj
        /6+BR9+WVYwenzfJBbBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mk
        pOZklqUW6dsl6GXM71/PVvBevaKx0bqBcb1SFyMnh4SAicTB5W9Yuxi5OIQEljJKnFs6gRUi
        ISNxcloDlC0s8edaFxtE0VtGiUV728ASwgKeEu/mL2QCsdkEDCW63oIUcXKICJRIfDr3iAmk
        gVmgn1Fi8sId7BDd/xglln2ZywxSxStgJ9H77hJYB4uAisSlX01gtqhAnMSZnhdsEDWCEidn
        PmEBsTkF7CX+Pd4LtplZwExi3uaHzBC2vETz1tlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQs
        YGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERiR24793LyD8dLG4EOMAhyMSjy8N94HxAux
        JpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBySKvJN7Q1NDc
        wtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVANji9JVLoFNYrIxoQsyRHJ+vlp8
        4PXmk0ZJ0itDBSfktt7r9rw3f26QnpKvL6PxSjmXIxP1wvfn8v68v+zGlibzm2+u8gStSQ6S
        kRfWPhz5rCW2uctT85DCm7+v0v9KCsZLaJt01ErvuzOr3EvzR61MQueDw69aEu8/mnbhDGe8
        f0HGRr5NgYxKLMUZiYZazEXFiQD0TLsV3gIAAA==
X-CMS-MailID: 20200904092130eucas1p2b1869c64f61dd57d54ce8560273d6cba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200903165747eucas1p2f644b3ae6d7c48cb77f5c5f8b9be66ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200903165747eucas1p2f644b3ae6d7c48cb77f5c5f8b9be66ba
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
        <CGME20200903165747eucas1p2f644b3ae6d7c48cb77f5c5f8b9be66ba@eucas1p2.samsung.com>
        <20200903165717.1272492-3-m.tretter@pengutronix.de>
        <c0d6aad1-5d9b-4a24-e9a5-3878fb289ac3@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

On 04.09.2020 11:04, Marek Szyprowski wrote:
> On 03.09.2020 18:57, Michael Tretter wrote:
>> As the driver shall be usable with drivers that use the component
>> framework and drivers that don't, split the common probing code into a
>> separate function that can be called from different locations.
>>
>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>
> This is the first patch that causes the crash on Exynos boards:
>
> exynos4-fb 11c00000.fimd: Adding to iommu group 0
> OF: graph: no port node found in /soc/fimd@11c00000
> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> OF: graph: no port node found in /soc/dsi@11c80000
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 
> 00000084
> pgd = (ptrval)
> [00000084] *pgd=00000000
> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 
> 5.9.0-rc2-next-20200824-00004-g680baccba1c2 #1591
> Hardware name: Samsung Exynos (Flattened Device Tree)
> PC is at drm_bridge_attach+0x18/0x164
> LR is at exynos_dsi_bind+0x88/0x9c
> pc : [<c0620524>]    lr : [<c0644df8>]    psr: 20000013
> ...
> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> ...
> [<c0620524>] (drm_bridge_attach) from [<c0644df8>] 
> (exynos_dsi_bind+0x88/0x9c)
> [<c0644df8>] (exynos_dsi_bind) from [<c0661aec>] 
> (component_bind_all+0xfc/0x290)
> [<c0661aec>] (component_bind_all) from [<c06413d0>] 
> (exynos_drm_bind+0xe4/0x19c)
> [<c06413d0>] (exynos_drm_bind) from [<c0662060>] 
> (try_to_bring_up_master+0x1e4/0x2c4)
> [<c0662060>] (try_to_bring_up_master) from [<c06625a0>] 
> (component_master_add_with_match+0xd4/0x108)
> [<c06625a0>] (component_master_add_with_match) from [<c06410f8>] 
> (exynos_drm_platform_probe+0xe4/0x110)
> [<c06410f8>] (exynos_drm_platform_probe) from [<c066c788>] 
> (platform_drv_probe+0x6c/0xa4)
> [<c066c788>] (platform_drv_probe) from [<c0669cc4>] 
> (really_probe+0x200/0x4fc)
> [<c0669cc4>] (really_probe) from [<c066a188>] 
> (driver_probe_device+0x78/0x1fc)
> [<c066a188>] (driver_probe_device) from [<c066a570>] 
> (device_driver_attach+0x58/0x60)
> [<c066a570>] (device_driver_attach) from [<c066a654>] 
> (__driver_attach+0xdc/0x174)
> [<c066a654>] (__driver_attach) from [<c0667a4c>] 
> (bus_for_each_dev+0x68/0xb4)
> [<c0667a4c>] (bus_for_each_dev) from [<c0668d80>] 
> (bus_add_driver+0x158/0x214)
> [<c0668d80>] (bus_add_driver) from [<c066b538>] 
> (driver_register+0x78/0x110)
> [<c066b538>] (driver_register) from [<c06412b8>] 
> (exynos_drm_init+0xe4/0x118)
> [<c06412b8>] (exynos_drm_init) from [<c01023f4>] 
> (do_one_initcall+0x8c/0x424)
> [<c01023f4>] (do_one_initcall) from [<c10011a8>] 
> (kernel_init_freeable+0x190/0x1dc)
> [<c10011a8>] (kernel_init_freeable) from [<c0ae8ab4>] 
> (kernel_init+0x8/0x118)
> [<c0ae8ab4>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> Exception stack(0xef0dffb0 to 0xef0dfff8)
> ffa0:                                     00000000 00000000 00000000 
> 00000000
> ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> 00000000
> ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
> Code: e92d4070 0a00002e e3520000 0a000044 (e592c06c)
> ---[ end trace 1c93b26d166070f6 ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> CPU0: stopping
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D 
> 5.9.0-rc2-next-20200824-00004-g680baccba1c2 #1591
> Hardware name: Samsung Exynos (Flattened Device Tree)
> [<c011160c>] (unwind_backtrace) from [<c010cfc0>] (show_stack+0x10/0x14)
> [<c010cfc0>] (show_stack) from [<c0533c3c>] (dump_stack+0xbc/0xe8)
> [<c0533c3c>] (dump_stack) from [<c01104e0>] (handle_IPI+0x3e0/0x428)
> [<c01104e0>] (handle_IPI) from [<c05511dc>] (gic_handle_irq+0x98/0x9c)
> [<c05511dc>] (gic_handle_irq) from [<c0100af0>] (__irq_svc+0x70/0xb0)
> Exception stack(0xc1101f08 to 0xc1101f50)
> 1f00:                   c01095d8 00000000 00000000 c1100000 c1108eec 
> c1108f30
> 1f20: 00000001 c107d068 c1108ec8 00000000 00000000 00000000 00005dc0 
> c1101f58
> 1f40: c01095d8 c01095dc 60000013 ffffffff
> [<c0100af0>] (__irq_svc) from [<c01095dc>] (arch_cpu_idle+0x24/0x44)
> [<c01095dc>] (arch_cpu_idle) from [<c01635dc>] (do_idle+0x1bc/0x2bc)
> [<c01635dc>] (do_idle) from [<c0163a90>] (cpu_startup_entry+0x18/0x1c)
> [<c0163a90>] (cpu_startup_entry) from [<c1000f88>] 
> (start_kernel+0x628/0x664)
> [<c1000f88>] (start_kernel) from [<00000000>] (0x0)
> ---[ end Kernel panic - not syncing: Attempted to kill init! 
> exitcode=0x0000000b ]---

# arm-linux-gnueabi-addr2line -a c0620524 -e vmlinux
0xc0620524
drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)

what is:

184:    if (previous && (!previous->dev || previous->encoder != encoder))

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

