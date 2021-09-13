Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786F6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 16:10:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F80060698
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 16:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345611AbhIMQMH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:12:07 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33130 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344789AbhIMQMG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 12:12:06 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210913161049euoutp0120f14f709a0cfa1c58adfe4d0a7d255d~kbZRmtT4p0837708377euoutp01N
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Sep 2021 16:10:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210913161049euoutp0120f14f709a0cfa1c58adfe4d0a7d255d~kbZRmtT4p0837708377euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1631549449;
        bh=Zx8D72epb2PdIAupmljFTtGZ+DY+cmCbD9kHxLWNdyc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=YSJssw0MoxceKzl/PWy+AaV5chfkQDs4sYNnJJh+GpNcHgbBbKJX1zxxYIl2alZZ7
         4veLc2VxoF6tCkpNWjqkP+1mPyAL2BTLQCjibZ/33XJje5gnf3RQLwbCQtDmwRsK0s
         kAbxJAg10YAnWFn2Qtcs9aP/wF5MulMInkq/BTi8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210913161048eucas1p267aee7ce54e94beb4d4e6adca6c75b22~kbZRVtuTM2793827938eucas1p2K;
        Mon, 13 Sep 2021 16:10:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 2F.BE.42068.8087F316; Mon, 13
        Sep 2021 17:10:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210913161048eucas1p2b41cd188521dfba255bd47da7e677a42~kbZQoHtI12793827938eucas1p2I;
        Mon, 13 Sep 2021 16:10:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210913161048eusmtrp1c16b3a5bcecf6e12f4d46664a8584b0a~kbZQnPaEs0906809068eusmtrp1O;
        Mon, 13 Sep 2021 16:10:48 +0000 (GMT)
X-AuditID: cbfec7f4-c89ff7000002a454-c2-613f78082e79
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F3.61.20981.7087F316; Mon, 13
        Sep 2021 17:10:47 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210913161047eusmtip2674b7de0c52c723e10efd72d30cd86d6~kbZQCQ33W2037120371eusmtip2u;
        Mon, 13 Sep 2021 16:10:47 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos-audss: Make use of the helper
 function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <1ff69b9c-fe27-5da8-8908-c9777be0f72c@samsung.com>
