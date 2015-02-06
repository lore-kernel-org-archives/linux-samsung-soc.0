From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/2] arm/dma-mapping: Respect NO_KERNEL_MAPPING when we
 don't have an IOMMU
Date: Fri, 06 Feb 2015 13:16:57 +0100
Message-ID: <54D4B0B9.6090300@samsung.com>
References: <1423041800-27859-1-git-send-email-carlo@caione.org>
 <1423041800-27859-3-git-send-email-carlo@caione.org>
 <54D1F2AE.4070003@samsung.com>
 <CAOQ7t2ZtWA4gnatMgRuk17BPycM8A6MaPD7s6jeprr3VWqOaPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47940 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755768AbbBFMRB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Feb 2015 07:17:01 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJC00AGXNN11X10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Feb 2015 12:21:01 +0000 (GMT)
In-reply-to: <CAOQ7t2ZtWA4gnatMgRuk17BPycM8A6MaPD7s6jeprr3VWqOaPA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "Jasper St. Pierre" <jstpierre@mecheye.net>, Daniel Drake <drake@endlessm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Clark <robdclark@gmail.com>, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, kgene@kernel.org, jy0922.shim@samsung.com, Laura Abbott <lauraa@codeaurora.org>

Hello,

On 2015-02-05 11:13, Carlo Caione wrote:
> On Wed, Feb 4, 2015 at 11:21 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 2015-02-04 10:23, Carlo Caione wrote:
>>> From: "Jasper St. Pierre" <jstpierre@mecheye.net>
>>>
>>> Even without an iommu, NO_KERNEL_MAPPING is still convenient to save on
>>> kernel address space in places where we don't need a kernel mapping.
>>> Implement support for it in the two places where we're creating an
>>> expensive mapping.
>>>
>>> __alloc_from_pool uses an internal pool from which we already have
>>> virtual addresses, so it's not relevant, and __alloc_simple_buffer uses
>>> alloc_pages, which will always return a lowmem page, which is already
>>> mapped into kernel space, so we can't prevent a mapping for it in that
>>> case.
>>>
>>> Signed-off-by: Jasper St. Pierre <jstpierre@mecheye.net>
>>> Signed-off-by: Carlo Caione <carlo@caione.org>
>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>> Reviewed-by: Daniel Drake <dsd@endlessm.com>
>>
>> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Thanks. Who is supposed to take this patch? Russel?

I think this will be the best way to get it merged. Please upload it to
http://www.arm.linux.org.uk/developer/patches/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
