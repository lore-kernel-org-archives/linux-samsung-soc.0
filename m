Return-Path: <SRS0=PHE5=6G=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01581C55189
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Apr 2020 08:17:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D61112071E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Apr 2020 08:16:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgDVIQ6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Apr 2020 04:16:58 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53975 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbgDVIQ5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Apr 2020 04:16:57 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200422081651euoutp02d377b92fcec6cfd76d3990804bf73b46~IFlJxXyks2834728347euoutp02Q
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Apr 2020 08:16:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200422081651euoutp02d377b92fcec6cfd76d3990804bf73b46~IFlJxXyks2834728347euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587543412;
        bh=qahajO8EdLEFPsOsPmNrRVSa3WWajVJaiWJFPW87fo4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=RJ95rCSOneItgliu0K+oj071gx/AHzGTq+yyoLaZu59e5sQH4LLnB7jTyyOOhtTHt
         nLBfwC/+9QnEsYKEA/KWNlsSqN6HbY2o+lXyiJpDqpW0GBOS7akguh4Gy8XoCEQTbZ
         r3v7X+fvUVQy4LGVz6C7a7aeWxAducG9t90SPXxY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200422081651eucas1p2779ad0b3d7d74ec9ea56df2b87da918d~IFlJbOgxK0355403554eucas1p2e;
        Wed, 22 Apr 2020 08:16:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 65.1F.60698.37DFF9E5; Wed, 22
        Apr 2020 09:16:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200422081650eucas1p1203eea2dfe72cdc8563902dd63804857~IFlIoP9FQ0595005950eucas1p1Y;
        Wed, 22 Apr 2020 08:16:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200422081650eusmtrp1c96beec388babe11c1636513ce407f92~IFlInnGQ51509315093eusmtrp1u;
        Wed, 22 Apr 2020 08:16:50 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-32-5e9ffd73177a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 80.0C.08375.27DFF9E5; Wed, 22
        Apr 2020 09:16:50 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200422081650eusmtip1fc8ddcc541383103498af7bafa5f43df~IFlIL0Gx60889208892eusmtip1v;
        Wed, 22 Apr 2020 08:16:50 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity
 check on Prime import
To:     Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <4cfed490-e45c-e559-bfa3-c616e3c00029@samsung.com>
Date:   Wed, 22 Apr 2020 10:16:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d37e223f-d62e-f711-2ce1-9bc69537d38f@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djPc7rFf+fHGex4r2hxa905VouNM9az
        Wlz5+p7NYtL9CSwWM87vY7KYMfklmwObx/3u40wefVtWMXp83iQXwBzFZZOSmpNZllqkb5fA
        lfHg7W/Wgt3KFet/7GBuYFwm08XIySEhYCJxetU6li5GLg4hgRWMEteffWeDcL4wSmz88wkq
        85lRYs2BdlaYlrcf70BVLWeU6Fo7jxXCec8osWvtdqAMB4ewQILEid06IA0iApkSB55MZwSx
        mQXaGSXWHo8HsdkEDCW63naBlfMK2EmceRkHEmYRUJXYvmUbO0hYVCBWYvq1EJAwr4CgxMmZ
        T1hAbE4Be4mpTbvYISbKSzRvnc0MYYtL3HoynwnkGgmBRewS/25fYIe42UWio+ssG4QtLPHq
        +BaouIzE6ck9LBANzYwSD8+tZYdwehglLjfNYISospa4c+4X2KHMApoS63fpg5gSAo4SffvF
        IEw+iRtvBSFu4JOYtG06M0SYV6KjTQhihprErOPr4LYevHCJeQKj0iwkn81C8s0sJN/MQli7
        gJFlFaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmCCOf3v+NcdjPv+JB1iFOBgVOLhvXF+
        XpwQa2JZcWXuIUYJDmYlEd4ND4FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY0XvYwVEkhPLEnN
        Tk0tSC2CyTJxcEo1MPLpFb7/97qQZ1san2O63QSL52dPiB15eaTjgv/VXXW6UlG3/aSq9Ze0
        Llnc8OqJ4do3u66ELL8gxnXhHPevN61zcpOOTIwVWfoz+ZhqxM25Zr8bmzq2mH74eaXGQNpA
        MLPPwuF5qrtcdb7ntM2Hb79NKtaVrK+UcQnRL3vdfXzZkavsZTty+JRYijMSDbWYi4oTAVji
        mG4sAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7pFf+fHGew+pWFxa905VouNM9az
        Wlz5+p7NYtL9CSwWM87vY7KYMfklmwObx/3u40wefVtWMXp83iQXwBylZ1OUX1qSqpCRX1xi
        qxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/Hg7W/Wgt3KFet/7GBuYFwm
        08XIySEhYCLx9uMdti5GLg4hgaWMEicv32WHSMhInJzWwAphC0v8udYFVfSWUeL6nNnMIAlh
        gQSJyaduMYLYIgKZEi+b1zODFDELtDNKHNnXwQ7RMZ1ZYtftQ0wgVWwChhJdb0FGcXDwCthJ
        nHkZBxJmEVCV2L5lGztIWFQgVqLloiZImFdAUOLkzCcsIDangL3E1KZdYMcxC5hJzNv8kBnC
        lpdo3jobyhaXuPVkPtMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS
        83M3MQLjatuxn5t3MF7aGHyIUYCDUYmH98b5eXFCrIllxZW5hxglOJiVRHg3PAQK8aYkVlal
        FuXHF5XmpBYfYjQF+m0is5Rocj4w5vNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqem
        FqQWwfQxcXBKNTA2uF3wrRcsE0n9H3G+s+Xc7YTHZiKro5e8fjpx/r/iC3xJr+p9t7KkFsyL
        Dqg6HFVansidXf3Wf+rPF9wZK89/XW/h6/LUb1qagOtuM2UeVv+ZbiUtD2ZVyj5++v1IReVm
        no+fe7Y68ETwrCr0L53wXa/+wSJt2bwlfluPFGnN/DlfZI9de7YSS3FGoqEWc1FxIgBPeNKU
        wQIAAA==
