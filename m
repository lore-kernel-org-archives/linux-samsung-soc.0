Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAA1C43381
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Feb 2021 16:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C49664F59
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Feb 2021 16:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237890AbhBDQ3s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 4 Feb 2021 11:29:48 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41951 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237032AbhBDQ3i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 11:29:38 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210204162852euoutp0189f48ab5195b7445e5e3010f4ef8258c~gmE9AoIXW2514725147euoutp01O
        for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Feb 2021 16:28:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210204162852euoutp0189f48ab5195b7445e5e3010f4ef8258c~gmE9AoIXW2514725147euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1612456132;
        bh=wy+N6hH5UMo0G1yvwEKRJOVTnMQMcjG16x4cpWl18GA=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=FFAKUjRhedePCQKxxqur95MYsHaM0M7IwLImsbBCqpyidCi3ouJWg1uVZHulSyBTg
         cWUQuURYBdRJcxRhSI5ceDrbx9Y0RzXeM8iF+gqRcQiydQ+cZwt28dvTWyxX3Ro0V6
         fHt5o47W2F1JyfPiDvZIOsgjlMAoLMNYLXzOOrWA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210204162851eucas1p2b9eea5c3cbf5f566718744979e474275~gmE8Pfz8f3088830888eucas1p2j;
        Thu,  4 Feb 2021 16:28:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E1.B8.44805.3C02C106; Thu,  4
        Feb 2021 16:28:51 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210204162851eucas1p27eb1b56f60c3a8a1a1b33c41c91a8807~gmE7wG2s43194031940eucas1p25;
        Thu,  4 Feb 2021 16:28:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210204162851eusmtrp104833f0862f94cbff8d5a1964bc5744e~gmE7u3xfB0800008000eusmtrp1I;
        Thu,  4 Feb 2021 16:28:51 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-26-601c20c34bae
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E1.4D.21957.3C02C106; Thu,  4
        Feb 2021 16:28:51 +0000 (GMT)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210204162850eusmtip17e50bf2e5f704e5741a3d7ef506ad328~gmE6eunDA0215102151eusmtip1O;
        Thu,  4 Feb 2021 16:28:49 +0000 (GMT)
Message-ID: <e9a01089-8374-5b1a-0d80-17b83013ad44@samsung.com>
Date:   Thu, 4 Feb 2021 17:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0)
        Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH v2 10/16] drm/exynos: implement a drm bridge
Content-Language: en-GB
To:     Daniel Vetter <daniel@ffwll.ch>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     Marek Vasut <marex@denx.de>, aisheng.dong@nxp.com,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        ch@denx.de, Neil Armstrong <narmstrong@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        dl-linux-imx <linux-imx@nxp.com>, frieder.schrempf@kontron.de,
        abel.vesa@nxp.com,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        sylvester.nawrocki@gmail.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        aford173@gmail.com, Sascha Hauer <kernel@pengutronix.de>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
