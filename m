Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E777C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Nov 2021 09:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239049AbhKVJ4k (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Nov 2021 04:56:40 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41130 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbhKVJ4k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:56:40 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211122095332euoutp02f26df122ec6240373e9c900fa6fd3685~51Z2SwD1I0172501725euoutp02s
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 09:53:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211122095332euoutp02f26df122ec6240373e9c900fa6fd3685~51Z2SwD1I0172501725euoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637574812;
        bh=1DsjXNko7rd8YZ0oM/fefpj+Mam+cIvi2IQj8grbPFM=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=KSwsw1YY1DNHg+3erdEVZDX5BdHD1AMz5hmfVHgMZoUka19ftJJ0QISPF28DHAXGE
         PmPY7Xs+Wo95tRggEToIT5LrgnceoTioYSbzPzq622sLBoomBVR5EaNxYFLptuSexN
         aQq67qpFlxLoyVIpO/f2Mdjr0pZ2zp45kjpyRZ9Q=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211122095331eucas1p16f7af3f13dfe2f188f6d542ae6b9bb82~51Z1-YL5e1250312503eucas1p1k;
        Mon, 22 Nov 2021 09:53:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id ED.C5.09887.B986B916; Mon, 22
        Nov 2021 09:53:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211122095331eucas1p1de320ad6ceb4138eae0d801f87944dca~51Z1ci5ij1468214682eucas1p1E;
        Mon, 22 Nov 2021 09:53:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211122095331eusmtrp2f4575b8d9f895537bbf606fd36cec282~51Z1bmYHH0380303803eusmtrp2J;
        Mon, 22 Nov 2021 09:53:31 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-2d-619b689ba74e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D4.5F.09522.B986B916; Mon, 22
        Nov 2021 09:53:31 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211122095330eusmtip1691380f6365ad39a207037888f3baa9b~51Z0uGXtP3036730367eusmtip1B;
        Mon, 22 Nov 2021 09:53:30 +0000 (GMT)
Message-ID: <b0cbe955-28dc-aeeb-51de-6617286e7b4e@samsung.com>
Date:   Mon, 22 Nov 2021 10:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/6] dt-bindings: clock: Add bindings for Exynos850
 CMU_APM
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211121232741.6967-2-semen.protsenko@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWy7djPc7qzM2YnGrTtNLC4/uU5q8X8I+dY
        LTa+/cFksenxNVaLjz33WC0u75rDZjHj/D4mi4unXC1+HO9jtmjde4Td4t+1jSwWz/uA4qt2
        /WG0OP7+MaMDn8f7G63sHrMaetk8ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkAjigu
        m5TUnMyy1CJ9uwSujA1rV7MXzGKpeLdqGWsD41HmLkZODgkBE4mTH/eygthCAisYJZ63RnQx
        cgHZXxgl5jTsYoNwPjNK3J5ygB2mY/XK5VAdyxkl7kzRgij6yCgx99gNsLG8AnYSd0/dZgKx
        WQRUJfo33IGKC0qcnPmEBcQWFUiSON06CSwuLBAo0TpvGhuIzSwgLnHryXwmkKEiAiuYJB5M
        n8UK4jAL9DFJnPnyH2wqm4ChRO/RPkYQm1PAXuL6tmlMEN3yEtvfzmEGaZAQWM0p0bX9FhPE
        3S4S21ous0LYwhKvjm+B+kdG4v9OiHUSAs2MEj27b7NDOBMYJe4fX8AIUWUtcefcL6ADOYBW
        aEqs36UPEXaU+HLhIDNIWEKAT+LGW0GII/gkJm2bDhXmlehoE4KoVpH4vWo61DlSEt1P/rNM
        YFSahRQws5ACYBaSd2Yh7F3AyLKKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMM2d/nf8
        yw7G5a8+6h1iZOJgPMQowcGsJMLLsWF6ohBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFekT8NiUIC
        6YklqdmpqQWpRTBZJg5OqQYmx/vTZZ7YJgbIHilpl1vFNPXhDv6DF0KjLQO+3pXfOd3DZY3c
        cgGjrEYlvU0/tn+WC0lR3Pmow/Zl1L/VocY5BksPrQvS1Mw4lfc1ysGC+0XEsrjjOZlvnwo8
        /GnSslmKz3Rx6V3fA1oLs3bdknTTnTnzZhunb4Trl9z7TdMVhT5mP4oVY1c51S+5p0d46aJZ
        CTlZ++LlnvmtVY7hu/R899N1PRcvml4TPLru5uqIvWwP389UvFRuv/Dcg0di3wKXHrFLf5dc
        UBCdF2++X6Db7Yu/wb+dk49caWSc5vQl39iU9fbW1aY6j3WUb6/sOy4WJt5Y0zsx7QPX3a2Z
        Z2UeGn8tkg+U0fJzlA2dfjBPiaU4I9FQi7moOBEA7el2OeIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsVy+t/xu7qzM2YnGszZxG9x/ctzVov5R86x
        Wmx8+4PJYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbNG69wi7xb9rG1ksnvcBxVft
        +sNocfz9Y0YHPo/3N1rZPWY19LJ57Jx1l91j06pONo871/aweWxeUu/Rt2UVo8fnTXIBHFF6
        NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GRvWrmYv
        mMVS8W7VMtYGxqPMXYycHBICJhKrVy5n7WLk4hASWMoocXLvZKYuRg6ghJTE/BYliBphiT/X
        utggat4zSmzbv5kFJMErYCdx99RtJhCbRUBVon/DHWaIuKDEyZlPwGpEBZIk+r/vAosLCwRK
        tM6bxgZiMwuIS9x6Mp8JZKiIwComiRcP+hhBHGaBCUwSczr3MkKsO84o8fPDIlaQFjYBQ4ne
        oyBVnBycAvYS17dNAzuVWUBdYv08IYip8hLb385hnsAoNAvJIbOQLJyF0DELSccCRpZVjCKp
        pcW56bnFhnrFibnFpXnpesn5uZsYgVG97djPzTsY5736qHeIkYmD8RCjBAezkggvx4bpiUK8
        KYmVValF+fFFpTmpxYcYTYGBMZFZSjQ5H5hW8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNIT
        S1KzU1MLUotg+pg4OKUamASiVugpMESKpF10Cq1jsWGab2cyveost17FdMZ0G5mYjyFusgVW
        mwymbbyt+XnngzWBnqfKE6++/DhVcD3Dy5Ygmb/OTNs9j5XcO70j4LqsdYhpiv6T/XdNamNM
        ZCZOfMu/ht9WmKnkK9OvLeoibxvjzu3fMpF3x68lnAsXTZ5WtvXt2uw9Wy+I+Nc+rnVeyvvy
        +dFtiybq1f9PzRPVYLsm+n+5yyyGbMOg7u54pnpeTcOVSnYnJr3vdeyUWZzyUVEsdycnx7wH
        J/8t433cXDz3c/dh5t2J+1KsL2l52oRmiOx28lZ4Nzl62+xM0fd/Nfis6jl93zit+L1VZ6b4
        rRuKoRlz3iqaLPWK1M9VV2Ipzkg01GIuKk4EANg78qFzAwAA
X-CMS-MailID: 20211122095331eucas1p1de320ad6ceb4138eae0d801f87944dca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211121232750eucas1p28779b6d9983dad26d848bf24831e55ca
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211121232750eucas1p28779b6d9983dad26d848bf24831e55ca
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
        <CGME20211121232750eucas1p28779b6d9983dad26d848bf24831e55ca@eucas1p2.samsung.com>
        <20211121232741.6967-2-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22.11.2021 00:27, Sam Protsenko wrote:
> CMU_APM generates clocks for APM IP-core (Active Power Management). In
> particular it generates RTC clocks, which are needed to enable rtc-s3c
> driver on Exynos850 SoC.
> 
> Add clock indices and binding documentation for CMU_APM.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Applied, thanks.

