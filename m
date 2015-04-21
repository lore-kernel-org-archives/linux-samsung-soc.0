From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/5] exynos: add EXYNOS_G2D_EVENT to drmHandleEvent
Date: Tue, 21 Apr 2015 18:14:35 +0000
Message-ID: <5536938B.8060605@gmail.com>
References: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1426890348-12807-3-git-send-email-tjakobi@math.uni-bielefeld.de> <CAF6AEGsZdV3CrdnNUVEeaNyxq6H6ZUdCte17-NRSHhS7kZL2tQ@mail.gmail.com> <9f0f7af7b53d22b2be2dd1b25ebbad56@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:34297 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932433AbbDURQF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Apr 2015 13:16:05 -0400
Received: by wgso17 with SMTP id o17so221116714wgs.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Apr 2015 10:16:03 -0700 (PDT)
In-Reply-To: <9f0f7af7b53d22b2be2dd1b25ebbad56@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Rob Clark <robdclark@gmail.com>
Cc: emil.l.velikov@gmail.com, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Hellstrom <thellstrom@vmware.com>

Hi Tobias,

On 30/03/15 13:04, Tobias Jakobi wrote:
> Hello,
> 
> On 2015-03-30 02:02, Rob Clark wrote:
>> so, iirc, vmwgfx also has some custom events..  not really sure if
>> they have their own hand-rolled drmHandleEvent() or if they have
>> another way of catching those.
>>
>> Maybe we need some more flexible way to register handlers for driver
>> custom events?  But everyone adding their own thing to
>> drmHandleEvent() doesn't really seem so nice..  that said, I'm not
>> sure how much to care.  If it is just exynos and vmwgfx, then telling
>> them to use there own version of of drmHandleEvent() might be ok.  But
>> if driver custom events somehow become more popular, maybe we want a
>> better solution..
> 
> would something like this work for you guys:
> https://www.math.uni-bielefeld.de/~tjakobi/archive/0001-custom-events.patch
> 
> (this is not compile tested or anything, just a draft)
> 
> Basically this introduces drmHandleEvent2, which is drmHandleEvent with
> two additional arguments. The first one being a function pointer through
> which the 'remaining' events (which are not handled by the common code)
> are handled, and some (opaque) pointer to data that the handler might need.
> 
> In the vendor specific code I then introcuded exynos_handle_event which
> calls dramHandleEvent2 with a properly setup handler. vmwgfx could do
> the same here I guess.
> 
I'm assuming that one of the concerns here is about adding API for a
single (and not so common) user to the core library.

>From a quick look at the mesa and xf86-video-vmware I cannot see the
vmwgfx driver using events. It has some definitions in vmwgfx_drm.h but
that's about it.

That aside - the drmHandleEvent2 approach looks like a massive
improvement over the original patch. Personally I do not see any
problems with it and think that it's a good way forward.

Perhaps you can come over to #dri-devel and ping the devs to get some
more feedback. As the topic is not a priority for most of them your
suggestions has mostly gone unnoticed.

Cheers,
Emil
