From: Sean Paul <seanpaul@chromium.org>
Subject: Re: exynos-drm 1024x768 HDMI output
Date: Wed, 4 Dec 2013 13:14:11 -0500
Message-ID: <CAOw6vb+58XZFzxkzfBRfRFObfY5+q29Yk9_qkesGg+kqSYYB+w@mail.gmail.com>
References: <CAD8Lp47ya+nX5S2aZOYVzg+Qx11jhcnf+hvVONpBtGVdKHtwfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f46.google.com ([209.85.213.46]:63961 "EHLO
	mail-yh0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933075Ab3LDSOf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Dec 2013 13:14:35 -0500
Received: by mail-yh0-f46.google.com with SMTP id l109so11536351yhq.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2013 10:14:34 -0800 (PST)
Received: from mail-ie0-x230.google.com (mail-ie0-x230.google.com [2607:f8b0:4001:c03::230])
        by mx.google.com with ESMTPSA id q44sm98343960yhg.10.2013.12.04.10.14.32
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Wed, 04 Dec 2013 10:14:32 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id at1so26259333iec.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2013 10:14:31 -0800 (PST)
In-Reply-To: <CAD8Lp47ya+nX5S2aZOYVzg+Qx11jhcnf+hvVONpBtGVdKHtwfA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Tue, Dec 3, 2013 at 5:07 PM, Daniel Drake <drake@endlessm.com> wrote:
> Hi,
>
> Thanks a lot for this exynos-drm commit:
>
> commit 62747fe0ad5169a767987d9009e3398466555cde
> Author: Sean Paul <seanpaul@chromium.org>
> Date:   Tue Jan 15 08:11:08 2013 -0500
>
>     drm/exynos: hdmi: support extra resolutions using drm_display_mode timings
>
> As you probably know, many people had written off the Exynos4's
> capability to output to non-TV resolutions over HDMI. Now, with your
> patch, 640x480 works perfectly, and other resolutions are hopefully
> within reach.
>

Awesome, I'm glad it improved things :)

> I would like to get 1024x768 working on Exynos4412. I'm using a Sony
> TV which has an EDID that offers 1024x768 in its established timing
> bitmap - i.e. it supports 1024x768 via the standard/ancient VESA
> timings. I have tested the TV with other devices, it seems to work
> fine at this res.
>

I assume this is the "1024x768@60Hz" mode in drm_edid.c?

ie:

hdisplay = 1024
hsync_start = 1048
hsync_end = 1184
htotal = 1344
vdisplay = 768
vsync_start = 771
vsync_end = 777
vtotal = 806

> However, on Exynos4412 with exynos-drm, running at this resolution is
> not quite right. The very first row of pixels is rendered perfectly,
> but all off the others are offset and wrapped. I'll try to explain
> with some ASCII art:
>
> AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
> XXXXXXXXXBBBBBBBBBBBBBBBBBBBBBBBB
> BBBBBBBBBCCCCCCCCCCCCCCCCCCCCCCCC
>
> Imagine that is the complete first 3 rows of pixels shown on my display.
> The first row, with pixels A, is complete, and starts and finishes
> where it should do on the physical display.
>
> However, the second row on the display starts with a series of
> always-black pixels, this is the region marked X, which occupies 257
> pixels. Immediately after, the second row of pixels of the output
> image starts (B), then when it hits the end of the screen, it wraps
> around onto the next row of pixels on the screen. Then the third row
> of the image pixels starts (C) and so on.
>
> Sounds like a hsync issue, right? I have been playing with the
> register writes in hdmi_v14_mode_set() but I can't quite get a perfect
> output.
>
> Is there any documentation available for these registers? Why do we
> have to program the numbers twice (once in HDMI regs, once in timing
> generator regs)?
>

I don't have any documentation for the 4412, so I'm flying blind as well.


> Specifically, I have not yet found an explanation for why the first
> row gets rendered right, and I haven't found a way to reduce the size
> of region X, although I have figured out how to move it around:
>
> The standard timings for 1024x768 are:
> hdisplay=1024
> hsync_start=1048
> hsync_end=1185
> htotal=1344
>
> Using these numbers, exynos-drm writes:
> tg->hact_st = 320
> tg->hact_sz = 1024
>
> If I subtract and add 257 (the size of the black region X)  respectively, i.e.
> tg->hact_st = 63
> tg->hact_sz = 1288
>
> Then I get the following:
>
> AAAAAAAAAAAAAAAAAAAAAAAAXXXXXXXXX
> BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
> CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
>

Have you tried:

hact_st = 320
h_fsz += 257?

hact_st specifies where to start scanning out the buffer, so it's not
surprising that you're missing the first 257 pixels in this case.
Maybe bumping up the full size of the h_line will help?


Sean

> i.e. all rows of displayed output are now fine, except for the first.
> On the first row, the leftmost 257 pixels of output are no longer
> visible anywhere, the rest of them start in the wrong place (top left,
> rather than 257 pixels in), and the black region X is now positioned
> at the right hand side of the first row.
>
> That is the closest I have found so far.
>
> Any thoughts or tips much appreciated.
>
> Thanks
> Daniel
