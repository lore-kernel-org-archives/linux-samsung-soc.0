From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 0/9] Exynos DRM: rewrite IPP subsystem and userspace
 API
Date: Wed, 18 Oct 2017 09:41:32 +0200
Message-ID: <588f72f2-6044-3825-7efd-c079c94bc156@samsung.com>
References: <CGME20171017110810eucas1p13e4fd9a96b7866324da0f49a356db558@eucas1p1.samsung.com>
        <20171017110752.25096-1-m.szyprowski@samsung.com>
        <20171017122456.m7ul76s73hhvddch@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53335 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762087AbdJRHli (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 03:41:38 -0400
In-reply-to: <20171017122456.m7ul76s73hhvddch@phenom.ffwll.local>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi Daniel,

On 2017-10-17 14:24, Daniel Vetter wrote:
> On Tue, Oct 17, 2017 at 01:07:43PM +0200, Marek Szyprowski wrote:
>> This patchset performs complete rewrite of Exynos DRM IPP subsystem and
>> its userspace API.
>>
>> Why such rewrite is needed? Exynos DRM IPP API is over-engineered in
>> general, but not really extensible on the other side. It is also buggy,
>> with significant design flaws:
>> - Userspace API covers memory-2-memory picture operations together with
>>    CRTC writeback and duplicating features, which belongs to video plane.
>> - Lack of support of the all required image formats (for example NV12
>>    Samsung-tiled cannot be used due to lack of pixel format modifier
>>    support).
>> - Userspace API designed only to mimic hardware behaviour, not easy to
>>    understand.
>> - Lack of proper input validation in the core, drivers also didn't do that
>>    correctly, so it was possible to set incorrect parameters and easil
>>    trigger IOMMU fault or memory trash.
>> - Drivers were partially disfunctional or supported only a subset of modes.
>>
>> Due to the above limitations and issues the Exynos DRM IPP API was not
>> used by any of the open-source projects. I assume that it is safe to remove
>> this broken API without any damage to open-source community. All remaining
>> users (mainly Tizen project related) will be updated to the new version.
>>
>> This patchset changes Exynos DRM IPP subsystem to something useful. The
>> userspace API is much simpler, state-less and easy to understand. Also
>> the code of the core and driver is significantly smaller and easier to
>> understand.
>>
>> Patches were tested on Exynos4412 based Odroid U3, Exynos5422
>> Odroid XU3 and Exynos5433 TM2 boards, on top of Linux next-20171016 kernel.
> When submitting uapi changes, please link to the corresponding userspace
> work. Otherwise pretty hard to find this stuff.

A simple userspace test tool has been sent together with v1:
https://www.spinics.net/lists/linux-samsung-soc/msg60498.html

Tobias Jakobi has added support for this new API to his fork of libdrm and
mpv video player:
https://github.com/tobiasjakobi/libdrm/tree/ippv2
https://github.com/tobiasjakobi/mpv

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
