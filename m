Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A308DC43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 19:41:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5866D20770
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 19:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rhqPmpS8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgIOTlW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 15:41:22 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44014 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgIOTkt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 15:40:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200915194042euoutp02428792583c3e89177522c1529995cb8f~1DF6MR4qK2999829998euoutp02E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 19:40:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200915194042euoutp02428792583c3e89177522c1529995cb8f~1DF6MR4qK2999829998euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600198842;
        bh=DdcigaowX/y3rXVBHZnIpBkSJIoIjyIB3u5nKE6Ialg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=rhqPmpS8E0QdzRKVN7Sa3jTzWSwRQia1lHZ+eEh5FLRdHd2hv3wiE2y3YZRimNo/g
         ESJeq8XZjogBznBo/kNGd+olDmP34FXytfIH3SEnIUEbh89yvUxmV8A4r79QLNnZng
         8gcXyWHFzHQyt4T8OOEYHPl9BW8CEfsuNWsPoweQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200915194041eucas1p20f90b53ffa2c36525524209b97bc8418~1DF5PVdQM3162931629eucas1p2l;
        Tue, 15 Sep 2020 19:40:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C4.04.06456.9B8116F5; Tue, 15
        Sep 2020 20:40:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200915194041eucas1p16cb105d73d395b6729325af494491d0b~1DF4t6jRH0221002210eucas1p1w;
        Tue, 15 Sep 2020 19:40:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200915194041eusmtrp103ed0c791b1fa4a982b3e9426aeb2b4d~1DF4tKV4a1851918519eusmtrp1Q;
        Tue, 15 Sep 2020 19:40:41 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-94-5f6118b9559f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 51.8C.06017.9B8116F5; Tue, 15
        Sep 2020 20:40:41 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200915194040eusmtip23f4d5ceb2365f73c8653625832ba959e~1DF4FdkZ01755217552eusmtip2G;
        Tue, 15 Sep 2020 19:40:40 +0000 (GMT)
Subject: Re: [PATCH v2 10/16] drm/exynos: implement a drm bridge
From:   Andrzej Hajda <a.hajda@samsung.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sw0312.kim@samsung.com, krzk@kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        sylvester.nawrocki@gmail.com, Laurent.pinchart@ideasonboard.com
Message-ID: <2d7f0e5e-070c-971e-1e4f-47a60f00d934@samsung.com>
Date:   Tue, 15 Sep 2020 21:40:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <a5e5e6d5-95a2-1f5a-94a2-27ec3d12e781@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7djPc7o7JRLjDT4+0LTYOGM9q8WVr+/Z
        LF7cu8hisWrqThaL8+c3sFt0TlzCbjHj/D4mi7VH7rJbbFtxjtXiUF+0xYzJL9ks5n3eyeTA
        4/H+Riu7x85Zd9k9ZnfMZPXYtKqTzeN+93Emj/6/Bh59W1YxenzeJBfAEcVlk5Kak1mWWqRv
        l8CVMfVFJ2tBT0RF+8lZLA2Ms726GDk5JARMJLa+fsjSxcjFISSwglHi39tWNgjnC6PE6xff
        mSGcz4wSF59cYYJpWThvLyOILSSwnFHi8Q0WCPs9o8SuZg4QW1jAQeLMphNsIDabgKbE3803
        wWwRgViJBdO/MoIMZRaYySRx8E8bWIJXwE5i4tObYENZBFQl9s9rALNFBZIk9n85B1UjKHFy
        5hOwZZwC9hJTmu6D1TALyEs0b53NDGGLSzR9WckKskBC4CW7xMcnH4GKOIAcF4mPB2ogHhCW
        eHV8CzuELSNxenIPC4RdL3F/RQszRG8Ho8TWDTuZIRLWEnfO/WIDmcMM9M36XfoQYUeJm91H
        mCDG80nceCsIcQKfxKRt05khwrwSHW1CENWKEvfPboUaKC6x9MJXtgmMSrOQPDYLyTOzkDwz
        C2HvAkaWVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIHJ7PS/4592MH69lHSIUYCDUYmH
        d8HthHgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2KU5mBREuc1XvQyVkgg
        PbEkNTs1tSC1CCbLxMEp1cAoUPsyfOFF2a9BN/3n8zF6zb8w3zr7tVzN5IIUJbGmN977X11b
        37XFO/JIy71Xov49US/93OoWfnt6iyehTMXYI7XA7+2eE5zzv99238OQ86kxyDe3S+3X1+IO
        hW6rKz8mqSyOq/NLtlBeFL+i4Z7VYtunW6vE/jlNu9O9lT/15Zy4dUmtSwWVWIozEg21mIuK
        EwFXFV9ZYgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7o7JRLjDe5N47HYOGM9q8WVr+/Z
        LF7cu8hisWrqThaL8+c3sFt0TlzCbjHj/D4mi7VH7rJbbFtxjtXiUF+0xYzJL9ks5n3eyeTA
        4/H+Riu7x85Zd9k9ZnfMZPXYtKqTzeN+93Emj/6/Bh59W1YxenzeJBfAEaVnU5RfWpKqkJFf
        XGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXMfVFJ2tBT0RF+8lZLA2M
        s726GDk5JARMJBbO28vYxcjFISSwlFHiwKZORoiEuMTu+W+ZIWxhiT/Xutggit4ySny99oQV
        JCEs4CBxZtMJNhCbTUBT4u/mm2C2iECsxItlPewgNrPATCaJ9Su0IZonMUs8/7UGrIhXwE5i
        4tObYNtYBFQl9s9rALNFBZIkbqy7ywhRIyhxcuYTFhCbU8BeYkrTfUaIoWYS8zY/ZIaw5SWa
        t86GssUlmr6sZJ3AKDQLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusZFecWJucWleul5yfu4m
        RmAMbzv2c8sOxq53wYcYBTgYlXh4F9xOiBdiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+
        fFFpTmrxIUZToOcmMkuJJucD00teSbyhqaG5haWhubG5sZmFkjhvh8DBGCGB9MSS1OzU1ILU
        Ipg+Jg5OqQbGkjUyhxgfeSwX1y6a1dGdzF1iNJsvg9F6s987mStC1w2LpLqn7iswz7VRMy+a
        lRH0ZZuQz4U90VflD32/GWzgxLAi5w1zisjERTPW8wpvbTXbMCH39f3T56q3b3F0l/Toc3y1
        V6HkvJfMisJVR1VrDIOMP3560fGp63W79cvXR/o6XeeveH1CiaU4I9FQi7moOBEAdFBLS/cC
        AAA=
