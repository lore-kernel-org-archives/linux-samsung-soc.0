From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Tue, 28 Oct 2014 20:16:44 +0530
Message-ID: <CAEC9eQNqDNS0HgCSCOkVBYzSypHCt+aMxYZaX1vmTr8SKn2cbA@mail.gmail.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
	<1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
	<20141027190137.GT26941@phenom.ffwll.local>
	<CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
	<CAEC9eQPQaYjL3ZxtDZBdKi2z5yANcHQ9s4ikYkxN95K9qvu01Q@mail.gmail.com>
	<CAKMK7uGoO5TBgLh4HSDjxUM=-WRfsQoDHusLmOYxLio-QBMEPQ@mail.gmail.com>
	<CAEC9eQNJb1TgK1ihvzvC0VjSJhm48WaFO5SVigPsqTOurK2UQw@mail.gmail.com>
	<CAKMK7uFX7rENLBmwE58rtCBXZ_pSF_uS5Poiuks7xfi+r=e9gw@mail.gmail.com>
	<20141028144126.GC17770@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:59137 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751400AbaJ1Oqp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 10:46:45 -0400
Received: by mail-ig0-f170.google.com with SMTP id hn18so8010717igb.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Oct 2014 07:46:44 -0700 (PDT)
In-Reply-To: <20141028144126.GC17770@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Jingoo Han <jg1.han@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>

On Tue, Oct 28, 2014 at 8:11 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Tue, Oct 28, 2014 at 03:19:36PM +0100, Daniel Vetter wrote:
>> On Tue, Oct 28, 2014 at 1:28 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
>> > On Tue, Oct 28, 2014 at 3:31 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> [...]
>> >> Hm, if you do this can you pls also update drm_panel accordingly? It
>> >> shouldn't be a lot of fuzz and would make things around drm+dt more
>> >> consistent.
>> > Are you talking about using struct device_node instead of struct device?
>> > I guess you have misplaced the comment under the wrong section!
>>
>> Yeah, that should have been one up ;-)
>
> Like I said earlier, I don't think dropping struct device * in favour of
> struct device_node * is a good idea.
I am not sure about drm_panel.
But, I am not really doing anything with the struct device pointer in
case of bridge.
So, just wondering if it is really needed?

Ajay