From:   Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <YBwbNeoMhTE7fIOb@phenom.ffwll.local>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplk+LIzCtJLcpLzFFi42LZduzned3DCjIJBlOXGFksu3SU0eLO7dPM
        Fl+m7mK22DhjPavFpZfXGC3+b5vIbHHl63s2i96l51gtXty7yGKxaupOFovz5zewW3ROXMJu
        0fVrJbPFjPP7mCzWHrnLbrFtBVDdm7ZGRotDfdEWL7aIW8yY/JLNYt7nnUwOoh7vb7Sye8yb
        dYLFY++3BSweO2fdZfeY3TGT1WPTqk42jyNXF7N63O8+zuSx8d0OJo/+vwYefVtWMXp83iQX
        wBPFZZOSmpNZllqkb5fAlbH5eg9rwet2xoqLS2czNzB2FncxcnJICJhIbGrdxtjFyMUhJLCC
        UeLW72MsEM4XRomnh5qgnM+MEnsPnWOCadm9bTczRGI5UNWMBlYI5z2jxKG2E4wgVbwCdhI3
        t85lBrFZBFQkti++yQYRF5Q4OfMJC4gtKpAgsaFzM9hUYQEHiTObToDVMAuISzR9WQk0lIND
        RCBQ4kR7Bsh8ZoEDrBKd/2aA1bAJaEr83Qwxk1PASGJVxzJmiF55ieats8GukxD4xCnRtnEG
        O8TZLhIHHu1hhLCFJV4d3wIVl5E4PbmHBcKul7i/ogWquYNRYuuGncwQCWuJO+d+sYFcxAy0
        ef0ufYiwo8Tfj7+YQcISAnwSN94KQtzAJzFp23SoMK9ER5sQRLWixP2zW6EGikssvfCVbQKj
        0iykUJmF5PtZSL6ZhbB3ASPLKkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMCUevrf8S87
        GJe/+qh3iJGJg/EQowQHs5IIb2KbVIIQb0piZVVqUX58UWlOavEhRmkOFiVx3qQta+KFBNIT
        S1KzU1MLUotgskwcnFINTOkFi52yJq1affeNwN1lnb4/pkx51PbhnPy8grUbXj6zmu99c0nE
        HU7h/+lfdF1O75HqmvvisZ7kLLUTDA1peyavc+9VdA68LXC6nW+vi8jCrpgzu1YK7ym6eLnu
        ae6nefZfyk/8mZSZXckqbZ6jf9RerGaipbE/a5rkU5EHBQFbL4fci5tsyqxkbHrIo2VKBsP5
        iv3XHSRvPJ2ccNvPL7TwRq+ciPr9hINGpTddwy8/e+j57UfoT2MLicI43cn5d0zn2k60ndPD
        Jt/q2tiyzGfn5UvbLKKDV1w1W79nb6XCW4eJU/x/8c/J+3vUnEl+VeSLCIWuz1kGUZypD/vV
        3yTu/cb5/6kk4+Ha4rOzdyqxFGckGmoxFxUnAgDG7ZWyGAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsVy+t/xu7qHFWQSDA4d5bVYdukoo8Wd26eZ
        Lb5M3cVssXHGelaLSy+vMVr83zaR2eLK1/dsFr1Lz7FavLh3kcVi1dSdLBbnz29gt+icuITd
        ouvXSmaLGef3MVmsPXKX3WLbCqC6N22NjBaH+qItXmwRt5gx+SWbxbzPO5kcRD3e32hl95g3
        6wSLx95vC1g8ds66y+4xu2Mmq8emVZ1sHkeuLmb1uN99nMlj47sdTB79fw08+rasYvT4vEku
        gCdKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2Pz
        9R7WgtftjBUXl85mbmDsLO5i5OSQEDCR2L1tN3MXIxeHkMBSRonZ+48xQyTEJXbPfwtlC0v8
        udbFBlH0llGi+dt6RpAEr4CdxM2tc8GKWARUJLYvvskGEReUODnzCQuILSqQIDG5/zVYXFjA
        QeLMphNgNjPQgqYvK1lBbBGBQIndz86DLWAWOMQq0ff6AtRJ/1gkpu58C1bFJqAp8XczxAZO
        ASOJVR3LmCEmmUl0be1ihLDlJZq3zmaewCg0C8khs5AsnIWkZRaSlgWMLKsYRVJLi3PTc4sN
        9YoTc4tL89L1kvNzNzEC08i2Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIryJbVIJQrwpiZVVqUX5
        8UWlOanFhxhNgaExkVlKNDkfmMjySuINzQxMDU3MLA1MLc2MlcR5t85dEy8kkJ5YkpqdmlqQ
        WgTTx8TBKdXAZBmctqT6V6fQD6/DU48teSi7jVHpn3ds5/53hmdWs25/pR5uojIvbU/KkfV1
        Jb3ZT0X0mxoP33/ZJBVvk+ZdVyT/TZ97l8TXZbs+lS7xsl7Ts/TP3OsLuWubLsjPWPCf45/D
        Gs1HS2ZUfpz0LHimguYZ0dz5z1ZlfeR76SD7c8ka94B1f3snHCrNqTdVjrv7cEq1w/arzt8q
        TvYJLmroOp01SV378IlVtzPvrmOZt+V5mu2cGDsVZt5Nc0912L1bHMTmMctz1q+Vkam+6mbr
        7grXXLv3McBb3sHwiLLyPNvW7BTpl7seLWi+uFk66vBuE749D57z77l49Ozn4oiIwhlyFmrt
        h7++SlncN4M7dqkSS3FGoqEWc1FxIgB+A3EyrAMAAA==
