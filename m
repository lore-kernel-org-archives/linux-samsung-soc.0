Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FABC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 21:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F0120759
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 21:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="H9AIApeh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgINVZ1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 17:25:27 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56172 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgINVZY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 17:25:24 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200914211904euoutp0107733a42cddeb60f87c5f8872be153bb~0wygJE7km1550715507euoutp01X
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2020 21:19:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200914211904euoutp0107733a42cddeb60f87c5f8872be153bb~0wygJE7km1550715507euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600118344;
        bh=qknvUjm0A+uKrH81oQba7lEm6/acJSWE6wSvde7Qzfg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=H9AIApehobiP0adMJsqQe68EVklnjMwmHhdnLv3PYZc7ruJnujFxEbOvcFjoFV0aZ
         HDbcep8m8RK1fNR3JnhCIIS+E+lnOcCL+S/nd7YWyaWd2jjk9c9/5sT04aVpcjFTDf
         vUljFqvf2rDGPuPjWknI3qNla5yvkTtVf5nb5KCo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200914211903eucas1p157fb5c09931f305b847071cf52c539f9~0wyfbpMYS2494624946eucas1p1k;
        Mon, 14 Sep 2020 21:19:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E0.C3.06318.74EDF5F5; Mon, 14
        Sep 2020 22:19:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200914211903eucas1p2c85fe74dbe172b96e2e875f7283ddfcd~0wyfA-OF81504515045eucas1p2j;
        Mon, 14 Sep 2020 21:19:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200914211903eusmtrp228502086e2158a670848d81a89116af6~0wyfAQIyw3268332683eusmtrp2V;
        Mon, 14 Sep 2020 21:19:03 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-1a-5f5fde47aa49
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 10.A0.06017.64EDF5F5; Mon, 14
        Sep 2020 22:19:03 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200914211902eusmtip2eb389eeb75d30dd4412af8c3810009ea~0wyeUyjA72524225242eusmtip2V;
        Mon, 14 Sep 2020 21:19:02 +0000 (GMT)
