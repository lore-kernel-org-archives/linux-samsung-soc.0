Return-Path: <SRS0=YLlK=6V=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C33C38A24
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 May 2020 03:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 298D520725
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 May 2020 03:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Xe1xj13E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgEGDxh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 May 2020 23:53:37 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:18985 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgEGDxg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 May 2020 23:53:36 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200507035332epoutp01aad8a163dbf7a650dd159c976d601dff~Moqhtwhk00784707847epoutp016
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2020 03:53:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200507035332epoutp01aad8a163dbf7a650dd159c976d601dff~Moqhtwhk00784707847epoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1588823612;
        bh=2mtMx9nirXTQyimY69b16lRHz9NJv4CaXko+yxoyLVc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Xe1xj13EN2S+8dCs5BPJfSgYBVQFg00eFM2pwGpS/1FJVMw+BoPpkYvvxiYkvelnk
         qTm51y9kiSApviKDOZjOaNIzsw/2RDpTwoYOWT6YSW7anRau4Wbmfw7aetLtZbF7T2
         M0r6RAo5900FWW/XLn9R4km7cAlCeoiLxoDU6iWQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20200507035332epcas1p4e67cb6ca2e8ae56b0e2fd7b908285d64~MoqhUDOOY2794227942epcas1p4W;
        Thu,  7 May 2020 03:53:32 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 49HfhB1CsxzMqYks; Thu,  7 May
        2020 03:53:30 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        21.3D.04402.73683BE5; Thu,  7 May 2020 12:53:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200507035325epcas1p344b72b806a9e7bd14dbd93759bc4ccae~MoqbPURx52674826748epcas1p3E;
        Thu,  7 May 2020 03:53:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200507035325epsmtrp25c7c422afba4ab5ccbbfd243cab94920~MoqbOnkgM0717907179epsmtrp2c;
        Thu,  7 May 2020 03:53:25 +0000 (GMT)
X-AuditID: b6c32a35-753ff70000001132-d1-5eb3863715a5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        36.34.18461.53683BE5; Thu,  7 May 2020 12:53:25 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200507035325epsmtip16fa6b2623f6129afe2361b91688635fb~MoqbBkXuW1939419394epsmtip1X;
        Thu,  7 May 2020 03:53:25 +0000 (GMT)
