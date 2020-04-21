Return-Path: <SRS0=0l+h=6F=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E01DC2BA19
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Apr 2020 08:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B70E52072D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Apr 2020 08:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WMp9wzin"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgDUIJd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Apr 2020 04:09:33 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51027 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgDUIJb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 04:09:31 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200421080929euoutp029b51c0e49743dd4a649dc0f6583ccd21~Hx1bTd8QZ1526115261euoutp02g
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Apr 2020 08:09:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200421080929euoutp029b51c0e49743dd4a649dc0f6583ccd21~Hx1bTd8QZ1526115261euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587456569;
        bh=FCt71SEiI519fjradSUmj8Awr/xMxJ7GwNv2OpT0rYw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=WMp9wzintspdJ3t2O13LELgLTKfFXk3k0sJfAKdsSQNvRwVQ7gwKA1kRjRbbA0CBf
         RQnzopEA/2g6TToh6my1V5pfPwviHkix0sUtHJlom1aWapd673bTO2xTdQXHG+Eb3X
         wVqDd1WOG2pC9HTbhZ7zmv9rW5WQwm+4Sq6UPnZ8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200421080929eucas1p19646994bab12742d52528801e616d899~Hx1a-T7WL2150021500eucas1p1H;
        Tue, 21 Apr 2020 08:09:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 23.37.60679.83AAE9E5; Tue, 21
        Apr 2020 09:09:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200421080928eucas1p164c7148d7ff0e85ad9751fc89a1d45b3~Hx1amUDlj2149521495eucas1p1X;
        Tue, 21 Apr 2020 08:09:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200421080928eusmtrp26f53e863422d737e6f8b33aa5811a0bd~Hx1aluwzk2810628106eusmtrp2u;
        Tue, 21 Apr 2020 08:09:28 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-1b-5e9eaa385884
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1A.A2.07950.83AAE9E5; Tue, 21
        Apr 2020 09:09:28 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200421080928eusmtip13945b7bfcf9bf1dad8bd27c320511410~Hx1aKXjAa2484924849eusmtip1b;
        Tue, 21 Apr 2020 08:09:28 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity
 check on Prime import
