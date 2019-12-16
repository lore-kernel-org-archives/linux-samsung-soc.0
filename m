Return-Path: <SRS0=IpvG=2G=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED77C43603
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Dec 2019 11:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AFCC20700
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Dec 2019 11:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JHLD0A1n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfLPLFU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Dec 2019 06:05:20 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54863 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbfLPLFU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 06:05:20 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191216110518euoutp022e5022af9e40d2faaf7fbe7673bdca64~g1TracbZa2801228012euoutp02C
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2019 11:05:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191216110518euoutp022e5022af9e40d2faaf7fbe7673bdca64~g1TracbZa2801228012euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576494318;
        bh=D7ziW8Ra8ercCRi5TtnxsBxx+Qcdq/e8MjDG0YYEBt8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=JHLD0A1n4rEu9Bo6sUlivu933+bcfSHlxUVAb25Tn/tK8pYnWAUDs2g3VHf3R/pM3
         m2gOUTgVT6vtADWUNPmMoZhtD7ZPBy5zy7BSqYsjBhq+BbamLP3+kskOxC1j7ty2n6
         uHy2cnjuuDwB2WFGWsX8M1ZH1PG6x9DBoY37jKGo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191216110517eucas1p17928e21e70f982dc3267ba6987b8c9fe~g1TrE5G3R1842718427eucas1p1o;
        Mon, 16 Dec 2019 11:05:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DD.66.60679.DE467FD5; Mon, 16
        Dec 2019 11:05:17 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191216110517eucas1p2945e7b1145aeea34d106ab7fd3aa1dcb~g1Tqtgld33221732217eucas1p27;
        Mon, 16 Dec 2019 11:05:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191216110517eusmtrp1b98a9923126ade5c2475b7181e9a755b~g1Tqs4c0U2037820378eusmtrp14;
        Mon, 16 Dec 2019 11:05:17 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-22-5df764ed7e85
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D2.14.07950.DE467FD5; Mon, 16
        Dec 2019 11:05:17 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191216110517eusmtip209ca570792e13674a59ecf8aec1f7387~g1TqR5d8u2795227952eusmtip25;
        Mon, 16 Dec 2019 11:05:17 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5420: Keep top G3D clocks enabled
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <26b1c535-b942-29f8-ca93-f841a01f0441@samsung.com>
Date:   Mon, 16 Dec 2019 12:05:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f7fbb6a3-6890-7a25-3a15-b608aa2e69dc@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87pvU77HGuz/Z2GxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFhdPuVr8u7aRxaL96UtmBy6P9zda2T12zrrL
        7rFpVSebR9+WVYwenzfJBbBGcdmkpOZklqUW6dslcGWcWzWftaCTs2Ln82PsDYzz2LsYOTkk
        BEwklnUsZ+5i5OIQEljBKPF/zRpWCOcLo8TVFQegnM+MEod3XmeBaenc+44JIrGcUWLuqtvs
        EM5bRomJqzaDDRYW8JJYM+UKK4gtIjCJUWLL5lCQImaBfiaJ3vu/wRJsAoYSvUf7GLsYOTh4
        BewkfqwSBQmzCKhKtFxsYgKxRQUiJJ5ceQxWzisgKHFy5hOwKzgF7CXuLN4EFmcWEJdo+rIS
        ypaX2P52DthDEgKn2CVm961hhjjbReJ820UoW1ji1fEt0BCQkTg9uYcFoqGZUaJnN8Q7EgIT
        GCXuH1/ACFFlLXH4+EVWkEuZBTQl1u/Shwg7Slx9fAIsLCHAJ3HjrSDEEXwSk7ZNZ4YI80p0
        tAlBVKtI/F41nQnClpLofvKfZQKj0iwkr81C8s4sJO/MQti7gJFlFaN4amlxbnpqsVFearle
        cWJucWleul5yfu4mRmCKOv3v+JcdjLv+JB1iFOBgVOLhdcj+FivEmlhWXJl7iFGCg1lJhHeH
        wvdYId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhhTtSaH
        SaZyS4Ru2qp7I+byL3sZpvBfP1fJu//yOxqp8HhpcfKx3LlZPtnWOyQcLzmX73cT1Y7g8jSa
        tjOiV7b++Be/n813zRf+mHvd1fu0d1dz2i6HFXcff1iYxaDX33JK8d/ZbUlnHp/Y4VCllXvh
        2rSJ877snXL/5OlMH5kijTaW82/MtXcqsRRnJBpqMRcVJwIALUe4800DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7pvU77HGmz+oWCxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFhdPuVr8u7aRxaL96UtmBy6P9zda2T12zrrL
        7rFpVSebR9+WVYwenzfJBbBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp
        29mkpOZklqUW6dsl6GWcWzWftaCTs2Ln82PsDYzz2LsYOTkkBEwkOve+Y+pi5OIQEljKKDFt
        XguQwwGUkJKY36IEUSMs8edaFxtEzWtGiZ/7mtlAEsICXhJrplxhBUmICExilNj2YScLSIJZ
        YCKTxOq5uhAdK5kkNt/czwySYBMwlOg92scIsoFXwE7ixypRkDCLgKpEy8UmJhBbVCBC4u3v
        m6wgNq+AoMTJmU/AZnIK2EvcWbyJFWK+usSfeZeYIWxxiaYvK6Hi8hLb385hnsAoNAtJ+ywk
        LbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYERuO/Zzyw7GrnfBhxgFOBiV
        eHgdsr/FCrEmlhVX5h5ilOBgVhLh3aHwPVaINyWxsiq1KD++qDQntfgQoynQcxOZpUST84HJ
        Iq8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA+Oeoh9lglZSaze2
        fPaJEFTdNeMmT8W5oJjNUzteHBPJfab/3WeZ/K698+I6bVedttvkzn1eVjQ7q+btDyZFzfhu
        pr9/Ti9olfXLzn6dnXNIjff4B+/bt/8yaD/pL55wxKdPXb2qZa4Ny04Jrw22/Zk/zzt3R537
        bJ7IERE358o2AUajDSq1qkosxRmJhlrMRcWJAElImpbeAgAA