Subject: Re: [PATCH 1/2] clk: samsung: Mark top ISP and CAM clocks on
 Exynos542x as critical
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <f8383f5f-64f4-415c-09ca-980f104bbfba@samsung.com>
Date:   Thu, 7 May 2020 13:03:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200506132659.17162-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmvq552+Y4g2srNC02zljPanH+/AZ2
        i48991gtZpzfx2Sx9shddov1036yWvy7tpHFov3pS2YHDo+ds+6ye2xa1cnm0bdlFaPH501y
        ASxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QGco
        KZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgosC/SKE3OLS/PS9ZLzc60MDQyMTIEK
        E7Izlhw/w1hwQaFi7pLb7A2ME6S7GDk5JARMJCa/b2HvYuTiEBLYwShxat5RVpCEkMAnRonT
        l9IhEt8YJfY+/cgI03H5egcTRGIvo0Tz6v+sEM57Rom5XX/YQaqEBeIkJr45B2RzcIgI5EvM
        ehsCUsMscBtoRfdtsElsAloS+1/cYAOx+QUUJa7+eAwW5xWwk3jRuBfsDBYBFYkHHxYyg9ii
        AmESJ7e1QNUISpyc+YQFxOYEqn/ZuxzMZhYQl7j1ZD4ThC0vsf3tHGaQxRICczkkLjZ/ZIF4
        wUVizullULawxKvjW9ghbCmJz+/2skHY1RIrTx5hg2juYJTYsv8CK0TCWGL/0slMIJ8xC2hK
        rN+lDxFWlNj5ey4jxGI+iXdfe1hBSiQEeCU62oQgSpQlLj+4ywRhS0osbu9km8CoNAvJO7OQ
        vDALyQuzEJYtYGRZxSiWWlCcm55abFhgiBzbmxjBSVTLdAfjlHM+hxgFOBiVeHgPLNsUJ8Sa
        WFZcmXuIUYKDWUmEl+fHxjgh3pTEyqrUovz4otKc1OJDjKbA0J7ILCWanA9M8Hkl8YamRsbG
        xhYmhmamhoZK4rxTr+fECQmkJ5akZqemFqQWwfQxcXBKNTCG/X7q5tPnbHNk05dJ5yJOaWqx
        Tvrnuvd+aF/oAYa+Oy+3bmpeHlBYekK3QYnlkmLmio8tTFq2nlNsKq5Pufp2kWznvG1Xt5SL
        /zKMFxCRia3tP9vREcu09upF7oBDDBsv3Z5S4uS05v/N0y1yr/flr76V9OPxxGjPnadOb0t3
        61W0/7/QoLpRiaU4I9FQi7moOBEAvPI9trgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42LZdlhJTte0bXOcwbILBhYbZ6xntTh/fgO7
        xceee6wWM87vY7JYe+Quu8X6aT9ZLf5d28hi0f70JbMDh8fOWXfZPTat6mTz6NuyitHj8ya5
        AJYoLpuU1JzMstQifbsErowlx88wFlxQqJi75DZ7A+ME6S5GTg4JAROJy9c7mLoYuTiEBHYz
        Sux5dJgFIiEpMe3iUeYuRg4gW1ji8OFiiJq3jBKvph9lAqkRFoiTmPjmHDuILSKQLzHjTi8j
        SBGzwF1GifYLEI6QwERGiXfHZ4BVsQloSex/cYMNxOYXUJS4+uMxI4jNK2An8aJxLyuIzSKg
        IvHgw0JmEFtUIExi55LHTBA1ghInZz4Bu44TqP5l73Iwm1lAXeLPvEvMELa4xK0n85kgbHmJ
        7W/nME9gFJ6FpH0WkpZZSFpmIWlZwMiyilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMj
        OKK0NHcwbl/1Qe8QIxMH4yFGCQ5mJRFenh8b44R4UxIrq1KL8uOLSnNSiw8xSnOwKInz3ihc
        GCckkJ5YkpqdmlqQWgSTZeLglGpg2urd1OHXl+o0oeNStfjPtssHJ4deCxBe0nx4+YPv3iVz
        An5qhly/s3uqUGVQgID0y7keWXufmSc088qL3LJT1+a8vmtbkqiYb9a9zUyfdyq/DSrZ8K9u
        6ae5v5P0/P/LKHSre/9afUEq1una1LfXpRuSby4omSSR0jB5Q7nkh4B751+eWqX2lkX1gw0n
        99Pzq1dv6AybPOlA+DTuuW2usjw/pzIqr2JMcj+p6Kn813SGAo/kngXnbuxIqKtnXbpRqLSU
        2XzCHN17DoXb3t5WdLrxTZRfSUvwwOU3GRbL3l40WHFX1N6vcdqt7/Kn6y3fKZ+JzlmlGLfl
        ad/cqDcNb/+7+V3hvhDhu0PP+TdDuRJLcUaioRZzUXEiAOwkAxIXAwAA
X-CMS-MailID: 20200507035325epcas1p344b72b806a9e7bd14dbd93759bc4ccae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a
References: <CGME20200506132718eucas1p27ceb5f9d146beda30723ed99151ef51a@eucas1p2.samsung.com>
        <20200506132659.17162-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 5/6/20 10:26 PM, Marek Szyprowski wrote:
