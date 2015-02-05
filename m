From: Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH v2 2/2] arm/dma-mapping: Respect NO_KERNEL_MAPPING when we
 don't have an IOMMU
Date: Thu, 5 Feb 2015 11:13:15 +0100
Message-ID: <CAOQ7t2ZtWA4gnatMgRuk17BPycM8A6MaPD7s6jeprr3VWqOaPA@mail.gmail.com>
References: <1423041800-27859-1-git-send-email-carlo@caione.org>
	<1423041800-27859-3-git-send-email-carlo@caione.org>
	<54D1F2AE.4070003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:39689 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756968AbbBEKNQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 05:13:16 -0500
Received: by mail-wi0-f178.google.com with SMTP id bs8so9395177wib.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2015 02:13:15 -0800 (PST)
In-Reply-To: <54D1F2AE.4070003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Carlo Caione <carlo@caione.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "Jasper St. Pierre" <jstpierre@mecheye.net>, Daniel Drake <drake@endlessm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Clark <robdclark@gmail.com>, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, kgene@kernel.org, jy0922.shim@samsung.com, Laura Abbott <lauraa@codeaurora.org>

On Wed, Feb 4, 2015 at 11:21 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On 2015-02-04 10:23, Carlo Caione wrote:
>>
>> From: "Jasper St. Pierre" <jstpierre@mecheye.net>
>>
>> Even without an iommu, NO_KERNEL_MAPPING is still convenient to save on
>> kernel address space in places where we don't need a kernel mapping.
>> Implement support for it in the two places where we're creating an
>> expensive mapping.
>>
>> __alloc_from_pool uses an internal pool from which we already have
>> virtual addresses, so it's not relevant, and __alloc_simple_buffer uses
>> alloc_pages, which will always return a lowmem page, which is already
>> mapped into kernel space, so we can't prevent a mapping for it in that
>> case.
>>
>> Signed-off-by: Jasper St. Pierre <jstpierre@mecheye.net>
>> Signed-off-by: Carlo Caione <carlo@caione.org>
>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>> Reviewed-by: Daniel Drake <dsd@endlessm.com>
>
>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks. Who is supposed to take this patch? Russel?

Cheers,

-- 
Carlo Caione
