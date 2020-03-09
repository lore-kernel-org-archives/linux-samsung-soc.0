Return-Path: <SRS0=xY/3=42=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DF7C10DCE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Mar 2020 00:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84EA4206D5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Mar 2020 00:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hWRYtEbo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgCIAWc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Mar 2020 20:22:32 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:62037 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbgCIAWb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Mar 2020 20:22:31 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200309002228epoutp02243a13aaad36b7b42277fb6f933efca5~6euZSmUv92969329693epoutp02L
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Mar 2020 00:22:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200309002228epoutp02243a13aaad36b7b42277fb6f933efca5~6euZSmUv92969329693epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583713348;
        bh=DPRGiObdu5DpGG4HCjdMPVIuIdkoGD+I4f1nVNHdBmI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=hWRYtEboF2jKRn/ZSwmFqU9AfeXf2b7kDw3AtOgllUyGjQxi3fohvKGXo5qNkhMTl
         2cjEmaXWGmSnSFtpvb4S0Vqq85PsblnM76zt49aIMphct5vN/BJnYTx7v9JUd5WY+X
         m3e7pZQ/PPZ/plAFIQdLG0YZ0IWh3Xq7OL5FENTg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200309002228epcas1p17107922a74248ae2d3f30d79c5284642~6euY-6e1n1651816518epcas1p17;
        Mon,  9 Mar 2020 00:22:28 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.152]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 48bJns1VwDzMqYkh; Mon,  9 Mar
        2020 00:22:25 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        4A.04.48019.14C856E5; Mon,  9 Mar 2020 09:22:25 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200309002224epcas1p2354c5b8d38d142a6e114394cd5250ab9~6euVsX8I33131731317epcas1p2M;
        Mon,  9 Mar 2020 00:22:24 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200309002224epsmtrp1c72242519ddb51b817d9b60aefc7422d~6euVrtzpS1493714937epsmtrp1d;
        Mon,  9 Mar 2020 00:22:24 +0000 (GMT)
