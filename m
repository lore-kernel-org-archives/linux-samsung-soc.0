Return-Path: <SRS0=sb5j=YW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433B5C47E49
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 10:36:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17D33214B2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 10:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BuwT7aYq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfJ2Kgy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 29 Oct 2019 06:36:54 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41447 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbfJ2Kgy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 06:36:54 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191029103652euoutp02c074586cab86381c3080bbc463ec05bd~SF9JUR0-T2345423454euoutp02A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2019 10:36:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191029103652euoutp02c074586cab86381c3080bbc463ec05bd~SF9JUR0-T2345423454euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572345412;
        bh=wsOlogYyKVWHtjwly+VzQvwFftHCoPcv3ZdC7XtJCYs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=BuwT7aYqbYe4hWBT1p2GfqriFhSQKAxPtAevJGgo16IMOMXuq90T9qrvn1+czJ3G+
         L0iTTdl2q0t1HH5tUOlMerTXCy6yTkVcT0dIChqbhqoVQvBjVxFxNYrtxQn3ddcFwT
         irvOsWgk7jYGyo6jOkAWMLdE1RKliq+hU1keJlgs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191029103651eucas1p28c6749bd89a75f05145bbe5a36bef04a~SF9I_BQzE1818618186eucas1p2N;
        Tue, 29 Oct 2019 10:36:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 13.28.04469.34618BD5; Tue, 29
        Oct 2019 10:36:51 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191029103651eucas1p17564e2615c30666d791249cf73a5f7a6~SF9Ir7gXH1073510735eucas1p18;
        Tue, 29 Oct 2019 10:36:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191029103651eusmtrp1bf38421b817143aaeb8e9ccbaa87074b~SF9IrYI0v0774007740eusmtrp1b;
        Tue, 29 Oct 2019 10:36:51 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-65-5db81643cf71
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 43.BB.04166.34618BD5; Tue, 29
        Oct 2019 10:36:51 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191029103651eusmtip1c84363988b619069668ed6fe086e4396~SF9IfLSik1155011550eusmtip1B;
        Tue, 29 Oct 2019 10:36:51 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5420: Preserve CPU clocks
 configuration during suspend/resume
To:     Marian Mihailescu <mihailescu2m@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <97a6583c-3c5c-40c0-3bcf-9017e9bc2773@samsung.com>
Date:   Tue, 29 Oct 2019 11:36:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029005025.4476-1-mihailescu2m@gmail.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LZduznOV1nsR2xBpf+qlp87LnHajHj/D4m
        i/XTfrI6MHvsnHWX3ePzJrkApigum5TUnMyy1CJ9uwSujItHnjEWLOGsmLy+qIHxNnsXIyeH
        hICJxNQnzWxdjFwcQgIrGCXu/PvODuF8YZT49f0/lPOZUeJP9x5mmJZz004zgthCAssZJd7t
        q4Aoesso8WPOSxaQhLBAhsStR69YQWwRAT2J/wt3sYHYzAI+Eq/bm8F2swkYSvQe7QMbxCtg
        J7H69W2wGhYBVYlTDQeYuhg5OEQFIiROf02EKBGUODnzCdh4TgFria13dzJCjBSXaPqykhXC
        lpfY/nYOM8g9EgL/2SRu7znNCnG0i8Tcef+YIGxhiVfHt0D9LyNxenIPC0RDM6NEz+7b7BDO
        BEaJ+8cXMEJUWUscPn6RFeQiZgFNifW79CHCjhJvDuwCO1RCgE/ixltBiCP4JCZtm84MEeaV
        6GgTgqhWkfi9ajrUCVIS3U/+s0xgVJqF5LVZSN6ZheSdWQh7FzCyrGIUTy0tzk1PLTbMSy3X
        K07MLS7NS9dLzs/dxAhMHaf/Hf+0g/HrpaRDjAIcjEo8vBMub4sVYk0sK67MPcQowcGsJMJ7
        8QxQiDclsbIqtSg/vqg0J7X4EKM0B4uSOG81w4NoIYH0xJLU7NTUgtQimCwTB6dUA2OK4V2L
        q4uaz50X8NoVdJb3QoH40loPma7Oc9fM15gKna8xUVgntmy1/0XXz8erQ/+6Pb830zqqpOdq
        jPLJvba5x3KiAi/tmpm3d24219Hfn9L02DJupHikJldNS5ll6jed8UhZob72OzuJ+Ak9Hhkp
        GxOzGH5dcTL885B9UvecFXtMXuy4ckyJpTgj0VCLuag4EQAfx2HzGQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xu7rOYjtiDf7uF7b42HOP1WLG+X1M
        Fuun/WR1YPbYOesuu8fnTXIBTFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkam
        Svp2NimpOZllqUX6dgl6GRePPGMsWMJZMXl9UQPjbfYuRk4OCQETiXPTTjN2MXJxCAksZZQ4
        +HkaSxcjB1BCSmJ+ixJEjbDEn2tdbBA1rxkluu9tZARJCAtkSNx69IoVxBYR0JP4v3AXVFEf
        o8S8S9uZQRLMAj4Sr9ubwbaxCRhK9B7tA2vmFbCTWP36NhuIzSKgKnGq4QATiC0qECHxfPsN
        qBpBiZMzn7CA2JwC1hJb7+5khJipLvFn3iWo+eISTV9WskLY8hLb385hnsAoNAtJ+ywkLbOQ
        tMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYLRsO/Zz8w7GSxuDDzEKcDAq8fBO
        uLwtVog1say4MvcQowQHs5II78UzQCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB0ZyXkm8
        oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRtfoH11xC+x7DSdsvikx
        QXvL+oJu/s7MOVsrWLcnyc3IvXTT7cpX5bPtRhob83ce6lX3ZGtz69BwiJ71noe9XmvXw9Xh
        v9dMftuz7z27Xt6hzEYLi1NS+w40aD0J4t15YqJMzZmHc5ZF7N/yfsrCex/cfzddd5uYuqhq
        zhGp74kXz3HeWjH1XKASS3FGoqEWc1FxIgAtrSBRrAIAAA==
X-CMS-MailID: 20191029103651eucas1p17564e2615c30666d791249cf73a5f7a6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191029005041epcas3p3be88dd1df53b124f5642259784d8b1c6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191029005041epcas3p3be88dd1df53b124f5642259784d8b1c6
References: <CGME20191029005041epcas3p3be88dd1df53b124f5642259784d8b1c6@epcas3p3.samsung.com>
        <20191029005025.4476-1-mihailescu2m@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/29/19 01:50, Marian Mihailescu wrote:
> Save and restore top PLL related configuration registers for big (APLL)
> and LITTLE (KPLL) cores during suspend/resume cycle. So far, CPU clocks
> were reset to default values after suspend/resume cycle and performance
> after system resume was affected when performance governor has been selected.
> 
> Fixes: 773424326b51 ("clk: samsung: exynos5420: add more registers to restore list")
> Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>

Patch applied, thank you.
Please remember to also Cc in future any clk patches to the linux-clk@vger.kernel.org 
mailing list.

> ---
>  drivers/clk/samsung/clk-exynos5420.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 403b5a367a5b..3a991ca1ee36 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -165,6 +165,8 @@ static const unsigned long exynos5x_clk_regs[] __initconst = {
>  	GATE_BUS_CPU,
>  	GATE_SCLK_CPU,
>  	CLKOUT_CMU_CPU,
> +	APLL_CON0,
> +	KPLL_CON0,
>  	CPLL_CON0,
>  	DPLL_CON0,
>  	EPLL_CON0,