To:     Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <40285486-be0a-1e7b-6fd9-2c821bd537f9@samsung.com>
Date:   Tue, 21 Apr 2020 10:09:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <92cffe01-7a14-8fbd-90a3-dc171884c26d@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djPc7oWq+bFGbRMsrG4te4cq8XGGetZ
        La58fc9mMen+BBaLGef3MVnMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
        yvj9bipLwUGBiil/L7I2MG7l7WLk5JAQMJF4ufIIexcjF4eQwApGibeXd7JCOF8YJVYc+swI
        4XxmlDh7bhc7TMv5DxuZIRLLGSX2LN7LAuG8Z5RYuO4AUxcjB4ewQILEid06IA0iApkSB55M
        ZwSxmQXaGSXWHo8HsdkEDCW63naxgZTzCthJfJ0pCxJmEVCV+PpiPjNIWFQgVmL6tRCQMK+A
        oMTJmU9YQGxOAXuJJUt2sUJMlJdo3jqbGcIWl7j1ZD4TxJnz2CWWd3JD2C4S/67fgYoLS7w6
        vgXqFRmJ/ztB6rmA7GZGiYfn1rJDOD2MEpebZjBCVFlL3Dn3C+xOZgFNifW79EFMCQFHib79
        YhAmn8SNt4IQJ/BJTNo2nRkizCvR0SYEMUNNYtbxdXBbD164xDyBUWkWksdmIXlmFpJnZiGs
        XcDIsopRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMwvZz+d/zLDsZdf5IOMQpwMCrx8G4Q
        mxcnxJpYVlyZe4hRgoNZSYTXQgsoxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU
        7NTUgtQimCwTB6dUA2P4NSa3E5d+HLWQLniTJnUnveXeAamvq4wOfbwZdTp1FZ/FDq2OjiOF
        M3/vvt3h/D+0Y5ZQ04WVmVmBX35P/PiLUeCHmXVn024+vsNmzcZ7sh/dO/xCWHt30rkw9yva
        y7k4MvdMbnr4Tnhahf6z5lefT33Iv/DeNHeFp3Dv+7qK6B07d9UtEputxFKckWioxVxUnAgA
        vqS6FSsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7oWq+bFGVyYrWhxa905VouNM9az
        Wlz5+p7NYtL9CSwWM87vY7KYMfklmwObx/3u40wefVtWMXp83iQXwBylZ1OUX1qSqpCRX1xi
        qxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/H73VSWgoMCFVP+XmRtYNzK
        28XIySEhYCJx/sNG5i5GLg4hgaWMEusub2CESMhInJzWwAphC0v8udbFBlH0llHi8oz9zCAJ
        YYEEicmnboE1iAhkSrxsXg82iVmgnVHiyL4OdoiOH4wSB9pfglWxCRhKdL0FGcXBwStgJ/F1
        pixImEVAVeLri/nMIGFRgViJlouaIGFeAUGJkzOfsIDYnAL2EkuW7AI7iFnATGLe5ofMELa8
        RPPW2VC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yf
        u4kRGFfbjv3csoOx613wIUYBDkYlHt4NYvPihFgTy4orcw8xSnAwK4nwWmgBhXhTEiurUovy
        44tKc1KLDzGaAv02kVlKNDkfGPN5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtS
        i2D6mDg4pYCR9MTrg88Hbo6PsttPiBz8tyhvw8FqgVe7gmNKTTKEf7BpyU4UtNn6zU1m7628
        2Lz+svvvY3RK2LeK7fz3wGH3+3V//Od4v4u6b3PlwxmXLz1by1X5U8UYDxz21NL6sb1i4o7X
        FpHJGXopBVO2/0594fr96+a+rFvbf79b1hmvt3eeWou3nfdxJZbijERDLeai4kQARebNN8EC
        AAA=
X-CMS-MailID: 20200421080928eucas1p164c7148d7ff0e85ad9751fc89a1d45b3
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
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

On 21.04.2020 09:38, Inki Dae wrote:
> 20. 4. 7. 오후 10:42에 Marek Szyprowski 이(가) 쓴 글:
>> Explicitly check if the imported buffer has been mapped as contiguous in
>> the DMA address space, what is required by all Exynos DRM CRTC drivers.
>> While touching this, set buffer flags depending on the availability of
>> the IOMMU.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_gem.c | 36 +++++++++++++++++--------
>>   1 file changed, 25 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> index 40514d3dcf60..9d4e4d321bda 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> @@ -458,6 +458,23 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>>   	int npages;
>>   	int ret;
>>   
> (Optional) could you leave one comment here?
> i.e., /* Check if DMA memory region from a exporter are mapped contiguously or not. */

Okay.

>> +	if (sgt->nents != 1) {
> How about using below condition instead?
> if (sgt->nents > 0) {

This is not the same. My check for != 1 is intended. Checking contiguity 
of the scatterlist if it has only 1 element doesn't have much sense.

>> +		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
>> +		struct scatterlist *s;
>> +		unsigned int i;
>> +
>> +		for_each_sg(sgt->sgl, s, sgt->nents, i) {
>> +			if (!sg_dma_len(s))
>> +				continue;
> Isn't it an error case if sg_dma_len(s) is 0? I think length of s is 0 then it would be invalid because all entries of sgt should be mapped before sg_dma_len() is called.

Well, it is a grey area. Some code incorrectly sets nents as orig_nents, 
thus this version is simply safe for both approaches. sg entries unused 
for DMA chunks have sg_dma_len() == 0.

The above check is more or less copied from 
drm_gem_cma_prime_import_sg_table() (drivers/gpu/drm/drm_gem_cma_helper.c).

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

