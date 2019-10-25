Return-Path: <SRS0=fp8F=YS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDF3CA9EBD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Oct 2019 09:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 055CE21D7B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Oct 2019 09:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZFec/BZv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfJYJVQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Oct 2019 05:21:16 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48733 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbfJYJVQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 05:21:16 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191025092114euoutp027ebd0ecf4b4e0d8dfa5d27e439d00eb2~Q2V_dvYja0386503865euoutp02Q
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2019 09:21:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191025092114euoutp027ebd0ecf4b4e0d8dfa5d27e439d00eb2~Q2V_dvYja0386503865euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571995274;
        bh=KMKNokIDIDnSm9WZEk03whwXAqbkj6Bt158JqveuvBw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ZFec/BZvlhxBr80rJFgtglRaDjZk627OVyetSS6j6j7/Jc01VJu2bl6zTMtL4gnEB
         +XsLsqYR9fHHE9FlwwLWVJR1R22Tm9AEwpUSdEcLn4erKsm08WsfLqhrp7Hh96w31Z
         KudDFPi3rIm/YuUck9ck0lE6I4GiNPpRNyFJ5+uI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191025092114eucas1p158de965a62669dece458bd8e4c2b60aa~Q2V_Hj4Hs2280722807eucas1p1g;
        Fri, 25 Oct 2019 09:21:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 0D.ED.04309.A8EB2BD5; Fri, 25
        Oct 2019 10:21:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191025092113eucas1p20f985822200e64277b4b41201adacd8a~Q2V9t-At70533305333eucas1p2Z;
        Fri, 25 Oct 2019 09:21:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191025092113eusmtrp221c24a84b23d5745e72a8bd88e651676~Q2V9tVacp1206612066eusmtrp28;
        Fri, 25 Oct 2019 09:21:13 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-42-5db2be8a1977
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F4.39.04117.98EB2BD5; Fri, 25
        Oct 2019 10:21:13 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191025092113eusmtip2ce601fc8f8477325ddabf4c03bfb324f~Q2V9QHSts1737817378eusmtip2L;
        Fri, 25 Oct 2019 09:21:13 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5420: Preserve PLL configuration
 during suspend/resume
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <fcf29d21-5fbc-faf6-dc9a-3f7b874cb89a@samsung.com>
Date:   Fri, 25 Oct 2019 11:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025090201.30246-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djPc7pd+zbFGmzo4rbYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi/anL5kdODx2zrrL7rFpVSebR9+WVYwenzfJ
        BbBEcdmkpOZklqUW6dslcGW8O7mZraCbtWLd7KUsDYxLWboYOTkkBEwk3kw5wd7FyMUhJLCC
        UWLjojlQzhdGifubH7FCOJ8ZJZb8ncYO07Lh/k0WiMRyRomuvp1MEM5bRolHy+YxdzFycAgL
        JErMPu0PYooI5EvMehsCUsIs8IhRYs32VjaQQWwChhK9R/sYQWxeATuJVb/vg8VZBFQlWk7N
        ZAPpFRWIkDj9NRGiRFDi5MwnYGdzApU/WzyPFcRmFhCXaPqyEsqWl9j+dg4zyC4JgU3sElem
        L2GEONpFYtaGj1APCEu8Or4FypaR+L9zPhNEQzOjRM/u2+wQzgSg/48vgOq2ljh8/CIryEXM
        ApoS63fpQ4QdJbY9v8ECEpYQ4JO48VYQ4gg+iUnbpjNDhHklOtqEIKpVJH6vms4EYUtJdD/5
        zzKBUWkWktdmIXlnFpJ3ZiHsXcDIsopRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMwBZ3+
        d/zLDsZdf5IOMQpwMCrx8DpM2hgrxJpYVlyZe4hRgoNZSYR3txpQiDclsbIqtSg/vqg0J7X4
        EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA6PoKfl7h7wXGIutOfncQllTecfbnQys
        gop6Z829uX5H3ii+dPe57oLJjGk5zMf25bRfCgut9D6TLf9uf5zZ2ftFPgxx8SdXen+L69Zz
        0//hPCfmxtTHP2/EXVkTalXie+uv5qoJ8l9610u9+F30wNbZ72Xlnn2WC9duy9JrUv++UG3/
        nTt/twoqsRRnJBpqMRcVJwIAwK58CT0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xe7qd+zbFGtxdoGuxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFu1PXzI7cHjsnHWX3WPTqk42j74tqxg9Pm+S
        C2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt4
        d3IzW0E3a8W62UtZGhiXsnQxcnJICJhIbLh/E8wWEljKKHGsRaeLkQMoLiUxv0UJokRY4s+1
        LrYuRi6gkteMEpdmv2AGqREWSJSYfdofpEZEIF9ixp1eRpAaZoFHjBLTth9jhGiYyChx6O9X
        VpAqNgFDid6jfYwgNq+AncSq3/fZQGwWAVWJllMzwWxRgQiJ59tvQNUISpyc+QTsOE6g+meL
        54HNYRZQl/gz7xIzhC0u0fRlJVRcXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5N
        zy020itOzC0uzUvXS87P3cQIjLltx35u2cHY9S74EKMAB6MSD6/DpI2xQqyJZcWVuYcYJTiY
        lUR4d6sBhXhTEiurUovy44tKc1KLDzGaAj03kVlKNDkfmA7ySuINTQ3NLSwNzY3Njc0slMR5
        OwQOxggJpCeWpGanphakFsH0MXFwSjUwznFZpbpnk3zsvi+XLiY1r7Xu5Tu/3l1A66exN6/8
        2dgFl33ZbkyecPCUWDeDp7350xsmP4LTbu09wpriUbGGr7/29abnk0/OU5SufTe/qe1Gyto4
        y4lHzNmVM/jTF/Ox/HzW/5ll+v6PsvvaJ5nd+3NP92/sFJ5Xd33KnFVZGFInOe0XyT4SpMRS
        nJFoqMVcVJwIAJtZ6y/PAgAA
X-CMS-MailID: 20191025092113eucas1p20f985822200e64277b4b41201adacd8a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191025090212eucas1p10ef782af07e01470b185e4fb190d3ce6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191025090212eucas1p10ef782af07e01470b185e4fb190d3ce6
References: <CGME20191025090212eucas1p10ef782af07e01470b185e4fb190d3ce6@eucas1p1.samsung.com>
        <20191025090201.30246-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/25/19 11:02, Marek Szyprowski wrote:
> Properly save and restore all top PLL related configuration registers
> during suspend/resume cycle. So far driver only handled EPLL and RPLL
> clocks, all other were reset to default values after suspend/resume cycle.
> This caused for example lower G3D (MALI Panfrost) performance after system
> resume, even if performance governor has been selected.
> 
> Reported-by: Reported-by: Marian Mihailescu <mihailescu2m@gmail.com>
> Fixes: 773424326b51 ("clk: samsung: exynos5420: add more registers to restore list")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.