Subject: Re: [PATCH v2 10/16] drm/exynos: implement a drm bridge
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sw0312.kim@samsung.com, krzk@kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        sylvester.nawrocki@gmail.com, Laurent.pinchart@ideasonboard.com
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <a5e5e6d5-95a2-1f5a-94a2-27ec3d12e781@samsung.com>
Date:   Mon, 14 Sep 2020 23:19:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914200145.GA8098@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRT23f1UnNxmtoOa4aAfZjXDsguZWQhdIqK/VrZmXSx0U+7NSkGK
        /J60rDDdxDKxskVpy1krKFqWmm1qFBWUs3LVtFihEolaXq+R/57znOe8z3MOL42pPEQkfch4
        mBeM+hwNGYJ3PP3tWbV1UKdLKPkSzd6qayXYlxMBkv06OICzthonzvb1tVFs5Zlmiq3re6Bg
        b3S+p9iOFg/Busy72bpzfpK9MOZUpIZygTelFOe0vqe4+goLwdltlSTnrepScKenEzhzuw1x
        Y/aYnfSukOQDfM6hI7ygTdkXcvDJnSEyb2jbsdYRE3UCuTeZEE0DsxbuO8NNKIRWMS0I6sz9
        pFyMI2jo/UTJxRiCK/ebcRMKnpsYdg+TElYxVxHYfs2LAgiKP08SUiOcSYXn9u450WImAxpr
        J5AkwhiLAh5Nlc01SCYOpm+/ncNKJgVuvLZjUiacWQ7mU3qJjmD2wtNnH3FZsgh6LMO4JAlm
        EmF0PEKiMWYZFDvqMRmr4eT4NUKyAsZPwc2Kn0gOnQYW9zQm43AY6WqnZBwNf5wXFTI+Dt6W
        EkwerkDgaHPOD2yAd55JUjLGZjO33tPK9GZ4W9WpkM8YBm++L5IzhMHZjlpMppVQUaaS1bHg
        dTvmH1TD5f4JshpprAsWsy7YxrpgG+t/30aE25CazxcNWbyYaOSPrhb1BjHfmLV6f67BjmZ/
        We9M18Rd9GAq04UYGmlClXS+Tqci9EfEAoMLAY1pFiu3uHv3qpQH9AWFvJCrE/JzeNGFomhc
        o1YmNvkzVEyW/jCfzfN5vPCvq6CDI0+g+M7qmMTR5Eu+WMEdm64d2k+8uo4veUGmB2WPav0m
        W0Ozkfaob1WvbPq0Z6mwcSTz+D0sY/C8WK5pT4sb2k5/8K0qFWtUEeVFj83fC2c83kbfte4W
        Ude/b32bZTnj477tcaz72RMfNvDDnxRkTPK64qKOcTu0WFFoXuDhk48aXDyoX7MCE0T9X7eN
        G5lhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsVy+t/xe7ru9+LjDW6mW2ycsZ7V4srX92wW
        L+5dZLFYNXUni8X58xvYLTonLmG3mHF+H5PF2iN32S22rTjHanGoL9pixuSXbBbzPu9kcuDx
        eH+jld1j56y77B6zO2ayemxa1cnmcb/7OJNH/18Dj74tqxg9Pm+SC+CI0rMpyi8tSVXIyC8u
        sVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Ms4uv0BW8EDr4r1r7rYGxjP
        2ncxcnJICJhIPDn7hK2LkYtDSGApo8S7SxNZIRLiErvnv2WGsIUl/lzrgip6yyjx4MR3FpCE
        sICDxJlNJ9hAbBGBWIkXy3rYQWxmgZlMEutXaEM03GWS2PKlGayBTUBT4u/mm2ANvAJ2Emuv
        bwLawMHBIqAq0debCBIWFYiTONPzAqpEUOLkzCcsICWcAsYSr7+IQow3k5i3+SEzhC0v0bx1
        NpQtLtH0ZSXrBEahWUi6ZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzEC
        o3fbsZ9bdjB2vQs+xCjAwajEw5tQHh8vxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii
        0pzU4kOMpkCvTWSWEk3OByaWvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUw
        fUwcnFINjFsX/2r9XjqhS3ju/p81PG52Pku++yZOOLfrxt/w/3lxk2UKdtjMV5FWiVgrx/hT
        r1FjJlfATqbX268zP0159X6vd9J6LiP+o8dsKyboGCyPuy2u/+trzYWsU1NFT0tFik5cEHVn
        8eLETaZq9++XfbYqr+JndJf+1yCyvDxktY9hZenhg/FL7yuxFGckGmoxFxUnAgC6jIsZ9AIA
        AA==
X-CMS-MailID: 20200914211903eucas1p2c85fe74dbe172b96e2e875f7283ddfcd
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
        <650db263-df3f-17fa-0298-62cd821b5274@samsung.com>
        <20200914200145.GA8098@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek, Michael,

