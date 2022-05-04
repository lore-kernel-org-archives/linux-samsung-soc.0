Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDE0C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 09:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347677AbiEDJse (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 05:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347441AbiEDJsd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:48:33 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC14A27B3D
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 02:44:56 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220504094450euoutp019b59051292374281bd6270246486b7ed~r3by34cXL0963209632euoutp01Z
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 09:44:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220504094450euoutp019b59051292374281bd6270246486b7ed~r3by34cXL0963209632euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651657491;
        bh=CR2rUyPpEC3O+PF9CRMeTZPQlKzVWlxJkCpt9rQRisk=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=iKv+6XtiM4I3g+Qis9H5quc0+4gSpT8qhiGtBCxU0IMqvBzsPqR/tuDcYz2bvQ6XE
         PnR2Bi2iV6a15T8uA7ndbncMNrefOljobFoHge5BCQ5lY9QvkgOuRmAnFAeVN3a3P2
         fmqiZhMe85DE2nqZ0DlTRvpi9htkfVs2DyrT8D6I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220504094450eucas1p1832f6046f3953a34fb525e4cf239c285~r3bydVRLx1981019810eucas1p1K;
        Wed,  4 May 2022 09:44:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id A3.97.09887.21B42726; Wed,  4
        May 2022 10:44:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220504094449eucas1p250940cdbef6dd3b97f9a048574bc21e5~r3bx9WpnQ0673506735eucas1p2T;
        Wed,  4 May 2022 09:44:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220504094449eusmtrp2845022d04d9d02ca8781201409addb8c~r3bx8OLoC0422004220eusmtrp2J;
        Wed,  4 May 2022 09:44:49 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-55-62724b1222ae
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F7.B9.09522.11B42726; Wed,  4
        May 2022 10:44:49 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220504094448eusmtip2ef6dba53fd29a47cf97301cd2e18064d~r3bwnr5IO3079830798eusmtip2I;
        Wed,  4 May 2022 09:44:48 +0000 (GMT)
Message-ID: <5a71d819-820d-b06b-a988-e428190fe539@samsung.com>
Date:   Wed, 4 May 2022 11:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH 01/11] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZBN=SPZze6n8=0hHPRc0jw6U+UJ7Ejv+8Bg3bkvwdY46w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzn2ftjY9fw3djiSSlziVd4Aq66e8j0KjzvrXlnndx1/Tht4Aui
        bKMNEitLd46T4bhBncBIIX40NiJiKCCHlHMBunMTsqkxXF7TmAPHj2XEHRrjzeK/z/fz4/k8
        3+ceHiYykit5eapCRqNS5EtJPt418Ldng0iuyUpz/vAE8o26MORvnMVRaLSFRHVON4Gu/hkm
        kbF5EVX6TTiK2E0kGr85jKPLugkuKq1o4iKLqZ9E9t+9BDLMWzFU7ennoEtH9DhylL+HZsy3
        MKQ/5+Si6i+CJBoemsFekdBt036CDl/Xc2n38TGSPmse49K1x2oIurEvyKHttlKSdv7SSNA+
        bx9J+8sGOXRn0+d0x70eDl1+2gboWftTb8a9y395D5Of9xGjSd3yAX9vsNpOFHRIilvOfUMe
        BnVCA4jlQeoFGJy+jBkAnyeiWgA0/lRCsEMEwD+a5v9VZgH0T0XAo4i91IyzggXAkxMWLjtM
        A/hzu27JJaC2QIPJQEQxTq2FnpkgwfJCeLEmgEexhMqCJ/tvYlEcT22DDwx9S1mMSoC/Buo4
        USym1sP7NSEyWoBR3SRsr723JJDURmiYNJBRHEu9BRu6juBseDXsnvxq6d6Q0vHhHcP8oom3
        OGyFwc5n2BXi4d3B01wWJ8KHZ6NlUYsaLlQ/z9LF0Bv6FmPxJuhzs6dg1HOwvTeVpV+F4eZb
        BJuMg9cnhewF4mBlVxXG0gJ4rETEutdB8+B3/3WevzKCmYDUvOxNzMt2Ny9bxfx/bz3AbSCB
        KdIqcxmtTMUcSNEqlNoiVW5KtlppB4s/1vVgMNIDLHenUxyAwwMOAHmYVCzIaC7IEgn2KA5+
        zGjUuzVF+YzWAVbxcGmCIDvve4WIylUUMvsZpoDRPFI5vNiVhzk5n0J37jVrr3W/PH1rslVm
        ubNewuw8pXx/XeeXV46WD0zd98oqt9/4WmlbccZnLEuRcRaEqvGCztvFlsxnLxSGdN1PH4p5
        MbVWLS/XZsrVO0K36ap9rosZ6QPu+G2f+PSjreP1hoB+7q9NwUimo0tzMLnwuMKVHT6x5sxQ
        YGhuQScukYgujGQKx9pcPQ07gjFeIqfHqH/bA24ceq2m4bHfQGua943EsvTwZqscVsztuyb+
        rK10d2Q+0XnC82PSO7KODx9aYdnUyNUN7WJZRXHE9Di5emLnqieHnUn1m18aa+7edaDXOHzU
        lnE+qdL6ujMQw88pcl7alda6ZmRtlWqFFNfuVWxMxjRaxT8sfTYdIAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xe7qC3kVJBrv+m1rcuX2a2eL+4s8s
        Fq9vr2CzmH/kHKvFla/v2Sx6lwJZk+5PYLH4smkCm8WLexdZLM42vWG36Jy4hN1i+YR9bBab
        Hl9jtej6tZLZYsb5fUwWpxpbWSwO9UVbfJr1kNmide8RdosZk1+yWVw88YnZQdRj7cf7rB7v
        b7Sye5zrucvmsXPWXXaP2R0zWT0W73nJ5LFpVSebx5Gri1k97lzbw+Zxv/s4k8fmJfUeG9/t
        YPLo27KK0ePzJrkAvig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
        nMyy1CJ9uwS9jJczNrEWbBStWLF3GVsD43zBLkZODgkBE4lNnbNYuhi5OIQEljJK/H9+hhUi
        ISNxcloDlC0s8edaFxtE0XtGic+/57CBJHgF7CS6JnSBFbEIqEic//SSFSIuKHFy5hMWEFtU
        IEnixbbnjCC2sICbxL+uPWA2s4C4xK0n85lAbBEBbYlvM1+DLWAW2MkmsXzDA0aIbceZJNZO
        uQFWxSZgKNH1tgtsM6dAoMSibY0sEJPMJLq2dkFNlZfY/nYO8wRGoVlIDpmFZOEsJC2zkLQs
        YGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJEZhath37uXkH47xXH/UOMTJxMB5ilOBgVhLh
        dV5akCTEm5JYWZValB9fVJqTWnyI0RQYGhOZpUST84HJLa8k3tDMwNTQxMzSwNTSzFhJnNez
        oCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgUlym8Oe07KH2S0L7Kf/r6n859e50saVZ/0P3al9s17Y
        LX+uMS3Vp3i6C9N7DuH9v9eFPfhouONgf8kni7rH3251TEqYvlVQdHXc98BFLwvXCn7aWnrn
        05lFBWxtkV4zT2uF3JUUPi+cmr1FzULFKa1y0tb78gIt85wyvXQbf818d+bn5Q3OBfveyn3j
        EFdf/3RFb7kYz+bAtZYbVivW/y45vGeBypo9kiGv2DjaX1XXPxVxTnx855pdtva0med1m77O
        ux00z/6lWaoTG4fBveTQ6Y/O3nh2+4V0ytrDzF+CT1zet8Xb5lvn75bvEmxGr2XDpjp/yJtv
        9jihKUA4sfA2894dcW3lXH8Y7v6OurxXiaU4I9FQi7moOBEAig2Z5LYDAAA=
