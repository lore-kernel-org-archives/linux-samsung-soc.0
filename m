From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] ARM: s3c24xx: add dma_coherent_mask for DMA devices
Date: Tue, 5 May 2015 12:38:18 +0900
Message-ID: <CAJKOXPcjdnAyr+wxzfPtmw+-QQnQeBuUL-gMrnuEs-SvOYs1pA@mail.gmail.com>
References: <1430676910-30657-1-git-send-email-anarsoul@gmail.com>
	<CAJKOXPfbF0RDPisY-PvKKKVT1kHDrR60b7VmcjTkco5UPm-WTg@mail.gmail.com>
	<CA+E=qVf5MLsdV+U82Smv-weKQ3eJAEob7J+hdbhtZ-E1qrOsYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f48.google.com ([209.85.216.48]:35954 "EHLO
	mail-vn0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754994AbbEEDiT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 23:38:19 -0400
Received: by vnbf62 with SMTP id f62so16068032vnb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2015 20:38:18 -0700 (PDT)
In-Reply-To: <CA+E=qVf5MLsdV+U82Smv-weKQ3eJAEob7J+hdbhtZ-E1qrOsYw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

2015-05-05 2:54 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
> On Mon, May 4, 2015 at 6:42 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> 2015-05-04 3:15 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
>>> Otherwise dma_alloc_coherent() fails.
>>
>> Could you say few more words about the failure?
>> Also the patch looks like a candidate for CC-stable along with Fixes tag.
>
> Hm, any call of dma_alloc_coherent() will fail for s3c24xx-dmac
> device. For example, asoc dmaengine driver. What exactly do
> you want me to precise?

Anything more than just "fails" would be welcome. Especially for
backporting to stable.

Best regards,
Krzysztof
