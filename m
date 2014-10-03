From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH RFC 0/4] drm/core: restore suspend/resume calbacks in KMS
 drm drivers
Date: Fri, 03 Oct 2014 11:42:53 +0200
Message-ID: <542E6F9D.2090005@samsung.com>
References: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
 <20141003083121.GC16117@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29208 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbaJCJm6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Oct 2014 05:42:58 -0400
In-reply-to: <20141003083121.GC16117@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, "open list:INTEL DRM DRIVERS..." <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 10/03/2014 10:31 AM, Daniel Vetter wrote:
> On Fri, Oct 03, 2014 at 10:24:09AM +0200, Andrzej Hajda wrote:
>> The main intent of this patchset is to allow use of suspend/resume drm driver
>> callbacks in KMS drivers, as these callbacks seems to me the best place
>> to implement suspend/resume functionality in drm driver.
>> Implementing this functionality in master component driver PM ops is problematic
>> as those callbacks can be called asynchronously regardless of state/existence of
>> drm device, thus it would require additional synchronization mechanism.
>>
>> Callbacks re-enabling requires small changes in i915 and exynos driver.
>> The patchset contains also fix of exynos resume callback.
> Nack.
>
> Like completely and totally. The drm core has really no business doing
> hardware stuff, which includes runtime pm, system suspend and all that
> nonsense. It' an interface between userspace and drivers, with a big
> library to back it all up. Everything else just repeats the old midlayer
> mistake.

Hmm, I have just tried to reuse the existing infrastructure, I did not see
any sign "do not touch, this is a mistake". Now I see it, thanks :)

>
> If you driver needs this, do it there. Also, the component framework is
> probably the solution you're looking for. And if there are synchronization
> issues with that then we need to fix those instead of reinventing yet
> another half-assed broken wheel.

But this is an issue closely connected with component framework.
Component framework separates master component probe and drm device
initialization. As a result PM ops which are synchronized with probe
(via device_lock)
are no more synchronized with drm initialization which is usually called
from
.bind callback.

>
> Aside: With David Herrmann's latest patches to de-midlayer the drm
> init/teardown sequence the driver is in full control of when the drm data
> structures get allocate, initialized and registered. If you convert to
> that plus the component framework I'm pretty sure your problem is solved.

I will look closer at it but as I described above it is rather matter of
separation
of master component and drm device initialization.

My idea was to avoid creation of new synchronization mechanism and to
reuse the
existing ones which seems to fit perfectly to the scenario, but if there
is big NO for it
another solution should be found.

Anyway I guess the problem exists for all drivers having component
framework and suspend:
exynos, msm and incoming rockchip.


Regards
Andrzej

>
> Thanks, Daniel
