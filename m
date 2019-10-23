Return-Path: <SRS0=1mvF=YQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD64CA9EB9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Oct 2019 12:58:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 116B021872
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Oct 2019 12:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kk3iXlB8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390570AbfJWM57 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Oct 2019 08:57:59 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49414 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390108AbfJWM57 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:57:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191023125757euoutp0264e8877440df176f5963a2b657faf895~QSAoG8_9B0379103791euoutp02K
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Oct 2019 12:57:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191023125757euoutp0264e8877440df176f5963a2b657faf895~QSAoG8_9B0379103791euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571835477;
        bh=ioPuJgiHc3Vhz3Tnq4uZBWM1dDcn+P8zwQM5nxQ68ok=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Kk3iXlB8gjETbFBZRM39ms/sJDOPYWHuIPXL6BevMGFp7JthXhEngqt5AvHT2x8RB
         I7QLWMYHH52+kYB5O4JEiX46DG4Oza4j5COS5kE4Ldc7sBDHPXQvenp0oNA4FGEWMP
         T5Kfa12vGZHnwh1TowKd2hDrvspLCcOed46xr350=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191023125757eucas1p17d2d38e101aff475099171ded99369c8~QSAnxXBbL2259122591eucas1p1T;
        Wed, 23 Oct 2019 12:57:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EF.3A.04374.55E40BD5; Wed, 23
        Oct 2019 13:57:57 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191023125756eucas1p2f2fa89f7c972227e34310603ab3d6af3~QSAnT6ObC2345223452eucas1p2J;
        Wed, 23 Oct 2019 12:57:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191023125756eusmtrp2369bfa1e0656559555c141ba81b80d05~QSAnTRlri2299822998eusmtrp23;
        Wed, 23 Oct 2019 12:57:56 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-bd-5db04e555b8e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 68.2C.04117.45E40BD5; Wed, 23
        Oct 2019 13:57:56 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191023125756eusmtip25bbcf5f8fab8d87af580d2ad8ff0714c~QSAm7rAA71532715327eusmtip2X;
        Wed, 23 Oct 2019 12:57:56 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix error paths
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <d5e30096-3337-ffd6-43ed-8fa3f29ba374@samsung.com>
Date:   Wed, 23 Oct 2019 14:57:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002085309.9473-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djPc7qhfhtiDbZOkrTYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbtH+9CWzA7vHplWdbB59W1YxenzeJBfAHMVlk5Kak1mW
        WqRvl8CVsfPjU6aCCUwVr1dvYmtgfMbYxcjBISFgInFlf1YXIxeHkMAKRok7PyezQDhfGCWe
        nX7IBuF8ZpRonPIIqIMTrKOxcz1U1XJGiSm7LjBDOG8ZJX4u72cBqRIWsJN48vcCWIeIgJfE
        p8afrCBFzAI3GSXubXzDBpJgEzCU6D3aB1bEC9SwcmYP2FEsAqoSfatYQUxRgQiJ018TISoE
        JU7OfAI2nlPAVuJZ53EmEJtZQFyi6ctKVghbXmL72zlg90gILGOXaLu0AepPF4mn6ysgHhCW
        eHV8CzuELSPxf+d8Joj6ZkaJnt232SGcCYwS948vgHrZWuLw8YtgBzELaEqs36UPEXaU2P7i
        EwvEfD6JG28FIW7gk5i0bTozRJhXoqNNCKJaReL3qulMELaURPeT/ywTGJVmIflsFpJvZiH5
        ZhbC3gWMLKsYxVNLi3PTU4uN81LL9YoTc4tL89L1kvNzNzECk83pf8e/7mDc9yfpEKMAB6MS
        D2+Fz4ZYIdbEsuLK3EOMEhzMSiK8dwzWxgrxpiRWVqUW5ccXleakFh9ilOZgURLnrWZ4EC0k
        kJ5YkpqdmlqQWgSTZeLglGpgvGu5I918m6dp1cHEa7qVxZ1HNKepbnfW1orUSRFiVA/pmDFp
        O7NUounyZ8ZLtFZzyTydumH33Q0aWka29SfXb9CqPxantqxH2kPMz4vnyESbLbkpZ5T7v7CF
        LD99W9E3o+jWd78cEVWWD46BZy51pPr9VGq7dTjw+J3FE3TX7NpZsTsr5ZiHEktxRqKhFnNR
        cSIAb/gb7zIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xe7ohfhtiDW59sLLYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbtH+9CWzA7vHplWdbB59W1YxenzeJBfAHKVnU5RfWpKq
        kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsfPjU6aCCUwVr1dv
        YmtgfMbYxcjJISFgItHYuZ6li5GLQ0hgKaPEhO5FbF2MHEAJKYn5LUoQNcISf651sUHUvGaU
        aF+4gh0kISxgJ/Hk7wWwQSICXhKfGn+yghQxC9xklPjbu5UJomMCo8TJp0fAqtgEDCV6j/aB
        2bxA3Stn9jCCbGMRUJXoW8UKEhYViJB4vv0GVImgxMmZT1hAbE4BW4lnnceZQGxmAXWJP/Mu
        MUPY4hJNX1ayQtjyEtvfzmGewCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFibnFp
        Xrpecn7uJkZghG079nPLDsaud8GHGAU4GJV4eCt8NsQKsSaWFVfmHmKU4GBWEuG9Y7A2Vog3
        JbGyKrUoP76oNCe1+BCjKdBvE5mlRJPzgdGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2x
        JDU7NbUgtQimj4mDU6qBsfRo8Av9qdbzrDfLTmnovWhyUeRuypMFn3iVztmc2L9JVzlrkdF5
        5b8/jv2co83JJ8Io4c/bvPpLtXD4jlj+gmOJCaFf/x9delr9sG78XnGBuc/MrB+wMRue2J+Y
        5WvU+fnfyV9C7Np8dzfyO69mrXB7pDcjJWadB1f/o4xH1hP6bPZsU924QYmlOCPRUIu5qDgR
        APAVlNDGAgAA
X-CMS-MailID: 20191023125756eucas1p2f2fa89f7c972227e34310603ab3d6af3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234
References: <CGME20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234@eucas1p2.samsung.com>
        <20191002085309.9473-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/2/19 10:53, Marek Szyprowski wrote:
> Add checking the value returned by samsung_clk_alloc_reg_dump() and
> devm_kcalloc(). While fixing this, also release all gathered clocks.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.
