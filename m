Return-Path: <SRS0=PHE5=6G=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35BEC54FCB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Apr 2020 03:32:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3C732076A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Apr 2020 03:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Bg1x0G0e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgDVDc3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Apr 2020 23:32:29 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:62154 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgDVDc2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 23:32:28 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200422033225epoutp03d7b80463e922c6e87547b19ff52da739~IBszYhwgN0420004200epoutp03k
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Apr 2020 03:32:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200422033225epoutp03d7b80463e922c6e87547b19ff52da739~IBszYhwgN0420004200epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587526345;
        bh=llfDxHhNURjT7jNOQ/6kDn/ybSZNL+9Rf7CZN2fFxCo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Bg1x0G0ehYgI4NnI7kSVv6k1homOcE1UZEn2Q85l6JAzGa3mIjru79qLkwh/vfoMn
         tvD9ltvCjZ1WW0IVHXVZZb9GMrhSse4OZ2otI5OWzc2iUE/v4Hrkj8HFzsZLf2Ph3Q
         onTvX0INIx59klqbA13YVlq7p5ANKNhbN2yw4w94=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200422033225epcas1p2de0af2b1403492d015da7e42be303080~IBszHEw6B0927409274epcas1p2M;
        Wed, 22 Apr 2020 03:32:25 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 496Qwk3fMrzMqYlh; Wed, 22 Apr
        2020 03:32:22 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        2A.30.04402.6CABF9E5; Wed, 22 Apr 2020 12:32:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200422033222epcas1p2e30a83108eb21fa76b0facdc2ce83f8e~IBswLnjhq1158711587epcas1p2F;
        Wed, 22 Apr 2020 03:32:22 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200422033222epsmtrp29f27374b3e1f2a7d7777c7d780382013~IBswK6iF01056610566epsmtrp2T;
        Wed, 22 Apr 2020 03:32:22 +0000 (GMT)
X-AuditID: b6c32a35-76bff70000001132-7b-5e9fbac6d168
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F5.2D.04158.5CABF9E5; Wed, 22 Apr 2020 12:32:22 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200422033221epsmtip2de27683c6aed50c4b6f5450d9f8a4617~IBswCGM_j2782827828epsmtip2H;
        Wed, 22 Apr 2020 03:32:21 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity
 check on Prime import
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <a268d606-b387-beeb-362f-07ae89a23ce7@samsung.com>
Date:   Wed, 22 Apr 2020 12:37:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <40285486-be0a-1e7b-6fd9-2c821bd537f9@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURTHuTM74yptjavVSajcoT4oPnbc3dpCrUhEqMiwSCJcB51W2Wc7
        u9KLMIIyFdFMMK3sJVRo2mqmlkWbzwrNyrSHSbQVlmmkVvbQdhwjv/3Ouf9z/+fce6S4vJAM
        kKab7ZzNzBpp0kdSdy8oPLS1sSxJ+WpisfbF1U5Ce624itA+HR8htcVdtzFtZXO/l7a4cJBc
        S8YN5LRhcXm1V1DcqHNJPL7DEJnGsamcLZAzp1hS0836KHpDgm69TrNCyYQyq7Qr6UAza+Ki
        6JiN8aGx6UaPLx2YwRodnlQ8y/N0eHSkzeKwc4FpFt4eRXPWVKN1lTWMZ028w6wPS7GYVjNK
        ZYTGI0w2pE2e8bHm++2pKN+ZiZzzspG3FCg15HaUEgLLqXoEl8sjs5GPh78iKP/9iRCDbwiO
        5VRg/yrenC/yEg+aEPx53jQTjCD48aUHz0ZSqR+VDO03Q4QCf8oBp6davQTGqaMIKtt0ApPU
        cii4NEAKLKOiof95n0RgiSff7PyJCdfMpxLhwTgrSnyh46R7WuJNrYEe1yFCvHIhvHCXYSIv
        hcPXS3GhHaAekvBx8igSm46Bsrr2GfaDj221XiIHwOhwEykWHEZQUPwAE4MsBP1veyWiSgV3
        ygunO8KpIKhqDBfTCmj4dRqJznNheDyXECRAySDriFyU0NDa3TfjC/DoYgEpchzcLcqT5CNF
        yazZSmbNUzJrnpL/xmeR5ApawFl5k57jGSsz+6udaHohgzX16ETnRheipIieI+vrOpMkJ9gM
        fq/JhUCK0/6y6jeelCyV3buPs1l0NoeR411I43n5AjxgforFs95mu47RRKhUKq2aWaFhGHqh
        rKjXmCSn9KydM3CclbP9q8Ok3gGZaFvHdlVvBUZkJG+xvjzW7j90cEQ9ONXreHyhsGGoKObd
        WnWC7+bhSedxt3JZiH7r7nMH7i/Zfyq7Z3F1/JOpwdd5XEQs7VZPfHf5ev9R1E++Hmj+/MFQ
        +oycM4YFKd7vVowl5mzui6y5ZXDuGqlxL1p3I5bZRJiOt1S1NHZ1J5x4TEv4NJYJxm08+xcb
        7zHlpgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSvO6xXfPjDJbeYrK4te4cq8XGGetZ
        La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
        yvg3j6tggnDFmqUxDYyb+LsYOTkkBEwkHi6ayt7FyMUhJLCbUeLzvMtsXYwcQAkJiS1bOSBM
        YYnDh4tByoUE3jJK9O/OB7GFBRIkJp+6xQhiiwiUSrzqv88IMoZZoJ1R4si+DqiZa5kkjj3Z
        xgJSxSagKjFxxX02EJtXwE7i7s0bYHEWoPiRTb+YQGxRgQiJ59tvMELUCEqcnPkErIZTwF7i
        6qFGVhCbWUBd4s+8S8wQtrjErSfzmSBseYnmrbOZJzAKzULSPgtJyywkLbOQtCxgZFnFKJla
        UJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcE1paOxhPnIg/xCjAwajEw3vj/Lw4IdbEsuLK
        3EOMEhzMSiK8Gx4ChXhTEiurUovy44tKc1KLDzFKc7AoifPK5x+LFBJITyxJzU5NLUgtgsky
        cXBKNTB2qZcJnxJMbXnl56l+6b/ICuFfZlGMoUqz0uM370r/PE34TyTToZV3fq9tte218Yg+
        GTB712NFVSnla35M9oWhey8wFsXaScw9pf50f/6dp2tucM60+rWkujqRvT+LVX01iyhrbL3J
        SZ5HDsdcRdWZ7G+9XW10ryb7W9BeXyFxtxMPZNlzLyixFGckGmoxFxUnAgC2J+ckhQIAAA==
