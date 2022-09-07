Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3E5C38145
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Sep 2022 10:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiIGKFi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiIGKFX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2022 06:05:23 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B26F54658
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Sep 2022 03:05:11 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220907100442euoutp0128543ec70ed9fa18d365ef1b55cebc8b~Si-GamiOp3008330083euoutp01q
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Sep 2022 10:04:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220907100442euoutp0128543ec70ed9fa18d365ef1b55cebc8b~Si-GamiOp3008330083euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1662545082;
        bh=y3QXvzcWdWmiL9mJzwaKS6s+Nz0PdlkDlk8R+FmdwWU=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=IjHtO3q/CIDQ+kXvP3JSEQpsbkN68qBln5JFxBL09PvGVY3Jy1rkElkfIVN7h3fb/
         5mkexLG2/aN3kf5PdKir6Ob3/HNAcp/ehJl2k/xNsaaeSSdB7o+TBfoGQ+dKv+VXm5
         2x1t0VdiynyYaJvx7yHyol90dcZGzQpE48bUFvh8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220907100436eucas1p28576ba1c8bb4cabfcdfb30d5ad3c5322~Si-BM_k-03225232252eucas1p2E;
        Wed,  7 Sep 2022 10:04:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 64.50.07817.4BC68136; Wed,  7
        Sep 2022 11:04:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220907100436eucas1p10d2eb509f90e35bdabebe6d925326bfb~Si-AmeFup3087030870eucas1p1z;
        Wed,  7 Sep 2022 10:04:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220907100435eusmtrp1098acc78400171ab907c1f718ff0a37b~Si-AjiieV1365013650eusmtrp1k;
        Wed,  7 Sep 2022 10:04:35 +0000 (GMT)
X-AuditID: cbfec7f4-893ff70000011e89-11-63186cb431eb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D4.F9.10862.3BC68136; Wed,  7
        Sep 2022 11:04:35 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220907100434eusmtip296589c920f5cd1940af162fc6295deaa~Si_-Z5xHQ0646406464eusmtip22;
        Wed,  7 Sep 2022 10:04:34 +0000 (GMT)
Message-ID: <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
Date:   Wed, 7 Sep 2022 12:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxze6b29fZjipWVwgkyzTjeUiGLdciKGzQXi3Uw2p+yBy8Kacgco
        bbGF0Zls4guwdFgfS6GgGB5SjA5WOx5O6qxQwE6KoICjyKquAxEY8prMkdHeuvHf9/sev8fJ
        4WLCQiKUm6rIoFUKaZqY4ON19qcday1pULY+Xy9Grn4HhgbLJ3E00m8i0O3pcQJ9W9nBRicG
        9TiaMusJNHTvFo5uHnzMQUePV3BQld5KIPODHjbSzlVjqNBpZaHHOQcActyvwdCNA0dwZCv4
        FD0xuhfEk8MEutX2BEOzf9/E3gqmLk4MsqnxviMc6oyxDadOtTWzqQ7dAEE1Ggc4VHFeEZsq
        vzLMoprvlLMpV88VghrMb2VRlyr2Uz+MNbCoAst5QE2al29fuou/OYlOS/2SVq2L+ZyfUq+v
        Zae7l2mGzb+zskF3sBbwuJDcCOtKTrO0gM8VkiYAb+RaCaaYArC32e1XJgGsrPkNfx453V0P
        GKEKwFnnVX8xAeAvBhfH6xKQMdBSWc32YpxcCYt7L7EYPhC2Fz30dXqRlEGj3Q68WES+Awfa
        53w8RobAXx+W+vxBZAScKRrx7YSRswTM/svga0qQUVA7qiW8mEd+ACs7L7KZ8ApYP1qCeQOQ
        /I4Pn9ma/HvHwjpTmR+L4KNWC4fBYdBxUrfAcxewEv5TKGFoDewZuYAxOBq6OuYIrwUjV8Oa
        y+sYegvUzVz2JwNg32ggs0EAPFFnwBhaAPNyhIz7VWhs/f6/mdc6uzA9EBsXPYpx0fHGRbcY
        /597FuDnQQidqZYn0+oNCjorUi2VqzMVyZEypdwMFj6vY751qgFUPZqItAEWF9gA5GLiIEFS
        Q5BMKEiSfrWPVikTVZlptNoGlnFxcYhAllorFZLJ0gx6D02n06rnKovLC81m/ZT+wkhT+rax
        L3J2rdk9VkD1uk9NR9E734gren/rkgvj010Zu/dtMZgkh4R7ZkrtH/H/CI1f/6ETVO8s677q
        +QSueno4OzFupUmiXpEQG3248MezCo9r+cfbPDzMznt96s/VWdbGBIx0Z4WWZe0Ychja7Q9e
        iZkP0LdtzCW7kb2nqn8owhR5V3COvK657jzuyf3mrii6YpNIE6grCTZda1h6rCLe4LG8dkZj
        9JRKWs5t3R7WlBe+v7il1mFVbvrspXudm1e53z0qkn+tapHPH0rcGzFsCB99Uxqb35jSp+sa
        2uu8vwRTmnZMxiW0rL0zYfj5vYO3pc82lMa+HP92WLgkuFiMq1OkUWswlVr6L9pccewrBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsVy+t/xe7qbcySSDR4/NLG4c/s0s8X9xZ9Z
        LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
        0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFob5oi0+zHgIlJ79ks7h44hOzxfffZ5kdxDzW
        frzP6vH+Riu7x7xZJ1g8ppw4wupxrucum8fOWXfZPWZ3zGT1WLznJZPHkauLWT3uXNvD5nG/
        +ziTx+Yl9R4b3+1g8ujbsorR4/MmuQD+KD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj
        81grI1MlfTublNSczLLUIn27BL2M7RM2sBY8lK54uekpUwPjZbEuRk4OCQETibmXtzN2MXJx
        CAksZZT4cuscK0RCRuLktAYoW1jiz7UuNoii94wSe+8sYARJ8ArYSWxZuhKsiEVARWL29c1M
        EHFBiZMzn7CA2KICyRJLGu6D1QgLeErcPfkLLM4sIC5x68l8sHoRAW2JbzNfgy1gFvjNJnHq
        aS9YQkjgH5NES5sfiM0mYCjR9RbkCk4OToFAiaUX1rJCDDKT6NraxQhhy0tsfzuHeQKj0Cwk
        d8xCsm8WkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECEw224793LKDceWrj3qH
        GJk4GA8xSnAwK4nwpuwQSRbiTUmsrEotyo8vKs1JLT7EaAoMjInMUqLJ+cB0l1cSb2hmYGpo
        YmZpYGppZqwkzutZ0JEoJJCeWJKanZpakFoE08fEwSnVwLSH+T/H+tOh58J6pXIm/3yTt2yN
        i/PJWZ0GkizZM0/MvjitNqu5/t2Dhz9yWiYt2fhS0nxx1LsfbCeusG0MirPqO9ggve+rRrHk
        xFN7fEq4Ijubq/dcMFHd8y12rm7q377kjxsnHHLfMGVri0upSvK6WQe4Xuh/5S67YTRJ11Hj
        Nt+Mo3sZipknPjB5sO6jdvrOGTOMV6xJ+XN70yaF222C/Gr8SqnvhItm6iWE8Uef33X/L6Oj
        UGXf9qgYIwmll/eO5otLLp22V7nhj+ihkkdbk1QNltY5bK9krbB3v6S89uWq2e8/6kb+9/rS
        or+C9a3KPGdH/iMP56wU91/ld/thwf+drnMEpjjVPbx3P+qlEktxRqKhFnNRcSIA9EmC3b8D
        AAA=