X-CMS-MailID: 20191216110517eucas1p2945e7b1145aeea34d106ab7fd3aa1dcb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8
References: <CGME20191121101158eucas1p26b1f74cd2396a2461530e684d17a82e8@eucas1p2.samsung.com>
        <20191121101145.15899-1-m.szyprowski@samsung.com>
        <f46f7d3d-c107-2542-d9ed-124c9079aeca@samsung.com>
        <20191213030311.8FB3F2253D@mail.kernel.org>
        <f7fbb6a3-6890-7a25-3a15-b608aa2e69dc@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/13/19 08:11, Marek Szyprowski wrote:
> The real issue here is that some SoC internal busses (not assigned to 
> any driver at all) are sourced from the same MUX, which that patch 
> flagged as CRITICAL without any additional gates, thus if the only 
> client of that MUX disables its gate clock, the whole path up to the 
> root PLL is disabled what causes the HW issue. The driver (or user via 
> dts) might change the root PLL, so that CRITICAL flag cannot be moved to 
> the top clock in this hierarchy.
> 
> I can change that CRITICAL flag to a explicit call to 
> clk_prepare_enable() during exynos542x-clk driver probe, but IMHO the 
> flag better fits in such case.

I would prefer an explicit clk_prepare_enable() call, similarly as it is 
done in drivers/clk/samsung/clk-exynos-audss.c. This would somewhat separate
proper clocks definition from workarounds. The CLK_IS_CRITICAL flag might be 
a bit misleading IMO because the clock for which it is being added now doesn't 
have gating ability. The flag really applies to some root PLL clock which is
behind few other muxes going up in the clk tree.

-- 
Regards
Sylwester