X-CMS-MailID: 20200422033222epcas1p2e30a83108eb21fa76b0facdc2ce83f8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
        <CGME20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada@eucas1p1.samsung.com>
        <20200407134256.9129-3-m.szyprowski@samsung.com>
        <92cffe01-7a14-8fbd-90a3-dc171884c26d@samsung.com>
        <40285486-be0a-1e7b-6fd9-2c821bd537f9@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

20. 4. 21. 오후 5:09에 Marek Szyprowski 이(가) 쓴 글:
> Hi Inki,
> 
> On 21.04.2020 09:38, Inki Dae wrote:
>> 20. 4. 7. 오후 10:42에 Marek Szyprowski 이(가) 쓴 글:
>>> Explicitly check if the imported buffer has been mapped as contiguous in
>>> the DMA address space, what is required by all Exynos DRM CRTC drivers.
>>> While touching this, set buffer flags depending on the availability of
>>> the IOMMU.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_gem.c | 36 +++++++++++++++++--------
>>>   1 file changed, 25 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>> index 40514d3dcf60..9d4e4d321bda 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>> @@ -458,6 +458,23 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>>>   	int npages;
>>>   	int ret;
>>>   
>> (Optional) could you leave one comment here?
>> i.e., /* Check if DMA memory region from a exporter are mapped contiguously or not. */
> 
> Okay.
> 
>>> +	if (sgt->nents != 1) {
>> How about using below condition instead?
>> if (sgt->nents > 0) {
> 
> This is not the same. My check for != 1 is intended. Checking contiguity 
> of the scatterlist if it has only 1 element doesn't have much sense.

Oops sorry. My intention was 'if (sgt->nents > 1)' because if (sgt->nents != 1) allows
- sgt->nents < 1
- sgt->nents > 1

I think the checking would be valid only in case of having multiple entries - sgt->nents > 1.

Thanks,
Inki Dae

> 
>>> +		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
>>> +		struct scatterlist *s;
>>> +		unsigned int i;
>>> +
>>> +		for_each_sg(sgt->sgl, s, sgt->nents, i) {
>>> +			if (!sg_dma_len(s))
>>> +				continue;
>> Isn't it an error case if sg_dma_len(s) is 0? I think length of s is 0 then it would be invalid because all entries of sgt should be mapped before sg_dma_len() is called.
> 
> Well, it is a grey area. Some code incorrectly sets nents as orig_nents, 
> thus this version is simply safe for both approaches. sg entries unused 
> for DMA chunks have sg_dma_len() == 0.
> 
> The above check is more or less copied from 
> drm_gem_cma_prime_import_sg_table() (drivers/gpu/drm/drm_gem_cma_helper.c).
> 
> Best regards
> 