On 14.09.2020 22:01, Michael Tretter wrote:
> Hi,
>
> On Mon, 14 Sep 2020 14:31:19 +0200, Marek Szyprowski wrote:
>> On 14.09.2020 10:29, Marek Szyprowski wrote:
>>> On 11.09.2020 15:54, Michael Tretter wrote:
>>>> Make the exynos_dsi driver a full drm bridge that can be found and used
>>>> from other drivers.
>>>>
>>>> Other drivers can only attach to the bridge, if a mipi dsi device
>>>> already attached to the bridge. This allows to defer the probe of the
>>>> display pipe until the downstream bridges are available, too.
>>>>
>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>> This one (and the whole series applied) still fails on Exynos boards:
>>>
>>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
>>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
>>> OF: graph: no port node found in /soc/dsi@11c80000
>>> 8<--- cut here ---
>>> Unable to handle kernel NULL pointer dereference at virtual address 00000084
>>> pgd = (ptrval)
>>> [00000084] *pgd=00000000
>>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>>> Modules linked in:
>>> CPU: 1 PID: 1 Comm: swapper/0 Not tainted
>>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec #1608
>>> Hardware name: Samsung Exynos (Flattened Device Tree)
>>> PC is at drm_bridge_attach+0x18/0x164
>>> LR is at exynos_dsi_bind+0x88/0xa8
>>> pc : [<c0628c08>]    lr : [<c064d560>]    psr: 20000013
>>> sp : ef0dfca8  ip : 00000002  fp : c13190e0
>>> r10: 00000000  r9 : ee46d580  r8 : c13190e0
>>> r7 : ee438800  r6 : 00000018  r5 : ef253810  r4 : ef39e840
>>> r3 : 00000000  r2 : 00000018  r1 : ef39e888  r0 : ef39e840
>>> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
>>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>>> Stack: (0xef0dfca8 to 0xef0e0000)
>>> ...
>>> [<c0628c08>] (drm_bridge_attach) from [<c064d560>]
>>> (exynos_dsi_bind+0x88/0xa8)
>>> [<c064d560>] (exynos_dsi_bind) from [<c066a800>]
>>> (component_bind_all+0xfc/0x290)
>>> [<c066a800>] (component_bind_all) from [<c0649dc0>]
>>> (exynos_drm_bind+0xe4/0x19c)
>>> [<c0649dc0>] (exynos_drm_bind) from [<c066ad74>]
>>> (try_to_bring_up_master+0x1e4/0x2c4)
>>> [<c066ad74>] (try_to_bring_up_master) from [<c066b2b4>]
>>> (component_master_add_with_match+0xd4/0x108)
>>> [<c066b2b4>] (component_master_add_with_match) from [<c0649ae8>]
>>> (exynos_drm_platform_probe+0xe4/0x110)
>>> [<c0649ae8>] (exynos_drm_platform_probe) from [<c0674e6c>]
>>> (platform_drv_probe+0x6c/0xa4)
>>> [<c0674e6c>] (platform_drv_probe) from [<c067242c>]
>>> (really_probe+0x200/0x4fc)
>>> [<c067242c>] (really_probe) from [<c06728f0>]
>>> (driver_probe_device+0x78/0x1fc)
>>> [<c06728f0>] (driver_probe_device) from [<c0672cd8>]
>>> (device_driver_attach+0x58/0x60)
>>> [<c0672cd8>] (device_driver_attach) from [<c0672dbc>]
>>> (__driver_attach+0xdc/0x174)
>>> [<c0672dbc>] (__driver_attach) from [<c06701b4>]
>>> (bus_for_each_dev+0x68/0xb4)
>>> [<c06701b4>] (bus_for_each_dev) from [<c06714e8>]
>>> (bus_add_driver+0x158/0x214)
>>> [<c06714e8>] (bus_add_driver) from [<c0673c1c>] (driver_register+0x78/0x110)
>>> [<c0673c1c>] (driver_register) from [<c0649ca8>]
>>> (exynos_drm_init+0xe4/0x118)
>>> [<c0649ca8>] (exynos_drm_init) from [<c0102484>]
>>> (do_one_initcall+0x8c/0x42c)
>>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
>>> (kernel_init_freeable+0x190/0x1dc)
>>> [<c11011c0>] (kernel_init_freeable) from [<c0af7880>]
>>> (kernel_init+0x8/0x118)
>>> [<c0af7880>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
>>> Exception stack(0xef0dffb0 to 0xef0dfff8)
>>> ...
>>> ---[ end trace ee27f313f9ed9da1 ]---
>>>
>>> # arm-linux-gnueabi-addr2line -e vmlinux c0628c08
>>> drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)
>>>
>>> I will try to debug it a bit more today.
>> The above crash has been caused by lack of in_bridge initialization to
>> NULL in exynos_dsi_bind() in this patch. However, fixing it reveals
>> another issue:
>>
>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
>> OF: graph: no port node found in /soc/dsi@11c80000
>> 8<--- cut here ---
>> Unable to handle kernel NULL pointer dereference at virtual address 00000280
>> pgd = (ptrval)
>> [00000280] *pgd=00000000
>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>> Modules linked in:
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec-dirty #1613
>> Hardware name: Samsung Exynos (Flattened Device Tree)
>> PC is at __mutex_lock+0x54/0xb18
>> LR is at lock_is_held_type+0x80/0x138
>> pc : [<c0afc920>]    lr : [<c0af63e8>]    psr: 60000013
>> sp : ef0dfd30  ip : 33937b74  fp : c13193c8
>> r10: c1208eec  r9 : 00000000  r8 : ee45f808
>> r7 : c19561a4  r6 : 00000000  r5 : 00000000  r4 : 0000024c
>> r3 : 00000000  r2 : 00204140  r1 : c124f13c  r0 : 00000000
>> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>> Stack: (0xef0dfd30 to 0xef0e0000)
>> ...
>> [<c0afc920>] (__mutex_lock) from [<c0afd400>] (mutex_lock_nested+0x1c/0x24)
>> [<c0afd400>] (mutex_lock_nested) from [<c064d4b8>]
>> (__exynos_dsi_host_attach+0x20/0x6c)
>> [<c064d4b8>] (__exynos_dsi_host_attach) from [<c064d914>]
>> (exynos_dsi_host_attach+0x70/0x194)
>> [<c064d914>] (exynos_dsi_host_attach) from [<c0656b64>]
>> (s6e8aa0_probe+0x1b0/0x218)
>> [<c0656b64>] (s6e8aa0_probe) from [<c0672530>] (really_probe+0x200/0x4fc)
>> [<c0672530>] (really_probe) from [<c06729f4>]
>> (driver_probe_device+0x78/0x1fc)
>> [<c06729f4>] (driver_probe_device) from [<c0672ddc>]
>> (device_driver_attach+0x58/0x60)
>> [<c0672ddc>] (device_driver_attach) from [<c0672ec0>]
>> (__driver_attach+0xdc/0x174)
>> [<c0672ec0>] (__driver_attach) from [<c06702b8>]
>> (bus_for_each_dev+0x68/0xb4)
>> [<c06702b8>] (bus_for_each_dev) from [<c06715ec>]
>> (bus_add_driver+0x158/0x214)
>> [<c06715ec>] (bus_add_driver) from [<c0673d20>] (driver_register+0x78/0x110)
>> [<c0673d20>] (driver_register) from [<c0102484>]
>> (do_one_initcall+0x8c/0x42c)
>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
>> (kernel_init_freeable+0x190/0x1dc)
>> [<c11011c0>] (kernel_init_freeable) from [<c0af7988>]
>> (kernel_init+0x8/0x118)
>> [<c0af7988>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
>> Exception stack(0xef0dffb0 to 0xef0dfff8)
>> ...
>> ---[ end trace c06e996ec2e8234d ]---
>>
>> This means that dsi->encoder.dev is not initialized in
>> __exynos_dsi_host_attach().
>>
>> This happens, because drm_bridge_attach() in exynos_dsi_bind() returned
>> earlier -517 (deferred probe), what causes cleanup of encoder and
>> release of all drm resources.
>>
>> Then however, the panel tries to register itself and
>> exynos_dsi_host_attach() tries to access the released encoder (which is
>> zeroed in drm_encoder_release) and rest of resources, what causes failure.
>>
>> It looks that something is missing. Maybe mipi host has to be registered
>> later, when bridge is ready? I have no idea how it is handled before
>> this patch. Andrzej, could you comment it a bit?
> I intentionally changed the order, because if another bridge follows in the
> pipeline, the probe of the drm driver has to be deferred until some bridge
> provides a connector. The next bridge registers itself via the host_attach
> function and the deferral is ensured via the bind for the bind/unbind API or
> the bridge_attach function otherwise.
>
> On the other hand, the bridge does not have an encoder until the mipi device
> has been attached.
>
> As a solution, the exynos dsi driver must initialize the encoder in
> exynos_dsi_probe instead of in exynos_dsi_bind and access the encoder via
> exynos_dsi instead of the bridge.
>
> Can you try to move everything except samsung_dsim_bind from exynos_dsi_bind
> to exynos_dsi_probe (respectively for unbind) and report if it fixes the
> crash.


The original behaviour is that encoder (exynos_dsi) is registered 
regardless of sink presence (initially panel, later also bridge) - it 
avoids multiple issues with deferred probe, device driver bind/unbind 
and module load/unload. Appearance or disappearance of sink is reported 
to host nicely via DSI attach/detach callbacks - and it is reflected in 
drm world as change state of the connector.

Registering DSI host in bind and unregistering in unbind assures that if 
mipi_dsi device is attached/detached the drm device is always present - 
it makes device/driver binding race free and allows to avoid additional 
locking.

Moving DSI host registration to probe changes everything, for sure it 
breaks the nice feature of DSI attach/detach callbacks and apparently 
can cause different issues depending on device bind order.

I will try to look at the patches tomorrow and maybe I can find more 
constructive comments :)


Regards

Andrzej


>
> Michael
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/v1/url?k=4f0be936-129547ac-4f0a6279-0cc47a336fae-e9aecfc5418740e8&q=1&e=1d4b0871-5b85-47f3-9506-79c768643aee&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
