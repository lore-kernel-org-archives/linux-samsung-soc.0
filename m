From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] exynos: pmu: use PS_HOLD based poweroff for all supported
 SoCs
Date: Tue, 24 Mar 2015 17:06:36 +0900
Message-ID: <020001d06609$74970ee0$5dc52ca0$@kernel.org>
References: <1423466741-11421-1-git-send-email-m.szyprowski@samsung.com>
 <CAJKOXPeeUjcwO6qBdHA8DJaviPxRwjAsSe7ciyGDFOUoNhZvcQ@mail.gmail.com>
 <CAJKOXPe4=DHsV3_axDUhpimRaqSHA3=HLiSJ1K3DYZoGRRiTTg@mail.gmail.com>
 <550C3888.7050905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61976 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751494AbbCXIGl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Mar 2015 04:06:41 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NLP004XAIJ3BJD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Mar 2015 17:06:39 +0900 (KST)
In-reply-to: <550C3888.7050905@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene@kernel.org>, 'Tobias Jakobi' <tjakobi@math.uni-bielefeld.de>, 'Daniel Drake' <drake@endlessm.com>

Marek Szyprowski wrote:
> 
> Hello,
> 
Hi,

> On 2015-02-09 11:58, Krzysztof Kozlowski wrote:
> > 2015-02-09 10:06 GMT+01:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> >> 2015-02-09 8:25 GMT+01:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> >>> PS_HOLD based power off procedure is common for all Exynos SoCs, so use
> >>> it for every Exynos SoC.
> >>>
> >>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>> ---
> >>>   arch/arm/mach-exynos/pmu.c | 6 +++---
> >>>   1 file changed, 3 insertions(+), 3 deletions(-)
> >> I tried this on Trats2 board (Exynos 4412) and message "Power down
> >> failed, please power off system manually." appears. Is it expected? Or
> >> am I missing some patches (I applied this on top of next-20150129)?
> > It was my fault (I left attached JIG cable which prevents power off).
> > Now it works fine.
> >
> > Tested on Trats2 (Exynos4412):
> > Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >
> > Patch also looks good, so:
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> Gentle ping for merging this in v4.1-next...
> 
OK, I'll queue this into v4.1-next/mach-samsung.

Just note, some newer SoC has different poweroff scheme not just using PS_HOLD
based so maybe we need to revisit the poweroff later ;-)

Thanks,
Kukjin
