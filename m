From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] exynos: pmu: use PS_HOLD based poweroff for all supported SoCs
Date: Mon, 9 Feb 2015 11:58:57 +0100
Message-ID: <CAJKOXPe4=DHsV3_axDUhpimRaqSHA3=HLiSJ1K3DYZoGRRiTTg@mail.gmail.com>
References: <1423466741-11421-1-git-send-email-m.szyprowski@samsung.com>
	<CAJKOXPeeUjcwO6qBdHA8DJaviPxRwjAsSe7ciyGDFOUoNhZvcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:48430 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932339AbbBIK66 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 05:58:58 -0500
Received: by mail-vc0-f177.google.com with SMTP id hy10so7104801vcb.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Feb 2015 02:58:57 -0800 (PST)
In-Reply-To: <CAJKOXPeeUjcwO6qBdHA8DJaviPxRwjAsSe7ciyGDFOUoNhZvcQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

2015-02-09 10:06 GMT+01:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> 2015-02-09 8:25 GMT+01:00 Marek Szyprowski <m.szyprowski@samsung.com>:
>> PS_HOLD based power off procedure is common for all Exynos SoCs, so use
>> it for every Exynos SoC.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  arch/arm/mach-exynos/pmu.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> I tried this on Trats2 board (Exynos 4412) and message "Power down
> failed, please power off system manually." appears. Is it expected? Or
> am I missing some patches (I applied this on top of next-20150129)?

It was my fault (I left attached JIG cable which prevents power off).
Now it works fine.

Tested on Trats2 (Exynos4412):
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Patch also looks good, so:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
