Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78239C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:12:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 624196112D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhJSIO0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:14:26 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31811 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbhJSIOZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 04:14:25 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211019081212euoutp01b8af213609e593f07d098cddfb2032d1~vYFqZxNr51070110701euoutp01d
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 08:12:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211019081212euoutp01b8af213609e593f07d098cddfb2032d1~vYFqZxNr51070110701euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634631132;
        bh=EjIBPPqL4n/7gCoP5fgtE0bCoBV5PSZqoDjvlnLfJ2k=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=J2ZlRuhRm4ph8uraqJN9DLvrOruEbj2w/gjD+H85gO8eI68lzG8uwAekAfjxrDLMf
         3dsFg7tpewnii4gRMDBou9Yt6gMg2E6CzXgwICTNTGxuD2S7HwaSc4ICc8kelHFQC/
         yVuT7uEKpdwQzb5NsqTxbUZJg/vvcs44g/1eo7e8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211019081211eucas1p22ddc72c1d8f373b43573f8bc2335f3e4~vYFp3EbAe3054630546eucas1p2k;
        Tue, 19 Oct 2021 08:12:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 7A.3A.56448.BDD7E616; Tue, 19
        Oct 2021 09:12:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211019081210eucas1p23be643e805efed44708a5fa95942dfcf~vYFpbgWd20034700347eucas1p2Y;
        Tue, 19 Oct 2021 08:12:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211019081210eusmtrp1f983819b7b9c53e211818bb3862ff7b6~vYFpajLC11074510745eusmtrp1C;
        Tue, 19 Oct 2021 08:12:10 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-bc-616e7ddbce8b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 44.31.20981.ADD7E616; Tue, 19
        Oct 2021 09:12:10 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211019081210eusmtip151d274b7765241afa9184740f0617efc~vYFo038on0897708977eusmtip1q;
        Tue, 19 Oct 2021 08:12:10 +0000 (GMT)
