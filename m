Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A89C43463
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 01:16:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F9F720888
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 01:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bNSx2TNh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgIUBQH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Sep 2020 21:16:07 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:50806 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIUBQG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Sep 2020 21:16:06 -0400
X-Greylist: delayed 333 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 21:16:04 EDT
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200921011030epoutp01bb1edbcfce6ef182217c61c2f63b865c~2p0R0yfOx1253312533epoutp01B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2020 01:10:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200921011030epoutp01bb1edbcfce6ef182217c61c2f63b865c~2p0R0yfOx1253312533epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600650630;
        bh=eWT7d06KWfcsVOgfahORUzj7OIiAkwi/DKjSmtEKPc0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=bNSx2TNhhuXfbU1ibmp8RkDoPwuZ90rifre6UWv1NuI/uGcQboLvrqCeCmCjun51b
         NCx5CyTrjs5gqHfz/9PGPUBQuvZXz4jGQTqnrkzS+NQsEpKFua9cbdcQyhy7Mbe7M9
         B2cItFG8qReOxvgWt8Wqo4HtLXGL07DowyMHqXt8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200921011028epcas1p2c16c19a3b8aee4bdade361606cb56fad~2p0QnlBtp0695506955epcas1p2i;
        Mon, 21 Sep 2020 01:10:28 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.152]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4BvmZn4fLMzMqYkr; Mon, 21 Sep
        2020 01:10:25 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        C7.A1.10463.18DF76F5; Mon, 21 Sep 2020 10:10:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200921011024epcas1p2b26ae07e221b20cdfc80561214578938~2p0Mrry063055230552epcas1p2T;
        Mon, 21 Sep 2020 01:10:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200921011024epsmtrp244c6fc1789e40d60241758c8e549e37a~2p0MrAmWq1240512405epsmtrp2V;
        Mon, 21 Sep 2020 01:10:24 +0000 (GMT)
X-AuditID: b6c32a38-f11ff700000028df-26-5f67fd81751f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        64.D7.08745.08DF76F5; Mon, 21 Sep 2020 10:10:24 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200921011024epsmtip22da2959353b240cf8ffde505d62bbd97~2p0Mc-Ku53034930349epsmtip2Z;
        Mon, 21 Sep 2020 01:10:24 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Drop local dma_parms
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <25b69abe-7fdc-24bf-e84d-fed8afe1888d@samsung.com>
Date:   Mon, 21 Sep 2020 10:17:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fedadf3b-f9f8-b959-6e25-e687ad8a78f3@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmrm7j3/R4g3P7lCyufH3PZvHi3kUW
        i7NNb9gtNj2+xmox4/w+Jou1R+6yWxz88ATInfySzYHDY828NYwe97uPM3lsXlLv0bdlFaPH
        501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5
        QKcoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgosC/SKE3OLS/PS9ZLzc60MDQyM
        TIEKE7Iz9jw5yFLwR7Ti28HXbA2MbwW7GDk5JARMJObcecjYxcjFISSwg1Gi78QmFgjnE5Az
        5wY7hPOZUeLu8U1sMC0dZ99BVe1ilJgzeQKU855R4sOrDhaQKmEBU4kL926ygiREBJYwSry/
        1M0MkmAWyJNYsOEII4jNJqAqMXHFfbCxvAJ2EiuWNYPVsADF7y7YARYXFYiQON49mR2iRlDi
        5MwnYAs4BewlHt/6ywgxU1zi1pP5TBC2vETz1tnMIIslBCZySLxZcYoZ4m4XiV0TT7BC2MIS
        r45vYYewpSQ+v9vLBtHQzCgxccZpJginA+jrx9dZIKqMJfYvnQyU4ABaoSmxfpc+RFhRYufv
        uVBX8Em8+9rDClIiIcAr0dEmBFGiJHHs4g1GCFtC4sKSidBw9JC4NP0I0wRGxVlIfpuF5J9Z
        SP6ZhbB4ASPLKkax1ILi3PTUYsMCE+QI38QITqlaFjsY5779oHeIkYmD8RCjBAezkgivmlF6
        vBBvSmJlVWpRfnxRaU5q8SFGU2BoT2SWEk3OByb1vJJ4Q1MjY2NjCxNDM1NDQyVx3oe3FOKF
        BNITS1KzU1MLUotg+pg4OKUamDi5EvvC7kwX+cPupxlbIrDV5YyqyMHtfQ0vjxdE/zrn3n/F
        WcHt8lz3f3kiovbTJ19ktZVPYFZgPOA6LV0hbsGTvSnT/8XeNz90cWrylvfaO/pe3bn86LGw
        mmbAzqsmq/sCVJnPS4Sxb9t2d9evrxO/lR/y7r67+MfF/DsF2geuF4l8DLJs49VULbhhP+ui
        39124dV620WsjDLvquYc+Ba15Mr8h6q1RqXL1S7dFp8zT/fApJNvP9TYa1y4EL5v2Sxr28NX
        /Bd61O5xmbkr9L1QxtdIwbmVf3LXv4s7ZnRwl+5OPt/2u9Yt3mzSMk+v1K8ruqz1OqVQXN6v
        7P6RQs91Pae33prO9lmqie3zJGMlluKMREMt5qLiRAC7VTNTMgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsWy7bCSvG7D3/R4g/434hZXvr5ns3hx7yKL
        xdmmN+wWmx5fY7WYcX4fk8XaI3fZLQ5+eALkTn7J5sDhsWbeGkaP+93HmTw2L6n36NuyitHj
        8ya5ANYoLpuU1JzMstQifbsErow9Tw6yFPwRrfh28DVbA+NbwS5GTg4JAROJjrPvWLoYuTiE
        BHYwSux6tIGpi5EDKCEhsWUrB4QpLHH4cDFIuZDAW0aJ3nN6ILawgKnEhXs3WUFaRQSWMEos
        /dDPCpJgFsiTeL/7IjtEw2NGiTkLckFsNgFViYkr7rOB2LwCdhIrljUzg9gsQPG7C3aAxUUF
        IiRa7v9hh6gRlDg58wkLiM0pYC/x+NZfRoj56hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgW
        kvZZSFpmIWmZhaRlASPLKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4NjR0trBuGfV
        B71DjEwcjIcYJTiYlUR41YzS44V4UxIrq1KL8uOLSnNSiw8xSnOwKInzfp21ME5IID2xJDU7
        NbUgtQgmy8TBKdXApHXdUFn/1NPkgETVV3o+hgkyrD9tl1j+lrB9colbYc6rpDnfXWsTT8wO
        zxT36XVVua3J6XqmflOJdX2oKte53i3/18YxX8svStRu/alaWpd+Z+KOjs8ntc+FzeeW/+fo
        sSQui4ntjtPx6udqlYU7FRwd1dK4y92zm9mcNxqdnn/nwdGjb2xNXR5VXth3jeGn6fW3R8rL
        DGfozfpUErKa33mG75vSxy+OvVz5VW9CenVmNVtbghjH7ECe+SybZt7WOW8XoDqZ6WnN4cea
        irxFMbtWr87x3tX2IsbsUEPxI7m0vK7IWYuVvxRt5N2fpvBxg13zxwYRHb6PRxviXMIemzXd
        bXLv45Rd1RB11UOJpTgj0VCLuag4EQAfOEK0DAMAAA==