X-CMS-MailID: 20200915194041eucas1p16cb105d73d395b6729325af494491d0b
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
        <a5e5e6d5-95a2-1f5a-94a2-27ec3d12e781@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi again,

W dniu 14.09.2020 o 23:19, Andrzej Hajda pisze:
> Hi Marek, Michael,
>
> On 14.09.2020 22:01, Michael Tretter wrote:
>> Hi,
>>
>> On Mon, 14 Sep 2020 14:31:19 +0200, Marek Szyprowski wrote:
>>> On 14.09.2020 10:29, Marek Szyprowski wrote:
>>>> On 11.09.2020 15:54, Michael Tretter wrote:
>>>>> Make the exynos_dsi driver a full drm bridge that can be found and 
>>>>> used
>>>>> from other drivers.
>>>>>
>>>>> Other drivers can only attach to the bridge, if a mipi dsi device
>>>>> already attached to the bridge. This allows to defer the probe of the
>>>>> display pipe until the downstream bridges are available, too.
>>>>>
>>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>>> This one (and the whole series applied) still fails on Exynos boards:
>>>>
>>>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping 
>>>> operations
>>>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
>>>> OF: graph: no port node found in /soc/dsi@11c80000
>>>> 8<--- cut here ---
>>>> Unable to handle kernel NULL pointer dereference at virtual address 
>>>> 00000084
>>>> pgd = (ptrval)
>>>> [00000084] *pgd=00000000
>>>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>>>> Modules linked in:
>>>> CPU: 1 PID: 1 Comm: swapper/0 Not tainted
>>>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec #1608
>>>> Hardware name: Samsung Exynos (Flattened Device Tree)
>>>> PC is at drm_bridge_attach+0x18/0x164
>>>> LR is at exynos_dsi_bind+0x88/0xa8
>>>> pc : [<c0628c08>]    lr : [<c064d560>]    psr: 20000013
>>>> sp : ef0dfca8  ip : 00000002  fp : c13190e0
>>>> r10: 00000000  r9 : ee46d580  r8 : c13190e0
>>>> r7 : ee438800  r6 : 00000018  r5 : ef253810  r4 : ef39e840
>>>> r3 : 00000000  r2 : 00000018  r1 : ef39e888  r0 : ef39e840
>>>> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>>>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
>>>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>>>> Stack: (0xef0dfca8 to 0xef0e0000)
>>>> ...
>>>> [<c0628c08>] (drm_bridge_attach) from [<c064d560>]
>>>> (exynos_dsi_bind+0x88/0xa8)
>>>> [<c064d560>] (exynos_dsi_bind) from [<c066a800>]
>>>> (component_bind_all+0xfc/0x290)
>>>> [<c066a800>] (component_bind_all) from [<c0649dc0>]
>>>> (exynos_drm_bind+0xe4/0x19c)
>>>> [<c0649dc0>] (exynos_drm_bind) from [<c066ad74>]
>>>> (try_to_bring_up_master+0x1e4/0x2c4)
>>>> [<c066ad74>] (try_to_bring_up_master) from [<c066b2b4>]
>>>> (component_master_add_with_match+0xd4/0x108)
>>>> [<c066b2b4>] (component_master_add_with_match) from [<c0649ae8>]
>>>> (exynos_drm_platform_probe+0xe4/0x110)
>>>> [<c0649ae8>] (exynos_drm_platform_probe) from [<c0674e6c>]
>>>> (platform_drv_probe+0x6c/0xa4)
>>>> [<c0674e6c>] (platform_drv_probe) from [<c067242c>]
>>>> (really_probe+0x200/0x4fc)
>>>> [<c067242c>] (really_probe) from [<c06728f0>]
>>>> (driver_probe_device+0x78/0x1fc)
>>>> [<c06728f0>] (driver_probe_device) from [<c0672cd8>]
>>>> (device_driver_attach+0x58/0x60)
>>>> [<c0672cd8>] (device_driver_attach) from [<c0672dbc>]
>>>> (__driver_attach+0xdc/0x174)
>>>> [<c0672dbc>] (__driver_attach) from [<c06701b4>]
>>>> (bus_for_each_dev+0x68/0xb4)
>>>> [<c06701b4>] (bus_for_each_dev) from [<c06714e8>]
>>>> (bus_add_driver+0x158/0x214)
>>>> [<c06714e8>] (bus_add_driver) from [<c0673c1c>] 
>>>> (driver_register+0x78/0x110)
>>>> [<c0673c1c>] (driver_register) from [<c0649ca8>]
>>>> (exynos_drm_init+0xe4/0x118)
>>>> [<c0649ca8>] (exynos_drm_init) from [<c0102484>]
>>>> (do_one_initcall+0x8c/0x42c)
>>>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
>>>> (kernel_init_freeable+0x190/0x1dc)
>>>> [<c11011c0>] (kernel_init_freeable) from [<c0af7880>]
>>>> (kernel_init+0x8/0x118)
>>>> [<c0af7880>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
>>>> Exception stack(0xef0dffb0 to 0xef0dfff8)
>>>> ...
>>>> ---[ end trace ee27f313f9ed9da1 ]---
>>>>
>>>> # arm-linux-gnueabi-addr2line -e vmlinux c0628c08
>>>> drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)
>>>>
>>>> I will try to debug it a bit more today.
>>> The above crash has been caused by lack of in_bridge initialization to
>>> NULL in exynos_dsi_bind() in this patch. However, fixing it reveals
>>> another issue:
>>>
>>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
>>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
>>> OF: graph: no port node found in /soc/dsi@11c80000
>>> 8<--- cut here ---
>>> Unable to handle kernel NULL pointer dereference at virtual address 
>>> 00000280
>>> pgd = (ptrval)
>>> [00000280] *pgd=00000000
>>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>>> Modules linked in:
>>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec-dirty #1613
>>> Hardware name: Samsung Exynos (Flattened Device Tree)
>>> PC is at __mutex_lock+0x54/0xb18
>>> LR is at lock_is_held_type+0x80/0x138
>>> pc : [<c0afc920>]    lr : [<c0af63e8>]    psr: 60000013
>>> sp : ef0dfd30  ip : 33937b74  fp : c13193c8
>>> r10: c1208eec  r9 : 00000000  r8 : ee45f808
>>> r7 : c19561a4  r6 : 00000000  r5 : 00000000  r4 : 0000024c
>>> r3 : 00000000  r2 : 00204140  r1 : c124f13c  r0 : 00000000
>>> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
>>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>>> Stack: (0xef0dfd30 to 0xef0e0000)
>>> ...
>>> [<c0afc920>] (__mutex_lock) from [<c0afd400>] 
>>> (mutex_lock_nested+0x1c/0x24)
>>> [<c0afd400>] (mutex_lock_nested) from [<c064d4b8>]
>>> (__exynos_dsi_host_attach+0x20/0x6c)
>>> [<c064d4b8>] (__exynos_dsi_host_attach) from [<c064d914>]
>>> (exynos_dsi_host_attach+0x70/0x194)
>>> [<c064d914>] (exynos_dsi_host_attach) from [<c0656b64>]
>>> (s6e8aa0_probe+0x1b0/0x218)
>>> [<c0656b64>] (s6e8aa0_probe) from [<c0672530>] 
>>> (really_probe+0x200/0x4fc)
>>> [<c0672530>] (really_probe) from [<c06729f4>]
>>> (driver_probe_device+0x78/0x1fc)
>>> [<c06729f4>] (driver_probe_device) from [<c0672ddc>]
>>> (device_driver_attach+0x58/0x60)
>>> [<c0672ddc>] (device_driver_attach) from [<c0672ec0>]
>>> (__driver_attach+0xdc/0x174)
>>> [<c0672ec0>] (__driver_attach) from [<c06702b8>]
>>> (bus_for_each_dev+0x68/0xb4)
>>> [<c06702b8>] (bus_for_each_dev) from [<c06715ec>]
>>> (bus_add_driver+0x158/0x214)
>>> [<c06715ec>] (bus_add_driver) from [<c0673d20>] 
>>> (driver_register+0x78/0x110)
>>> [<c0673d20>] (driver_register) from [<c0102484>]
>>> (do_one_initcall+0x8c/0x42c)
>>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
>>> (kernel_init_freeable+0x190/0x1dc)
>>> [<c11011c0>] (kernel_init_freeable) from [<c0af7988>]
>>> (kernel_init+0x8/0x118)
>>> [<c0af7988>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
>>> Exception stack(0xef0dffb0 to 0xef0dfff8)
>>> ...
>>> ---[ end trace c06e996ec2e8234d ]---
>>>
>>> This means that dsi->encoder.dev is not initialized in
>>> __exynos_dsi_host_attach().
>>>
>>> This happens, because drm_bridge_attach() in exynos_dsi_bind() returned
>>> earlier -517 (deferred probe), what causes cleanup of encoder and
>>> release of all drm resources.
>>>
>>> Then however, the panel tries to register itself and
>>> exynos_dsi_host_attach() tries to access the released encoder (which is
>>> zeroed in drm_encoder_release) and rest of resources, what causes 
>>> failure.
>>>
>>> It looks that something is missing. Maybe mipi host has to be 
>>> registered
>>> later, when bridge is ready? I have no idea how it is handled before
>>> this patch. Andrzej, could you comment it a bit?
>> I intentionally changed the order, because if another bridge follows 
>> in the
>> pipeline, the probe of the drm driver has to be deferred until some 
>> bridge
>> provides a connector. The next bridge registers itself via the 
>> host_attach
>> function and the deferral is ensured via the bind for the bind/unbind 
>> API or
>> the bridge_attach function otherwise.
>>
>> On the other hand, the bridge does not have an encoder until the mipi 
>> device
>> has been attached.
>>
>> As a solution, the exynos dsi driver must initialize the encoder in
>> exynos_dsi_probe instead of in exynos_dsi_bind and access the encoder 
>> via
>> exynos_dsi instead of the bridge.
>>
>> Can you try to move everything except samsung_dsim_bind from 
>> exynos_dsi_bind
>> to exynos_dsi_probe (respectively for unbind) and report if it fixes the
>> crash.
>
>
> The original behaviour is that encoder (exynos_dsi) is registered 
> regardless of sink presence (initially panel, later also bridge) - it 
> avoids multiple issues with deferred probe, device driver bind/unbind 
> and module load/unload. Appearance or disappearance of sink is 
> reported to host nicely via DSI attach/detach callbacks - and it is 
> reflected in drm world as change state of the connector.
>
> Registering DSI host in bind and unregistering in unbind assures that 
> if mipi_dsi device is attached/detached the drm device is always 
> present - it makes device/driver binding race free and allows to avoid 
> additional locking.
>
> Moving DSI host registration to probe changes everything, for sure it 
> breaks the nice feature of DSI attach/detach callbacks and apparently 
> can cause different issues depending on device bind order.
>
> I will try to look at the patches tomorrow and maybe I can find more 
> constructive comments :)