X-CMS-MailID: 20210204162851eucas1p27eb1b56f60c3a8a1a1b33c41c91a8807
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210204160524eucas1p1dba5e4d75dddbc65feaeaf8918e468d4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210204160524eucas1p1dba5e4d75dddbc65feaeaf8918e468d4
References: <20200911135413.3654800-11-m.tretter@pengutronix.de>
        <381a553a-5bc6-d070-fc40-7d48fdb89ca9@samsung.com>
        <650db263-df3f-17fa-0298-62cd821b5274@samsung.com>
        <20200914200145.GA8098@pengutronix.de>
        <a5e5e6d5-95a2-1f5a-94a2-27ec3d12e781@samsung.com>
        <2d7f0e5e-070c-971e-1e4f-47a60f00d934@samsung.com>
        <20210201163314.GB26987@pengutronix.de>
        <20210203203148.GA29287@pengutronix.de>
        <CAKMK7uGO+hUBzR5H0yZdaKg_fNsv7d=tKVZNwozdvG=9GA2FBQ@mail.gmail.com>
        <20210204105632.GB29287@pengutronix.de>
        <CGME20210204160524eucas1p1dba5e4d75dddbc65feaeaf8918e468d4@eucas1p1.samsung.com>
        <YBwbNeoMhTE7fIOb@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


