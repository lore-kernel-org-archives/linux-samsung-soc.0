From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v4 2/9] drm/exynos: ipp: Add IPP v2 framework
Date: Wed, 1 Nov 2017 15:18:44 +0100
Message-ID: <aa856baa-abc0-0cb6-60c1-2be07fe454b5@math.uni-bielefeld.de>
References: <CGME20171023075449eucas1p18211ed64e964860d201aaeb53a87a8be@eucas1p1.samsung.com>
 <20171023075428.7003-1-m.szyprowski@samsung.com>
 <20171023075428.7003-3-m.szyprowski@samsung.com>
 <CAPM=9tyy135aOOiMFiUzkfJQYbD0a_v_p9SsRk=TT-=VVSPaug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40718 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751525AbdKAOSs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 10:18:48 -0400
In-Reply-To: <CAPM=9tyy135aOOiMFiUzkfJQYbD0a_v_p9SsRk=TT-=VVSPaug@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Dave Airlie wrote:
> On 23 October 2017 at 17:54, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> This patch adds Exynos IPP v2 subsystem and userspace API.
>>
>> New userspace API is focused ONLY on memory-to-memory image processing.
>> The two remainging IPP operation modes (framebuffer writeback and
>> local-path output with image processing) can be implemented using
>> standard DRM features: writeback connectors and additional DRM planes with
>> scaling features.
>>
>> V2 IPP userspace API is not compatible with old IPP ioctls. This is a
>> significant change, but the old IPP subsystem in mainline Linux kernel was
>> partially disfunctional anyway and not used in any open-source project.
>>
>> V2 IPP userspace API is based on stateless approach, which much better fits
>> to memory-to-memory image processing model. It also provides support for
>> all image formats, which are both already defined in DRM API and supported
>> by the existing IPP hardware modules.
>>
>> The API consists of the following ioctls:
>> - DRM_IOCTL_EXYNOS_IPP_GET_RESOURCES: to enumerate all available image
>>   processing modules,
>> - DRM_IOCTL_EXYNOS_IPP_GET_CAPS: to query capabilities and supported image
>>   formats of given IPP module,
>> - DRM_IOCTL_EXYNOS_IPP_GET_LIMITS: to query hardware limitiations for
>>   selected image format of given IPP module,
>> - DRM_IOCTL_EXYNOS_IPP_COMMIT: to perform operation described by the
>>   provided structures (source and destination buffers, operation rectangle,
>>   transformation, etc).
>>
>> The proposed userspace API is extensible. In the future more advanced image
>> processing operations can be defined to support for example blending.
>>
>> Userspace API is fully functional also on DRM render nodes, so it is not
>> limited to the root/privileged client.
>>
>> Internal driver API also has been completely rewritten. New IPP core
>> performs all possible input validation, checks and object life-time
>> control. The drivers can focus only on writing configuration to hardware
>> registers. Stateless nature of DRM_IOCTL_EXYNOS_IPP_COMMIT ioctl simplifies
>> the driver API. Minimal driver needs to provide a single callback for
>> starting processing and an array with supported image formats.
> 
> Is there userspace user for this? This is pretty significant
> driver-specific API addition.
> 
> The commit should contain pointers to a userspace project using this,
> or patches to one.
The pointers are in the cover letter of the series.

- Tobias

> Dave.
> 
