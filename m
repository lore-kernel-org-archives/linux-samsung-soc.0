Return-Path: <SRS0=PHE5=6G=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D0BC55181
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Apr 2020 04:31:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FCF22076A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Apr 2020 04:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vb+yg1qY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgDVEb2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Apr 2020 00:31:28 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:19639 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgDVEb1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Apr 2020 00:31:27 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200422043121epoutp022828ec3200cb7da5354c205f1163ae71~ICgQgGDbk1544615446epoutp02h
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Apr 2020 04:31:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200422043121epoutp022828ec3200cb7da5354c205f1163ae71~ICgQgGDbk1544615446epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587529881;
        bh=PvRu+TZQUg81qzuR02dRwIL5Xd+kRYKkrn1KisdSUO0=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=vb+yg1qYtuJ0Sy+cI0WHqf6ezccdV1b3wdgbvFq0ALnSkbI7n2DO8zwf/KJZrYo+G
         4JSpENU7O6P8BgAEb3GONnFFwrh7OLU+vZnTKFi6mXCwDPQ5u3XWO4tKalZ8HzWIv4
         aQsgufak5KWZBtMRXwJPFJeJGS4Znj2Ju3IB73qY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200422043121epcas1p242c31e232f03d50c9798e9335dd08f84~ICgQMXn2K2213522135epcas1p23;
        Wed, 22 Apr 2020 04:31:21 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.154]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 496SDk18bJzMqYkr; Wed, 22 Apr
        2020 04:31:18 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        40.BD.04544.298CF9E5; Wed, 22 Apr 2020 13:31:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200422043113epcas1p3855ddbbca01634d55fd6df12fd9cee9d~ICgJHFJ1Z3057030570epcas1p3j;
        Wed, 22 Apr 2020 04:31:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200422043113epsmtrp1d997ad77ec38c6ecca397f851a52c93e~ICgJGbIZE0675406754epsmtrp1c;
        Wed, 22 Apr 2020 04:31:13 +0000 (GMT)
X-AuditID: b6c32a36-7e7ff700000011c0-80-5e9fc892edd9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        7F.34.04024.198CF9E5; Wed, 22 Apr 2020 13:31:13 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200422043113epsmtip21e21e59ffb381794b22de8d3f72457ca~ICgI8CxiY2724727247epsmtip2d;
        Wed, 22 Apr 2020 04:31:13 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity
 check on Prime import
From:   Inki Dae <inki.dae@samsung.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <d37e223f-d62e-f711-2ce1-9bc69537d38f@samsung.com>
Date:   Wed, 22 Apr 2020 13:36:14 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a268d606-b387-beeb-362f-07ae89a23ce7@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHeXbv7q7S6rZKD6NsXupDkrqrzm6SFiRiZCD0oTJwXtzNyV7Z
        3aRZiGGZqJnLjLnQRu8YlUmJGhWZOCuzxGJqqGRG2ZtlGZFFbV4lv/3Oef7nnOf/PIfEFLWE
        ksw323mbmTPSRCje8mCdOvpE95lsdfclKTt0rVfK3nBfl7LPpycJ1v30roS92jksY901E8QW
        In20widJr7rZiNK/NUdkYlmGTXqe0/E2FW/OtejyzXnJ9Pad2q1aTaKaiWY2shtolZkz8cl0
        akZmdFq+MTCXVhVwRkcglckJAh2bsslmcdh5ld4i2JNp3qozWjdaYwTOJDjMeTG5FlMSo1bH
        aQLCHIO+qaIPWZvp/R/7/2LFqEJZjkJIoBKgpbQTK0ehpIJqRTBT5sPFYApBg/+FVAx+IGj5
        cEU6XzLy9pRMPLiDYPjj2OyBgppEMO1TlSOSXEblQPft9cE0Qa0F1+VRIsjLKQfU/+2SBRmj
        jiK46tMGWU6lwLvK8lkNHtD3vPyOB9usoHbD42lOlCyFh3XjeJBDqM3Q09WPi23CYWj8jETk
        1VBy6/SsG6B6CJj6VT1351S42Do2x8vgve+mTGQlTBwvlYkFJQhc7scSMSgLGHvtx0VVPNy7
        UCMJ3gij1sH19lgxHQltM/VInLwYPk9XSoMSoORQVqoQJTR09Q0gkQGenXcRIqfD/doqvBpF
        ehZ48yzw41ngx/N/sBfhjSiMtwqmPF5grHELP7sZza5kVGIrOtub0YEoEtGL5ANPG7IVUq5A
        cJo6EJAYvVze9CqQkus4ZyFvs2htDiMvdCBN4OVdmHJFriWw4Ga7ltHExcfHswlMooZh6HB5
        rd+YraDyODtv4Hkrb5uvk5AhymJ01Fs80XWk6NDDw5Ps75gZ2YGUpM4U5EobZM/tCCkoXOWv
        Hx9xHrQUvlP3Ot2574umvMcMEeFvCvxffXs6lFUnw5r/xD7x+EYjf8bsqyvF2rfpyAb9J1Bl
        DYb9qRxasmuvd7Tt0Rqv4c7BpO7hmhJmbVvWG+fK+sbhL8kyuFX0gMYFPcdEYTaB+wfWALJA
        qAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvO7EE/PjDHbOlbW4te4cq8XGGetZ
        La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
        ytjQfZGxYJNSxZvL/5kbGLuluhg5OSQETCTuPZ/G3sXIxSEksJtR4sPcJ6xdjBxACQmJLVs5
        IExhicOHiyFK3jJKfNmwhBmkV1ggQWLyqVuMIDabgKrExBX32UBsEYFSiVf99xlBGpgF2hkl
        juzrgFrwiEniw6atrCBVvAJ2Ei96usA6WIC6z9z+wgJiiwpESDzffoMRokZQ4uTMJ2BxTgF7
        iTPHLoPZzALqEn/mXWKGsMUlbj2ZzwRhy0s0b53NPIFRaBaS9llIWmYhaZmFpGUBI8sqRsnU
        guLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgyNDS3MF4eUn8IUYBDkYlHt4b5+fFCbEmlhVX
        5h5ilOBgVhLh3fAQKMSbklhZlVqUH19UmpNafIhRmoNFSZz3ad6xSCGB9MSS1OzU1ILUIpgs
        EwenVAMjzyZ9+769bmy8/yZlr6jd0JabarbHvKFVR6B7BnvvTvZgqdllgbcVuh32z/1iN+Xi
        3diHjbYfxC4f28h6NyM2+33cLdUZ9V01R+1eCUZoT8i0rCnaNeHRX8NTP3bUPD6l+/Hh7F23
        NA9ERMoKndg2l3HO1zkO3/ZMWi564fiSmQ83vOD7U23XpMRSnJFoqMVcVJwIAIBLwV+IAgAA
