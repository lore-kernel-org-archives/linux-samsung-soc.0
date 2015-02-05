From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 04/14] drm/exynos: remove struct *_win_data abstraction on planes
Date: Thu, 5 Feb 2015 07:26:59 -0500
Message-ID: <CAF6AEGvB5N4XtGRetP0Xay0iH3awz_Bf2Uk34KFVJi-4ea3eUw@mail.gmail.com>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
	<1422990871-21355-5-git-send-email-gustavo@padovan.org>
	<54D1CDCC.60906@samsung.com>
	<20150204142838.GH14009@phenom.ffwll.local>
	<54D2D759.3000709@samsung.com>
	<20150205091514.GO14009@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:42517 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751539AbbBEM1A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 07:27:00 -0500
Received: by mail-ie0-f175.google.com with SMTP id ar1so9668570iec.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2015 04:27:00 -0800 (PST)
In-Reply-To: <20150205091514.GO14009@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On Thu, Feb 5, 2015 at 4:15 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Feb 05, 2015 at 11:37:13AM +0900, Joonyoung Shim wrote:
>> Hi Daniel,
>>
>> On 02/04/2015 11:28 PM, Daniel Vetter wrote:
>> > On Wed, Feb 04, 2015 at 04:44:12PM +0900, Joonyoung Shim wrote:
>> >> Hi,
>> >>
>> >> On 02/04/2015 04:14 AM, Gustavo Padovan wrote:
>> >>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>> >>>
>> >>> struct {fimd,mixer,vidi}_win_data was just keeping the same data
>> >>> as struct exynos_drm_plane thus get ride of it and use exynos_drm_plane
>> >>> directly.
>> >>>
>> >>> It changes how planes are created and remove .win_mode_set() callback
>> >>> that was only filling all *_win_data structs.
>> >>>
>> >>
>> >> I commented already on prior patch.
>> >
>> > I think you don't quite understand how this primary/overlay plane stuff
>> > works in drm core. The entire point of the drm core primary plane is to
>> > work _exactly_ like an overlay plane and allow userspace to mangle the
>> > primary plane configuration through the overlay plane. The only reason we
>> > have primary planes is so that old userspace keeps working.
>> >
>>
>> Right, i misunderstood a bit because exynos hw drivers have dependency
>> of zpos(hw overlay position).
>>
>> Current exynos drm driver has each primary plane of hw drivers and five
>> overlay planes. The primary plane is fixed on default hw overlay and all
>> overlay plane can map to all hw overlays using specific zpos property of
>> exynos drm plane.
>>
>> Gustavo approach will include specific hw overlay data in overlay plane
>> and hw driver keeps overlay planes to array by zpos order. But current
>> zpos of overlay plane is 0 always if user doesn't modify it, so hw
>> driver will use only hw overlay data of primary plane always even if
>> user want to use overlay plane.
>>
>> If user is modified zpos of overlay plane, hw driver can get wrong hw
>> overlay data from different overlay plane because hw driver keeps
>> overlay planes by zpos order.
>
> Yeah I noticed the zpos fun when hacking around too. Exynos should
> probably switch defaults so that overlays are visible by default. And we
> need to standardize the zpos property so that other drivers can use it
> too.

jfyi, I have a bit of logic in mdp5_crtc_atomic_check() (and really
mdp4 probably needs the same) to sort attached planes and derive the
actual hw zpos (with each layer having a unique zpos)..

I suspect most hw will end up needing the same (ie. dislike having two
overlays at same zpos), so might not be a horrible idea to make the
atomic helpers do this sorting for us..

BR,
-R

> But that doesn't change anything with the primary plane just being a
> special plane from the sw side (backwards compat), for exynos hw they all
> look the same.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
