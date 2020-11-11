Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94F1C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Nov 2020 03:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DA4A2168B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Nov 2020 03:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OQXRfILW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgKKDD7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 22:03:59 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:19582 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgKKDD7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 22:03:59 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201111030355epoutp04bb8225e76724d1f0ef699ff0087f03aa~GVQ3h9f9y0420304203epoutp048
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Nov 2020 03:03:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201111030355epoutp04bb8225e76724d1f0ef699ff0087f03aa~GVQ3h9f9y0420304203epoutp048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605063835;
        bh=cOvnrUzBvQi8/GMeaEsVC6rESuodfLLTM94v7dfdoIM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=OQXRfILWCnrnRBTrvhG9E3QXSZlLYOQ7cWn3pOH3S6a34jLbCq0Al5AKseLfyEGh7
         tIOJLxEczQ3V3YTHH3uO6kBmDV/Jxj8fQE2/6+M7ZwnYW0bS4zBSPlN6aDrI3JPoT4
         lDGQW2SIVNsLVlqJ8yhBr3FAM2idsoY5DQ48U3f4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201111030354epcas1p21868a349cc43bc13639ae573d9a98bf7~GVQ3F4rQ70619906199epcas1p2T;
        Wed, 11 Nov 2020 03:03:54 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.154]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4CW8h84P7mzMqYlv; Wed, 11 Nov
        2020 03:03:52 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        9C.9C.09582.8945BAF5; Wed, 11 Nov 2020 12:03:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20201111030351epcas1p4501ca2797f349939bfcd3a179c06f99d~GVQ0ZnVXI2669226692epcas1p4i;
        Wed, 11 Nov 2020 03:03:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201111030351epsmtrp18c7707d2d92ee18676c9c17ee48c43da~GVQ0Y16-42642926429epsmtrp1Y;
        Wed, 11 Nov 2020 03:03:51 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-e1-5fab54981fb2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C3.F1.13470.7945BAF5; Wed, 11 Nov 2020 12:03:51 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201111030351epsmtip1101c593abdd4fa83bc60576f18b17c28~GVQ0H-OwW2416424164epsmtip1s;
        Wed, 11 Nov 2020 03:03:51 +0000 (GMT)
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
From:   Inki Dae <inki.dae@samsung.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com
Message-ID: <c56586b0-f616-6a57-3628-5840a99f6c1a@samsung.com>
Date:   Wed, 11 Nov 2020 12:11:15 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fd177674-b22e-6743-9886-5590ccade2f5@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAJsWRmVeSWpSXmKPExsWy7bCmge6MkNXxBq2LpS1urTvHarFxxnpW
        iytf37NZvLh3kcVi1dSdLBbnz29gt+icuITdYsb5fUwW21YA1R3qi7aYMfklm8W8zzuZHHg8
        3t9oZffYOesuu8fsjpmsHptWdbJ53O8+zuTR/9fAo2/LKkaPz5vkAjiism0yUhNTUosUUvOS
        81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgI5VUihLzCkFCgUkFhcr6dvZ
        FOWXlqQqZOQXl9gqpRak5BRYFugVJ+YWl+al6yXn51oZGhgYmQIVJmRntK5ZzFbwX6ni/syL
        zA2MH6W7GDk4JARMJF489Ohi5OIQEtjBKDH1xA4WCOcTo8SExlWMEM43Rok/Jy+wdTFygnXc
        etvIDJHYyygxefYaJgjnPaPErnU/2EGqhAXcJJ6cOc4EYrMJqEpMXHEfrFtEQE9i/8pZbCAN
        zAIbmCS27r3HApLgFbCTePzpM1gRC1DDnb7DYM2iAhESx7sns0PUCEqcnPkErJ5TwF5izdzZ
        zCA2s4C4xK0n85kgbHmJ5q2zwc6TEDjBIfH2Qy8zxN0uEq9+3GaFsIUlXh3fwg5hS0m87G9j
        h2hoZpSYOOM0E4TTwShx9/F1FogqY4n9SyczgcKMWUBTYv0ufYiwosTO33MZITbzSbz72sMK
        CVZeiY42IYgSJYljF28wQtgSEheWTISGo4fEoeWv2CYwKs5C8tssJP/MQvLPLITFCxhZVjGK
        pRYU56anFhsWGCPH9yZGcFLWMt/BOO3tB71DjEwcjIcYJTiYlUR4mdpWxQvxpiRWVqUW5ccX
        leakFh9iNAWG9kRmKdHkfGBeyCuJNzQ1MjY2tjAxNDM1NFQS5/2j3REvJJCeWJKanZpakFoE
        08fEwSnVwLTOeavGi/JPQgwZuSwJ+16eWryme4VQnWJrtet3Eb/8d0YCM34//2CWUGASJubz
        5pyCxNWCkw5XTpt4+327e1XMetYno5BeWeF8rRlrsgzF338V/+tuezROy6rGeofBTks1bh7Z
        PFcj7tzli7q67p3hrVY1eDVB5nqYsMOXc6c8jWv2vE0JCL11mLPf8ffhL3FHw5f5n7EuPMG6
        Y77w2Sf/5y4PvdcjznjR4GaoaFhJROyJ2pDPJ15crJvzr+nLiZCDQnyczyaolB3d/P6NxeLD
        hXF3dawNZvznPL2JZZb8i1Dr8v/iGzmnv8xUyXZ/mXqlYPKkouXm/qt+V9eVm35Umr5l4u+e
        hXdW7jzIWKLEUpyRaKjFXFScCABiSYJSUwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSnO70kNXxBk/7jCxurTvHarFxxnpW
        iytf37NZvLh3kcVi1dSdLBbnz29gt+icuITdYsb5fUwW21YA1R3qi7aYMfklm8W8zzuZHHg8
        3t9oZffYOesuu8fsjpmsHptWdbJ53O8+zuTR/9fAo2/LKkaPz5vkAjiiuGxSUnMyy1KL9O0S
        uDJa1yxmK/ivVHF/5kXmBsaP0l2MnBwSAiYSt942MncxcnEICexmlNh4aDtbFyMHUEJCYstW
        DghTWOLw4WKIkreMEhfOvGcG6RUWcJN4cuY4E4jNJqAqMXHFfTYQW0RAT2L/yllsIA3MAhuY
        JCafvsQI0b2cSeLYpsOMIFW8AnYSjz99ButgAeq+03cYbJKoQIREy/0/7BA1ghInZz5hAbE5
        Bewl1sydDbaZWUBd4s+8S1C2uMStJ/OZIGx5ieats5knMArNQtI+C0nLLCQts5C0LGBkWcUo
        mVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERyDWpo7GLev+qB3iJGJg/EQowQHs5IIL1Pb
        qngh3pTEyqrUovz4otKc1OJDjNIcLErivDcKF8YJCaQnlqRmp6YWpBbBZJk4OKUamFaYXSrK
        3ns9JJfxZ+obrSkf9xlxbwsxkzkdpP52vb6Ly7RtRdaTdvzW1Z6WX2bGmrJhp/12gQNTzyss
        +qt9omeRFPsjZ4X1sUsNPsn+k1hZ9GT+jQndnNqbfsQzpjczPxWf7fqs3uagct/Hv+nXWGb5
        ttfZJyo++1we9rs7vGTPnLX77YLORKxP1wqON/Vd+jRHceLU9TFXdvuqfF2+P/5fq+Dsyz1F
        G/NNf+3J/zLj+ffCSZMMWPcvKr4pHsj5pzag+TKjYYje4e9zW5yCOxed2Bq6aPnDPMUCBhWW
        NY53ev/66TNLJz3Z3NTW8P2cQPDeM5zlKmsTDyzfeTNsxrJzQr9vp7qdFDi61nDqwQ1KLMUZ
        iYZazEXFiQB+O/GyMAMAAA==
