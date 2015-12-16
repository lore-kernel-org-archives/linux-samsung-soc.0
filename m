From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/7] drm/exynos: make zpos property configurable
Date: Wed, 16 Dec 2015 15:21:58 +0100
Message-ID: <20151216142158.GP30437@phenom.ffwll.local>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-3-git-send-email-m.szyprowski@samsung.com>
 <20151216132836.GM30437@phenom.ffwll.local>
 <56716CFC.1090006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:37908 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933082AbbLPOWB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 09:22:01 -0500
Received: by mail-wm0-f54.google.com with SMTP id l126so40099488wml.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Dec 2015 06:22:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <56716CFC.1090006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On Wed, Dec 16, 2015 at 02:54:04PM +0100, Marek Szyprowski wrote:
> Hello,
> 
> On 2015-12-16 14:28, Daniel Vetter wrote:
> >On Wed, Dec 16, 2015 at 01:21:43PM +0100, Marek Szyprowski wrote:
> >>This patch adds all infrastructure to make zpos plane property
> >>configurable from userspace.
> >>
> >>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >Imo zpos should be a generic atomic property with well-defined semantics
> >shared across drivers. So
> >- storead (in decoded form) in drm_plane_state
> >- common functions to register/attach zpos prop to a plane, with
> >   full-blown kerneldoc explaining how it should work
> >- generic kms igt to validate that interface
> >
> >One of the big things that always comes up when we talk about zpos is how
> >equal zpos should be handled, and how exactly they should be sorted. I
> >think for that we should have a drm function which computes a normalized
> >zpos. Or the core check code should reject such nonsense.
> 
> IMHO it will be enough to state that the case of equal zpos is HW specific.
> This might simplify some driver logic. For example, in case of Exynos Mixer,
> equal priority (zpos) means that HW predefined order will be used, so there
> is no need to normalize zpos values.
> 
> If you want I can move zpos to drm core and add a function to normalize
> zpos,
> although for this particular driver normalization is not needed.
> 
> It should be quite easy to convert other drivers to use the generic zpos
> property. The only problem I see is how to handle omap driver, which use
> 'zorder' property.
> 
> What about some other typical properties related to blending:
> - global plane alpha,
> - colorkey,
> - alpha mode (standard or pre-multiplied) for alpha-enabled modes,
> - crtc background color.
> 
> Do you also want to handle them as generic or driver-specific properties?

Should all be generic really. And it's also kinda ABI, so userspace
needed, and preferrably a proper/automated testcase. i915 has
infrastructure to use display pipeline CRCs to really measure it's all
correct even, and that's the standard I'd like to see for all KMS API
extensions like this.

Since if we don't do this we'll end up in a giant mess, and it will be
impossible to write a kms compositor that's generic and uses all this.

And since this stuff is supposed to be generic, fluffy/unspecified
semantics aren't good. Especially if your hw can just somehow deal with it
all.

> I plan to add support for them to Exynos Mixer and I would like to avoid
> doing this twice.

It's a lot more work than just adding a few members to drm_plane_state.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