X-CMS-MailID: 20220907100436eucas1p10d2eb509f90e35bdabebe6d925326bfb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
        <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
        <20220829184031.1863663-3-jagan@amarulasolutions.com>
        <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
        <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
        <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan,

On 06.09.2022 21:07, Jagan Teki wrote:
> On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 02.09.2022 12:47, Marek Szyprowski wrote:
>>> On 29.08.2022 20:40, Jagan Teki wrote:
>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
>>>> various
>>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>>
>>>> In order to access this DSI controller between various platform SoCs,
>>>> the ideal way to incorporate this in the drm stack is via the drm bridge
>>>> driver.
>>>>
>>>> This patch is trying to differentiate platform-specific and bridge
>>>> driver
>>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
>>>> glue code and samsung-dsim.c as a common bridge driver code.
>>>>
>>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>>>>     detach code along with conventional component_ops.
>>>>
>>>> - Samsung DSIM is a bridge driver which is common across all
>>>> platforms and
>>>>     the respective platform-specific glue will initialize at the end
>>>> of the
>>>>     probe. The platform-specific operations and other glue calls will
>>>> invoke
>>>>     on associate code areas.
>>>>
>>>> v4:
>>>> * include Inki Dae in MAINTAINERS
>>>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
>>> This breaks Exynos DRM completely as the Exynos DRM driver is not able
>>> to wait until the DSI driver is probed and registered as component.
>>>
>>> I will show how to rework this the way it is done in
>>> drivers/gpu/drm/exynos/exynos_dp.c and
>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
>> I've finally had some time to implement such approach, see
>> https://protect2.fireeye.com/v1/url?k=c5d024d9-a4ab8e4e-c5d1af96-74fe4860001d-625a8324a9797375&q=1&e=489b94d4-84fb-408e-b679-a8d27acf2930&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv6.0-dsi-v4-reworked
>>
>> If you want me to send the patches against your v4 patchset, let me
>> know, but imho my changes are much more readable after squashing to the
>> original patches.
>>
>> Now the driver is fully multi-arch safe and ready for further
>> extensions. I've removed the weak functions, reworked the way the
>> plat_data is used (dropped the patch related to it) and restored
>> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
>> free to resend the above as v5 after testing on your hardware. At least
>> it properly works now on all Exynos boards I have, both compiled into
>> the kernel or as modules.
> Thanks. I've seen the repo added on top of Dave patches - does it mean
> these depends on Dave changes as well?

Yes and no. My rework doesn't change anything with this dependency. It 
comes from my patch "drm: exynos: dsi: Restore proper bridge chain 
order" already included in your series (patch #1). Without it exynos-dsi 
driver hacks the list of bridges to ensure the order of pre_enable calls 
needed for proper operation. This works somehow with DSI panels on my 
test systems, but it has been reported that it doesn't work with a bit 
more complex display pipelines. Only that patch depends on the Dave's 
patches. If you remove it, you would need to adjust the code in the 
exynos_drm_dsi.c and samsung-dsim.c respectively. imho it would be 
better to keep it and merge Dave's patches together with dsi changes, as 
they are the first real client of it.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

