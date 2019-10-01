Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0E2ECE587
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 13:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25BC121924
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 13:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y+SRxMsy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388287AbfJANWS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 09:22:18 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48582 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388242AbfJANWS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:22:18 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191001132216euoutp026093d10e2b8c4ba08e70ccc20d4ed572~JiJkaxdIr0789607896euoutp02k
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2019 13:22:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191001132216euoutp026093d10e2b8c4ba08e70ccc20d4ed572~JiJkaxdIr0789607896euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569936136;
        bh=zcE2ojGHd98IbSHVWVOb5Thss1OS+EUHn2hqa5E6qaE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Y+SRxMsy/f4BJpgucvLgkL5Vkhob/6he1Ey7r+2iCP80mpAT4EJJLPAFcvmx/66jt
         uAEcFEdRFFo98NTSPaIJALXxocf2hEiyegZ1pcw0gLFnGISA+cVhgnSRutnqxk/qd/
         f7SOM3HTF5962MaZs12xQhyCuRhLcYPf6iTXMlAI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191001132216eucas1p20978600a4a359c907b5c8816eed6cd15~JiJkRWwAk1219612196eucas1p2e;
        Tue,  1 Oct 2019 13:22:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id DA.9A.04374.803539D5; Tue,  1
        Oct 2019 14:22:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191001132215eucas1p133849c58958cf4a77afc0a6250a17350~JiJkANo2O3239932399eucas1p1L;
        Tue,  1 Oct 2019 13:22:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191001132215eusmtrp2756f20a7223f8927602ea87c8b3b9d6e~JiJj8pUuS1496514965eusmtrp2T;
        Tue,  1 Oct 2019 13:22:15 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-20-5d9353084812
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 5E.E1.04166.703539D5; Tue,  1
        Oct 2019 14:22:15 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191001132215eusmtip21c78f853e6b4bb1dd2896e0c907f5b44~JiJjp-Zfk0729107291eusmtip2Q;
        Tue,  1 Oct 2019 13:22:15 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix potential NULL pointer
 dereference
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <00f7f77d-cd0e-b49b-56dd-5e7e0a5d385e@samsung.com>
Date:   Tue, 1 Oct 2019 15:22:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001131641.GA30129@pi3>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djPc7ocwZNjDfobWS2uf3nOanH+/AZ2
        i48991gtZpzfx2Sx9shddov2py+ZHdg8Nq3qZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSu
        jNttp1kKJnJXtHxzb2Bs5+xi5OSQEDCR2HfhPVsXIxeHkMAKRomFT1ezQjhfGCXOvZ3AAuF8
        ZpS4svQDM0zLhh23mCASyxklVqxshap6yyhx9eRj9i5GDg5hgXCJrrscIKaIQITE9pXsICXM
        ApMZJV6/vwM2iE3ASmJi+ypGEJtXwE7i+I4mJhCbRUBF4uHJCywgtihQ76cHh1khagQlTs58
        wgIyk1NAU2Lyw0yQMLOAuMStJ/OZIGx5ie1v5zCD7JIQWMQucWfyIiaIo10kLkycwgZhC0u8
        Or6FHcKWkfi/cz4TRMM6Rom/HS+gurczSiyf/A+qw1ri8PGLrCCbmYE2r9+lDxF2lPjw6g/Y
        QRICfBI33gpCHMEnMWnbdGaIMK9ER5sQRLWaxIZlG9hg1nbtXMk8gVFpFpLPZiF5ZxaSd2Yh
        7F3AyLKKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMMWc/nf86w7GfX+SDjEKcDAq8fBa
        PJ8YK8SaWFZcmXuIUYKDWUmE1+bPpFgh3pTEyqrUovz4otKc1OJDjNIcLErivNUMD6KFBNIT
        S1KzU1MLUotgskwcnFINjNvvKnId/Z+97g+r3ifTaWmpjmcLY9n/ut6+qvlg7/Erxz7bKH+t
        Kp947GToba8j4tvYC7Oab3S0VKpnWfCwiXM6FxpsvWz+/N1D17gVd3KM/DWMcx8H3p+45otI
        10bTDX0MbCx1aTlNGm53wq7cK9ox8YjC6p09bduWeLuVNt58faPhFtNTKyWW4oxEQy3mouJE
        AAJqyZEtAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xe7rswZNjDWZs0rW4/uU5q8X58xvY
        LT723GO1mHF+H5PF2iN32S3an75kdmDz2LSqk82jb8sqRo/Pm+QCmKP0bIryS0tSFTLyi0ts
        laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mm63nWYpmMhd0fLNvYGxnbOL
        kZNDQsBEYsOOW0xdjFwcQgJLGSUmvJ7P3sXIAZSQkTi+vgyiRljiz7UuNoia14wSizu+MILU
        CAuES3Td5QCpERGIkHh95x4LSA2zwFRGiUn3l0EN3cAoceTdRiaQKjYBK4mJ7asYQWxeATuJ
        4zuawOIsAioSD09eYAGxRYEmHd4xC6pGUOLkzCcsIMs4BTQlJj/MBAkzC6hL/Jl3iRnCFpe4
        9WQ+E4QtL7H97RzmCYxCs5B0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefn
        bmIExtS2Yz8372C8tDH4EKMAB6MSD++ElxNjhVgTy4orcw8xSnAwK4nw2vyZFCvEm5JYWZVa
        lB9fVJqTWnyI0RTot4nMUqLJ+cB4zyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpa
        kFoE08fEwSnVwGj3a7Vf70GZOmtfG3WmX7yyj+vE52VP7f32bDpPl9bzwLM7Z16vuzpnovRy
        N3XnnGufHllkR65adCxp2owzPM+niS6z8UzI2ie16IL6Ufnf9g8NQ32Nfm5aJvS6oP5AG++k
        yRMP5Wcmu0vvLc5RXHhwVjvfJbXr76T3acm8MXtsZqw9P2D3hzAlluKMREMt5qLiRABh3NHS
        vwIAAA==
X-CMS-MailID: 20191001132215eucas1p133849c58958cf4a77afc0a6250a17350
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191001130929eucas1p114d229f779680122c629396a4fc040c0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191001130929eucas1p114d229f779680122c629396a4fc040c0
References: <CGME20191001130929eucas1p114d229f779680122c629396a4fc040c0@eucas1p1.samsung.com>
        <20191001130921.24571-1-m.szyprowski@samsung.com>
        <20191001131641.GA30129@pi3>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On 10/1/19 3:16 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 01, 2019 at 03:09:21PM +0200, Marek Szyprowski wrote:
>> devm_kcalloc might fail, so avoid accessing the allocated object in such
>> case.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5433.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
>> index 7824c2ba3d8e..6afbcd0ae96f 100644
>> --- a/drivers/clk/samsung/clk-exynos5433.c
>> +++ b/drivers/clk/samsung/clk-exynos5433.c
>> @@ -5592,7 +5592,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>>  	if (data->nr_pclks > 0) {
>>  		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
>>  					   data->nr_pclks, GFP_KERNEL);
>> -
>> +		if (!data->pclks)
>> +			return -ENOMEM;
> 
> You leak the memory from the samsung_clk_alloc_reg_dump() call.

Also we may want to fix the code to check samsung_clk_alloc_reg_dump()
return value for NULL while we are at it..

> The error path few lines later (from of_clk_get()) leaks it as well.
> 
> Best regards,
> Krzysztof
> 
>>  		for (i = 0; i < data->nr_pclks; i++) {
>>  			struct clk *clk = of_clk_get(dev->of_node, i);
>>  
>> -- 
>> 2.17.1
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
