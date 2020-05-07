Return-Path: <SRS0=YLlK=6V=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CBAC38A24
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 May 2020 03:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E85372082E
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 May 2020 03:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YnPhVW43"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgEGDgH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 May 2020 23:36:07 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:20405 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgEGDgG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 May 2020 23:36:06 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200507033604epoutp0387985a0bddd684d09e7418c303c7978e~MobRsHGpf1284112841epoutp030
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 May 2020 03:36:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200507033604epoutp0387985a0bddd684d09e7418c303c7978e~MobRsHGpf1284112841epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1588822564;
        bh=QCcjfN1DfavPfFZKvJo2De0oSUCDw29Ff1xvs4YX1kI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=YnPhVW43GHDmqDZ5j2xS66hkifKLqlmfoT40zQMMgXTJqfR61jpZHIBahwlR300gm
         pWaQw8OVcodKZ5omyWZtaCUO3AO8JZuD5oy+xUmFwFHLjPnjlLXfmu/Vv5B0WHy2Xq
         lozBtE9YwUmkHvtuR+pbfOr0J0FLWrK22CY7ALYk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200507033604epcas1p34a9e5e9f9c74dc87e815ef4100f3753b~MobQ8-Ix52276422764epcas1p3o;
        Thu,  7 May 2020 03:36:04 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 49HfJ167jRzMqYlv; Thu,  7 May
        2020 03:36:01 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        E1.D9.04648.12283BE5; Thu,  7 May 2020 12:36:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20200507033601epcas1p439cdb42583e4ed5eb0e901d173d4f4a0~MobOfhbDp0856008560epcas1p4G;
        Thu,  7 May 2020 03:36:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200507033601epsmtrp149afc2be501afc46fbb42a88ba310ea1~MobOeu6eU1793017930epsmtrp1K;
        Thu,  7 May 2020 03:36:01 +0000 (GMT)
X-AuditID: b6c32a37-1dbff70000001228-87-5eb38221d628
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        6E.40.25866.12283BE5; Thu,  7 May 2020 12:36:01 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200507033601epsmtip27087059a16fe8df0c68f8f2bca93e0c0~MobOToRoC0835308353epsmtip2V;
        Thu,  7 May 2020 03:36:01 +0000 (GMT)