X-AuditID: b6c32a38-257ff7000001bb93-a5-5e658c417361
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        77.FD.06569.04C856E5; Mon,  9 Mar 2020 09:22:24 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200309002224epsmtip1442e3586a5e3bfaee3564baf7a48111e~6euVfd24l2172821728epsmtip1P;
        Mon,  9 Mar 2020 00:22:24 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Fix cleanup of IOMMU related objects
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <0aae03a3-6321-0c72-be24-cdd7ae7b4e45@samsung.com>
Date:   Mon, 9 Mar 2020 09:26:52 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3939a892-5d30-9647-30aa-81e3c9244c4f@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGczvtdABrroPgCW4wwgNVsGMpjgvuS4081PjiklAn5VoI3dJp
        UfRBlAgEiEqISa3ihltQQA0YXNAIBjQqLrjFhEVACMZIopbEJWrb0cjbd27+c//z33sYij1M
        xzG5Dg9xO0QbR0cqr7Ul61KWV5AsXcu9KOFtfadKuOJrUAkvAqO04HtyWyHU3etWC76qEXoZ
        bewt71AYDzTWIuOXqzNM1Ja8xTlEzCbueOKwOLNzHdYMbv1G80qzIV3Hp/ALhPlcvEO0kwxu
        VaYpZU2uLejLxeeLNm/wyCRKEjd3yWK30+sh8TlOyZPBEVe2zbXAlSqJdsnrsKZanPaFvE43
        zxAUbsvLaa/dR7t69Dsvt51WFKIH2jIUwQBOg9vVP6gyFMmwuBlB2fEOtVx8RlAz2k2HVCwe
        QxBoT/zXUVbSopBFLQhunnutlItRBGNVA6qQKhqvhsflw1SIJ2MvVP9uV4eYwiUI6jrMIaZx
        ElRe6A07aPASOLE/EGYlToSxmidBB4aJwZvgYUCUJZPgwZFBZYgj8FLoPx9QyFdOgbeDJ/7y
        TChqOkrJgz6i4fmdbTKvgs7+PiRzNHzoaFTLHAcjB4vDiQEXIaj0PVTIRSmC7oHXSlmlhztn
        q8IDUTgZGm7MlY8T4PqPaiQbT4RPgQpVSAJYA6XFrCzhoP3Zm7++AE/PVNIyG6FmqFx1CCX4
        x0Xzj4vjHxfH/9/4JFLWoljikuxWIvGutPGffRWFV1IrNKNbnZmtCDOIm6Dpm0myWJWYLxXY
        WxEwFDdZs1dryWI12WLBLuJ2mt1eG5FakSH48JVUXIzFGVxwh8fMG+bp9XohjU838Dw3RfNu
        c3IWi62ih+QR4iLuf30KJiKuEHH76zekTJ1j2DOaWJXArtg6W4d/ahvWpa3vonuQuXv4e3NB
        26lG66KpFS/WLLxiUvWov236lVTykXo66/i397EO/8uhab+2N5Fby+/3vlqru/S1sCiJRVFN
        w7HGo9jmLi49dOrYAYvlwu5pQ2MjXfX9UdEjvo2m6RfTuZs77lrbojillCPyWsotiX8AkS4Z
        I6gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSnK5DT2qcwf/ZGha31p1jtdg4Yz2r
        xZWv79ksZpzfx2Sx9shddosZk1+yObB53O8+zuTRt2UVo8fnTXIBzFFcNimpOZllqUX6dglc
        GcdWNbEV3DOu2HB4EVMD40mtLkZODgkBE4mu9r1MXYxcHEICuxkl5j2Yw9LFyAGUkJDYspUD
        whSWOHy4GKLkLaPE6iXXWUF6hQVcJc52P2cGsUUESiVe9d9nBCliFmhnlDiyr4MdouM3o8TJ
        l43sIFVsAqoSE1fcZwOxeQXsJOa3fgWzWQRUJL4tPs8EYosKREg8336DEaJGUOLkzCcsIDan
        gL3Eo+VfwWqYBdQl/sy7xAxhi0vcejIfKi4v0bx1NvMERqFZSNpnIWmZhaRlFpKWBYwsqxgl
        UwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgiNDS2sH44kT8YcYBTgYlXh4H8inxgmxJpYV
        V+YeYpTgYFYS4W3USo4T4k1JrKxKLcqPLyrNSS0+xCjNwaIkziuffyxSSCA9sSQ1OzW1ILUI
        JsvEwSnVwJjR0mlnuvzy8475U/0Odc17aLPbyjZTYaGmmI57Wv/sNdklbdNCMy9E2E1KtBFu
        83lUo1rAn92yP3aDXsgGm5v1Ny0jlJVf3Vl8QWdzzYmDvuZ99QeuzbBoZji+gXOSR1gYu9kD
        HR2ZbMv5269sWvyvhv0VF5fJyg2mGZcqGpMZjux/JL7onhJLcUaioRZzUXEiAGPnhWGIAgAA
X-CMS-MailID: 20200309002224epcas1p2354c5b8d38d142a6e114394cd5250ab9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200302142822eucas1p1749e7cd54ad0b8657b753a8b720ccba2
References: <CGME20200302142822eucas1p1749e7cd54ad0b8657b753a8b720ccba2@eucas1p1.samsung.com>
        <20200302142709.15007-1-m.szyprowski@samsung.com>
        <d392e79f-7209-d7f6-0f1a-3d3d6e4c4473@samsung.com>
        <3939a892-5d30-9647-30aa-81e3c9244c4f@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 3. 5. 오후 5:13에 Marek Szyprowski 이(가) 쓴 글:
> Hi Inki,
> 
> On 05.03.2020 09:01, Inki Dae wrote:
>> Hi Marek,
>>
>> 20. 3. 2. 오후 11:27에 Marek Szyprowski 이(가) 쓴 글:
>>> Store the IOMMU mapping created by device core of each Exynos DRM
>>> sub-device and restore it when Exynos DRM driver is unbound. This fixes
>>> IOMMU initialization failure for the second time when deferred probe is
>>> triggered from the bind() callback of master's compound DRM driver.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +++--
>>>   drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 +++--
>>>   drivers/gpu/drm/exynos/exynos_drm_dma.c       | 22 +++++++++++--------
>>>   drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 +++--
>>>   drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +++--
>>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +++--
>>>   drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +++--
>>>   drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +++--
>>>   drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +++--
>>>   drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 +++--
>>>   drivers/gpu/drm/exynos/exynos_mixer.c         |  7 ++++--
>>>   11 files changed, 47 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>>> index 8428ae12dfa5..1f79bc2a881e 100644
>>> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>>> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>>> @@ -55,6 +55,7 @@ static const char * const decon_clks_name[] = {
>>>   struct decon_context {
>>>   	struct device			*dev;
>>>   	struct drm_device		*drm_dev;
>>> +	void				*dma_priv;
>>>   	struct exynos_drm_crtc		*crtc;
>>>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>>>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
>>> @@ -644,7 +645,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>>>   
>>>   	decon_clear_channels(ctx->crtc);
>>>   
>>> -	return exynos_drm_register_dma(drm_dev, dev);
>>> +	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>>>   }
>>>   
>>>   static void decon_unbind(struct device *dev, struct device *master, void *data)
>>> @@ -654,7 +655,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
>>>   	decon_atomic_disable(ctx->crtc);
>>>   
>>>   	/* detach this sub driver from iommu mapping if supported. */
>>> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>>> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>>>   }
>>>   
>>>   static const struct component_ops decon_component_ops = {
>>> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>>> index ff59c641fa80..1eed3327999f 100644
>>> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>>> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
>>> @@ -40,6 +40,7 @@
>>>   struct decon_context {
>>>   	struct device			*dev;
>>>   	struct drm_device		*drm_dev;
>>> +	void				*dma_priv;
>>>   	struct exynos_drm_crtc		*crtc;
>>>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>>>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
>>> @@ -127,13 +128,13 @@ static int decon_ctx_initialize(struct decon_context *ctx,
>>>   
>>>   	decon_clear_channels(ctx->crtc);
>>>   
>>> -	return exynos_drm_register_dma(drm_dev, ctx->dev);
>>> +	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
>>>   }
>>>   
>>>   static void decon_ctx_remove(struct decon_context *ctx)
>>>   {
>>>   	/* detach this sub driver from iommu mapping if supported. */
>>> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>>> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>>>   }
>>>   
>>>   static u32 decon_calc_clkdiv(struct decon_context *ctx,
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
>>> index 9ebc02768847..482bec7756fa 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
>>> @@ -58,7 +58,7 @@ static inline void clear_dma_max_seg_size(struct device *dev)
>>>    * mapping.
>>>    */
>>>   static int drm_iommu_attach_device(struct drm_device *drm_dev,
>>> -				struct device *subdrv_dev)
>>> +				struct device *subdrv_dev, void **dma_priv)
>>>   {
>>>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>>>   	int ret;
>>> @@ -74,7 +74,8 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>>>   		return ret;
>>>   
>>>   	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>>> -		if (to_dma_iommu_mapping(subdrv_dev))
>>> +		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
>>> +		if (*dma_priv)
>>>   			arm_iommu_detach_device(subdrv_dev);
>>>   
>>>   		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
>>> @@ -98,19 +99,21 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>>>    * mapping
>>>    */
>>>   static void drm_iommu_detach_device(struct drm_device *drm_dev,
>>> -				struct device *subdrv_dev)
>>> +				    struct device *subdrv_dev, void **dma_priv)
>>>   {
>>>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>>>   
>>> -	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
>>> +	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>>>   		arm_iommu_detach_device(subdrv_dev);
>>> -	else if (IS_ENABLED(CONFIG_IOMMU_DMA))
>>> +		arm_iommu_attach_device(subdrv_dev, *dma_priv);
>> I don't see why arm_iommu_attach_device function should be called again at drm_iommu_detach_device function.
>> I think it should be no problem without arm_iommu_attach_device call.
> 
> If device is not attached again to the mapping created by the DMA 
> framework, it will be later considered as a device without IOMMU.
> 
>> If there is any problem without arm_iommu_attach_device function call then maybe getting wrong somewhere but not here.
> 
> The problem will be during the second initialization of Exynos DRM, 
> mainly if the first initialization is interrupted by deferred probe. 
> This issue would be also visible when Exynos DRM is compiled as module 
> and loaded, removed and loaded again. Sadly, due to some circular 
> dependencies, this is not yet possible without the hacks.

Could you add above your comments on the code so that other developers can understand why the hacks should be used here?

Thanks,
Inki Dae

> 
> Best regards
> 
