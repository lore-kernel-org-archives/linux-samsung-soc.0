Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A1FC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 17:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1612E610E5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 17:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhDHRiN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Apr 2021 13:38:13 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63521 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbhDHRiN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 13:38:13 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210408173800euoutp02c76fe6c2a4661005f01f8934c2a97142~z8qS8ueWD2394223942euoutp027
        for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Apr 2021 17:38:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210408173800euoutp02c76fe6c2a4661005f01f8934c2a97142~z8qS8ueWD2394223942euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617903480;
        bh=vquHiqaALnuuLU6zMICX31IWiyI0/05OP6X0GBydTlk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=MGRAtYVW0j6/0X2mW/xxeM4RIR6MMKiroE+yiHCeDWYb+MxPJJiVcPpvfGAblgUAZ
         FFZHDkuekUr95yLEWVcvUEfAlvX7hU0IBBCXVpCXQpvOLGugHUi8mTMq0lFxAyS9Yc
         7wWHiNy1RAjRfkK0UPiCRR7yf0f4UzjLpS8xm7QU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210408173759eucas1p247ccd7fcfbd34e45ed128b7e9404c239~z8qSJCIYW2437624376eucas1p25;
        Thu,  8 Apr 2021 17:37:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id BF.33.09444.77F3F606; Thu,  8
        Apr 2021 18:37:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210408173758eucas1p135532a2db61e8b5ad8467a7d6b6343aa~z8qRfokOn0576305763eucas1p1K;
        Thu,  8 Apr 2021 17:37:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210408173758eusmtrp15df24cb7c6e7a26fb3cdd59c52de7d33~z8qRe6BWe0555405554eusmtrp1_;
        Thu,  8 Apr 2021 17:37:58 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-b7-606f3f77c881
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id FC.39.08696.67F3F606; Thu,  8
        Apr 2021 18:37:58 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210408173758eusmtip227bbb5404894f496ec51c839c46bd187~z8qQwcq6v1122911229eusmtip2L;
        Thu,  8 Apr 2021 17:37:58 +0000 (GMT)
Subject: Re: [PATCH -next] clk: samsung: Remove redundant dev_err calls
To:     Chen Hui <clare.chenhui@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, cw00.choi@samsung.com,
        tomasz.figa@gmail.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <e8ac725b-b1f5-1631-53bb-fcd0e6c44a96@samsung.com>