W dniu 04.02.2021 o 17:05, Daniel Vetter pisze:
> On Thu, Feb 04, 2021 at 11:56:32AM +0100, Michael Tretter wrote:
>> On Thu, 04 Feb 2021 11:17:49 +0100, Daniel Vetter wrote:
>>> On Wed, Feb 3, 2021 at 9:32 PM Michael Tretter <m.tretter@pengutronix.de> wrote:
>>>> On Mon, 01 Feb 2021 17:33:14 +0100, Michael Tretter wrote:
>>>>> On Tue, 15 Sep 2020 21:40:40 +0200, Andrzej Hajda wrote:
>>>>>> W dniu 14.09.2020 o 23:19, Andrzej Hajda pisze:
>>>>>>> On 14.09.2020 22:01, Michael Tretter wrote:
>>>>>>>> On Mon, 14 Sep 2020 14:31:19 +0200, Marek Szyprowski wrote:
>>>>>>>>> On 14.09.2020 10:29, Marek Szyprowski wrote:
>>>>>>>>>> On 11.09.2020 15:54, Michael Tretter wrote:
>>>>>>>>>>> Make the exynos_dsi driver a full drm bridge that can be found and
>>>>>>>>>>> used
>>>>>>>>>>> from other drivers.
>>>>>>>>>>>
>>>>>>>>>>> Other drivers can only attach to the bridge, if a mipi dsi device
>>>>>>>>>>> already attached to the bridge. This allows to defer the probe of the
>>>>>>>>>>> display pipe until the downstream bridges are available, too.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>>>>>>>>> This one (and the whole series applied) still fails on Exynos boards:
>>>>>>>>>>
>>>>>>>>>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping
>>>>>>>>>> operations
>>>>>>>>>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
>>>>>>>>>> OF: graph: no port node found in /soc/dsi@11c80000
>>>>>>>>>> 8<--- cut here ---
>>>>>>>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>>>>>>>> 00000084
>>>>>>>>>> pgd = (ptrval)
>>>>>>>>>> [00000084] *pgd=00000000
>>>>>>>>>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>>>>>>>>>> Modules linked in:
>>>>>>>>>> CPU: 1 PID: 1 Comm: swapper/0 Not tainted
>>>>>>>>>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec #1608
>>>>>>>>>> Hardware name: Samsung Exynos (Flattened Device Tree)
>>>>>>>>>> PC is at drm_bridge_attach+0x18/0x164
>>>>>>>>>> LR is at exynos_dsi_bind+0x88/0xa8
>>>>>>>>>> pc : [<c0628c08>]    lr : [<c064d560>]    psr: 20000013
>>>>>>>>>> sp : ef0dfca8  ip : 00000002  fp : c13190e0
>>>>>>>>>> r10: 00000000  r9 : ee46d580  r8 : c13190e0
>>>>>>>>>> r7 : ee438800  r6 : 00000018  r5 : ef253810  r4 : ef39e840
>>>>>>>>>> r3 : 00000000  r2 : 00000018  r1 : ef39e888  r0 : ef39e840
>>>>>>>>>> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>>>>>>>>>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
>>>>>>>>>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>>>>>>>>>> Stack: (0xef0dfca8 to 0xef0e0000)
>>>>>>>>>> ...
>>>>>>>>>> [<c0628c08>] (drm_bridge_attach) from [<c064d560>]
>>>>>>>>>> (exynos_dsi_bind+0x88/0xa8)
>>>>>>>>>> [<c064d560>] (exynos_dsi_bind) from [<c066a800>]
>>>>>>>>>> (component_bind_all+0xfc/0x290)
>>>>>>>>>> [<c066a800>] (component_bind_all) from [<c0649dc0>]
>>>>>>>>>> (exynos_drm_bind+0xe4/0x19c)
>>>>>>>>>> [<c0649dc0>] (exynos_drm_bind) from [<c066ad74>]
>>>>>>>>>> (try_to_bring_up_master+0x1e4/0x2c4)
>>>>>>>>>> [<c066ad74>] (try_to_bring_up_master) from [<c066b2b4>]
>>>>>>>>>> (component_master_add_with_match+0xd4/0x108)
>>>>>>>>>> [<c066b2b4>] (component_master_add_with_match) from [<c0649ae8>]
>>>>>>>>>> (exynos_drm_platform_probe+0xe4/0x110)
>>>>>>>>>> [<c0649ae8>] (exynos_drm_platform_probe) from [<c0674e6c>]
>>>>>>>>>> (platform_drv_probe+0x6c/0xa4)
>>>>>>>>>> [<c0674e6c>] (platform_drv_probe) from [<c067242c>]
>>>>>>>>>> (really_probe+0x200/0x4fc)
>>>>>>>>>> [<c067242c>] (really_probe) from [<c06728f0>]
>>>>>>>>>> (driver_probe_device+0x78/0x1fc)
>>>>>>>>>> [<c06728f0>] (driver_probe_device) from [<c0672cd8>]
>>>>>>>>>> (device_driver_attach+0x58/0x60)
>>>>>>>>>> [<c0672cd8>] (device_driver_attach) from [<c0672dbc>]
>>>>>>>>>> (__driver_attach+0xdc/0x174)
>>>>>>>>>> [<c0672dbc>] (__driver_attach) from [<c06701b4>]
>>>>>>>>>> (bus_for_each_dev+0x68/0xb4)
>>>>>>>>>> [<c06701b4>] (bus_for_each_dev) from [<c06714e8>]
>>>>>>>>>> (bus_add_driver+0x158/0x214)
>>>>>>>>>> [<c06714e8>] (bus_add_driver) from [<c0673c1c>]
>>>>>>>>>> (driver_register+0x78/0x110)
>>>>>>>>>> [<c0673c1c>] (driver_register) from [<c0649ca8>]
>>>>>>>>>> (exynos_drm_init+0xe4/0x118)
>>>>>>>>>> [<c0649ca8>] (exynos_drm_init) from [<c0102484>]
>>>>>>>>>> (do_one_initcall+0x8c/0x42c)
>>>>>>>>>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
>>>>>>>>>> (kernel_init_freeable+0x190/0x1dc)
>>>>>>>>>> [<c11011c0>] (kernel_init_freeable) from [<c0af7880>]
>>>>>>>>>> (kernel_init+0x8/0x118)
>>>>>>>>>> [<c0af7880>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
>>>>>>>>>> Exception stack(0xef0dffb0 to 0xef0dfff8)
>>>>>>>>>> ...
>>>>>>>>>> ---[ end trace ee27f313f9ed9da1 ]---
>>>>>>>>>>
>>>>>>>>>> # arm-linux-gnueabi-addr2line -e vmlinux c0628c08
>>>>>>>>>> drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)
>>>>>>>>>>
>>>>>>>>>> I will try to debug it a bit more today.
>>>>>>>>> The above crash has been caused by lack of in_bridge initialization to
>>>>>>>>> NULL in exynos_dsi_bind() in this patch. However, fixing it reveals
>>>>>>>>> another issue:
>>>>>>>>>
>>>>>>>>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
>>>>>>>>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
>>>>>>>>> OF: graph: no port node found in /soc/dsi@11c80000
>>>>>>>>> 8<--- cut here ---
>>>>>>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>>>>>>> 00000280
>>>>>>>>> pgd = (ptrval)
>>>>>>>>> [00000280] *pgd=00000000
>>>>>>>>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>>>>>>>>> Modules linked in:
>>>>>>>>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>>>>>>>>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec-dirty #1613
>>>>>>>>> Hardware name: Samsung Exynos (Flattened Device Tree)
>>>>>>>>> PC is at __mutex_lock+0x54/0xb18
>>>>>>>>> LR is at lock_is_held_type+0x80/0x138
>>>>>>>>> pc : [<c0afc920>]    lr : [<c0af63e8>]    psr: 60000013
>>>>>>>>> sp : ef0dfd30  ip : 33937b74  fp : c13193c8
>>>>>>>>> r10: c1208eec  r9 : 00000000  r8 : ee45f808
>>>>>>>>> r7 : c19561a4  r6 : 00000000  r5 : 00000000  r4 : 0000024c
>>>>>>>>> r3 : 00000000  r2 : 00204140  r1 : c124f13c  r0 : 00000000
>>>>>>>>> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>>>>>>>>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
>>>>>>>>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>>>>>>>>> Stack: (0xef0dfd30 to 0xef0e0000)
>>>>>>>>> ...
>>>>>>>>> [<c0afc920>] (__mutex_lock) from [<c0afd400>]
>>>>>>>>> (mutex_lock_nested+0x1c/0x24)
>>>>>>>>> [<c0afd400>] (mutex_lock_nested) from [<c064d4b8>]
>>>>>>>>> (__exynos_dsi_host_attach+0x20/0x6c)
>>>>>>>>> [<c064d4b8>] (__exynos_dsi_host_attach) from [<c064d914>]
>>>>>>>>> (exynos_dsi_host_attach+0x70/0x194)
>>>>>>>>> [<c064d914>] (exynos_dsi_host_attach) from [<c0656b64>]
>>>>>>>>> (s6e8aa0_probe+0x1b0/0x218)
>>>>>>>>> [<c0656b64>] (s6e8aa0_probe) from [<c0672530>]
>>>>>>>>> (really_probe+0x200/0x4fc)
>>>>>>>>> [<c0672530>] (really_probe) from [<c06729f4>]
>>>>>>>>> (driver_probe_device+0x78/0x1fc)
>>>>>>>>> [<c06729f4>] (driver_probe_device) from [<c0672ddc>]
>>>>>>>>> (device_driver_attach+0x58/0x60)
>>>>>>>>> [<c0672ddc>] (device_driver_attach) from [<c0672ec0>]
>>>>>>>>> (__driver_attach+0xdc/0x174)
>>>>>>>>> [<c0672ec0>] (__driver_attach) from [<c06702b8>]
>>>>>>>>> (bus_for_each_dev+0x68/0xb4)
>>>>>>>>> [<c06702b8>] (bus_for_each_dev) from [<c06715ec>]
>>>>>>>>> (bus_add_driver+0x158/0x214)
>>>>>>>>> [<c06715ec>] (bus_add_driver) from [<c0673d20>]
>>>>>>>>> (driver_register+0x78/0x110)
>>>>>>>>> [<c0673d20>] (driver_register) from [<c0102484>]
>>>>>>>>> (do_one_initcall+0x8c/0x42c)
>>>>>>>>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
>>>>>>>>> (kernel_init_freeable+0x190/0x1dc)
>>>>>>>>> [<c11011c0>] (kernel_init_freeable) from [<c0af7988>]
>>>>>>>>> (kernel_init+0x8/0x118)
>>>>>>>>> [<c0af7988>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
>>>>>>>>> Exception stack(0xef0dffb0 to 0xef0dfff8)
>>>>>>>>> ...
>>>>>>>>> ---[ end trace c06e996ec2e8234d ]---
>>>>>>>>>
>>>>>>>>> This means that dsi->encoder.dev is not initialized in
>>>>>>>>> __exynos_dsi_host_attach().
>>>>>>>>>
>>>>>>>>> This happens, because drm_bridge_attach() in exynos_dsi_bind() returned
>>>>>>>>> earlier -517 (deferred probe), what causes cleanup of encoder and
>>>>>>>>> release of all drm resources.
>>>>>>>>>
>>>>>>>>> Then however, the panel tries to register itself and
>>>>>>>>> exynos_dsi_host_attach() tries to access the released encoder (which is
>>>>>>>>> zeroed in drm_encoder_release) and rest of resources, what causes
>>>>>>>>> failure.
>>>>>>>>>
>>>>>>>>> It looks that something is missing. Maybe mipi host has to be
>>>>>>>>> registered
>>>>>>>>> later, when bridge is ready? I have no idea how it is handled before
>>>>>>>>> this patch. Andrzej, could you comment it a bit?
>>>>>>>> I intentionally changed the order, because if another bridge follows
>>>>>>>> in the
>>>>>>>> pipeline, the probe of the drm driver has to be deferred until some
>>>>>>>> bridge
>>>>>>>> provides a connector. The next bridge registers itself via the
>>>>>>>> host_attach
>>>>>>>> function and the deferral is ensured via the bind for the bind/unbind
>>>>>>>> API or
>>>>>>>> the bridge_attach function otherwise.
>>>>>>>>
>>>>>>>> On the other hand, the bridge does not have an encoder until the mipi
>>>>>>>> device
>>>>>>>> has been attached.
>>>>>>>>
>>>>>>>> As a solution, the exynos dsi driver must initialize the encoder in
>>>>>>>> exynos_dsi_probe instead of in exynos_dsi_bind and access the encoder
>>>>>>>> via
>>>>>>>> exynos_dsi instead of the bridge.
>>>>>>>>
>>>>>>>> Can you try to move everything except samsung_dsim_bind from
>>>>>>>> exynos_dsi_bind
>>>>>>>> to exynos_dsi_probe (respectively for unbind) and report if it fixes the
>>>>>>>> crash.
>>>>>>>
>>>>>>> The original behaviour is that encoder (exynos_dsi) is registered
>>>>>>> regardless of sink presence (initially panel, later also bridge) - it
>>>>>>> avoids multiple issues with deferred probe, device driver bind/unbind
>>>>>>> and module load/unload. Appearance or disappearance of sink is
>>>>>>> reported to host nicely via DSI attach/detach callbacks - and it is
>>>>>>> reflected in drm world as change state of the connector.
>>>>>>>
>>>>>>> Registering DSI host in bind and unregistering in unbind assures that
>>>>>>> if mipi_dsi device is attached/detached the drm device is always
>>>>>>> present - it makes device/driver binding race free and allows to avoid
>>>>>>> additional locking.
>>>>>>>
>>>>>>> Moving DSI host registration to probe changes everything, for sure it
>>>>>>> breaks the nice feature of DSI attach/detach callbacks and apparently
>>>>>>> can cause different issues depending on device bind order.
>>>>>>>
>>>>>>> I will try to look at the patches tomorrow and maybe I can find more
>>>>>>> constructive comments :)
>>>>>>
>>>>>> As I said yesterday, exynos_dsi driver uses dsi host attach/detach
>>>>>> callbacks to control appearance/disappearance of downstream device. It
>>>>>> allows to:
>>>>>>
>>>>>> 1. Safely bind/unbind different device drivers at any time and at any
>>>>>> order, without killing exynos_drm and/or crashing system.
>>>>>>
>>>>>> 2. Avoid issues with late drm init - on some platforms exynos_drm device
>>>>>> appeared too late, due to deferred probe, and resulted in black screen
>>>>>> in userspace.
>>>>>>
>>>>>>
>>>>>> Now if we want to convert exynos_dsi to drm_bridge I see following options:
>>>>>>
>>>>>> A. Forgot about callbacks and make the exynos_drm to defer probing until
>>>>>> exynos_dsi bridge is available, probably it will cause later exynos_drm
>>>>>> appearance, thus probably black screen on some targets. So for sure it
>>>>>> will be suboptimal. Making it bridge unbind safe would be another
>>>>>> problem, but most developers do not care about it so why should we? :)
>>>>>>
>>>>>> B. Try to mimic current behaviour - exynos_dsi register bridge ASAP,
>>>>>> even if downstream devices are not yet attached, on attach/detach notify
>>>>>> drm about it via connector status change, for this dsi_host registration
>>>>>> should be performed from drm_bridge attach, I guess.
>>>>>>
>>>>>>
>>>>>> Option A is more standard, but is unsafe and causes other issues.
>>>>>>
>>>>>> Option B keeps current behaviour.
>>>>> Maybe we can have both, but I am not sure, if I am missing something:
>>>>>
>>>>> I still prefer option A for the samsung-dsim driver, because it is more
>>>>> standard, simpler and avoids issues with encoders, connectors or handling
>>>>> hotplug.
>>>>>
>>>>> The idea is to use two bridges in the exynos-dsi driver: One bridge in the
>>>>> samsung-dsim driver which implements option A and defers probing of the drm
>>>>> driver until the next bridge is attached. And a second bridge in the
>>>>> exynos_dsi that attaches to the first bridge (thus, allowing the exynos_drm
>>>>> device to appear) and implements the hotplug handling for notifying drm via
>>>>> connector status change.
>>>>>
>>>>> The driver for the i.MX8M would use the samsung-dsim bridge without an
>>>>> additional bridge.
>>>>>
>>>>> This allows the samsung-dsim driver to expose the standard behavior while the
>>>>> exynos_dsi may stick to the existing behavior for the exynos_drm driver.
>>>>>
>>>>> I hope this makes sense and does not sound too crazy. It might be difficult to
>>>>> get the probing and mipi host/device registration correct, but I will try, if
>>>>> this can work.
>>>> Adding two bridges for being able to support hotplugging adds many special
>>>> cases to the bridge driver and still requires more custom API to correctly add
>>>> the second bridge. I don't think that this a viable path to go.
>>> Just jumping in here: You cannot hotplug/hotremove anything from a
>>> drm_device after drm_dev_register has been called, except
>>> drm_connector. I didn't dig into details here so not sure whether you
>>> want to late-bind your bridge after drm_dev_register is called or not,
>>> so might just be fyi and not relevant to the discussion.
>> Thanks. AFAIC that is exactly what is currently implemented in the exynos_drm
>> driver (i.e. Option B)
>>
>> exynos_dsi_bind configures the encoder and registers a DSI host. Afterwards,
>> exynos_drm_bind (as component_master_ops) calls drm_dev_register. Later, a DSI
>> device might attach to the DSI host and call exynos_dsi_host_attach. In
>> exynos_dsi_host_attach, the driver finds the drm_bridge for the DSI device and
>> attaches this bridge to the encoder _after_ drm_dev_register has been called.
>> This is invalid behavior, right?
> Definitely not supported, I don't think we have the right locks in place
> to make sure this works.
>
> Now if your _only_ adding a drm_bridge (and not an encoder or anything
> like that), and you are adding the drm_connector correctly (like a
> hotplugged DP MST sink), then that would at least work from a uapi pov.
> Because drm_bridge isn't exposed as an uapi object.
>
> But yeah, as-is, don't :-)
>
> The solution here is a bunch of EPROBE_DEFER handling until all your
> bridges are loaded, with or without the assistance of component.c
> framework. Only then call drm_dev_register.
> -Daniel


