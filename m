From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 01/18] arm: dma-mapping: arm_iommu_attach_device:
 automatically set max_seg_size
Date: Thu, 25 Sep 2014 12:43:35 +0200
Message-ID: <5423F1D7.3060400@samsung.com>
References: <1410868485-4143-1-git-send-email-m.szyprowski@samsung.com>
 <1410868485-4143-2-git-send-email-m.szyprowski@samsung.com>
 <20140924170627.GK16244@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10072 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752135AbaIYKnj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 06:43:39 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NCG00MS2DXGGS40@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Sep 2014 11:46:28 +0100 (BST)
In-reply-to: <20140924170627.GK16244@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Cho KyongHo <pullip.cho@samsung.com>, Joerg Roedel <joro@8bytes.org>, Thierry Reding <treding@nvidia.com>, Olof Johansson <olof@lixom.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, David Wodhouse <dwmw2@infradead.org>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hello,

On 2014-09-24 19:06, Will Deacon wrote:
> Hi Marek,
>
> On Tue, Sep 16, 2014 at 12:54:28PM +0100, Marek Szyprowski wrote:
>> If device has no max_seg_size set, we assume that there is no limit and
>> force it to DMA_BIT_MASK(32) to always use contiguous mappings in DMA
>> address space.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/mm/dma-mapping.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>> index bcd5f836f27e..84705e24571b 100644
>> --- a/arch/arm/mm/dma-mapping.c
>> +++ b/arch/arm/mm/dma-mapping.c
>> @@ -2050,6 +2050,22 @@ int arm_iommu_attach_device(struct device *dev,
>>   {
>>   	int err;
>>   
>> +	/*
>> +	 * if device has no max_seg_size set, we assume that there is no limit
>> +	 * and force it to DMA_BIT_MASK(32) to always use contiguous mappings
>> +	 * in DMA address space
>> +	 */
>> +	if (!dev->dma_parms) {
>> +		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
>> +		if (!dev->dma_parms)
>> +			return -ENOMEM;
>> +	}
>> +	if (!dev->dma_parms->max_segment_size) {
>> +		err = dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> Would it make more sense to base this default value off the dma_mask?
> In my IOMMU series, of_dma_configure passes back a size parameter to
> arch_setup_dma_ops which is calculated from the dma-ranges property or the
> coherent dma mask if the ranges property is absent, so maybe we should set
> this there too?

Right, good idea. This patch predates your arch_setup_dma_ops changes, so I
had to use something. The value taken from dma_mask is much better than 
hardcoded
DMA_BIT_MASK(32). Do you want to include an updated patch in next 
version of your
arch_setup_dma_ops patchset?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
