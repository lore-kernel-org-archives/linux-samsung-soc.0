Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D166CCA47B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jun 2022 13:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380101AbiFMN5a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jun 2022 09:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380835AbiFMNzL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 09:55:11 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD7F819AD
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 04:36:06 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220613113603euoutp01a7f3907cd3c2aabe1a2d38f88e4090d5~4KwTrcwfv2727127271euoutp01a
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2022 11:36:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220613113603euoutp01a7f3907cd3c2aabe1a2d38f88e4090d5~4KwTrcwfv2727127271euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1655120163;
        bh=jPDfSy6Wp4cK2AK2eUVCDIZOSm/la3LVb7ZFsgAjuLw=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=pNAn+C5SNj/48Md7ezLC2l10K8k4H5W5+Nry43+AbL7sO2Gg5hxm+6oBXbVvXGYDF
         jADrC8LIoyeoHXrsmOpDVvBNeuqO0ETj4EliPq9mypA9D2Y5tRtY9oDlV88gISt8/L
         Mrfx6XRVKbxiti31o5ls3vL4/IyaPx4KNk6bacSg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220613113602eucas1p18259345b11ecc941faeaafd680f0f68a~4KwS1JP_c2136921369eucas1p1k;
        Mon, 13 Jun 2022 11:36:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 33.1E.10067.22127A26; Mon, 13
        Jun 2022 12:36:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220613113601eucas1p236d31c3447c250bd3fbd64c65edc4865~4KwSTXiLE0719207192eucas1p2C;
        Mon, 13 Jun 2022 11:36:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220613113601eusmtrp29d8e178e4d7a9bbcc8f82c1799b31b93~4KwSSRjjr2070820708eusmtrp22;
        Mon, 13 Jun 2022 11:36:01 +0000 (GMT)
X-AuditID: cbfec7f4-dc1ff70000002753-0f-62a72122321b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 55.44.09095.12127A26; Mon, 13
        Jun 2022 12:36:01 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220613113600eusmtip1250f555bb8e037f2f1a9c630a33e7a1c~4KwRL5yT90291102911eusmtip1R;
        Mon, 13 Jun 2022 11:36:00 +0000 (GMT)
Message-ID: <8e3ea285-7837-1b22-9a88-738edd626d12@samsung.com>
Date:   Mon, 13 Jun 2022 13:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
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
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZAUBVjkDuB2MjMYzZiEc9K7h6tQWn-RozHt7AYNApsJow@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1DTdRjH+3x/sxh+GXB8jgBrXVaakIR3n8visKz7GkdplJad1QbfA2T8
        uE0E7Q9BhJur1gLuhLkLTn5NEkniFhARAcdIbkw4BMTBrBmyIePXjENTYny1+O/1vJ/3+57n
        +dyHwSVaKoRJzTjKKzNkCiklIky9K9bt0mfq5C9X5vki241+HNmrlgg0c8NIoeG7cxT6umaA
        RMV2HYE8TToKTU8OEshy6g6NznxbTaM6XQeFmhwjJNLcu4CjMmsHhvr/bMTRlfxCAnVpP0GL
        +j/W9BInhQb7FnG0fN+CxwZxDQt2kpsbK6S50r4ekhv4aoLiWvUTNHdOXU5yVe1OjOu5VkVy
        tpF2irN/aca4H6tPcpfdLRinba4H3FJT+D6/Q6LXknhF6jFeGRnzuSjF4LpNZ10MytVZlrE8
        8I2/BvgwkI2GmulZWgNEjIQ1AtgxaQdC4QFwvm3lUbEE4LC5CHscGZ2cJ4RGHYCNLgcpFAsA
        qhsKca9LzMbAKesE6WWCfQ4Wjd7EBN0f/l5+i/ByECuHFabCdU8Auxe6eztpL+NsMBy/VbHu
        D2S3wb/LZyjvAJwdo+CUrWI9QLE7oGZWQ3nZh90Pl51uXAhvhj/NGnBvALKnRLD78l1C2HsP
        XLWVPeIA6DI30wKHwtVW7zRmjTPhg7JXBDkXjsxcxAXeBW0D9yivBWdfhI1tkYK8G1r/MhFC
        0g+OzfoLG/jBYtNZXJDFUF0kEdxboN586b+Zv10dwnVAqt/wKPoNx+s33KL/f24lIOpBMJ+t
        Sk/mVVEZfE6ESpauys5IjkjMTG8Ca1+2/6HZ0wLqXAsRXQBjQBeADC4NFJcM1sol4iTZ8RO8
        MvMzZbaCV3WBpxhCGixOTP1BJmGTZUf5NJ7P4pWPuxjjE5KHHdamqU3b3Od/tsfB3rPRzfx1
        W0KBo31g8v3tyCI7XX7+gPuJO6D2yei0dsZZddJoDFAwX8iKD+rCQWcMuTdHVBIX5nthS362
        7/MRn37vOjz1QmXN1r5cs/XVTWfmwevWAx9uatSk5CTFVX9wxeef/KuRBSXz7zoMltvT8S2J
        NfujryVauhd5kRorVaJY8rj66ZCoNru8aMngWs5sndv56+bvot4ZtVn6Gm56jh2hfXaG7n4z
        fTxvSBG2wr7t+0uoJhgv2XP99InV6gdvlH7c2R3/0cO64dhd+7S0MyE2MMGY9VaPJ+xccm39
        ENlseDYrXh4unTn4kuNQ/HvwyPil+9kFUkKVItuxFVeqZP8CSGF3FyEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xu7qKisuTDNa9ULC4c/s0s8X9xZ9Z
        LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
        0fVrJbPFjPP7mCxOP1rPbHGqsZXF4lBftMWnWQ+B4pNfsllcPPGJ2eL777PMDqIeaz/eZ/V4
        f6OV3WPKiSOsHud67rJ57Jx1l91jdsdMVo/Fe14yeRy5upjV4861PWwe97uPM3lsXlLvsfHd
        DiaPvi2rGD0+b5IL4IvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJ
        zcksSy3St0vQy5jz6jl7wRrRiglnvzM1MPYLdjFyckgImEhcv/eBpYuRi0NIYCmjxMMz79kh
        EjISJ6c1sELYwhJ/rnWxQRS9BypaNp0FJMErYCfx7PxdsCIWAVWJtusPmCDighInZz4BqxEV
        SJKYt3c1I4gtLOAp8e7YAbAFzALiEreezAerFxHQlvg28zXYAmaBO2wS066eY4fYtp9Z4sLv
        JrAqNgFDia63IGdwcnAKBEp8f/mOGWKSmUTX1i5GCFteYvvbOcwTGIVmITlkFpKFs5C0zELS
        soCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgatl27OfmHYzzXn3UO8TIxMF4iFGCg1lJ
        hHfyxWVJQrwpiZVVqUX58UWlOanFhxhNgaExkVlKNDkfmNzySuINzQxMDU3MLA1MLc2MlcR5
        PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqYYu0KpDeUNxwu3LX+tFBffrPqHq913Z1Wx54Umb1Q
        DrRiY3/xwvwe74sJk9peRP3Y92b2+oufw95lnU9SVi09LhHy7KLr4X+v3Zo+Llr26MwhW4+I
        jyxfCyMceA3SuuQc0s6+jb36/kihskSkUbfqqrAXe7stJFpCHcNbV0zkmeew1lM84uBUVgOO
        NzN1rh3arb9GO+ve5XhLMYGeYsGsmPBjqm5z5mZZ3uaz/hL03O593bsNM96f25zawW7uEHfv
        pcPsOA2WBWuFBV2+TD8198Ku1m0L14kovf0rYHOuprpS58bxZtX1bvrSL9X2d5xa+cBk7Uz/
        FZtXh16ZuVhLRHzxi2nbr24SiAoMqedYrMRSnJFoqMVcVJwIALAJhYi2AwAA
