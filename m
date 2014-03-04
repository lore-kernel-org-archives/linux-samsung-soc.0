From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Adding set_blob ioctl to DRM
Date: Tue, 4 Mar 2014 09:35:57 +0100
Message-ID: <20140304083557.GM17001@phenom.ffwll.local>
References: <CAPdUM4PXxXgywMA8KnLhwAToHqfc0EP7HNDKjKJLK3T1HA7_eQ@mail.gmail.com>
 <CAPM=9tz6TzVyyCsNAGqt4Vy+WoKjcc-yvq7fSiLhNUKeWFO6bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:49102 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756262AbaCDIgC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Mar 2014 03:36:02 -0500
Received: by mail-ee0-f49.google.com with SMTP id c41so652479eek.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2014 00:36:00 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAPM=9tz6TzVyyCsNAGqt4Vy+WoKjcc-yvq7fSiLhNUKeWFO6bA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: Rahul Sharma <r.sh.open@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Prashanth G <prashanth.g@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On Thu, Feb 20, 2014 at 11:24:40AM +1000, Dave Airlie wrote:
> > I am working on enabling a Color Enhancement block for primary display
> > for Exynos SoC. I need to
> > set a bunch of parameters like Color Conversion matrix, Contrast
> > Improvement parameters etc ~ 30 parameters from User Space.
> >
> > I am planning to use KDS blob property to receive these parameters.
> > Currently drivers are not allowed to create a blob property inside
> > drm. Neither, user space can set the blob. There is no ioctl provided
> > for same.
> 
> I don't really like the idea of sticking unstructured data into an
> ioctl, for the driver to interpret,
> 
> it opens the door to all kinds of ugly driver hacks, so I think we
> should have writable blobs,
> but with well defined structures inside them, not per-driver ones.
> 
> Per-driver structures will lead to binary userspace drivers that start
> sticking a pll timings blob on the end and require it to set a mode,
> because I know driver developers will abuse any interface in the worst
> way possible.
> 
> Currently the only blob we really have is EDID and its well defined,
> so if we are going to add writable blobs, they need to be well defined
> and as little as possible driver specific, just to avoid driver
> writings doing what driver writers do.

tbh I don't see a use for structured blobs at all and would much more
prefer a pile of properties. With the atomic modeset ioctl proposals
floating around we could then pass in an entire sets of properties, which
is essentially what the blob prop would be doing.

The upshot of going all-in with explicitly named properties is that we can
shovel kms configuration descriptions into different formats. I'm thinking
of shovelling an initial config into DT or something similar as an
example.  For i915 we have some experimental patches which load a DT blob
as a firmware file and use the property values to set things up.

So imo a blob property needs some _really_ good justification. My default
stance is to oppose it ;-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
