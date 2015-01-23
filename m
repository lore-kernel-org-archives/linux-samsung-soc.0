From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/exynos: IOMMU support should not be selectable by user
Date: Fri, 23 Jan 2015 08:26:43 +0100
Message-ID: <54C1F7B3.6000305@samsung.com>
References: <1421764274-26398-1-git-send-email-m.szyprowski@samsung.com>
 <54C1857E.30503@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38342 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753249AbbAWH0r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 02:26:47 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIM00IP8CVG6A20@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jan 2015 07:30:52 +0000 (GMT)
In-reply-to: <54C1857E.30503@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

Hello,

On 2015-01-23 00:19, Tobias Jakobi wrote:
> Marek Szyprowski wrote:
>> If system provides IOMMU feature, Exynos DRM should use it by default,
>> because the Exynos DRM subdrivers don't work correctly when Exynos IOMMU
>> driver has been enabled and no IOMMU support has been compiled into Exynos
>> DRM driver.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/Kconfig | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
>> index 7f9f6f9e9b7e..39fe490efcd4 100644
>> --- a/drivers/gpu/drm/exynos/Kconfig
>> +++ b/drivers/gpu/drm/exynos/Kconfig
>> @@ -13,10 +13,9 @@ config DRM_EXYNOS
>>   	  If M is selected the module will be called exynosdrm.
>>   
>>   config DRM_EXYNOS_IOMMU
>> -	bool "EXYNOS DRM IOMMU Support"
>> +	bool
>>   	depends on DRM_EXYNOS && EXYNOS_IOMMU && ARM_DMA_USE_IOMMU
>> -	help
>> -	  Choose this option if you want to use IOMMU feature for DRM.
>> +	default y
>>   
>>   config DRM_EXYNOS_DMABUF
>>   	bool "EXYNOS DRM DMABUF"
>>
> I tested Exynos DRM with the IOMMU enabled today and couldn't find any
> of the previous issues.

Thanks for testing!

> A few things that I noticed though:
>
> 1) Without the IOMMU I get these powerdomain infos in the kernel logs:
> "lcd0-power-domain: Power-on latency exceeded, new value 416167 ns"
> "tv-power-domain: Power-on latency exceeded, new value 456125 ns"
> These don't appear with the IOMMU, so I was wondering if the
> powerdomains are now staying on the whole time?

Yes, when IOMMU is enabled, it keeps power domains enabled all the time.
Proper implementation of runtime power management is on my todo list and
needs some more discussions about the way it will be integrated with power
domain code. For the initial version I just wanted to have a working IOMMU
driver, aggressive runtime pm will be implemented later.

> 2) With Exynos DRM now having a dependency on IOMMU (when it is
> enabled), I was wondering if anything needs to be done for the old
> 's5p-tv' driver to work properly now?

The old driver should work fine with and without IOMMU, because it doesn't
do any fancy buffer management like Exynos DRM drivers.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