As I said yesterday, exynos_dsi driver uses dsi host attach/detach 
callbacks to control appearance/disappearance of downstream device. It 
allows to:

1. Safely bind/unbind different device drivers at any time and at any 
order, without killing exynos_drm and/or crashing system.

2. Avoid issues with late drm init - on some platforms exynos_drm device 
appeared too late, due to deferred probe, and resulted in black screen 
in userspace.


Now if we want to convert exynos_dsi to drm_bridge I see following options:

A. Forgot about callbacks and make the exynos_drm to defer probing until 
exynos_dsi bridge is available, probably it will cause later exynos_drm 
appearance, thus probably black screen on some targets. So for sure it 
will be suboptimal. Making it bridge unbind safe would be another 
problem, but most developers do not care about it so why should we? :)

B. Try to mimic current behaviour - exynos_dsi register bridge ASAP, 
even if downstream devices are not yet attached, on attach/detach notify 
drm about it via connector status change, for this dsi_host registration 
should be performed from drm_bridge attach, I guess.


Option A is more standard, but is unsafe and causes other issues.

Option B keeps current behaviour.


Regards

Andrzej


>
>
> Regards
>
> Andrzej
>
>
>>
>> Michael
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://protect2.fireeye.com/v1/url?k=4f0be936-129547ac-4f0a6279-0cc47a336fae-e9aecfc5418740e8&q=1&e=1d4b0871-5b85-47f3-9506-79c768643aee&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel 
>>