X-CMS-MailID: 20200422081650eucas1p1203eea2dfe72cdc8563902dd63804857
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
        <CGME20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada@eucas1p1.samsung.com>
        <20200407134256.9129-3-m.szyprowski@samsung.com>
        <92cffe01-7a14-8fbd-90a3-dc171884c26d@samsung.com>
        <40285486-be0a-1e7b-6fd9-2c821bd537f9@samsung.com>
        <a268d606-b387-beeb-362f-07ae89a23ce7@samsung.com>
        <d37e223f-d62e-f711-2ce1-9bc69537d38f@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

On 22.04.2020 06:36, Inki Dae wrote:
> 20. 4. 22. 오후 12:37에 Inki Dae 이(가) 쓴 글:
>> 20. 4. 21. 오후 5:09에 Marek Szyprowski 이(가) 쓴 글:
>>> On 21.04.2020 09:38, Inki Dae wrote:
>>>> 20. 4. 7. 오후 10:42에 Marek Szyprowski 이(가) 쓴 글:
>>>>> Explicitly check if the imported buffer has been mapped as contiguous in
>>>>> the DMA address space, what is required by all Exynos DRM CRTC drivers.
>>>>> While touching this, set buffer flags depending on the availability of
>>>>> the IOMMU.
>>>>>
>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> ---
>>>>>    drivers/gpu/drm/exynos/exynos_drm_gem.c | 36 +++++++++++++++++--------
>>>>>    1 file changed, 25 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>>>> index 40514d3dcf60..9d4e4d321bda 100644
>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>>>> @@ -458,6 +458,23 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>>>>>    	int npages;
>>>>>    	int ret;
>>>>>    
>>>> (Optional) could you leave one comment here?
>>>> i.e., /* Check if DMA memory region from a exporter are mapped contiguously or not. */
>>> Okay.
>>>
>>>>> +	if (sgt->nents != 1) {
>>>> How about using below condition instead?
>>>> if (sgt->nents > 0) {
>>> This is not the same. My check for != 1 is intended. Checking contiguity
>>> of the scatterlist if it has only 1 element doesn't have much sense.
>> Oops sorry. My intention was 'if (sgt->nents > 1)' because if (sgt->nents != 1) allows
>> - sgt->nents < 1
>> - sgt->nents > 1
>>
>> I think the checking would be valid only in case of having multiple entries - sgt->nents > 1.

Okay, I can change the check to  sgt->nents > 1.

>>>>> +		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
>>>>> +		struct scatterlist *s;
>>>>> +		unsigned int i;
>>>>> +
>>>>> +		for_each_sg(sgt->sgl, s, sgt->nents, i) {
>>>>> +			if (!sg_dma_len(s))
>>>>> +				continue;
>>>> Isn't it an error case if sg_dma_len(s) is 0? I think length of s is 0 then it would be invalid because all entries of sgt should be mapped before sg_dma_len() is called.
>>> Well, it is a grey area. Some code incorrectly sets nents as orig_nents,
>>> thus this version is simply safe for both approaches. sg entries unused
>>> for DMA chunks have sg_dma_len() == 0.
>>>
>>> The above check is more or less copied from
>>> drm_gem_cma_prime_import_sg_table() (drivers/gpu/drm/drm_gem_cma_helper.c).
> I looked into above original code but it seems that it allows sgt->nents to have negative value, 'sgt->nents < 1', which could incur some bugs.

Okay, I will add a check for negative or zero nents.

> So I think the original code can be fixed like below,
> 	if (sgt->nents > 1) {  // <- here
> 		/* check if the entries in the sg_table are contiguous */
> 		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
> 		struct scatterlist *s;
> 		unsigned int i;
>
> 		for_each_sg(sgt->sgl, s, sgt->nents, i) {
> 			/*
> 			 * sg_dma_address(s) is only valid for entries
> 			 * that have sg_dma_len(s) > 0 // <- here
> 			 */
> 			if (!sg_dma_len(s))
> 				continue;
>
> 			if (sg_dma_address(s) != next_addr)
> 				return ERR_PTR(-EINVAL);
>
> 			next_addr = sg_dma_address(s) + sg_dma_len(s);
> 		}
> 	}
>
> So if you agree with me then we don't have to copy and paste this code as-is.
>
> Regarding 'if (!sg_dma_len(s))' condition here, I'm not clear whether we are using it correctly because scatterlist.h header description says,
> /*
>   * These macros should be used after a dma_map_sg call has been done
>   * to get bus addresses of each of the SG entries and their lengths.
>   * You should only work with the number of sg entries dma_map_sg
>   * returns, or alternatively stop on the first sg_dma_len(sg) which
>   * is 0.
>   */
>
> According to above description, sg_dma_len() should be called after dma_map_sg() call. Even it says to stop on the first sg_dma_len(sg) which is 0.
> And we could avoid the checking function code from being duplicated by introducing one function which checks if the entries in the sg_table are contiguous or not as a separate patch later.

Okay, I will rework this, then I will prepare a patch which will unify 
scatterlist contiguity checks for all DRM drivers.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