X-CMS-MailID: 20201111030351epcas1p4501ca2797f349939bfcd3a179c06f99d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
        <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
        <20201110081336.GB13669@pengutronix.de>
        <fd177674-b22e-6743-9886-5590ccade2f5@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 11. 11. 오후 12:04에 Inki Dae 이(가) 쓴 글:
> 
> 
> 20. 11. 10. 오후 5:13에 Michael Tretter 이(가) 쓴 글:
>> On Mon, 09 Nov 2020 12:15:39 +0900, Inki Dae wrote:
>>> 20. 9. 11. 오후 10:53에 Michael Tretter 이(가) 쓴 글:
>>>> This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
>>>> bridge and make it usable with other drivers. Although the driver is
>>>> converted, it still supports the component framework API to stay compliant
>>>> with the Exynos DRM driver.
>>>>
>>>> The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
>>>> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
>>>> the Exynos Decon. The driver for the LCDIF does not use the component
>>>> framework, but uses drm bridges.
>>>>
>>>> I don't have any Exynos SoC to actually test the series. I build a dummy to
>>>> test the bridge with a component driver, to make sure that at least the
>>>> initialization is working. Furthermore, tested the driver as a bridge with a
>>>> few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
>>>> should verify that the driver is still working on Exynos hardware.
>>>>
>>>> I also changed the order of the patches to first make the driver more platform
>>>> independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
>>>
>>> Just a fundamental question, A MIPI-DSI(Display Serial Interface) bus device
>>> would be one of an encoder type of devices not bridge such as DSI to LVDS
>>> and LVDS to DSI bridge devices, and also image enhancer and image compressor
>>> in case of Exynos.
>>
>> I don't understand, why the MIPI-DSI bus device would be an encoder type and
>> DSI to LVDS or MIPI-DSI to HDMI would be bridges. For example, the device tree
>> documentation for the DSIM states that the DSIM receives RGB video as input
>> and produces MIPI-DSI as output. Thus, the DSIM is basically a parallel RGB to
> 
> MIPI-DSI receives RGB video as input and encodes it to MIPI packet and then transfers the packet to MIPI panel.
> And finally, MIPI panel decodes the packet and updates it - RGB data - on its SRAM.
> 
> MIPI-DSI driver programs how the RGB video should be made as MIPI packet. For more detail, you could refer to MIPI-DSI spec.
> This would be why we handle MIPI-DSI driver as an encoder like other ARM SoC DRM drivers did.
> 
>> MIPI-DSI bridge and the encoder is the LCD controller that encodes the video
>> data as parallel RGB.
>>
>> On the i.MX8MM, the LCDIF is already the encoder. On Exynos, the series
>> implements the encoder in the platform glue, but in the end the encoder can
>> probably be moved to the DECON.
> 
> As you know, Display controller can transfer RGB video to various devices such as RGB panel, CPU panel, LVDS panel via LVDS bridge, MIPI panel via MIPI-DSI bus device, and so on like below,
> 
> Display Controller --> RGB panel or CPU panel.
> Display Controller --> LVDS bridge --> LVDS panel.
> Display Controller --> MIPI DSI bus device --> MIPI Panel.
> ...
> 
> Display controller drivers such as FIMD and DECON series in case of Exynos don't create an encoder driver-internally instead of it depends on Display pipeline configuration - what kind of Display panel is used.
> In fact, if the Display pipeline uses RGB panel or CPU panel without Display bus device such as MIPI-DSI, then FIMD and DECON drivers create an encoder for it internally - just we separated the code to consider other type of panels.
> 
> On the I.MX8MM, could you share how to handle an encoder if some board has only MIPI-DSI panel, and in this case, where is an encoder for it created? I looked into I.MX8MM DRM driver but didn't find MIPI-DSI driver.
> Seems that they support only parallel display, HDMI and LVDS panel.

One more thing, If I saw correctly, the LVDS driver of IMX DRM - lmx_ldb - creates an encoder internally like MIPI-DSI driver of Exynos DRM did.

> 
> Thanks,
> Inki Dae
> 
>>
>>> Why do you want to convert such MIPI-DSI driver to bridge type of driver?
>>> Seems not sensible. The reason would be just to share MIPI-DSI phy driver
>>> for Exynos with i.MX8M Mini?
>>
>> Yes, the reason is that the driver should be shared between Exynos and
>> i.MX8MM. It is the same IP and I don't see a reason why we should introduce
>> another driver for the same IP if the driver works for both SoCs.
>>
>> Michael
>>
> 