> The TOP 'aclk*_isp', 'aclk550_cam', 'gscl_wa' and 'gscl_wb' clocks must
> be kept enabled all the time to allow proper access to power management
> control for the ISP and CAM power domains. The last two clocks, although
> related to GScaler device and GSCL power domain, provides also the
> I_WRAP_CLK signal to MIPI CSIS0/1 devices, which are a part of CAM power
> domain and are needed for proper power on/off sequence.
> 
> Currently there are no drivers for the devices, which are part of CAM and
> ISP power domains yet. This patch only fixes the race between disabling
> the unused power domains and disabling unused clocks, which randomly
> resulted in the following error during boot:
> 
> Power domain CAM disable failed
> Power domain ISP disable failed
> 
> Fixes: 318fa46cc60d ("clk/samsung: exynos542x: mark some clocks as critical")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index c9e5a1fb6653..edb2363c735a 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -540,7 +540,7 @@ static const struct samsung_div_clock exynos5800_div_clks[] __initconst = {
>  
>  static const struct samsung_gate_clock exynos5800_gate_clks[] __initconst = {
>  	GATE(CLK_ACLK550_CAM, "aclk550_cam", "mout_user_aclk550_cam",
> -				GATE_BUS_TOP, 24, 0, 0),
> +				GATE_BUS_TOP, 24, CLK_IS_CRITICAL, 0),
>  	GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
>  				GATE_BUS_TOP, 27, CLK_IS_CRITICAL, 0),
>  };
> @@ -943,25 +943,25 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
>  	GATE(0, "aclk300_jpeg", "mout_user_aclk300_jpeg",
>  			GATE_BUS_TOP, 4, CLK_IGNORE_UNUSED, 0),
>  	GATE(0, "aclk333_432_isp0", "mout_user_aclk333_432_isp0",
> -			GATE_BUS_TOP, 5, 0, 0),
> +			GATE_BUS_TOP, 5, CLK_IS_CRITICAL, 0),
>  	GATE(0, "aclk300_gscl", "mout_user_aclk300_gscl",
>  			GATE_BUS_TOP, 6, CLK_IS_CRITICAL, 0),
>  	GATE(0, "aclk333_432_gscl", "mout_user_aclk333_432_gscl",
>  			GATE_BUS_TOP, 7, CLK_IGNORE_UNUSED, 0),
>  	GATE(0, "aclk333_432_isp", "mout_user_aclk333_432_isp",
> -			GATE_BUS_TOP, 8, 0, 0),
> +			GATE_BUS_TOP, 8, CLK_IS_CRITICAL, 0),
>  	GATE(CLK_PCLK66_GPIO, "pclk66_gpio", "mout_user_pclk66_gpio",
>  			GATE_BUS_TOP, 9, CLK_IGNORE_UNUSED, 0),
>  	GATE(0, "aclk66_psgen", "mout_user_aclk66_psgen",
>  			GATE_BUS_TOP, 10, CLK_IGNORE_UNUSED, 0),
>  	GATE(0, "aclk266_isp", "mout_user_aclk266_isp",
> -			GATE_BUS_TOP, 13, 0, 0),
> +			GATE_BUS_TOP, 13, CLK_IS_CRITICAL, 0),
>  	GATE(0, "aclk166", "mout_user_aclk166",
>  			GATE_BUS_TOP, 14, CLK_IGNORE_UNUSED, 0),
>  	GATE(CLK_ACLK333, "aclk333", "mout_user_aclk333",
>  			GATE_BUS_TOP, 15, CLK_IS_CRITICAL, 0),
>  	GATE(0, "aclk400_isp", "mout_user_aclk400_isp",
> -			GATE_BUS_TOP, 16, 0, 0),
> +			GATE_BUS_TOP, 16, CLK_IS_CRITICAL, 0),
>  	GATE(0, "aclk400_mscl", "mout_user_aclk400_mscl",
>  			GATE_BUS_TOP, 17, CLK_IS_CRITICAL, 0),
>  	GATE(0, "aclk200_disp1", "mout_user_aclk200_disp1",
> @@ -1161,8 +1161,10 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
>  			GATE_IP_GSCL1, 3, 0, 0),
>  	GATE(CLK_SMMU_FIMCL1, "smmu_fimcl1", "dout_gscl_blk_333",
>  			GATE_IP_GSCL1, 4, 0, 0),
> -	GATE(CLK_GSCL_WA, "gscl_wa", "sclk_gscl_wa", GATE_IP_GSCL1, 12, 0, 0),
> -	GATE(CLK_GSCL_WB, "gscl_wb", "sclk_gscl_wb", GATE_IP_GSCL1, 13, 0, 0),
> +	GATE(CLK_GSCL_WA, "gscl_wa", "sclk_gscl_wa", GATE_IP_GSCL1, 12,
> +			CLK_IS_CRITICAL, 0),
> +	GATE(CLK_GSCL_WB, "gscl_wb", "sclk_gscl_wb", GATE_IP_GSCL1, 13,
> +			CLK_IS_CRITICAL, 0),
>  	GATE(CLK_SMMU_FIMCL3, "smmu_fimcl3,", "dout_gscl_blk_333",
>  			GATE_IP_GSCL1, 16, 0, 0),
>  	GATE(CLK_FIMC_LITE3, "fimc_lite3", "aclk333_432_gscl",
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