Date:   Mon, 13 Sep 2021 18:10:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210907085100.4152-1-caihuoqing@baidu.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djPc7ocFfaJBt+ua1msufeXzeL6l+es
        Fhvf/mCy2PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhb/rm1ksVi16w+jA5fHl6XNzB7vb7Sy
        e8xq6GXz2DnrLrvHplWdbB6bl9R79G1ZxejxeZNcAEcUl01Kak5mWWqRvl0CV8a87dtZCi5x
        V5zpPcLcwHiPs4uRg0NCwETi47+MLkYuDiGBFYwSc7ceZYRwvjBKtP+5yQbhfGaUOL9zN1CG
        E6xj35eXUInljBLHNt5mgXA+Mkq8udgHViUsUCyxZfULZhBbREBNYsqk6ewgRcwCD5gkbq1+
        wgSSYBMwlOg9CtHAK2AnseH9NzYQm0VAVeLTyecsILaoQLLEtL9NzBA1ghInZz4Bi3MKWEpM
        37cezGYWEJe49WQ+E4QtL7H97RxmkGUSAt2cEpcO/4G620Vi8d+LLBC2sMSr41vYIWwZidOT
        e1ggGpoZJXp232aHcCYwStw/vgCq21rizrlfbKAwYxbQlFi/Sx8SfI4SR2Z5Q5h8EjfeCkLc
        wCcxadt0Zogwr0RHmxDEDBWJ36umM0HYUhLdT/6zTGBUmoXks1lIvpmF5JtZCGsXMLKsYhRP
        LS3OTU8tNspLLdcrTswtLs1L10vOz93ECExep/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nwbntj
        myjEm5JYWZValB9fVJqTWnyIUZqDRUmcN2nLmnghgfTEktTs1NSC1CKYLBMHp1QDU+ZSySuW
        07h3PBW4fOfcYb+SgMxrtya3u8fZvGHgeF87Z+/2NgfbzInyS9vvGpUcaLc99HaPzAyFZW8+
        pia8elvmcTr93renHGvcrqleUtlce8pwg8SUVrG0NyyNLCVlD3Uu3b0cs61mbc9LJzflruQn
        v0sVfPrP9ah6f6v+IZTXWp3SVFa0ZIHPPTe5Ob96Nn1YJ562yWD3x0mlblUTJULy43/7Pp3g
        NmfC7u2njUoMiry/PTfvNIiMDXweuXOipd2mDXzHCrXjvVQOs+x3mbNnf6LGk6Ozlu74I/0t
        qPXIZoabh+c/urz3CdtCFxmhF/F/JJZMZFVgPJa6SX6N2tsGvdurLl0WuSwW62fbvU+JpTgj
        0VCLuag4EQCcxZByzQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xe7rsFfaJBvtnWlmsufeXzeL6l+es
        Fhvf/mCy2PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhb/rm1ksVi16w+jA5fHl6XNzB7vb7Sy
        e8xq6GXz2DnrLrvHplWdbB6bl9R79G1ZxejxeZNcAEeUnk1RfmlJqkJGfnGJrVK0oYWRnqGl
        hZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsa87dtZCi5xV5zpPcLcwHiPs4uRk0NCwERi
        35eXbF2MXBxCAksZJa7fb2fvYuQASkhJzG9RgqgRlvhzrQuq5j2jxOcXnxhBEsICxRJbVr9g
        BrFFBNQkpkyazg5SxCzwgEliyq8z7BAdPYwS699dYQGpYhMwlOg92gfWzStgJ7Hh/Tc2EJtF
        QFXi08nnYDWiAskSb19/Z4KoEZQ4OfMJWJxTwFJi+r71YDazgLrEn3mXmCFscYlbT+YzQdjy
        EtvfzmGewCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgvG47
        9nPLDsaVrz7qHWJk4mA8xCjBwawkwrvtjW2iEG9KYmVValF+fFFpTmrxIUZToH8mMkuJJucD
        E0ZeSbyhmYGpoYmZpYGppZmxkjivyZE18UIC6YklqdmpqQWpRTB9TBycUg1MM09FGWx7Yjwz
        w2ljj7JGWnls6Z1DvqlhO+SE13xhvFS29+C3X726iq8T/xo/yr3Cr/78SUKqMkvkgcC0dQnP
        85JiG5rzX7x8y1n8vF545pcozoRdnBzv+dINJGZwfBPaldxfF99j8f6kYfshptPTC2UmPPxR
        9rBlMScX43T2CD2LNZ+byoPNb85k2KpkmqVczVzH+SM//8bfpK3J808HP1ZTObVYZH/mRbnf
        Cb2HvGcx9+wyNhBKlHdi1+V+YXtqziSBqxdLbQMnxE578z3w7hZfm8AnDuv8/eplhTfW6/26
        zjR5nlToySOK94zvZR3f95Dr4G+BLXo97aeiyjdXMEyKVCo79DPwrYTbzL9KLMUZiYZazEXF
        iQBiPVqXYAMAAA==
X-CMS-MailID: 20210913161048eucas1p2b41cd188521dfba255bd47da7e677a42
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210907085111eucas1p12e14f7d5f4ec4cebfbde4f26e68754c3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210907085111eucas1p12e14f7d5f4ec4cebfbde4f26e68754c3
References: <CGME20210907085111eucas1p12e14f7d5f4ec4cebfbde4f26e68754c3@eucas1p1.samsung.com>
        <20210907085100.4152-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07.09.2021 10:50, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Thanks for the patch. I have applied it with summary line changed to 
"clk: samsung: exynos-audss: Make use of devm_platform_ioremap_resource()"
so it doesn't exceed 75 characters.

> ---
>  drivers/clk/samsung/clk-exynos-audss.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
> index 42b5d32c6cc7..9cc127a162ad 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -129,7 +129,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  	struct clk *pll_ref, *pll_in, *cdclk, *sclk_audio, *sclk_pcm_in;
>  	const struct exynos_audss_clk_drvdata *variant;
>  	struct clk_hw **clk_table;
> -	struct resource *res;
>  	struct device *dev = &pdev->dev;
>  	int i, ret = 0;
>  
> @@ -137,8 +136,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  	if (!variant)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	reg_base = devm_ioremap_resource(dev, res);
> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(reg_base))
>  		return PTR_ERR(reg_base);
-- 
Regards,
Sylwester
