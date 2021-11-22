Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBADC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Nov 2021 10:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238774AbhKVKDu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Nov 2021 05:03:50 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48210 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239058AbhKVKDt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 05:03:49 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211122100042euoutp02b810472cbad2742f89747b081385cfe6~51gGtuT8v1182911829euoutp02T
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 10:00:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211122100042euoutp02b810472cbad2742f89747b081385cfe6~51gGtuT8v1182911829euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637575242;
        bh=1X4c6bRA2iiPJOKEpNNBw6BQVKzsV8I9BWKl8K5rlEo=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=H+QNVNJPpdQa22csnTwxIYqkaLAgQWvJshITYD/540uNcYHxslnE3sa7o9B6rAXDV
         bSBbe+DugbI6xfl8LkFhOY9gu1scmhBU1s5IgMuFKASwmabVVmkFXyMgnjKzRHR1Fh
         5AaHURQhq9ASZG3hKpWjUoI/Xd8TAe2bjwaLyqjk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211122100041eucas1p17f81746a9507c53810a8a5edeff8b64f~51gGL8D7Q0755507555eucas1p1N;
        Mon, 22 Nov 2021 10:00:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 9E.57.09887.94A6B916; Mon, 22
        Nov 2021 10:00:41 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211122100041eucas1p186bc8e0e723c119713867d18fae8ea62~51gFrDZCU1426114261eucas1p1K;
        Mon, 22 Nov 2021 10:00:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211122100041eusmtrp20813e07eba73e583691035fe4560f112~51gFqMFmL0866808668eusmtrp2y;
        Mon, 22 Nov 2021 10:00:41 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-0f-619b6a492c46
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 86.AB.09404.84A6B916; Mon, 22
        Nov 2021 10:00:41 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211122100040eusmtip29a33ce9c0a42fd40f6048b898cd6b0c7~51gE8rMVE2908529085eusmtip22;
        Mon, 22 Nov 2021 10:00:40 +0000 (GMT)