X-CMS-MailID: 20200422043113epcas1p3855ddbbca01634d55fd6df12fd9cee9d
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
        <a268d606-b387-beeb-362f-07ae89a23ce7@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 4. 22. 오후 12:37에 Inki Dae 이(가) 쓴 글:
> Hi Marek,
> 
> 20. 4. 21. 오후 5:09에 Marek Szyprowski 이(가) 쓴 글:
>> Hi Inki,
>>
>> On 21.04.2020 09:38, Inki Dae wrote:
>>> 20. 4. 7. 오후 10:42에 Marek Szyprowski 이(가) 쓴 글:
>>>> Explicitly check if the imported buffer has been mapped as contiguous in
>>>> the DMA address space, what is required by all Exynos DRM CRTC drivers.
>>>> While touching this, set buffer flags depending on the availability of
>>>> the IOMMU.
>>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>>   drivers/gpu/drm/exynos/exynos_drm_gem.c | 36 +++++++++++++++++--------
>>>>   1 file changed, 25 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>>> index 40514d3dcf60..9d4e4d321bda 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>>>> @@ -458,6 +458,23 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>>>>   	int npages;
>>>>   	int ret;
>>>>   
>>> (Optional) could you leave one comment here?
>>> i.e., /* Check if DMA memory region from a exporter are mapped contiguously or not. */
>>
>> Okay.
>>
>>>> +	if (sgt->nents != 1) {
>>> How about using below condition instead?
>>> if (sgt->nents > 0) {
>>
>> This is not the same. My check for != 1 is intended. Checking contiguity 
>> of the scatterlist if it has only 1 element doesn't have much sense.
> 
> Oops sorry. My intention was 'if (sgt->nents > 1)' because if (sgt->nents != 1) allows
> - sgt->nents < 1
> - sgt->nents > 1
> 
> I think the checking would be valid only in case of having multiple entries - sgt->nents > 1.
> 
> Thanks,
> Inki Dae
> 
>>
>>>> +		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
>>>> +		struct scatterlist *s;
>>>> +		unsigned int i;
>>>> +
>>>> +		for_each_sg(sgt->sgl, s, sgt->nents, i) {
>>>> +			if (!sg_dma_len(s))
>>>> +				continue;
>>> Isn't it an error case if sg_dma_len(s) is 0? I think length of s is 0 then it would be invalid because all entries of sgt should be mapped before sg_dma_len() is called.
>>
>> Well, it is a grey area. Some code incorrectly sets nents as orig_nents, 
>> thus this version is simply safe for both approaches. sg entries unused 
>> for DMA chunks have sg_dma_len() == 0.
>>
>> The above check is more or less copied from 
>> drm_gem_cma_prime_import_sg_table() (drivers/gpu/drm/drm_gem_cma_helper.c).

I looked into above original code but it seems that it allows sgt->nents to have negative value, 'sgt->nents < 1', which could incur some bugs.
So I think the original code can be fixed like below,
	if (sgt->nents > 1) {  // <- here
		/* check if the entries in the sg_table are contiguous */
		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
		struct scatterlist *s;
		unsigned int i;

		for_each_sg(sgt->sgl, s, sgt->nents, i) {
			/*
			 * sg_dma_address(s) is only valid for entries
			 * that have sg_dma_len(s) > 0 // <- here
			 */
			if (!sg_dma_len(s))
				continue;

			if (sg_dma_address(s) != next_addr)
				return ERR_PTR(-EINVAL);

			next_addr = sg_dma_address(s) + sg_dma_len(s);
		}
	}

So if you agree with me then we don't have to copy and paste this code as-is.

Regarding 'if (!sg_dma_len(s))' condition here, I'm not clear whether we are using it correctly because scatterlist.h header description says,
/*                                                                              
 * These macros should be used after a dma_map_sg call has been done            
 * to get bus addresses of each of the SG entries and their lengths.            
 * You should only work with the number of sg entries dma_map_sg                
 * returns, or alternatively stop on the first sg_dma_len(sg) which             
 * is 0.                                                                        
 */      

According to above description, sg_dma_len() should be called after dma_map_sg() call. Even it says to stop on the first sg_dma_len(sg) which is 0.
And we could avoid the checking function code from being duplicated by introducing one function which checks if the entries in the sg_table are contiguous or not as a separate patch later.

Thanks,
Inki Dae

>>
>> Best regards
>>
> 
> 
