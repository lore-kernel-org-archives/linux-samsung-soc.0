From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 2/5] exynos: add =?UTF-8?Q?EXYNOS=5FG=32D=5FEVENT=20to?=
 =?UTF-8?Q?=20drmHandleEvent?=
Date: Mon, 30 Mar 2015 15:04:12 +0200
Message-ID: <9f0f7af7b53d22b2be2dd1b25ebbad56@math.uni-bielefeld.de>
References: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1426890348-12807-3-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CAF6AEGsZdV3CrdnNUVEeaNyxq6H6ZUdCte17-NRSHhS7kZL2tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33232 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752893AbbC3NEP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 09:04:15 -0400
In-Reply-To: <CAF6AEGsZdV3CrdnNUVEeaNyxq6H6ZUdCte17-NRSHhS7kZL2tQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Hellstrom <thellstrom@vmware.com>

Hello,

On 2015-03-30 02:02, Rob Clark wrote:
> so, iirc, vmwgfx also has some custom events..  not really sure if
> they have their own hand-rolled drmHandleEvent() or if they have
> another way of catching those.
> 
> Maybe we need some more flexible way to register handlers for driver
> custom events?  But everyone adding their own thing to
> drmHandleEvent() doesn't really seem so nice..  that said, I'm not
> sure how much to care.  If it is just exynos and vmwgfx, then telling
> them to use there own version of of drmHandleEvent() might be ok.  But
> if driver custom events somehow become more popular, maybe we want a
> better solution..

would something like this work for you guys:
https://www.math.uni-bielefeld.de/~tjakobi/archive/0001-custom-events.patch

(this is not compile tested or anything, just a draft)

Basically this introduces drmHandleEvent2, which is drmHandleEvent with 
two additional arguments. The first one being a function pointer through 
which the 'remaining' events (which are not handled by the common code) 
are handled, and some (opaque) pointer to data that the handler might 
need.

In the vendor specific code I then introcuded exynos_handle_event which 
calls dramHandleEvent2 with a properly setup handler. vmwgfx could do 
the same here I guess.

With best wishes,
Tobias
