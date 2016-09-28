From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 0/6] drm/exynos: g2d: rework sleep and runtime PM
Date: Wed, 28 Sep 2016 02:06:51 +0200
Message-ID: <57EB099B.7060005@math.uni-bielefeld.de>
References: <CGME20160927155105epcas1p2f38b5f490e87cdfd9893a01b28b30e54@epcas1p2.samsung.com>
 <1474991411-2937-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <57EB03A8.1060103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:41404 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932342AbcI1AGy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 20:06:54 -0400
In-Reply-To: <57EB03A8.1060103@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

Hello,


Inki Dae wrote:
> We would need to review this patch series for -next in a hurry.
> I have to request git-pull soon.
I just want to point out that I have yet to test the split series.
Currently it's only compile-tested.

But I have done a stress test with both sync and async execution mode
with the first version of the patch (the big one, before the split), and
there everything seemed to work.

So this should apply for this series as well... hopefully :)


With best wishes,
Tobias


> 2016년 09월 28일 00:50에 Tobias Jakobi 이(가) 쓴 글:
>> Hello everyone,
>>
>> as discussed with Marek I have broken down my initial patch into smaller piecer.
>>
>> Anyway, this series fixes a regression introduced by commit
>> b05984e21a7e000bf5074ace00d7a574944b2c16.
>>
>> With best wishes,
>> Tobias
>>
>> Tobias Jakobi (6):
>>   Revert "drm/exynos: g2d: fix system and runtime pm integration"
>>   drm/exynos: g2d: move PM management to runqueue worker
>>   drm/exynos: g2d: remove runqueue nodes in g2d_{close,remove}()
>>   drm/exynos: g2d: wait for engine to finish
>>   drm/exynos: g2d: use autosuspend mode for PM runtime
>>   drm/exynos: g2d: simplify g2d_free_runqueue_node()
>>
>>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 237 +++++++++++++++++++++++++-------
>>  1 file changed, 188 insertions(+), 49 deletions(-)
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
