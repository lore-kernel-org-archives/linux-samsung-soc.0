From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: drm/exynos: fimd: vrefresh is zero
Date: Mon, 2 May 2016 23:00:54 +0200
Message-ID: <CAKMK7uGPx5Pdio2cr+zBTX1NrMr9+nk1MY7bJqziLGNvS93gwA@mail.gmail.com>
References: <5725259C.9020206@math.uni-bielefeld.de>
	<CADnq5_N_SnzU3Cpc9+w8FJXvmpa=oRKcwNzHrTQwY21ksCbh_A@mail.gmail.com>
	<5727648D.7050603@math.uni-bielefeld.de>
	<20160502202257.GW14148@phenom.ffwll.local>
	<5727B8E6.6050106@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33463 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755198AbcEBVAz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 May 2016 17:00:55 -0400
Received: by mail-oi0-f51.google.com with SMTP id v145so700435oie.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 May 2016 14:00:54 -0700 (PDT)
In-Reply-To: <5727B8E6.6050106@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Alex Deucher <alexdeucher@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

On Mon, May 2, 2016 at 10:30 PM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
>> drm_mode_set_crtcinfo() is meant to be used to fill in all the derived
>> values. We might or might not want to have a default call for that in
>> atomic helpers actually (before we call down into any of the driver's
>> check functions for the first time). There's a bunch of flags to control
>> it, but drivers with special needs could simply call it once more and
>> overwrite the computed values. No harm done.
> I had a look at drm_mode_set_crtcinfo() (from 4.6-rc6) but it also
> doesn't set the vrefresh field. Maybe you mean a different call?

I was blind - it fills in everything except vrefresh. If you look at
drivers most of them use vrefresh purely for debug output or as an
informational field in general. Most hw wants the actual pixelclock
anyway, so there's not really a need for vrefresh (e.g. i915 only
computes vrefresh for the internally used panel modes). The value
itself is directly taken from userspace, so probably just a bug in
exynos userspace? Of course the driver should still keep working. From
a quick look you want to remove any use of vrefresh (except debug
output), and especially you shouldn't recompute the actual pixelclock
like decon/fimd seem to do (stored into ideal_clock). Instead use
mode->clock, that's supposed to be the real value.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
