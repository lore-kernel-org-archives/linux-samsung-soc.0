From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 2/4] ARM: Samsung: s5p-fimc: fix dma coherent mask
Date: Thu, 09 Sep 2010 10:44:14 +0900
Message-ID: <4C883BEE.2070503@samsung.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
 <1283745044-15514-3-git-send-email-m.szyprowski@samsung.com>
 <000301cb4fb7$b4448530$1ccd8f90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9904 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754993Ab0IIBoe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 21:44:34 -0400
Received: from eu_spt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L8G0030UI68IG@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 02:44:32 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8G00LKPI664E@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 02:44:31 +0100 (BST)
In-reply-to: <000301cb4fb7$b4448530$1ccd8f90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org

W dniu 2010-09-09 09:41, Kukjin Kim pisze:
> Marek Szyprowski wrote:
>>
>> FIMC driver uses DMA_coherent allocator, which requires proper dma mask
>> to be set.
>>
>> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>>   arch/arm/plat-s5p/dev-fimc0.c |    2 ++
>>   arch/arm/plat-s5p/dev-fimc1.c |    2 ++
>>   arch/arm/plat-s5p/dev-fimc2.c |    2 ++
>>   3 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/plat-s5p/dev-fimc0.c b/arch/arm/plat-s5p/dev-fimc0.c
>> index d3f1a9b..9f26096 100644
>> --- a/arch/arm/plat-s5p/dev-fimc0.c
>> +++ b/arch/arm/plat-s5p/dev-fimc0.c
>> @@ -33,4 +33,6 @@ struct platform_device s5p_device_fimc0 = {
>>   	.id		= 0,
>>   	.num_resources	= ARRAY_SIZE(s5p_fimc0_resource),
>>   	.resource	= s5p_fimc0_resource,
>> +	.dev.dma_mask	  =&s5p_device_fimc0.dev.coherent_dma_mask,
>> +	.dev.coherent_dma_mask = 0xffffffffUL,
>
> Ok...but I prefer following style :-)
> Could you please re-submit your this patch?

OK, I will update the style and resubmit the patch.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