I have impression we have similar conversation already.

As you stated drm_bridge and drm_panel are not exposed to userspace so 
there shouldn't be problem with them from uapi PoV.

On the other side drm_panel or drm_bridge are not used until pipeline 
enters connected state (at least they were not some time ago :) ). The 
issue is that bridge exposes drm_connector, but as you stated (again :) 
) connectors can be hotplugged, so in theory it should work. Practical 
tests shows that it also works, but bugs can be still there.

Bunch of EPROBE_DEFER was very slow (as a result userspace timeouted and 
decided there is no display), and does not handle unbinding/re-binding 
drivers.


Regards

Andrzej


>
>> Michael
>>
>>> -Daniel
>>>
>>>> This leaves us with:
>>>>
>>>> Option A) Standard drm_bridge behavior, which is currently implemented, but
>>>> incompatible with the currently expected behavior of exynos_drm.
>>>>
>>>> Option B) Creating the drm device without all bridges being attached, which
>>>> would work with the exynos_drm driver, but breaks for the standard drm_bridge
>>>> behavior, especially, if the encoder/connector is created at the beginning of
>>>> the pipeline and passed downwards when the bridges are attached.
>>>>
>>>> Option C) Extracting only low level register accesses into shared code, adding
>>>> a custom interface and implementing the drm_bridge handling in the platform
>>>> specific code.
>>>>
>>>> None of the options really convinces me.
>>>>
>>>> Michael
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://protect2.fireeye.com/v1/url?k=9b91fda0-c40ac4d5-9b9076ef-0cc47a31ce4e-a7f88871f6fd42d4&q=1&e=f2cfade9-8ecf-4697-88b3-69d93ed38361&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