Date:   Thu, 8 Apr 2021 19:37:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <38c703df-2bfc-6492-ab2f-344ffc2647a1@canonical.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87rl9vkJBgsfy1mcaDvEaHH9y3NW
        i41vfzBZbHp8jdXiY889VovLu+awWcw4v4/J4uIpV4t/1zayWKza9YfRgcvj/Y1Wdo9ZDb1s
        Hjtn3WX3aDnyltVj06pONo/NS+o9+rasYvT4vEkugCOKyyYlNSezLLVI3y6BK+Pv1n2MBRtZ
        Kg4ffcLWwHiduYuRk0NCwETi54nFbF2MXBxCAisYJQ7uXMoE4XxhlNh3+z47hPOZUWLGrWZ2
        mJYNLXOhWpYzSkza1Q3lfGSU+Lz7IBtIlbCAu8SDtx0sILaIQJLEp91vwRYyCzxmlFhyQRDE
        ZhMwlOg92scIYvMK2ElMuP8NrJ5FQEVi7sSNYHFRoN6lj/5B1QhKnJz5BKyGU8BRYvr6+6wQ
        M8Ulbj2ZzwRhy0tsfzuHGeQgCYFuTonJTxqgznaReHe+EeprYYlXx7dAxWUkTk/uYYFoaGaU
        6Nl9mx3CmcAocf/4AkaIKmuJO+d+Ab3GAbRCU2L9Ln0QUwLoissPxSBMPokbbwUhbuCTmLRt
        OjNEmFeio00IYoaKxO9V05kgbCmJ7if/WSYwKs1C8tksJN/MQvLNLIS1CxhZVjGKp5YW56an
        FhvlpZbrFSfmFpfmpesl5+duYgQmr9P/jn/Zwbj81Ue9Q4xMHIyHGCU4mJVEeHf0ZicI8aYk
        VlalFuXHF5XmpBYfYpTmYFES503asiZeSCA9sSQ1OzW1ILUIJsvEwSnVwOT157p5w+3i3KfM
        kyLDPtkv8sntbp+1sLrc+fQMaaZa9dpJGtmfzhw/Lcep93/Bwaf2T5WevZs+K+++leaEnG+z
        DKetf2KRw/Bh9ipfObP8DNG7lziWZviVxpYv4L2yYWFhx95eZRXundlF0tv2vW/dx80YuFDE
        6tvKkw0lWy46r7l0/+iyg7FsQqufS6/R0DSK81z1f01G99YiB7blPNweF70j9FdovFwoqjNj
        r/wxp/L6N4GtSx/W6xquj+F4YCx/tNCVW2GtyrldPu0XLl8xZpBM9rgzyUOk3Z1dasWe/fdy
        7zxv9wsyv9a7Y8H8nT9C2L/8K/nx+OtetmlrSoUN01srZ13Ruvzs5ITLid+UWIozEg21mIuK
        EwEuDvLJzQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7pl9vkJBpeO6FucaDvEaHH9y3NW
        i41vfzBZbHp8jdXiY889VovLu+awWcw4v4/J4uIpV4t/1zayWKza9YfRgcvj/Y1Wdo9ZDb1s
        Hjtn3WX3aDnyltVj06pONo/NS+o9+rasYvT4vEkugCNKz6Yov7QkVSEjv7jEVina0MJIz9DS
        Qs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+Pv1n2MBRtZKg4ffcLWwHiduYuRk0NCwERi
        Q8tcti5GLg4hgaWMEtc+vgByOIASUhLzW5QgaoQl/lzrgqp5zyhx/+R0NpCEsIC7xIO3HSwg
        tohAksT0ZdPZQYqYBR4zSjQePsUM0XGSUeLG/FlMIFVsAoYSvUf7GEFsXgE7iQn3v4F1swio
        SMyduBEsLgo0qW33THaIGkGJkzOfgNVwCjhKTF9/nxXEZhZQl/gz7xIzhC0ucevJfCYIW15i
        +9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIzXbcd+
        btnBuPLVR71DjEwcjIcYJTiYlUR4d/RmJwjxpiRWVqUW5ccXleakFh9iNAX6ZyKzlGhyPjBh
        5JXEG5oZmBqamFkamFqaGSuJ85ocWRMvJJCeWJKanZpakFoE08fEwSnVwOQUy108VzP+RU+C
        z9QE8w2GHjtZXpzbvev6i792SsnNl1ZFXM9sdXbbuibD1Lv7vJrgbqFbp7T1GDNmKgd9q06K
        Md7o96Jh72vL+8UHj2luWLB43wa39deFVBeHrWheeCq1vqq2NuXwkwm1d53zI03mZsztc68W
        qnpzTeHHKc3Cd0Zb1z4vq1Q7vrKk+9mrbRzTX307tPHNvO/XN1nziE8rnOCiu7P+ctfLWWe1
        Y4tv2qsW1/4U6/h4qd7+t/Y7nnWtr3J2Ms0pfCt2Sm737adBedzdCQqTkzL5vij8nabuvvlN
        n63plvQTMbpTtrk+3h9ptnfi2gnlS9sDeZy3X7pr9ElX93TW9ilPkr5WKX9XYinOSDTUYi4q
        TgQAWqjXzWADAAA=
X-CMS-MailID: 20210408173758eucas1p135532a2db61e8b5ad8467a7d6b6343aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210408162200eucas1p2054f6241f2bad360e52ec09dd112583d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210408162200eucas1p2054f6241f2bad360e52ec09dd112583d
References: <20210408134856.207305-1-clare.chenhui@huawei.com>
        <CGME20210408162200eucas1p2054f6241f2bad360e52ec09dd112583d@eucas1p2.samsung.com>
        <38c703df-2bfc-6492-ab2f-344ffc2647a1@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.04.2021 18:21, Krzysztof Kozlowski wrote:
> On 08/04/2021 15:48, Chen Hui wrote:
>> There is error message within devm_ioremap_resource
>> already, so remove the dev_err calls to avoid redundant
>> error messages.
>>
>> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
>> ---
>>  drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
>>  drivers/clk/samsung/clk-s5pv210-audss.c  | 4 +---
>>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thank you, patch applied.