Message-ID: <b1ce8a8e-d8aa-f9e5-27db-fa1455ea00f0@samsung.com>
Date:   Mon, 22 Nov 2021 11:00:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 5/6] clk: samsung: exynos850: Register clocks early
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211121232741.6967-6-semen.protsenko@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHKsWRmVeSWpSXmKPExsWy7djPc7qeWbMTDXonKVlc//Kc1WL+kXOs
        Fhvf/mCy2PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhY/jvcxW7TuPcJu8e/aRhaL531A8VW7
        /jBaHH//mNGBz+P9jVZ2j1kNvWweO2fdZffYtKqTzePOtT1sHpuX1Hv0bVnF6PF5k1wARxSX
        TUpqTmZZapG+XQJXxpHu5+wFOzkrunetY2xgPMrexcjJISFgIvFt71SmLkYuDiGBFYwSO750
        skM4XxglLn1YxAxSJSTwmVFi10wRmI6vy1dBdSxnlOh6vwWq6COjxJUGXhCbV8BOYu/hqSwg
        NouAqkTnvP8sEHFBiZMzn4DZogJJEqdbJ4H1Cgu4S7x5sYsVxGYWEJe49WQ+E4gtIqAnsW7m
        K7CLmAW6WCT6dvazgSTYBAwleo/2MYLYnAL2EpOXXWWDaJaX2P52DjNIg4TAck6J2Tt6mSHO
        dpG49aiXEcIWlnh1fAs0AGQk/u+czwTR0Mwo0bP7NjuEM4FR4v7xBVAd1hJ3zv0CWsEBtEJT
        Yv0ufYiwo8TW/tdgYQkBPokbbwUhjuCTmLRtOjNEmFeio00IolpF4veq6UwQtpRE95P/LBMY
        lWYhhcssJP/PQvLOLIS9CxhZVjGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgQmudP/jn/Z
        wbj81Ue9Q4xMHIyHGCU4mJVEeDk2TE8U4k1JrKxKLcqPLyrNSS0+xCjNwaIkzivypyFRSCA9
        sSQ1OzW1ILUIJsvEwSnVwCTGtYhBi7+59JHjiQPdCmeM9wkeWjvnVdhbi+RJq4VOT11d9Ssj
        amHv8hdK6z1e3zdbEPvxU1VTYlhZ7bmqdnM9/RelfvJbHj3vn6r5LNIppDus85S83ddN5fzC
        5396/+1StDayrGhaphGbf+HCq6Bm/Zlya3hucqzMNJhjWlNW7MDa9sus8BlfR+XFxVHvJqte
        KqwJSzJon95UsOWF2kyV5oyU77HH62YZst39mb6+guHlAQllwS/+WxfUu3rvVO3bm3XguOLR
        kqye8lZHZ/0cr1Ltrm8rj7AeFeI+r3ZY8PEBV1OtsqxFUlW5e1lbFSaelHM5KHNlgXTUj0Yl
        NZVL7Klf+V9MtO1zl/qgxFKckWioxVxUnAgAAO64gOEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7qeWbMTDf61MVpc//Kc1WL+kXOs
        Fhvf/mCy2PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhY/jvcxW7TuPcJu8e/aRhaL531A8VW7
        /jBaHH//mNGBz+P9jVZ2j1kNvWweO2fdZffYtKqTzePOtT1sHpuX1Hv0bVnF6PF5k1wAR5Se
        TVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexpHu5+wF
        OzkrunetY2xgPMrexcjJISFgIvF1+SqmLkYuDiGBpYwST6Z/AUpwACWkJOa3KEHUCEv8udbF
        BlHznlHi34O5LCAJXgE7ib2Hp4LZLAKqEp3z/kPFBSVOznwCZosKJEn0f9/FDGILC7hLvHmx
        ixXEZhYQl7j1ZD4TiC0ioCexbuYrdpAFzAI9LBIzdu9jgdh2nFHi4bujYJPYBAwleo/2MYLY
        nAL2EpOXXWUDuZRZQF1i/TwhiKHyEtvfzmGewCg0C8kds5Dsm4XQMQtJxwJGllWMIqmlxbnp
        ucVGesWJucWleel6yfm5mxiBMb3t2M8tOxhXvvqod4iRiYPxEKMEB7OSCC/HhumJQrwpiZVV
        qUX58UWlOanFhxhNgWExkVlKNDkfmFTySuINzQxMDU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNT
        UwtSi2D6mDg4pRqYuubNq4xK/7in2fWC4OT0pJ3bZG9fu5A858yl+tKLZ1oqL/crZCtabf51
        KvDYtzOychc/zTBfIhrOs5pxh7pYkiTPzuS539L054i7Cin9PhBmuDkvITh9poila4nm2ltu
        yVylbpt937gzqP+aGvZxEtuKPybz/3fkT566+ZVhpp5dpobFvs1e0vqRk/9V1oSxnJwh/k76
        nJuidZSt8d3s57JL1GYIz7sdvJD/hlil1vqHW6sDJJes/mJwvPHZuX4dUykO372BwnoznuW1
        pAfvLJwZlWy55IzaeofN60rVHYL//G8818rMc5/PcrPWIx6j4/PeNeY9fMP0IPTk2fPSS0J0
        /z09uc7yzem9Tr3sSizFGYmGWsxFxYkA5I5n8nIDAAA=
X-CMS-MailID: 20211122100041eucas1p186bc8e0e723c119713867d18fae8ea62
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211121232757eucas1p243a2e8fe3747fff4113d03aa473e71a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211121232757eucas1p243a2e8fe3747fff4113d03aa473e71a7
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
        <CGME20211121232757eucas1p243a2e8fe3747fff4113d03aa473e71a7@eucas1p2.samsung.com>
        <20211121232741.6967-6-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22.11.2021 00:27, Sam Protsenko wrote:
> /* Register Offset definitions for CMU_CORE (0x12000000) */
> @@ -1014,24 +1060,12 @@ static int __init exynos850_cmu_probe(struct platform_device *pdev)
>  {
>  	const struct samsung_cmu_info *info;
>  	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
>  
>  	info = of_device_get_match_data(dev);
> -	exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
> -	samsung_cmu_register_one(np, info);
>  
> -	/* Keep bus clock running, so it's possible to access CMU registers */
> -	if (info->clk_name) {
> -		struct clk *bus_clk;
> -
> -		bus_clk = clk_get(dev, info->clk_name);
> -		if (IS_ERR(bus_clk)) {
> -			pr_err("%s: could not find bus clock %s; err = %ld\n",
> -			       __func__, info->clk_name, PTR_ERR(bus_clk));
> -		} else {
> -			clk_prepare_enable(bus_clk);
> -		}
> -	}


> +	/* Early clocks are already registered using CLK_OF_DECLARE_DRIVER() */
> +	if (info != &peri_cmu_info)
> +		exynos850_register_cmu(dev, dev->of_node, info);
>  

Do you still need this test? How about just removing "samsung,exynos850-cmu-peri"
from exynos850_cmu_of_match[] ?

-- 
Regards,
Sylwester
