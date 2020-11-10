Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26741C4742C
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 12:34:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A88C320781
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Nov 2020 12:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PeOp5o0+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730489AbgKJMes (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Nov 2020 07:34:48 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60986 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731106AbgKJMer (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 07:34:47 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201110123435euoutp012cbde91e1c5d546eff5e9ec6a85ec819~GJZ1s47xe2302923029euoutp01a
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2020 12:34:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201110123435euoutp012cbde91e1c5d546eff5e9ec6a85ec819~GJZ1s47xe2302923029euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605011675;
        bh=QBy7+4PZvvQ7G+D12cRdPJrlJzpKNOMPy7iRobv0Ov4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=PeOp5o0+oxouwTO4Yf1GHNk8xSoEqGUgG45IvZ20Q1wwjMFBDwsP3h/9SeSbuKx1J
         /nsB0CBBEQuzH7IHWQPPLv8cGF6ZtnmzVXkHykdB6XOCrwYwvaDuQ4a0F3tbNJj08Q
         kb5FnDnsA5h5iQKu9jxAzu99s/BSUaTOrBbNW+10=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201110123429eucas1p251ad0eae72958741531b4a8ee025e33d~GJZv3ymmT1282012820eucas1p2Z;
        Tue, 10 Nov 2020 12:34:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 18.1D.05997.4D88AAF5; Tue, 10
        Nov 2020 12:34:28 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201110123428eucas1p10a30afb2603a47e4ca5787a8f15ffca1~GJZvYSVOi1093110931eucas1p1M;
        Tue, 10 Nov 2020 12:34:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201110123428eusmtrp20d68fc6b589164722c3dc6fd7b9df31b~GJZvXhfDl2842828428eusmtrp2r;
        Tue, 10 Nov 2020 12:34:28 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-5c-5faa88d43906
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id AC.10.06314.3D88AAF5; Tue, 10
        Nov 2020 12:34:27 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201110123426eusmtip1b53954442d1a19b8f56270ca7b5ed636~GJZtov_f_1197511975eusmtip1k;
        Tue, 10 Nov 2020 12:34:26 +0000 (GMT)
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Inki Dae <inki.dae@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <969deb9e-d883-49a9-5631-7747f0b3e583@samsung.com>
Date:   Tue, 10 Nov 2020 13:34:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110081336.GB13669@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOKsWRmVeSWpSXmKPExsWy7djPc7pXOlbFG/zfYWVxa905VouNM9az
        Wlz5+p7NYtL9CSwWL+5dZLFYNXUni8X58xvYLTonLmG3mHF+H5PFthVAxYf6oi1mTH7JZjHv
        804mB16P9zda2T12zrrL7jG7Yyarx6ZVnWwe97uPM3n0/zXw6NuyitHj8ya5AI4oLpuU1JzM
        stQifbsEroyzTb+YChYpVeyZ+omxgXG7dBcjJ4eEgInE4yWnWLoYuTiEBFYwSuz83QXlfGGU
        uLrqEDOE85lR4s/yt+wwLRta90ElljNKPJ47lR3Cec8ocXzeE1aQKmEBN4knZ44zgdgiAoES
        fXv2gnUwC2xgkti69x4LSIJNwFCi620XG4jNK2An8evQGbBmFgFVianvvjCC2KICSRJ/P/9h
        hqgRlDg58wlQLwcHJ9AZ/5qCQMLMAvISzVtnM0PY4hK3nsxnAtklIfCVXWL91XlQZ7tILNo1
        mwXCFpZ4dXwLVFxG4v9OmIZmRomH59ayQzg9jBKXm2YwQlRZS9w594sNZDOzgKbE+l36EGFH
        iY5dd8DCEgJ8EjfeCkIcwScxadt0Zogwr0RHmxBEtZrErOPr4NYevHCJeQKj0iwkn81C8s4s
        JO/MQti7gJFlFaN4amlxbnpqsVFearlecWJucWleul5yfu4mRmByO/3v+JcdjLv+JB1iFOBg
        VOLhPfBnWbwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZ
        KySQnliSmp2aWpBaBJNl4uCUamBcf9L9V/elH61Orye1ii48ftzfQcvzWqBZ1pe4xX239ph0
        yvCsV5jXsjJiY6SexT3dU4Ua8Vt8i+pKFB+oOtv5l/1v+vSFiTv/p4Ad/641bJmLXb006xVW
        J0+TWG6rIfv/05sVRtvjpxzW2uqhGPo690qi9OYHHLyHao1qQxpOHK6QkZRSfq/EUpyRaKjF
        XFScCAChmRYsagMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsVy+t/xu7pXOlbFG2w5KGlxa905VouNM9az
        Wlz5+p7NYtL9CSwWL+5dZLFYNXUni8X58xvYLTonLmG3mHF+H5PFthVAxYf6oi1mTH7JZjHv
        804mB16P9zda2T12zrrL7jG7Yyarx6ZVnWwe97uPM3n0/zXw6NuyitHj8ya5AI4oPZui/NKS
        VIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyzTb+YChYpVeyZ
        +omxgXG7dBcjJ4eEgInEhtZ9zF2MXBxCAksZJW78aWWFSMhInJzWAGULS/y51sUGUfSWUeL6
        pKvsIAlhATeJJ2eOM4HYIgKBEss3XgIrYhbYwCQx+fQlRoiOT4wSu9ZfYgGpYhMwlOh6CzKK
        k4NXwE7i16EzYCtYBFQlpr77wghiiwokSby8MJUJokZQ4uTMJ0C9HBycQLf+awoCCTMLmEnM
        2/yQGcKWl2jeOhvKFpe49WQ+0wRGoVlIumchaZmFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OL
        S/PS9ZLzczcxAqN527Gfm3cwXtoYfIhRgINRiYf3wJ9l8UKsiWXFlbmHGCU4mJVEeJ3Ono4T
        4k1JrKxKLcqPLyrNSS0+xGgK9NtEZinR5HxgoskriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQ
        nliSmp2aWpBaBNPHxMEp1cBY5b0/Usnux+Ge9MvO1xcfWl9Q5vW696D3a67LLc7VC/deX2Dg
        qmS5eO7iWqmgs85s1y6tdZG5y+ajffSFnGmroJZyf+0ky2r+s0sEP3f/fxk384J9iHbcz6ji
        M22SSmE3gy8urxYqsN6nHRpSX3jS1efz452flm7I77nnJi/w/Pb3R1MLzU4qsRRnJBpqMRcV
        JwIAbg+1N/wCAAA=
X-CMS-MailID: 20201110123428eucas1p10a30afb2603a47e4ca5787a8f15ffca1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
        <20200911135413.3654800-1-m.tretter@pengutronix.de>
        <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
        <20201110081336.GB13669@pengutronix.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Michael,

On 10.11.2020 09:13, Michael Tretter wrote:
> On Mon, 09 Nov 2020 12:15:39 +0900, Inki Dae wrote:
>> 20. 9. 11. 오후 10:53에 Michael Tretter 이(가) 쓴 글:
>>> This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
>>> bridge and make it usable with other drivers. Although the driver is
>>> converted, it still supports the component framework API to stay compliant
>>> with the Exynos DRM driver.
>>>
>>> The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
>>> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
>>> the Exynos Decon. The driver for the LCDIF does not use the component
>>> framework, but uses drm bridges.
>>>
>>> I don't have any Exynos SoC to actually test the series. I build a dummy to
>>> test the bridge with a component driver, to make sure that at least the
>>> initialization is working. Furthermore, tested the driver as a bridge with a
>>> few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
>>> should verify that the driver is still working on Exynos hardware.
>>>
>>> I also changed the order of the patches to first make the driver more platform
>>> independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
>> Just a fundamental question, A MIPI-DSI(Display Serial Interface) bus device
>> would be one of an encoder type of devices not bridge such as DSI to LVDS
>> and LVDS to DSI bridge devices, and also image enhancer and image compressor
>> in case of Exynos.
> I don't understand, why the MIPI-DSI bus device would be an encoder type and
> DSI to LVDS or MIPI-DSI to HDMI would be bridges. For example, the device tree
> documentation for the DSIM states that the DSIM receives RGB video as input
> and produces MIPI-DSI as output. Thus, the DSIM is basically a parallel RGB to
> MIPI-DSI bridge and the encoder is the LCD controller that encodes the video
> data as parallel RGB.
>
> On the i.MX8MM, the LCDIF is already the encoder. On Exynos, the series
> implements the encoder in the platform glue, but in the end the encoder can
> probably be moved to the DECON.

This is probably the historical decision. That time when Exynos DSI 
driver has been implemented, support for DRM bridges wasn't ready enough 
to use to for such purpose.

Frankly, I'm still not convinced that the current DRM bridge framework 
provides everything needed to reimplement the Exynos DSI driver with all 
its features. There are a lots of corner cases and order-specific bits 
in turning on/off the display pipeline, which don't map nicely to the 
bridge pre_enable (called in post-order) and enable (called in 
pre-order) callbacks. Especially if you consider that there might be 
another bridge before and after.

I think that Andrzej Hajda already pointed those drawbacks of the 
current design. Last week I've spent some significant amount of time 
playing with exynos dsi code to check how to match its operations 
(especially the runtime power management) to this design with the 
current boards (Arndale with additional DSI->LVDS bridge and panel, 
Trats2 with DSI panel and TM2e with MIC 'in-bridge' and DSI panel), but 
without a success.

>> Why do you want to convert such MIPI-DSI driver to bridge type of driver?
>> Seems not sensible. The reason would be just to share MIPI-DSI phy driver
>> for Exynos with i.MX8M Mini?
> Yes, the reason is that the driver should be shared between Exynos and
> i.MX8MM. It is the same IP and I don't see a reason why we should introduce
> another driver for the same IP if the driver works for both SoCs.

I think that the easiest way to share this driver between Exynos and iMX 
would be to extract the low-level code (the code that plays with 
hardware registers) to the common plane, while keeping the separate DRM 
glue, device component and platform device parts. This way the Exynos 
will continue to use it in the current form, while iMX can start using 
it as DRM bridge. A bit similar approach is used with exynos_dp driver 
and analogix_dp bridge shared with other SoCs.

I hope that later, when the bridge related issue are resolved, the 
Exynos can be converted too, so the encoder creation moved to FIMD and 
Decon.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

