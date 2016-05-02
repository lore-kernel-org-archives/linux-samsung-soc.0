From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: drm/exynos: fimd: vrefresh is zero
Date: Mon, 2 May 2016 10:22:47 -0400
Message-ID: <CADnq5_N_SnzU3Cpc9+w8FJXvmpa=oRKcwNzHrTQwY21ksCbh_A@mail.gmail.com>
References: <5725259C.9020206@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.161.174]:33122 "EHLO
	mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836AbcEBOWs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 May 2016 10:22:48 -0400
Received: by mail-yw0-f174.google.com with SMTP id t10so289901907ywa.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 May 2016 07:22:47 -0700 (PDT)
In-Reply-To: <5725259C.9020206@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org

On Sat, Apr 30, 2016 at 5:37 PM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> Hello,
>
> while playing around with FIMD enabled, I noticed that when first using
> the device a zero division was triggered in fimd_calc_clkdiv(). I
> remembered that I had a similar issue some time ago.
>
> I added a stub fimd_atomic_check() which shows that vrefresh is zero
> when fimd_calc_clkdiv() is called.
>
> [  164.059361] [drm:exynos_plane_mode_set] plane : offset_x/y(0,0),
> width/height(1366,768)
> [  164.067175] [drm:fimd_atomic_check] xres=1366, yres=768, refresh=0,
> intl=0
> [  164.074198] [drm:drm_atomic_helper_check_planes] [CRTC:24:crtc-0]
> atomic driver check failed
>
> I went back to the git log and noticed that some time ago in
> 50bbfbffa5c894def440ce8157dfe53e60960d35 the fimd_mode_fixup() call was
> removed.
>
> I'm now wondering where exactly vrefresh is set to a sane value. As far
> as I can see of_get_videomode() is used to fetch the video mode from the
> DT, and drm_display_mode_from_videomode() is used to convert it. However
> vrefresh is nowhere set.
>
> So is something broken here, or am I missing something?
>

There is no guarantee that vrefresh is actually set.  I think the only
way to reliably get it is to call drm_mode_vrefresh().


Alex
