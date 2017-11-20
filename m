From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL] exynos-drm-next
Date: Mon, 20 Nov 2017 08:33:07 +0100
Message-ID: <20171120073307.odudjlw4f6vsocjj@phenom.ffwll.local>
References: <CGME20171026013709epcas2p2525d1249a7f2ad640ce9028df12e2436@epcas2p2.samsung.com>
 <1508981828-5178-1-git-send-email-inki.dae@samsung.com>
 <CAPM=9ty-Boo8mjREQ8T2AaGYoU5ZcAu70iQpwJy_oawZxoS+Pg@mail.gmail.com>
 <5A0B97D5.1090202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36637 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbdKTHdL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2017 02:33:11 -0500
Received: by mail-wm0-f66.google.com with SMTP id r68so16601489wmr.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Nov 2017 23:33:11 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5A0B97D5.1090202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Dave Airlie <airlied@gmail.com>, Dave Airlie <airlied@linux.ie>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Wed, Nov 15, 2017 at 10:26:45AM +0900, Inki Dae wrote:
> Hi Dave,
> 
> 2017년 11월 14일 13:22에 Dave Airlie 이(가) 쓴 글:
> > On 26 October 2017 at 11:37, Inki Dae <inki.dae@samsung.com> wrote:
> >> Hi Dave,
> >>
> >>    Improving Exynos DRM HDMI and Mixer drivers and also adding
> >>    HDMI audio support.
> >>
> >>    Please kindly let me know if there is any problem.
> >>
> >>    Ps. we are reviewing IPP v2 driver[1] which controls post processor devices
> >>        such as FIMC, GScaler and Rotator of Exynos SoC. So I plan to request
> >>        git pull one more time after review.
> > 
> > Hi Inki,
> > 
> > I dropped the ball a bit here, I do think the second pull with IPP is
> > probably a bit late,
> > I think I'd like more assurance that the UAPI for IPP is to be used in
> > some upstream
> > shipping project (forks of mpv not withstanding, unless this fork
> > ships in some distro
> > or product).
> 
> I also commented same thing internally to author - Marek - of IPP v2 but I thought existing one is really ugly thing so may be better to change it as soon as possible before other users use this one.
> Anyway, we will merge user space for IPP v2 to libdrm first, and then Linux platform. I hope IPPv2 would be merged as soon as possible in next turn.

Beyond what Daniel said we unfortunately don't have time machines, so
fixing bad uapi isn't really possible. The problem is that even if you
create ippv2, then people can still use ippv1, and it needs to keep
working (almost) forever. So once a bad uapi is in, it's in, and there's
no good reason to add more uapi (since in 2 years you might again realize
it's not a good idea) to "fix" that. You can't fix bad uapi.

That's why we have all these rules to make sure as little bad uapi as
possible lands, since the cost is so bad.

So yeah unless you have new hw that needs it, or there's another clear
need (performance, features), you're stuck with ippv1. "It's cleaner" is
not a good reason to rev uapi, since our experience with all the uapi in
drm clearly shows we can't predict the future :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
