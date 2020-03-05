Return-Path: <SRS0=g11O=4W=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC8BC3F2D1
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 08:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B6A42073D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 08:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qGsJ6hng"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgCEINt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Mar 2020 03:13:49 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39023 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgCEINs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 03:13:48 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200305081345euoutp02017f9779b2f05a144ff43d0ca75f2915~5WkvLhE2W2001220012euoutp02Q
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2020 08:13:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200305081345euoutp02017f9779b2f05a144ff43d0ca75f2915~5WkvLhE2W2001220012euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583396025;
        bh=8GwUKEqPb511dY0B/HRym3VyWGWahe4WeolVX4eTbo8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qGsJ6hngmvQJuYUrHWBNzA1XhVq6UKJ0GvB2BVPD0czKz30cwKGfi4FlqrQ+pZfOG
         EwK2T9H7M8a3Phd23ZSBM+Ln2t8vrsHFUByb0KuHjYiVGwMhNiiwDM3j9PljmCcZ83
         11uKHsuGC/Q7z6CAOrmye7DgKhdwkaXuKFwTCbi8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200305081345eucas1p13fe9d222088f4cd58b0186e08b06fc86~5Wku-S6rR1265412654eucas1p1P;
        Thu,  5 Mar 2020 08:13:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E7.6C.60698.9B4B06E5; Thu,  5
        Mar 2020 08:13:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200305081344eucas1p210aadafaa9d38b58c2f1b06b7b8544ec~5WkunS-fA2347923479eucas1p2y;
        Thu,  5 Mar 2020 08:13:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200305081344eusmtrp28c189d2d69397b778eb2c901fc43c2e4~5WkumsxMc3101531015eusmtrp2u;
        Thu,  5 Mar 2020 08:13:44 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-77-5e60b4b9ac57
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.9F.07950.8B4B06E5; Thu,  5
        Mar 2020 08:13:44 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200305081344eusmtip21ed1ba3d09382b43068bf9856d10bc95~5WkuL4OVc1057510575eusmtip2k;
        Thu,  5 Mar 2020 08:13:44 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Fix cleanup of IOMMU related objects
To:     Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <3939a892-5d30-9647-30aa-81e3c9244c4f@samsung.com>
Date:   Thu, 5 Mar 2020 09:13:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d392e79f-7209-d7f6-0f1a-3d3d6e4c4473@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djPc7o7tyTEGZzYKWxxa905VouNM9az
        Wlz5+p7NYtL9CSwWM87vY7KYMfklmwObx/3u40wefVtWMXp83iQXwBzFZZOSmpNZllqkb5fA
        lfF6wSbmgvWGFZ2XljE2MJ7W6GLk5JAQMJF4duoQaxcjF4eQwApGiV/TLzFDOF8YJZqe/4TK
        fGaUOLDuACtMy5cP6xkhEssZJdatfcUO4bxllNg5+Q47SJWwgKvE2e7nzCC2iECmxIEn0xlB
        bGaBdkaJtcfjQWw2AUOJrrddbF2MHBy8AnYSnXMLQMIsAioSy049YgGxRQViJWavPAxm8woI
        Spyc+YQFpJxTwF5i/ZR4iInyEs1bZzND2OISt57MZwI5R0JgEbvEr0f/WCCOdpFo/byXCcIW
        lnh1fAs7hC0j8X8nTEMzo8TDc2vZIZweRonLTTMYIaqsJe6c+wV2KLOApsT6XfoQYUeJ3o+X
        2EHCEgJ8EjfeCkIcwScxadt0Zogwr0RHmxBEtZrErOPr4NYevHCJeQKj0iwkn81C8s4sJO/M
        Qti7gJFlFaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmCSOf3v+NcdjPv+JB1iFOBgVOLh
        fTE1Pk6INbGsuDL3EKMEB7OSCK+wKVCINyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJ
        JanZqakFqUUwWSYOTqkGxlKeya5dp7c69Ok4sCfEKokFxJk6vDqyaME91jrFnS0zYv3ml659
        +GD16rSCvSohe31PlzdVeW9ZM0Fo9UlmfXUjziOGs4TtvwR9dRE//VDn6Vn5Z/MTd31NVWaw
        Zeg4t19A7tFuVs53MVOSzeZxCn0Q5WOtz9WQKeS/ljqVb//D/XvmXlxSqcRSnJFoqMVcVJwI
        AJYM31AuAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7o7tiTEGWz+ZGlxa905VouNM9az
        Wlz5+p7NYtL9CSwWM87vY7KYMfklmwObx/3u40wefVtWMXp83iQXwBylZ1OUX1qSqpCRX1xi
        qxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/F6wSbmgvWGFZ2XljE2MJ7W
        6GLk5JAQMJH48mE9I4gtJLCUUWLqBTeIuIzEyWkNrBC2sMSfa11sXYxcQDWvGSVObesGaxAW
        cJU42/2cGcQWEciUeNm8nhmkiFmgnVHiyL4OdoiOY4wSLTMWglWxCRhKdL0FGcXBwStgJ9E5
        twAkzCKgIrHs1CMWEFtUIFbixswOJhCbV0BQ4uTMJywg5ZwC9hLrp8SDhJkFzCTmbX7IDGHL
        SzRvnQ1li0vcejKfaQKj0Cwk3bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5
        uZsYgVG17djPLTsYu94FH2IU4GBU4uFdYJ4QJ8SaWFZcmXuIUYKDWUmEV9g0Pk6INyWxsiq1
        KD++qDQntfgQoynQbxOZpUST84ERn1cSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1
        ILUIpo+Jg1OqgTHb8puzXmq1TNFdfwXN2uYtm7WKAk59vah+oPONx/xFP/Y5Kd47/SPg7uWJ
        J8P+8mo13dyWmiVgkRzbq3n9b9WssM81h96lu+8Ri8t+/+ehxNW1cvXnr9u5SXjdqJl9lY9Z
        Ir/auuHs6sAd/deq6z59VZDPft5z0MK76N1FwdoY87nqaq07XiixFGckGmoxFxUnAgDCfwP5
        wAIAAA==
