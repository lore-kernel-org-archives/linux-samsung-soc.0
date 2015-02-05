From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 04/14] drm/exynos: remove struct *_win_data abstraction
 on planes
Date: Thu, 5 Feb 2015 14:06:05 +0100
Message-ID: <20150205130605.GT14009@phenom.ffwll.local>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
 <1422990871-21355-5-git-send-email-gustavo@padovan.org>
 <54D1CDCC.60906@samsung.com>
 <20150204142838.GH14009@phenom.ffwll.local>
 <54D2D759.3000709@samsung.com>
 <20150205091514.GO14009@phenom.ffwll.local>
 <CAF6AEGvB5N4XtGRetP0Xay0iH3awz_Bf2Uk34KFVJi-4ea3eUw@mail.gmail.com>
 <CAPj87rNij8b9P6=Ygk6gQiA1gsSXJsq6WPatdXm85QcDMJhVqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:63384 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752811AbbBENEn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 08:04:43 -0500
Received: by mail-wi0-f182.google.com with SMTP id n3so10369256wiv.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2015 05:04:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAPj87rNij8b9P6=Ygk6gQiA1gsSXJsq6WPatdXm85QcDMJhVqg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On Thu, Feb 05, 2015 at 12:48:07PM +0000, Daniel Stone wrote:
> Hi,
> 
> On 5 February 2015 at 12:26, Rob Clark <robdclark@gmail.com> wrote:
> > On Thu, Feb 5, 2015 at 4:15 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> >> Yeah I noticed the zpos fun when hacking around too. Exynos should
> >> probably switch defaults so that overlays are visible by default. And we
> >> need to standardize the zpos property so that other drivers can use it
> >> too.
> >
> > jfyi, I have a bit of logic in mdp5_crtc_atomic_check() (and really
> > mdp4 probably needs the same) to sort attached planes and derive the
> > actual hw zpos (with each layer having a unique zpos)..
> >
> > I suspect most hw will end up needing the same (ie. dislike having two
> > overlays at same zpos), so might not be a horrible idea to make the
> > atomic helpers do this sorting for us..

Oh yeah such a helper would be nice. Especially since on intel hw flipping
planes around means fishing the right value out of some enum table ;-)
So some sort of helper to compute the absolute ordering in a stable way
would be nice.

> Same with Exynos, except it's a bit funnier still. In terms of its
> hardware, each CRTC has a number of planes which have a fixed zpos.
> The reason exynos_drm exposes zpos is because it sets up a fixed
> number of planes for the entire device and declares they can run
> across every single CRTC, and then works out from the combination of
> CRTC assignment and zpos property, which hardware plane to assign it
> to. This includes the primary, so if you accidentally get zpos==0 in
> there, then you smash the primary plane. Or set a duplicate zpos and
> then the last one in wins.
> 
> It also means if you're using multiple CRTCs (e.g. FIMD for internal
> panel plus mixer for external HDMI), then you can only use 5 planes in
> total, rather than 5 planes per head. (And let's not forget that each
> backend has disjoint format support, so again the driver just lies to
> you and claims to support them all, with a silent fallback via a
> default case statement when the format isn't actually supported.
> Whoops.)
> 
> I think a more ideal setup would be a much more direct 1:1 mapping
> with the hardware, where each actual plane on each actual CRTC gets
> exposed directly to userspace, perhaps with a fixed/read-only zpos
> property to tell the userspace which plane it's actually configuring.
> I suspect this would be a pretty good map to other hardware as well.

Hm that sounds indeed a bit funny. I agree that exynos should split planes
into per-crtc and separate the code and capability tables out so that
there's less lying. And zpos should probably be converted to a read-only
property to tell userspace about the facts, instead of doing something
funny behind the scenes.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