X-CMS-MailID: 20200921011024epcas1p2b26ae07e221b20cdfc80561214578938
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200903205201eucas1p124161a3310b7a0a3ba077a8369daa45b
References: <CGME20200903205201eucas1p124161a3310b7a0a3ba077a8369daa45b@eucas1p1.samsung.com>
        <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
        <fedadf3b-f9f8-b959-6e25-e687ad8a78f3@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

20. 9. 4. 오후 4:28에 Marek Szyprowski 이(가) 쓴 글:
> Hi Robin,
> 
> On 03.09.2020 22:51, Robin Murphy wrote:
>> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
>> for platform devices"), struct platform_device already provides a
>> dma_parms structure, so we can save allocating another one.
>>
>> Also the DMA segment size is simply a size, not a bitmask.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> I've sent a similar patch over 2 months ago, but it looks it got lost:
> 
> https://lore.kernel.org/dri-devel/20200707110827.3760-1-m.szyprowski@samsung.com/
> 
> Inki, could You queue it for merge?

Oops, sorry. Reviewed already but forgot to merge.

Thanks,
Inki Dae

> 
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_dma.c | 26 +------------------------
>>   1 file changed, 1 insertion(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
>> index 58b89ec11b0e..9f25a5ebbf7d 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
>> @@ -31,23 +31,6 @@
>>   #define EXYNOS_DEV_ADDR_START	0x20000000
>>   #define EXYNOS_DEV_ADDR_SIZE	0x40000000
>>   
>> -static inline int configure_dma_max_seg_size(struct device *dev)
>> -{
>> -	if (!dev->dma_parms)
>> -		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
>> -	if (!dev->dma_parms)
>> -		return -ENOMEM;
>> -
>> -	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
>> -	return 0;
>> -}
>> -
>> -static inline void clear_dma_max_seg_size(struct device *dev)
>> -{
>> -	kfree(dev->dma_parms);
>> -	dev->dma_parms = NULL;
>> -}
>> -
>>   /*
>>    * drm_iommu_attach_device- attach device to iommu mapping
>>    *
>> @@ -69,9 +52,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>>   		return -EINVAL;
>>   	}
>>   
>> -	ret = configure_dma_max_seg_size(subdrv_dev);
>> -	if (ret)
>> -		return ret;
>> +	dma_set_max_seg_size(subdrv_dev, UINT_MAX);
>>   
>>   	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>>   		/*
>> @@ -89,9 +70,6 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>>   		ret = iommu_attach_device(priv->mapping, subdrv_dev);
>>   	}
>>   
>> -	if (ret)
>> -		clear_dma_max_seg_size(subdrv_dev);
>> -
>>   	return ret;
>>   }
>>   
>> @@ -114,8 +92,6 @@ static void drm_iommu_detach_device(struct drm_device *drm_dev,
>>   		arm_iommu_attach_device(subdrv_dev, *dma_priv);
>>   	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
>>   		iommu_detach_device(priv->mapping, subdrv_dev);
>> -
>> -	clear_dma_max_seg_size(subdrv_dev);
>>   }
>>   
>>   int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
> 
> Best regards
> 