X-CMS-MailID: 20220504094449eucas1p250940cdbef6dd3b97f9a048574bc21e5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220408162224eucas1p2a445493e9354f6ee72b348cb1c4ebc16
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220408162224eucas1p2a445493e9354f6ee72b348cb1c4ebc16
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
        <CGME20220408162224eucas1p2a445493e9354f6ee72b348cb1c4ebc16@eucas1p2.samsung.com>
        <20220408162108.184583-2-jagan@amarulasolutions.com>
        <0146abe6-c588-820c-09f4-b12de2e734ac@samsung.com>
        <CAMty3ZBN=SPZze6n8=0hHPRc0jw6U+UJ7Ejv+8Bg3bkvwdY46w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan,

On 04.05.2022 11:16, Jagan Teki wrote:
> Hi Marek,
>
> On Tue, Apr 12, 2022 at 3:15 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Hi Jagan,
>>
>> On 08.04.2022 18:20, Jagan Teki wrote:
>>> Samsung MIPI DSIM controller is common DSI IP that can be used in various
>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>
>>> In order to access this DSI controller between various platform SoCs, the
>>> ideal way to incorporate this in the drm stack is via the drm bridge driver.
>>>
>>> This patch is trying to differentiate platform-specific and bridge driver
>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
>>> glue code and samsung-dsim.c as a common bridge driver code.
>>>
>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>>>     detach code along with conventional component_ops.
>>>
>>> - Samsung DSIM is a bridge driver which is common across all platforms and
>>>     the respective platform-specific glue will initialize at the end of the
>>>     probe. The platform-specific operations and other glue calls will invoke
>>>     on associate code areas.
>>>
>>> Updated MAINTAINERS file for this bridge with exynos drm maintainers along
>>> with Andrzej as he is the original author.
>>>
>>> Tomasz Figa has been not included in MAINTAINERS as he is not available via
>>> samsung.com.
>>>
>>> v1:
>>> * Don't maintain component_ops in bridge driver
>>> * Don't maintain platform glue code in bridge driver
>>> * Add platform-specific glue code and make a common bridge
>>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> Well, it took me a while to make this working on Exynos. I'm not really
>> happy of the design, although I didn't spent much time thinking how to
>> improve it and clarify some ambiguities. It doesn't even look that one
>> has compiled the Exynos code after this conversion.
> Well, I was successfully built the each commit on exynos and non-exynos
>
>> The following changes are needed to get it to the same working state as
>> before this patch (the next patches however break it even further):
>>
>> commit e358ee6239305744062713c5aa2e8d44f740b81a (HEAD)
>> Author: Marek Szyprowski <m.szyprowski@samsung.com>
>> Date:   Tue Apr 12 11:30:26 2022 +0200
>>
>>       drm: exynos: dsi: fixup driver after conversion
> What exactly it is fixing the existing conversion, could you point that out?

See the diff. Broken build (missing gpio_consumer.h in exynos-dsi), 
mixed structures put into drvdata (samsung_dsim vs. exynos_dsi) hidden 
by the casting to void * in the samsung_dsim_host_ops.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