X-CMS-MailID: 20220613113601eucas1p236d31c3447c250bd3fbd64c65edc4865
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
        <20220504114021.33265-9-jagan@amarulasolutions.com>
        <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
        <CGME20220613111735eucas1p1f80de0b3b377c12f183721371cf8d6fc@eucas1p1.samsung.com>
        <CAMty3ZBYkQ8GJL+9r+zXhjrFjb+XCLgBh8pY=f+FVM_DHm-SPQ@mail.gmail.com>
        <8a0727e2-134f-c34e-aa32-cf828255ce8c@samsung.com>
        <CAMty3ZAUBVjkDuB2MjMYzZiEc9K7h6tQWn-RozHt7AYNApsJow@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13.06.2022 13:34, Jagan Teki wrote:
> On Mon, Jun 13, 2022 at 5:02 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 13.06.2022 13:17, Jagan Teki wrote:
>>> On Wed, May 11, 2022 at 4:01 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>>>> On 04.05.2022 13:40, Jagan Teki wrote:
>>>>> Fixing up the mode flags is required in order to correlate the
>>>>> correct sync flags of the surrounding components in the chain
>>>>> to make sure the whole pipeline can work properly.
>>>>>
>>>>> So, handle the mode flags via bridge, atomic_check.
>>>>>
>>>>> v2:
>>>>> * none
>>>>>
>>>>> v1:
>>>>> * fix mode flags in atomic_check instead of mode_fixup
>>>>>
>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>> ---
>>>>>     drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
>>>>>     1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index b618e52d0ee3..bd78cef890e4 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>>         pm_runtime_put_sync(dsi->dev);
>>>>>     }
>>>>>
>>>>> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>>>>> +                                  struct drm_bridge_state *bridge_state,
>>>>> +                                  struct drm_crtc_state *crtc_state,
>>>>> +                                  struct drm_connector_state *conn_state)
>>>>> +{
>>>>> +     struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>>>>> +
>>>>> +     adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
>>>>> +     adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>>>> 1. Shouldn't this be in mode_fixup callback?
>>> Possible to do it on mode_fixup, yes. if we want to do the same stuff
>>> on atomic API then atomic_check is the proper helper.
>>>
>>>> 2. Where this requirement comes from? As Marek says it breaks Samsung
>>>> platforms and is against DSIM specification[1]:
>>> At least the bridge chain starting from LCDIF+DSIM requires active high sync.
>> Then please make this specific to the imx variant. The current version
>> breaks DSI operation on all Exynos based boards.
> But exynos trm also says the same?
>
> "45.2.2.1.2 RGB Interface
> Vsync, Hsync, and VDEN are active high signals"

Right, but You are forcing the negative sync signals:

adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

