Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D89C43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 12:32:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F27920735
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 12:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rqyAH4dx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgINMcP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 08:32:15 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45854 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgINMbj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 08:31:39 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200914123121euoutp02ed26c3ffc64cf88c4ca40afe70e0bb3d~0plv1SPfJ3098730987euoutp02-
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2020 12:31:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200914123121euoutp02ed26c3ffc64cf88c4ca40afe70e0bb3d~0plv1SPfJ3098730987euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600086681;
        bh=Jh0uKv3ZZMEW8PBi4TalKoy58nK4t8zAeGj5HH6m26I=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=rqyAH4dxiDIbz6GOLNruTheUait3OFSmPOjalCjUmpoiO35Mj9V9l4/0pVjLTLjeJ
         OUZpTjRc6FK5CP1opqilvDiYO+qd8A+g6Zzk8jtZMLn7lbJImnlyAW2YWRrDcddOpv
         BOfoR8iAkdmRTiTzEFBbzWvvblxaVnMjYcgcftHY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200914123121eucas1p1426d750f662f3ae0dc6f609187359ad1~0plvdkA220776307763eucas1p1A;
        Mon, 14 Sep 2020 12:31:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 84.B7.06318.9926F5F5; Mon, 14
        Sep 2020 13:31:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200914123120eucas1p14394366fb266e4efd40de3deb6e8f125~0plu-W6Aj2387823878eucas1p1s;
        Mon, 14 Sep 2020 12:31:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200914123120eusmtrp12db28ec042f56ea73fb8bb432877c2f0~0plu_g_0L0412004120eusmtrp1C;
        Mon, 14 Sep 2020 12:31:20 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-7e-5f5f62993487
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id EA.27.06314.8926F5F5; Mon, 14
        Sep 2020 13:31:20 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200914123119eusmtip27b928fcfc6aa2caa801e100e3bcda128~0pluQPIJ20971909719eusmtip2L;
        Mon, 14 Sep 2020 12:31:19 +0000 (GMT)
Subject: Re: [PATCH v2 10/16] drm/exynos: implement a drm bridge
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com
Message-ID: <650db263-df3f-17fa-0298-62cd821b5274@samsung.com>
Date:   Mon, 14 Sep 2020 14:31:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <381a553a-5bc6-d070-fc40-7d48fdb89ca9@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO+fsnONodpyaLyuKZgUWpWK0A5XZxThQP/wTdMHLzMOy3LRN
        V2aBWd6mmF2sbXYnUg6otdK00Gik0yzvdFfRFrpIRqwFWVrNY+W/53m/5/me73n5aFz+UqKg
        U3WZvF6nTlOSUqKh7XvXaktyYmLE4zqcfVvbJWHvmusk7IDXTbLnhssJdnyol2CFiiaC7e6+
        Q7HFZ29RrLm7BWMbqv+I7WX7WPN5F8le9TRhMTLO/Tqf4pqsgxRXWWSRcDahmOSGSxwYd2Yq
        giu7LyDOY1scR++Vbkjh01KNvD48Okl64ENBK5XhXXe0dKyRykWnw03IjwZmLbR2DBAmJKXl
        TDWChunbs+Qrgov9NbhIPAhK2l3IhOgZS/P0bnFehaBqyiQRiRuBq0ogfPcGMjHw3NZO+jDJ
        RIJpwkT6zEFMJnwe3eHT40wuBo8uPEQ+jYyJhl+992a8BLMcRjztlA8HMwnQ9myUEDUB0GFx
        zmA/ZhMM5tVLfBhnlsCp+kpcxCHw1nkN8wUA46Wg4kYfJhbdBs0vrbM4ED457lMiXgSd50sJ
        0XAKwUhXDSWSUgT9eWYkqtbD+67JmQo4EwZ1D2e3txnelDzFxLX4w+uJAPER/nCu4RIujmVQ
        VCAX1SvA6qj9F/ukpw8vR0rrnGrWOXWsc+pY/+deR4SAQvgsg1bDG6J0/JE1BrXWkKXTrNmf
        rrWhP7+tc9rhbUQtP5PtiKGRcp4sbmNColyiNhqytXYENK4Mkm150Zkgl6Wos4/x+vREfVYa
        b7CjhTShDJFF3XTFyxmNOpM/xPMZvP7vKUb7KXKRMP6xIIzU9uhcqpRFod8UxuElkNTvfuw9
        0eOcaL7YTybnxS8de1+oUhUqnLuGts/XTnBmpSfJQb06bcxfPXnG/jVna6hALuumFqw6ePdL
        yLi5XuUZezdmeWDMcV3pKLgc+0jeV7bTXyXsMVZmB588ronY+SMq/XBrbMtGizdOSRgOqCNX
        4nqD+jdRMWhqaQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsVy+t/xe7ozkuLjDTZMUrC4te4cq8XGGetZ
        La58fc9mMen+BBaLF/cuslismrqTxeL8+Q3sFp0Tl7BbzDi/j8li2wqg4kN90RYzJr9ks5j3
        eSeTA6/H+xut7B47Z91l95jdMZPVY9OqTjaP+93HmTz6/xp49G1ZxejxeZNcAEeUnk1RfmlJ
        qkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbjtqPsBV/NKnqe
        72BvYGzR72Lk4JAQMJHY+y+ii5GLQ0hgKaNE19f7jF2MnEBxGYmT0xpYIWxhiT/Xutggit4y
        StydtJYFJCEs4CBxZtMJNhCbTcBQouttF5gtIlAi8encIyaQBmaBBiaJxR9BJoF0/2eU+LJh
        Olg3r4CdxP+Lm8FsFgFViYefT7CD2KICcRJnel6wQdQISpyc+QSshlPAXuJu01awk5gFzCTm
        bX7IDGHLSzRvnQ1li0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFhnrFibnF
        pXnpesn5uZsYgdG87djPzTsYL20MPsQowMGoxMMbYBsXL8SaWFZcmXuIUYKDWUmE1+ns6Tgh
        3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgcmmrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLp
        iSWp2ampBalFMH1MHJxSDYytadeqJiW8PLU4/Ih/fUhF6w2tTR9acnPmMNp8kVm/LLZGrdV1
        fctmCcmUW36zbFP/Ky9Wa4yetLXi8u5n91/vXlw+j1V2zxnb2/EK+cd85uYJVE9PeWBZaG80
        o1mY6a6JbuiPeQ1HokWZpG8x3mWN8RWrvHDuSv6O94Z5uecm7Fi5zOzJ5n9KLMUZiYZazEXF
        iQDfIml5/AIAAA==