Subject: Re: [PATCH 2/2] clk: samsung: Fix CLK_SMMU_FIMCL3 clock name on
 Exynos542x
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <d82f2177-dbdc-03d6-3c1d-e51bea87e0ce@samsung.com>
Date:   Thu, 7 May 2020 12:45:59 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20200506132659.17162-2-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmrq5i0+Y4g03NBhYbZ6xntTh/fgO7
        xceee6wWM87vY7JYe+Quu8X6aT9ZLf5d28hi0f70JbMDh8fOWXfZPTat6mTz6NuyitHj8ya5
        AJaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoDOU
        FMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQWWBXrFibnFpXnpesn5uVaGBgZGpkCF
        CdkZE5oOsxe85qg42veOuYFxO3sXIweHhICJxIoPcV2MXBxCAjsYJV6+ecgO4XxilHh+ZSMr
        hPOZUWLhq8lADidYx5+Od0wQiV2MElvaVjFDOO8ZJVav3AVWJSwQKvF11y4mkB0iAvkSs96G
        gNQwC9xmlDjVfZsRpIZNQEti/4sbbCA2v4CixNUfj8HivAJ2EvMOT2ACsVkEVCSmvl0HZosK
        hEmc3NYCVSMocXLmExYQmxOofvK2X2BxZgFxiVtP5jNB2PIS29/OATtOQmAuh0THyg9sEC+4
        SLxb2QX1jrDEq+Nb2CFsKYmX/W1QdrXEypNH2CCaO4De3H8BqsFYYv/SyWCfMQtoSqzfpQ8R
        VpTY+Xsu1BF8Eu++9rBCAphXoqNNCKJEWeLyg7tMELakxOL2TrYJjEqzkLwzC8kLs5C8MAth
        2QJGllWMYqkFxbnpqcWGBcbIsb2JEZxEtcx3MG4453OIUYCDUYmH98CyTXFCrIllxZW5hxgl
        OJiVRHh5fmyME+JNSaysSi3Kjy8qzUktPsRoCgzticxSosn5wASfVxJvaGpkbGxsYWJoZmpo
        qCTOO/V6TpyQQHpiSWp2ampBahFMHxMHp1QDY8bcnDv/JTheOhaxGi++mLBuYvbd0xOvfhcp
        ip22xOS2cbJgfvuGXE9+LvfVoesmSUtO/bEujFWkIsDghtvj+a+jsyLCeO8u0Xtf2bpdXFD3
        sn+b0Qt+50Ax7X0cMo6XQuNus5bfm6f3w6zR32TRLn97ftklzi3bKtOXnU9kiwte+fqA/ost
        SizFGYmGWsxFxYkA3sl8/LgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42LZdlhJXlexaXOcQfM9EYuNM9azWpw/v4Hd
        4mPPPVaLGef3MVmsPXKX3WL9tJ+sFv+ubWSxaH/6ktmBw2PnrLvsHptWdbJ59G1ZxejxeZNc
        AEsUl01Kak5mWWqRvl0CV8aEpsPsBa85Ko72vWNuYNzO3sXIySEhYCLxp+MdUxcjF4eQwA5G
        iWkvL7FBJCQlpl08ytzFyAFkC0scPlwMUfOWUWLZyx5mkBphgVCJr7t2MYHYIgL5EjPu9DKC
        FDEL3GWUaL8A4nACdRxllLjexwdiswloSex/cQNsAb+AosTVH4/BangF7CTmHZ4ANohFQEVi
        6tt1YLaoQJjEziWPmSBqBCVOznzCAmJzAtVP3vYLrJdZQF3iz7xLzBC2uMStJ/OZIGx5ie1v
        5zBPYBSehaR9FpKWWUhaZiFpWcDIsopRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzie
        tLR2MO5Z9UHvECMTB+MhRgkOZiURXp4fG+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ836dtTBO
        SCA9sSQ1OzW1ILUIJsvEwSnVwNSiH+QjpTr7k8+i6yssQ47bXdNcWK0k4falsUBGadbey/NW
        uX0NUtp38KfxTZc7E/peL5vbZFMcxfrpZKOuQM1rVRsllx0Xl7Dd2sv21Ff+cPHamO2hNzae
        yahYxx/Nr3Bt8RVFyf89v21tdDpND1t/Lfi0sezWxiMOu4Ljwz88/LPesPHiCa4QruMl1461
        vxZ1Pzch9UzeyqU5P+OFNvjzmnP8yCn/uol/k391jNA9hVPsjQfEpFXWV32bK3qLNfWJhzRr
        qtZ/rsYrkSWfjv4quFOUU/pbiOt4wIY5yjbzlI40y6/sP6Fi33z6hVZTyJ+J97b9ZIm/MzXr
        +K1Pi79X/Qw9VxjxdsGH7ovcq6YrsRRnJBpqMRcVJwIAu2r7uhYDAAA=
X-CMS-MailID: 20200507033601epcas1p439cdb42583e4ed5eb0e901d173d4f4a0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591
References: <20200506132659.17162-1-m.szyprowski@samsung.com>
        <CGME20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591@eucas1p2.samsung.com>
        <20200506132659.17162-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 5/6/20 10:26 PM, Marek Szyprowski wrote:
> The proper name for CLK_SMMU_FIMCL3 is "smmu_fimcl3". Remove obvious
> typo.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index edb2363c735a..fea33399a632 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1165,7 +1165,7 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
>  			CLK_IS_CRITICAL, 0),
>  	GATE(CLK_GSCL_WB, "gscl_wb", "sclk_gscl_wb", GATE_IP_GSCL1, 13,
>  			CLK_IS_CRITICAL, 0),
> -	GATE(CLK_SMMU_FIMCL3, "smmu_fimcl3,", "dout_gscl_blk_333",
> +	GATE(CLK_SMMU_FIMCL3, "smmu_fimcl3", "dout_gscl_blk_333",
>  			GATE_IP_GSCL1, 16, 0, 0),
>  	GATE(CLK_FIMC_LITE3, "fimc_lite3", "aclk333_432_gscl",
>  			GATE_IP_GSCL1, 17, 0, 0),
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
