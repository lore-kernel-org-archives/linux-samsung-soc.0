From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: gem: Drop NONCONTIG flag for buffers
 allocated without IOMMU
Date: Thu, 02 Nov 2017 07:51:19 +0100
Message-ID: <f0e81d2c-4813-e377-3311-8b3a646df80d@samsung.com>
References: <CGME20171031162824eucas1p1d15c2ea1d529edd18e16506b26669b91@eucas1p1.samsung.com>
        <20171031162813.1546-1-m.szyprowski@samsung.com>
        <59F96A40.5080101@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55568 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbdKBGvY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Nov 2017 02:51:24 -0400
In-reply-to: <59F96A40.5080101@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marian Mihailescu <mihailescu2m@gmail.com>, stable@vger.kernel.org

Hi Inki,

On 2017-11-01 07:31, Inki Dae wrote:
> 2017년 11월 01일 01:28에 Marek Szyprowski 이(가) 쓴 글:
>> When no IOMMU is available, all GEM buffers allocated by Exynos DRM driver
>> are contiguous, because of the underlying dma_alloc_attrs() function
>> provides only such buffers. In such case it makes no sense to keep
>> BO_NONCONTIG flag for the allocated GEM buffers. This allows to avoid
>> failures for buffer contiguity checks in the subsequent operations on GEM
>> objects.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> CC: stable@vger.kernel.org # v4.4+
>> ---
>> This issue is there since commit 0519f9a12d011 ("drm/exynos: add iommu
>> support for exynos drm framework"), but this patch applies cleanly
>> only to v4.4+ kernel releases due changes in the surrounding code.
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_gem.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> index 02f978bb9261..476c00fe1998 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> @@ -227,6 +227,13 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
>>   	if (IS_ERR(exynos_gem))
>>   		return exynos_gem;
>>   
>> +	/*
>> +	 * when no IOMMU is available, all allocated buffers are contiguous
>> +	 * anyway, so drop EXYNOS_BO_NONCONTIG flag
>> +	 */
>> +	if (!is_drm_iommu_supported(dev))
>> +		flags &= ~EXYNOS_BO_NONCONTIG;
> Even through iommu isn't supported, there could be 3D GPU or other DMA devices which support IOMMU. Of course, in this case, at least one memory copy will be required to pass it to Display controller.
> So I'm not clear yet and it would bring more dicussions here.

This is NONCONTIG flag drop is done only in exynos_drm_gem_create() 
function,
which always allocates memory using dma_alloc_attrs() (a replacement for
dma_alloc_coherent). There is no point keeping this flag, when we KNOW that
the buffer is contiguous.

For buffers shared from 3D GPU or other DMA device, GEM object will be 
created
using exynos_drm_gem_prime_import() and 
exynos_drm_gem_prime_import_sg_table()
functions, which checks for buffer contiguity and sets proper flags.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
