From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH -v2] drm/exynos: track vblank events on a per crtc basis
Date: Fri, 30 Jan 2015 15:17:18 -0200
Message-ID: <20150130171718.GI30820@joana>
References: <1422016980-23806-2-git-send-email-gustavo@padovan.org>
 <1422551459-25812-1-git-send-email-gustavo@padovan.org>
 <54CAF028.6060902@samsung.com>
 <20150130143037.GB30820@joana>
 <CAPj87rOJO5kYeVeserzrCk6AYu3CfrKBk8hhNCvzWUGQu_7ncg@mail.gmail.com>
 <20150130160806.GB14009@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48]:37157 "EHLO
	mail-qg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751554AbbA3RRX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 12:17:23 -0500
Received: by mail-qg0-f48.google.com with SMTP id z60so39086844qgd.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jan 2015 09:17:22 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20150130160806.GB14009@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, =?utf-8?B?J+uMgOyduOq4sC9Nb2JpbGUgUy9XIFBsYXRmb3JtIExhYi4o7Ya17Iug7Jew?= =?utf-8?B?KS9FMyjsgqzsm5ApL+yCvOyEseyghOyekCc=?= <inki.dae@samsung.com>

2015-01-30 Daniel Vetter <daniel@ffwll.ch>:

> On Fri, Jan 30, 2015 at 03:57:53PM +0000, Daniel Stone wrote:
> > Hi,
> > 
> > On 30 January 2015 at 14:30, Gustavo Padovan <gustavo@padovan.org> wrote:
> > > 2015-01-30 Joonyoung Shim <jy0922.shim@samsung.com>:
> > >> We will lose unfinished prior events by this change. That's why we use
> > >> linked list.
> > >
> > > I think you are right, but I was using exynos_crtc->event to do exactly the
> > > same as exynos_crtc->pending_flip. So we were losing a event in
> > > exynos_drm_crtc_dpms() before too. I change this patch to have a page_flip
> > > list on the crtc.
> > 
> > The usual approach in other drivers is to return -EBUSY when there is
> > already an async pageflip pending. This definitely makes sense to me,
> > as I don't see the point of submitting pageflips faster than the
> > hardware can actually render, and pretending to the application that
> > they were actually shown.
> 
> Yes, right now drm doesn't really support anything like a pageflip queue.
> Same for atomic really. Even the async pageflip mode works like it, it
> just ends up flipping faster.
> 
> Long-term we want a flip queue where subsequent flips can be folded
> together on the next vblank. That makes benchmark-mode games happy,
> without resulting in tearing like async flips and still resulting in the
> lowest possible latency (since the kernel we just commit the flips for
> which all the buffers are ready and not stall).

Yeah, that makes sense. I'll just add a check for -EBUSY and send a v2.

	Gustavo
