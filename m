From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: gem: Drop NONCONTIG flag for buffers
 allocated without IOMMU
Date: Tue, 14 Nov 2017 08:46:08 +0900
Message-ID: <5A0A2EC0.8050503@samsung.com>
References: <CGME20171031162824eucas1p1d15c2ea1d529edd18e16506b26669b91@eucas1p1.samsung.com>
        <20171031162813.1546-1-m.szyprowski@samsung.com>
        <5A051757.9020101@samsung.com>
        <065ca47d-11e8-adb3-e264-a874a0b84067@samsung.com>
        <5A08F43A.8010204@samsung.com>
        <0347331c-263f-a077-53d3-7bd92ddc833b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49770 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751336AbdKMXqL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 18:46:11 -0500
In-reply-to: <0347331c-263f-a077-53d3-7bd92ddc833b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Marian Mihailescu <mihailescu2m@gmail.com>, stable@vger.kernel.org



2017년 11월 13일 23:28에 Marek Szyprowski 이(가) 쓴 글:
> Hi Inki,
> 
> On 2017-11-13 02:24, Inki Dae wrote:
>> Hi Marek,
>>
>> 2017년 11월 10일 16:35에 Marek Szyprowski 이(가) 쓴 글:
>>> Dear Inki,
>>>
>>> On 2017-11-10 04:04, Inki Dae wrote:
>>>> 2017년 11월 01일 01:28에 Marek Szyprowski 이(가) 쓴 글:
>>>>> When no IOMMU is available, all GEM buffers allocated by Exynos DRM driver
>>>>> are contiguous, because of the underlying dma_alloc_attrs() function
>>>>> provides only such buffers. In such case it makes no sense to keep
>>>> What if user disabled CMA support? In this case, it guarantees also to allocate physically contiguous memory?
>>>> I think it depends on CMA support so wouldn't be true.
>>> dma_alloc_attrs() always guarantees the contiguity of the allocated memory
>>> in DMA address space. When NOIOMMU is available, this mean that the allocated
>>> buffer is contiguous in the physical memory. When CMA is disabled,
>>> dma_alloc_attrs() uses alloc_pages() allocator. The drawback of alloc_pages()
>>> is that it easily fails if physical memory is fragmented and it cannot
>>> allocate memory larger than MAX_ORDER (4MiB in case of ARM32bit).
>> You are right. Without IOMMU suppot alloc_pages always tryies to allocate contiguous memory,
>> order = get_order(size);
>> page = alloc_pages(..., order);
>> if (!page)
>>     return NULL;
>> ...
> 
> Right
> 
>>>> Real problem I think is that user don't know whether the gem buffer allocated with CONTIG or NONCONTIG flag can be used as a SCANOUT buffer.
>>>> So user can request a page flip with NONCONTIG buffer to kernel which doesn't support IOMMU.
>>>>
>>>> And another is that user may want to use NONCONTIG buffer for another purpose, not scanout.
>>>> So if we enforce on using CONTIG buffer on kernel without IOMMU support, then it wouldn't be really what user intended.
>>> When IOMMU support is disabled, ANY buffer allocated with dma_alloc_attrs()
>>> will be contiguous, so I see no point propagating incorrect flag for it.
>>>
>>> The only way to create a NONCONTIG buffer with IOMMU disabled is to import
>>> it from other driver and this path is already handled correctly.
>>>
>>>> My idea is to provide a new flag - i.e., EXYNOS_BO_SCANOUT - which can allocate a buffer with a different allocation type - CONTIG or NONCONTIG - according to IOMMU support.
>>>> And any page flip request with NONCONTIG buffer to kernel without IOMMU support should fail and it has to return a error with a proper error message.
>>> I don't think that we need it. With the proposed patch the same userspace will
>>> work fine in both cases IOMMU enabled and disabled, even if it allocate GEM
>>> with NONCONTIG flag. We can assume that CONTIG is a special case of NONCONTIG
>>> then.
>> The problem is really not whether user space will work fine or not but is that this may be not what user space wanted.
>> I.e., user space expects the allocated buffer is NONCONTIG buffer because user space requested NONCONTIG buffer but kernel internally, this is changed to CONTIG buffer.
> 
> What's the problem when kernel allocated contiguous buffer but user
> requested non-contiguous? Contiguous is a subclass of non-contiguous
> in general. There is no driver nor scenario which will not work because
> of such change (any code for handing n-segments should be fine with only
> 1 segment). In some conditions, by luck, kernel might allocate
> a contiguous buffer even with IOMMU enabled. When we know that the
> buffer is contiguous, then flag it as such.

I'd like to say what I experienced before here. I'd ever modified in-house kernel with similar issue that with IOMMU sometimes page fault happended. So tempararily I always made gem allocation request from user space to allocate CONTIG buffer and it worked well without page fault. Several days ago, a Platform guy reported one issue that gem allocation request failed even through it has free memory enough. The issus was as you guess fragementation issue and I talked to him memory fragmentation happended.

However, that guy didn't understand why memory fragementation happended because he definitely requested NONCONTIG buffer allocation. Thus, if I provided a some hit - gem allocation way is changed to CONTIG due to some reason - to user space then he could understand the fragmentation issue without contacting me. This patch could fix the X Server issue but the X Server never know that the allocated buffer is contiguous because you changed the allocation type witout user's knowledge. 

Thanks,
Inki Dae

> 
>> So you could provide some information - maybe warning message?? - to user space the buffer type is changed to CONTIG buffer due to NO IOMMU support.
> 
> I don't think this needs a warning. I just think that when we know that
> the allocated buffer IS contiguous there is no point flagging it as
> non-contiguous and fail a few calls later although the driver allocated
> the contiguous buffer in fact. That's all.
> 
>> Regarding the buffer type Exynos DRM has, I'm not sure that providing CONTIG and NONCONTIG buffer types to user space is reasonable because I think such buffer types - physically contiguous or non contiguous - should be transparent to user space.
>> And I looked into other ARM DRM drivers - omap and msm provides SCANOUT buffer type, tegra and rockchip have no such buffer types (contiguous or non-contiguous).
>>
>> This is also a thing I felt while working on kernel in collaborating with Platform guys - we made user spaces to care about the memory allocation way.
>>
>> I wonder why you say SCANOUT type is incorrect flag.
> 
> I'm not against adding SCANOUT flag. It is a good idea in general,
> especially if the driver can simply select which set of flags will
> be best for such use case on the given hardware (IOMMU is practically
> always used on newer Exynos SoCs, IOMMU has enough TLB cache and
> handling of non-contiguous buffers is cheap there).
> 
> I would only separate it from fixing the current code.
> 
> Best regards