Message-ID: <80478d45-af5e-6d94-be8b-e458db876667@samsung.com>
Date:   Tue, 19 Oct 2021 10:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/2] clk: samsung: remove __clk_lookup() usage
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211018125456.8292-2-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xScRTux73AlQ27osZJy5LZu7T3aKWzkob9Vdla+keGeqcuwMZVM1rL
        spqi9mSp5NLWQyIpc/nemppkRekqSwuN1kjTaYxJzcgk4dbyv+/7zvl2znd2CEygYwcR6cpM
        SqWUyUUcHl7/5GfXKstxpWy16UyAuNc5xBZ3d9dwxY6ij2xxafcjltjYMcAVT717gIsNzZMo
        mitt0g1wpbWGAo703EMDko7XhuzCE3hbUih5ejaliog6yEur1zfghyvwnGt5B3LRC0yDfAgg
        14Ol5SJHg3iEgNQjsJzKRwxxIqizPWczZBxBr8HE+WfpaT2DM4UqBM1Pf/8lDgQXb7vYni4+
        GQW32hpZHoyTi+DzXROX0f3gWZkN9+BAMgkqrn7y6v6kBLSNJq8XI4XwwVbh9QaQGfC0ZdA7
        ACPLEPR8rvZuziHXQLHpHPJgHzISBgfbMMa8ABrGyjGPAch+Ah5PGf9GjYHr1cM4g/1hpPMh
        l8HzwHy5CGcMeQiKWixchlxAYO2sREzXZujvck1fgJgesQzuN0cw8la40v6R7ZGB9IW+MT9m
        CV+4VF+CMTIf8s8KmO4w+GUoYTE4CAptbvwCEulm3EU3I79uRhzd/7mVCDcgIZVFK1Ipep2S
        OhJOyxR0ljI1PDlDUYum38c81fm9EelHHOHtiEWgdgQEJgrgJ0kUMgE/RXZUTakyElVZcopu
        R8EELhLym+uqEwVkqiyTOkRRhynVvyqL8AnKZS3od26abC3ISOrqjasaSGdPBWrP+2fPXhIf
        7diwQzl/cbzpfen40rpC2GOt6Y8NzC0f+7a9aVbZ7roNRr3ZbFQF293DktFtmtoJ4aZRhfpl
        ww9nnG3ts6Z1yKI/KK0eMmlcK4RfM60jc6OgjQwp9pWETYTW+G3k7YtM2M7ulSTsNebPT1ss
        Ok1bLWb1qC5UHeq2+598c2yjdqE8lu+47gqWSw48igs7UREhccdoXzm2vE2IfbPHnsffX+Kb
        ld7aN9hxqVy3Ux0zdES7UpFMW9133Jp7rhRT2JeQ4pzRe8XZC3Mq4z8kltmXvh+OP22vmuPc
        tuq1cLf5hlF9M1Uuwuk02ZrlmIqW/QGGH5hgrQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7q3avMSDXq361lc//Kc1eL8+Q3s
        Fh977rFazDi/j8li7ZG77Bb/rm1ksVi16w+jA7vHzll32T02repk8+jbsorR4/MmuQCWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MbSu2sxTM
        Z6mY1xzXwHiGuYuRk0NCwETiyoFWli5GLg4hgaWMEg9uzQZyOIASUhLzW5QgaoQl/lzrYoOo
        ec8ocbG3gw0kwStgJ7H04A4mEJtFQFXi0eqj7BBxQYmTM5+wgNiiAkkSHzfMAFsmLOAqMWXH
        UVYQm1lAXOLWk/lgvSIC+RLLFm8FO4JZYCajxNTr09khth1mlPi8+BfYJDYBQ4neo32MIDan
        gK3Es2cHmUEuZRZQl1g/TwhiqLzE9rdzmCcwCs1CcscsJPtmIXTMQtKxgJFlFaNIamlxbnpu
        sZFecWJucWleul5yfu4mRmCcbTv2c8sOxpWvPuodYmTiYDzEKMHBrCTCm+SamyjEm5JYWZVa
        lB9fVJqTWnyI0RQYFhOZpUST84GRnlcSb2hmYGpoYmZpYGppZqwkzmtyZE28kEB6Yklqdmpq
        QWoRTB8TB6dUA5Peki+ubNM3Xpqp82bmemklHbEpJzXmzy1c0nmhZInSkxStf1VfV0dN9Zq8
        s5R7b+dNp/8S1geWBom1vTWrWLEtb+ElFwmO7/8+qX3b0yse+Dxeo7k/e+2WuVK/NXb4tFXM
        /8jxqPzSFK9J+5s2NYowsd2w3iPmLrm6/OnNLx32jE6Hnz8UP8t8WCrszNJbYjFvn0/k2XjU
        4NDc6gJhpmsem3ZtX89p7z1rn+jm7yYMB5U++Kpb71rOpPEx3fXQTYlDm9z3dvhf5Cnn+uDv
        YDOD6+anW8YaD1x77yidYe26YJmowsiwsSz7nPR+Yb2EBRvs9CbNW8f/L3JlmM/So9sE366J
        CbC0nya98wWny8l/SizFGYmGWsxFxYkA1t7jEzwDAAA=
X-CMS-MailID: 20211019081210eucas1p23be643e805efed44708a5fa95942dfcf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211018132100eucas1p18d6e292cf0c45cecc94313e0bcaba24f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211018132100eucas1p18d6e292cf0c45cecc94313e0bcaba24f
References: <20211018125456.8292-1-m.szyprowski@samsung.com>
        <CGME20211018132100eucas1p18d6e292cf0c45cecc94313e0bcaba24f@eucas1p1.samsung.com>
        <20211018125456.8292-2-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18.10.2021 14:54, Marek Szyprowski wrote:
> __clk_lookup() interface is obsolete, so remove it from the Samsung clock
> drivers. This has been achieved by getting rid of custom _get_rate()
> helper and replacing it with clk_hw_get_rate().
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
> v2: moved include/dt-bindings/clock/exynos*.h changes to separate file

Patch applied, thank you.

