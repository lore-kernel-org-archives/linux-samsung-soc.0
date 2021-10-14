Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD10C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 08:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9ACF610D2
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 08:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhJNIfd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 04:35:33 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26617 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJNIf0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 04:35:26 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211014083320euoutp0289ff469dedc351a9db1fad57d0186a03~t2Jsun7251301113011euoutp02I
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 08:33:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211014083320euoutp0289ff469dedc351a9db1fad57d0186a03~t2Jsun7251301113011euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634200400;
        bh=TiSj1o9zl4Q3JV99HgMOj8hOrXVab++M3/wqJ4giETs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=hMdcUjyZezKaEu8Ffs4p+Uon3dB/v1d7A9g5/6nobi8N/Xu7PF6Di/zzVCzeMr3d+
         rNXBnv016M/hB8LmkJaXZPY2S8oAKmX207soYv0m53bMElWaWTr9ZiT4VYcTMbX57D
         YCq5VnNklNhSFZKJ5ilR60i5ugfu4bq7MXPfw59Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211014083320eucas1p1bb242244d0b0bbcbece76218f2065024~t2JsSwuNS2169221692eucas1p1f;
        Thu, 14 Oct 2021 08:33:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 97.58.56448.05BE7616; Thu, 14
        Oct 2021 09:33:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211014083319eucas1p1c3e87b2cf393993fc24f5f4745847624~t2JriNsRT2169621696eucas1p1c;
        Thu, 14 Oct 2021 08:33:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211014083319eusmtrp1c7976934c7ec177a97c4215d7d19a339~t2JrhZ40b2286722867eusmtrp1d;
        Thu, 14 Oct 2021 08:33:19 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-d8-6167eb50431f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 02.B1.20981.F4BE7616; Thu, 14
        Oct 2021 09:33:19 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211014083318eusmtip123602346d88436281ef75c110080a0d4~t2JqydgI-1903819038eusmtip1W;
        Thu, 14 Oct 2021 08:33:18 +0000 (GMT)
Subject: Re: [RFT PATCH v3 0/2] clk: samsung: add common support for CPU
 clocks
