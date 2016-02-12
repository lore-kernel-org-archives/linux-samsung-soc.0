From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 08/10] drm/exynos: initialize DMA ops for virtual Exynos
 DRM device
Date: Fri, 12 Feb 2016 09:44:25 +0100
Message-ID: <56BD9B69.6000400@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
 <1454503374-16382-9-git-send-email-m.szyprowski@samsung.com>
 <56BD73E7.8060304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38231 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbcBLIo2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 03:44:28 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2F008KXEY2RG60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Feb 2016 08:44:26 +0000 (GMT)
In-reply-to: <56BD73E7.8060304@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 2016-02-12 06:55, Inki Dae wrote:
> Hi Marek,
>
> 2016=EB=85=84 02=EC=9B=94 03=EC=9D=BC 21:42=EC=97=90 Marek Szyprowski=
 =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> Virtual DRM device is used for memory allocation for GEM objects. On
>> some architectures null dma operations are assigned for virtual devi=
ces
>> if no explicit initialization has been made.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_drv.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/d=
rm/exynos/exynos_drm_drv.c
>> index 68f0f36..a33ea44 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -144,6 +144,7 @@ static int exynos_drm_load(struct drm_device *de=
v, unsigned long flags)
>>   	init_waitqueue_head(&private->wait);
>>   	spin_lock_init(&private->lock);
>>  =20
>> +	arch_setup_dma_ops(dev->dev, 0, DMA_BIT_MASK(32), false, false);
> As you got the report, above function incurrs build error below,
> ERROR: "arch_setup_dma_ops" [drivers/gpu/drm/exynos/exynosdrm.ko] und=
efined!
>
> Exynos drm can be built as a module. In this case, arch_setup_dma_ops=
 cannot be accessed by the module.
>
> I could fix it easily like below but I'm not sure that it's reasonabl=
e.
>
> +extern void arch_setup_dma_ops(struct device *dev, u64 dma_base,
> +                                     u64 size, struct iommu_ops *iom=
mu,
> +                                     bool coherent) { };

I don't think this is a good idea - the result will be same as not appl=
ying
the patch at all. Please drop this patch for now, I will rework it whil=
e
adding support for generic IOMMU for ARM and ARM64.

Best regards
--=20
Marek Szyprowski, PhD
Samsung R&D Institute Poland