X-CMS-MailID: 20200914123120eucas1p14394366fb266e4efd40de3deb6e8f125
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911164817eucas1p2a0907a3d4c5c0a8d8dc4bc97301f1517
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911164817eucas1p2a0907a3d4c5c0a8d8dc4bc97301f1517
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <CGME20200911164817eucas1p2a0907a3d4c5c0a8d8dc4bc97301f1517@eucas1p2.samsung.com>
        <20200911135413.3654800-11-m.tretter@pengutronix.de>
        <381a553a-5bc6-d070-fc40-7d48fdb89ca9@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 14.09.2020 10:29, Marek Szyprowski wrote:
> On 11.09.2020 15:54, Michael Tretter wrote:
>> Make the exynos_dsi driver a full drm bridge that can be found and used
>> from other drivers.
>>
>> Other drivers can only attach to the bridge, if a mipi dsi device
>> already attached to the bridge. This allows to defer the probe of the
>> display pipe until the downstream bridges are available, too.
>>
>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> This one (and the whole series applied) still fails on Exynos boards:
>
> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> OF: graph: no port node found in /soc/dsi@11c80000
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 00000084
> pgd = (ptrval)
> [00000084] *pgd=00000000
> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec #1608
> Hardware name: Samsung Exynos (Flattened Device Tree)
> PC is at drm_bridge_attach+0x18/0x164
> LR is at exynos_dsi_bind+0x88/0xa8
> pc : [<c0628c08>]    lr : [<c064d560>]    psr: 20000013
> sp : ef0dfca8  ip : 00000002  fp : c13190e0
> r10: 00000000  r9 : ee46d580  r8 : c13190e0
> r7 : ee438800  r6 : 00000018  r5 : ef253810  r4 : ef39e840
> r3 : 00000000  r2 : 00000018  r1 : ef39e888  r0 : ef39e840
> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 4000404a  DAC: 00000051
> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> Stack: (0xef0dfca8 to 0xef0e0000)
> ...
> [<c0628c08>] (drm_bridge_attach) from [<c064d560>]
> (exynos_dsi_bind+0x88/0xa8)
> [<c064d560>] (exynos_dsi_bind) from [<c066a800>]
> (component_bind_all+0xfc/0x290)
> [<c066a800>] (component_bind_all) from [<c0649dc0>]
> (exynos_drm_bind+0xe4/0x19c)
> [<c0649dc0>] (exynos_drm_bind) from [<c066ad74>]
> (try_to_bring_up_master+0x1e4/0x2c4)
> [<c066ad74>] (try_to_bring_up_master) from [<c066b2b4>]
> (component_master_add_with_match+0xd4/0x108)
> [<c066b2b4>] (component_master_add_with_match) from [<c0649ae8>]
> (exynos_drm_platform_probe+0xe4/0x110)
> [<c0649ae8>] (exynos_drm_platform_probe) from [<c0674e6c>]
> (platform_drv_probe+0x6c/0xa4)
> [<c0674e6c>] (platform_drv_probe) from [<c067242c>]
> (really_probe+0x200/0x4fc)
> [<c067242c>] (really_probe) from [<c06728f0>]
> (driver_probe_device+0x78/0x1fc)
> [<c06728f0>] (driver_probe_device) from [<c0672cd8>]
> (device_driver_attach+0x58/0x60)
> [<c0672cd8>] (device_driver_attach) from [<c0672dbc>]
> (__driver_attach+0xdc/0x174)
> [<c0672dbc>] (__driver_attach) from [<c06701b4>]
> (bus_for_each_dev+0x68/0xb4)
> [<c06701b4>] (bus_for_each_dev) from [<c06714e8>]
> (bus_add_driver+0x158/0x214)
> [<c06714e8>] (bus_add_driver) from [<c0673c1c>] (driver_register+0x78/0x110)
> [<c0673c1c>] (driver_register) from [<c0649ca8>]
> (exynos_drm_init+0xe4/0x118)
> [<c0649ca8>] (exynos_drm_init) from [<c0102484>]
> (do_one_initcall+0x8c/0x42c)
> [<c0102484>] (do_one_initcall) from [<c11011c0>]
> (kernel_init_freeable+0x190/0x1dc)
> [<c11011c0>] (kernel_init_freeable) from [<c0af7880>]
> (kernel_init+0x8/0x118)
> [<c0af7880>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> Exception stack(0xef0dffb0 to 0xef0dfff8)
> ...
> ---[ end trace ee27f313f9ed9da1 ]---
>
> # arm-linux-gnueabi-addr2line -e vmlinux c0628c08
> drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)
>
> I will try to debug it a bit more today.