X-CMS-MailID: 20200305081344eucas1p210aadafaa9d38b58c2f1b06b7b8544ec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200302142822eucas1p1749e7cd54ad0b8657b753a8b720ccba2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200302142822eucas1p1749e7cd54ad0b8657b753a8b720ccba2
References: <CGME20200302142822eucas1p1749e7cd54ad0b8657b753a8b720ccba2@eucas1p1.samsung.com>
        <20200302142709.15007-1-m.szyprowski@samsung.com>
        <d392e79f-7209-d7f6-0f1a-3d3d6e4c4473@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

On 05.03.2020 09:01, Inki Dae wrote:
> Hi Marek,
>
> 20. 3. 2. 오후 11:27에 Marek Szyprowski 이(가) 쓴 글:
>> Store the IOMMU mapping created by device core of each Exynos DRM
>> sub-device and restore it when Exynos DRM driver is unbound. This fixes
>> IOMMU initialization failure for the second time when deferred probe is
>> triggered from the bind() callback of master's compound DRM driver.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +++--
>>   drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 +++--
>>   drivers/gpu/drm/exynos/exynos_drm_dma.c       | 22 +++++++++++--------
>>   drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 +++--
>>   drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +++--
>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +++--
>>   drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +++--
>>   drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +++--
>>   drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +++--
>>   drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 +++--
>>   drivers/gpu/drm/exynos/exynos_mixer.c         |  7 ++++--
>>   11 files changed, 47 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> index 8428ae12dfa5..1f79bc2a881e 100644
>> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> @@ -55,6 +55,7 @@ static const char * const decon_clks_name[] = {
>>   struct decon_context {
>>   	struct device			*dev;
>>   	struct drm_device		*drm_dev;
>> +	void				*dma_priv;
>>   	struct exynos_drm_crtc		*crtc;
>>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
>> @@ -644,7 +645,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>>   
>>   	decon_clear_channels(ctx->crtc);
>>   
>> -	return exynos_drm_register_dma(drm_dev, dev);
>> +	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>>   }
>>   
>>   static void decon_unbind(struct device *dev, struct device *master, void *data)
>> @@ -654,7 +655,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
>>   	decon_atomic_disable(ctx->crtc);
>>   
>>   	/* detach this sub driver from iommu mapping if supported. */
>> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>>   }
>>   
>>   static const struct component_ops decon_component_ops = {
>> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> index ff59c641fa80..1eed3327999f 100644
>> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>> @@ -40,6 +40,7 @@
>>   struct decon_context {
>>   	struct device			*dev;
>>   	struct drm_device		*drm_dev;
>> +	void				*dma_priv;
>>   	struct exynos_drm_crtc		*crtc;
>>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
>> @@ -127,13 +128,13 @@ static int decon_ctx_initialize(struct decon_context *ctx,
>>   
>>   	decon_clear_channels(ctx->crtc);
>>   
>> -	return exynos_drm_register_dma(drm_dev, ctx->dev);
>> +	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
>>   }
>>   
>>   static void decon_ctx_remove(struct decon_context *ctx)
>>   {
>>   	/* detach this sub driver from iommu mapping if supported. */
>> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>>   }
>>   
>>   static u32 decon_calc_clkdiv(struct decon_context *ctx,
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
>> index 9ebc02768847..482bec7756fa 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
>> @@ -58,7 +58,7 @@ static inline void clear_dma_max_seg_size(struct device *dev)
>>    * mapping.
>>    */
>>   static int drm_iommu_attach_device(struct drm_device *drm_dev,
>> -				struct device *subdrv_dev)
>> +				struct device *subdrv_dev, void **dma_priv)
>>   {
>>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>>   	int ret;
>> @@ -74,7 +74,8 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>>   		return ret;
>>   
>>   	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>> -		if (to_dma_iommu_mapping(subdrv_dev))
>> +		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
>> +		if (*dma_priv)
>>   			arm_iommu_detach_device(subdrv_dev);
>>   
>>   		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
>> @@ -98,19 +99,21 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>>    * mapping
>>    */
>>   static void drm_iommu_detach_device(struct drm_device *drm_dev,
>> -				struct device *subdrv_dev)
>> +				    struct device *subdrv_dev, void **dma_priv)
>>   {
>>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>>   
>> -	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
>> +	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>>   		arm_iommu_detach_device(subdrv_dev);
>> -	else if (IS_ENABLED(CONFIG_IOMMU_DMA))
>> +		arm_iommu_attach_device(subdrv_dev, *dma_priv);
> I don't see why arm_iommu_attach_device function should be called again at drm_iommu_detach_device function.
> I think it should be no problem without arm_iommu_attach_device call.

If device is not attached again to the mapping created by the DMA 
framework, it will be later considered as a device without IOMMU.

> If there is any problem without arm_iommu_attach_device function call then maybe getting wrong somewhere but not here.

The problem will be during the second initialization of Exynos DRM, 
mainly if the first initialization is interrupted by deferred probe. 
This issue would be also visible when Exynos DRM is compiled as module 
and loaded, removed and loaded again. Sadly, due to some circular 
dependencies, this is not yet possible without the hacks.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

