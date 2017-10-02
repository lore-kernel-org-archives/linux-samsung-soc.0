From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 0/9] Exynos DRM: rewrite IPP subsystem and userspace
 API
Date: Mon, 02 Oct 2017 08:03:54 +0200
Message-ID: <a693f334-4622-0147-73ae-5e0f95f865d5@samsung.com>
References: <CGME20170929073300eucas1p29f75848701e8181d1482ce4e202c4b6e@eucas1p2.samsung.com>
        <1506670374-15689-1-git-send-email-m.szyprowski@samsung.com>
        <609b4512-b8e1-c28a-126d-25b0ac2f533c@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52040 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750760AbdJBGEB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 02:04:01 -0400
In-reply-to: <609b4512-b8e1-c28a-126d-25b0ac2f533c@math.uni-bielefeld.de>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>

Hi Tobias,

On 2017-09-29 15:24, Tobias Jakobi wrote:
> Hello Marek,
>
> I just tested this series, and I noticed a lot of these lines:
>> exynos-sysmmu 11a40000.sysmmu: restoring state
>> exynos-sysmmu 11a40000.sysmmu: saving state
> I guess it would make sense to enable autosuspend for runtime PM in each of the
> hw drivers.
>
> I've just send a patch that does it for the FIMC (the only hw I can test this
> on). This improves frame time stability for me.

Right, autosuspend definitely makes sense in case of IPP drivers. I will 
update all
to use it. Thanks for testing this stuff and pointing this issue!

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
