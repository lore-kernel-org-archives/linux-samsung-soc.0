From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 2/5] exynos: add =?UTF-8?Q?EXYNOS=5FG=32D=5FEVENT=20to?=
 =?UTF-8?Q?=20drmHandleEvent?=
Date: Thu, 23 Apr 2015 14:04:11 +0200
Message-ID: <e086870611c6d23904978de2a07f0bb2@math.uni-bielefeld.de>
References: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1426890348-12807-3-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CAF6AEGsZdV3CrdnNUVEeaNyxq6H6ZUdCte17-NRSHhS7kZL2tQ@mail.gmail.com>
 <9f0f7af7b53d22b2be2dd1b25ebbad56@math.uni-bielefeld.de>
 <5536938B.8060605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42177 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965378AbbDWMEM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Apr 2015 08:04:12 -0400
In-Reply-To: <5536938B.8060605@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Hellstrom <thellstrom@vmware.com>

Hello Emil,

On 2015-04-21 20:14, Emil Velikov wrote:
> Hi Tobias,
> 
> On 30/03/15 13:04, Tobias Jakobi wrote:
>> Hello,
>> 
>> On 2015-03-30 02:02, Rob Clark wrote:
>>> so, iirc, vmwgfx also has some custom events..  not really sure if
>>> they have their own hand-rolled drmHandleEvent() or if they have
>>> another way of catching those.
>>> 
>>> Maybe we need some more flexible way to register handlers for driver
>>> custom events?  But everyone adding their own thing to
>>> drmHandleEvent() doesn't really seem so nice..  that said, I'm not
>>> sure how much to care.  If it is just exynos and vmwgfx, then telling
>>> them to use there own version of of drmHandleEvent() might be ok.  
>>> But
>>> if driver custom events somehow become more popular, maybe we want a
>>> better solution..
>> 
>> would something like this work for you guys:
>> https://www.math.uni-bielefeld.de/~tjakobi/archive/0001-custom-events.patch
>> 
>> (this is not compile tested or anything, just a draft)
>> 
>> Basically this introduces drmHandleEvent2, which is drmHandleEvent 
>> with
>> two additional arguments. The first one being a function pointer 
>> through
>> which the 'remaining' events (which are not handled by the common 
>> code)
>> are handled, and some (opaque) pointer to data that the handler might 
>> need.
>> 
>> In the vendor specific code I then introcuded exynos_handle_event 
>> which
>> calls dramHandleEvent2 with a properly setup handler. vmwgfx could do
>> the same here I guess.
>> 
> I'm assuming that one of the concerns here is about adding API for a
> single (and not so common) user to the core library.
> 
> From a quick look at the mesa and xf86-video-vmware I cannot see the
> vmwgfx driver using events. It has some definitions in vmwgfx_drm.h but
> that's about it.
> 
> That aside - the drmHandleEvent2 approach looks like a massive
> improvement over the original patch. Personally I do not see any
> problems with it and think that it's a good way forward.
> 
> Perhaps you can come over to #dri-devel and ping the devs to get some
> more feedback. As the topic is not a priority for most of them your
> suggestions has mostly gone unnoticed.
I'm going to flesh out the non-exynos patches some more before sending 
them to the ML for discussion.


With best wishes,
Tobias
