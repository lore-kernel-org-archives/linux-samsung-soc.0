From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 6/7] drm/exynos/decon5433: signal vblank only on odd
 fields
Date: Thu, 26 Jan 2017 12:42:07 +0200
Message-ID: <20170126104207.GZ31595@intel.com>
References: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
 <CGME20170120065231eucas1p121d2a987695fdce00e1b2bba445f1818@eucas1p1.samsung.com>
 <1484895145-511-7-git-send-email-a.hajda@samsung.com>
 <20170120135540.GC31595@intel.com>
 <953193f0-484e-0457-baf4-e42b44a3f147@samsung.com>
 <20170125140641.GU31595@intel.com>
 <51bd59d2-e0ca-f265-c90f-d68725602b44@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:44973 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752971AbdAZKmN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:42:13 -0500
Content-Disposition: inline
In-Reply-To: <51bd59d2-e0ca-f265-c90f-d68725602b44@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Daniel Vetter <daniel@ffwll.ch>

On Thu, Jan 26, 2017 at 09:22:27AM +0100, Andrzej Hajda wrote:
> On 25.01.2017 15:06, Ville Syrjälä wrote:
> > On Mon, Jan 23, 2017 at 10:15:16AM +0100, Andrzej Hajda wrote:
> >> On 20.01.2017 14:55, Ville Syrjälä wrote:
> >>> On Fri, Jan 20, 2017 at 07:52:24AM +0100, Andrzej Hajda wrote:
> >>>> In case of interlace mode irq is generated for odd and even fields, but
> >>>> vblank should be signaled only for the last emitted field.
> >>> I'm pretty sure most drivers signal it for both fields. At least i915
> >>> does.
> >> The question is which behavior is correct? I have not found any clear
> >> statement in the documentation, or drm core code.
> > That's very typical for us unfortunately.
> >
> > I would say what we should do what i915 does. It allows more flexibility
> > in how you use the hardware. Eg. then you can actually scan out
> > interlaced material to an interlaced display and not mess up the fields,
> > and you can also do 3:2 pulldown type of stuff. Or you can even just
> > stuff progressive frames down the pipe at field rate.
> >
> > One problem with interlaced stuff is that we don't have any field
> > indication in the events, nor do we have a way to flip on a specific
> > field. I tried to specify the latter for the SETPLANE ioctl way
> > back when, but it didn't end up being implemented and now we would
> > need something different for atomic.
> >
> >> I have guessed that since vblank event is used to signal end of scan-out
> >> of buffer it should be called after scan-out of whole buffer - in case
> >> of interlaced mode after scan-out of 2nd field.
> > Each field has a proper vertical blanking interval, so you'd just end up
> > totally wasting one of them.
> 
> The problem in this particular case is that hardware does not allow to
> change buffers between fields, or more precisely it updates its internal
> registers after 2nd field - ie after reading full frame.

Oh. That's a rather odd piece of hw then. In that case it might indeed
be better to not signal vblank for the field that can't do the flip.

> I am still investigating the issue, but it is possible this limitation
> cannot be overcome.
> 
> Regards
> Andrzej
> 
> >
> >> Maybe my assumption is wrong, in such case this patch should be dropped
> >> and mixer driver also should be fixed, but before doing that it would be
> >> good to know for sure how it should be handled correctly.
> >>
> >> Regards
> >> Andrzej
> 

-- 
Ville Syrjälä
Intel OTC