To:     Will McVicker <willmcvicker@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b968773d-9ee4-4e7a-7e33-f3ded7362a9c@samsung.com>
Date:   Thu, 14 Oct 2021 10:33:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013221021.3433704-1-willmcvicker@google.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djP87oBr9MTDVaf4LW4/uU5q8WO7SIW
        G9/+YLLY9Pgaq8XHnnusFpd3zWGzmHF+H5PFxVOuFofftLNa/Lu2kcVi1a4/jBarPv1ndODx
        2LZ7G6vH+xut7B6zGnrZPHbOusvusWBTqcemVZ1sHpuX1Hv0bVnF6PF5k1wAZxSXTUpqTmZZ
        apG+XQJXxrf3J1gKrnFXNFy+ztLAeJyzi5GTQ0LAROLCtpPMXYxcHEICKxglfp5aCuV8YZRo
        O/qaBcL5zCjR9GsvC0zLqnl/oBLLGSX+7rzICOF8ZJT4t+YgI0iVsECgROf03WwgCRGBTUwS
        DXufsoI4zAILGSXebNzOBlLFJmAo0fW2C8zmFbCTWDzlCdBcDg4WAVWJd7PFQMKiAskS0/42
        MUOUCEqcnAlRwilgL/HtqShImFlAXmL72znMELa4xK0n85lAVkkITOeUeHxmP1i9hICLxPyb
        1RAfCEu8Or6FHcKWkTg9uYcFor6ZUeLhubXsEE4Po8TlphmMEFXWEnfO/WIDGcQsoCmxfpc+
        RNhR4sil/UwQ8/kkbrwVhLiBT2LStunMEGFeiY42IYhqNYlZx9fBrT144RLzBEalWUgem4Xk
        m1lIvpmFsHcBI8sqRvHU0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwLR2+t/xrzsYV7z6qHeI
        kYmD8RCjBAezkgjvuwPpiUK8KYmVValF+fFFpTmpxYcYpTlYlMR5d21dEy8kkJ5YkpqdmlqQ
        WgSTZeLglGpgWn2y4dW2ObrqC6x7GL/ey7/Wymv3smnDjV0zLFy7JzwIy839Ebe3a3O33PVc
        sdtnZ72Rt7khtKohQWv/qs6tfZZvLta8fn7dZWGH/hStGyGVb0yKumz3XDt73WFfuPfTUyYT
        788J12bXDTwU75Gldug0p0+yDdc7ZQcp17MaRp8TNlj+kVW99ksw/2NYzO3kM5s67Gd07Lat
        83x5L7Gu2TL0tcKJq7K7Nt0Tkd8275M646WG/t2cX58cz+Sb+PUiy94JRfyrGdWfqBXY8cf/
        ULLrXlDo6WvfUFP+Y/HmIxuzDsXck5ip+TWwUEX4FuusC6//3f2x87B4e9zneftNcrWYLASY
        XWeuvckjp8PAoMRSnJFoqMVcVJwIAMh+d1zaAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xu7r+r9MTDRbulbS4/uU5q8WO7SIW
        G9/+YLLY9Pgaq8XHnnusFpd3zWGzmHF+H5PFxVOuFofftLNa/Lu2kcVi1a4/jBarPv1ndODx
        2LZ7G6vH+xut7B6zGnrZPHbOusvusWBTqcemVZ1sHpuX1Hv0bVnF6PF5k1wAZ5SeTVF+aUmq
        QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexrf3J1gKrnFXNFy+
        ztLAeJyzi5GTQ0LARGLVvD8sILaQwFJGiQcfVCHiMhInpzWwQtjCEn+udbF1MXIB1bxnlHjz
        9xkjSEJYIFCic/pusISIwCYmib7T28AcZoGFjBItm16yQLRMYpQ4c/sSG0gLm4ChRNfbLjCb
        V8BOYvGUJ0BFHBwsAqoS72aLgYRFBZIl3r7+zgRRIihxciZECaeAvcS3p6IgYWYBM4l5mx8y
        Q9jyEtvfzoGyxSVuPZnPNIFRaBaS7llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0
        veT83E2MwDjeduznlh2MK1991DvEyMTBeIhRgoNZSYT33YH0RCHelMTKqtSi/Pii0pzU4kOM
        pkDfTGSWEk3OByaSvJJ4QzMDU0MTM0sDU0szYyVxXpMja+KFBNITS1KzU1MLUotg+pg4OKUa
        mKqemDh9PyT+gTGDdcZ+DjPt070znrcFl+SXmDSw1/et6c5kOLZKxkXTSryr83rW+51Jdb1m
        yXNq+Fkex//pUp/oYsaTz3qW/2dwSNaigw/jNPLeda1wffPF46Ks5rr1r7JT48J26xWfnLHv
        ywkjA+GtIX1HOq55uP+ffPnaSmPuPA+HnOfrm6+6ftz6fn4ba8flbXmPKuVcYjpPTlaZ6hB+
        I1hHj3NywXSLuiftR042bDgwYYapcY/TcYWwNTYmU0Oe73Svm1qf5pk2O44nuSyMqeVeyYyk
        Ayt9s+XLjKOdTnT8MKn93ZZ533qF35LPZswXGKonmnX76D6Okt41beHU5XkbVd4nOyx7nFeo
        xFKckWioxVxUnAgA5ls0wWwDAAA=
X-CMS-MailID: 20211014083319eucas1p1c3e87b2cf393993fc24f5f4745847624
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211013221032eucas1p1d8e2fcc36d3f021aa86cb846df0ed6da
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211013221032eucas1p1d8e2fcc36d3f021aa86cb846df0ed6da
References: <CGME20211013221032eucas1p1d8e2fcc36d3f021aa86cb846df0ed6da@eucas1p1.samsung.com>
        <20211013221021.3433704-1-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.10.2021 00:10, Will McVicker wrote:
> These two patches were originally a part of the series [1]. They add
> support to the common samsung clock driver to parse and register the
> CPU clocks when provided. This allows for the samsung clock drivers to
> simply provide a `struct samsung_cpu_clock` to `struct samsung_cmu_info`
> and then call samsung_cmu_register_one(). With this new support, we can
> now get rid of the custom apollo and atlas CLK_OF_DECLARE init functions.
>
> Since I don't have the hardware to test these, I'm including the RFT tag
> to try and get help testing and verifying these.
>
> [1] https://protect2.fireeye.com/v1/url?k=91329df7-cea9a478-913316b8-0cc47a31307c-8e0b8e6442100c5a&q=1&e=50af1e33-8bdf-429f-9e54-434d425998d6&u=https%3A%2F%2Flore.kernel.org%2Fall%2F20210928235635.1348330-4-willmcvicker%40google.com%2F

Works fine on my Exynos5433 TM2e test board.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> Will McVicker (2):
>    [RFT] clk: samsung: add support for CPU clocks
>    [RFT] clk: samsung: exynos5433: update apollo and atlas clock probing
>
>   drivers/clk/samsung/clk-cpu.c        |  26 ++++++
>   drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
>   drivers/clk/samsung/clk.c            |   2 +
>   drivers/clk/samsung/clk.h            |  26 ++++++
>   4 files changed, 102 insertions(+), 72 deletions(-)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