The above crash has been caused by lack of in_bridge initialization to 
NULL in exynos_dsi_bind() in this patch. However, fixing it reveals 
another issue:

[drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
OF: graph: no port node found in /soc/dsi@11c80000
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000280
pgd = (ptrval)
[00000280] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 
5.9.0-rc4-next-20200911-00010-g417dc70d70ec-dirty #1613
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at __mutex_lock+0x54/0xb18
LR is at lock_is_held_type+0x80/0x138
pc : [<c0afc920>]    lr : [<c0af63e8>]    psr: 60000013
sp : ef0dfd30  ip : 33937b74  fp : c13193c8
r10: c1208eec  r9 : 00000000  r8 : ee45f808
r7 : c19561a4  r6 : 00000000  r5 : 00000000  r4 : 0000024c
r3 : 00000000  r2 : 00204140  r1 : c124f13c  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 4000404a  DAC: 00000051
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
Stack: (0xef0dfd30 to 0xef0e0000)
...
[<c0afc920>] (__mutex_lock) from [<c0afd400>] (mutex_lock_nested+0x1c/0x24)
[<c0afd400>] (mutex_lock_nested) from [<c064d4b8>] 
(__exynos_dsi_host_attach+0x20/0x6c)
[<c064d4b8>] (__exynos_dsi_host_attach) from [<c064d914>] 
(exynos_dsi_host_attach+0x70/0x194)
[<c064d914>] (exynos_dsi_host_attach) from [<c0656b64>] 
(s6e8aa0_probe+0x1b0/0x218)
[<c0656b64>] (s6e8aa0_probe) from [<c0672530>] (really_probe+0x200/0x4fc)
[<c0672530>] (really_probe) from [<c06729f4>] 
(driver_probe_device+0x78/0x1fc)
[<c06729f4>] (driver_probe_device) from [<c0672ddc>] 
(device_driver_attach+0x58/0x60)
[<c0672ddc>] (device_driver_attach) from [<c0672ec0>] 
(__driver_attach+0xdc/0x174)
[<c0672ec0>] (__driver_attach) from [<c06702b8>] 
(bus_for_each_dev+0x68/0xb4)
[<c06702b8>] (bus_for_each_dev) from [<c06715ec>] 
(bus_add_driver+0x158/0x214)
[<c06715ec>] (bus_add_driver) from [<c0673d20>] (driver_register+0x78/0x110)
[<c0673d20>] (driver_register) from [<c0102484>] 
(do_one_initcall+0x8c/0x42c)
[<c0102484>] (do_one_initcall) from [<c11011c0>] 
(kernel_init_freeable+0x190/0x1dc)
[<c11011c0>] (kernel_init_freeable) from [<c0af7988>] 
(kernel_init+0x8/0x118)
[<c0af7988>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
Exception stack(0xef0dffb0 to 0xef0dfff8)
...
---[ end trace c06e996ec2e8234d ]---

This means that dsi->encoder.dev is not initialized in 
__exynos_dsi_host_attach().

This happens, because drm_bridge_attach() in exynos_dsi_bind() returned 
earlier -517 (deferred probe), what causes cleanup of encoder and 
release of all drm resources.

Then however, the panel tries to register itself and 
exynos_dsi_host_attach() tries to access the released encoder (which is 
zeroed in drm_encoder_release) and rest of resources, what causes failure.

It looks that something is missing. Maybe mipi host has to be registered 
later, when bridge is ready? I have no idea how it is handled before 
this patch. Andrzej, could you comment it a bit?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

