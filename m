From: Daniel Drake <drake@endlessm.com>
Subject: exynos-drm 1024x768 HDMI output
Date: Tue, 3 Dec 2013 16:07:55 -0600
Message-ID: <CAD8Lp47ya+nX5S2aZOYVzg+Qx11jhcnf+hvVONpBtGVdKHtwfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:63175 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752482Ab3LCWH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Dec 2013 17:07:57 -0500
Received: by mail-wg0-f45.google.com with SMTP id y10so12511660wgg.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2013 14:07:55 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, seanpaul@chromium.org
Cc: dri-devel@lists.freedesktop.org

Hi,

Thanks a lot for this exynos-drm commit:

commit 62747fe0ad5169a767987d9009e3398466555cde
Author: Sean Paul <seanpaul@chromium.org>
Date:   Tue Jan 15 08:11:08 2013 -0500

    drm/exynos: hdmi: support extra resolutions using drm_display_mode timings

As you probably know, many people had written off the Exynos4's
capability to output to non-TV resolutions over HDMI. Now, with your
patch, 640x480 works perfectly, and other resolutions are hopefully
within reach.

I would like to get 1024x768 working on Exynos4412. I'm using a Sony
TV which has an EDID that offers 1024x768 in its established timing
bitmap - i.e. it supports 1024x768 via the standard/ancient VESA
timings. I have tested the TV with other devices, it seems to work
fine at this res.

However, on Exynos4412 with exynos-drm, running at this resolution is
not quite right. The very first row of pixels is rendered perfectly,
but all off the others are offset and wrapped. I'll try to explain
with some ASCII art:

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
XXXXXXXXXBBBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBCCCCCCCCCCCCCCCCCCCCCCCC

Imagine that is the complete first 3 rows of pixels shown on my display.
The first row, with pixels A, is complete, and starts and finishes
where it should do on the physical display.

However, the second row on the display starts with a series of
always-black pixels, this is the region marked X, which occupies 257
pixels. Immediately after, the second row of pixels of the output
image starts (B), then when it hits the end of the screen, it wraps
around onto the next row of pixels on the screen. Then the third row
of the image pixels starts (C) and so on.

Sounds like a hsync issue, right? I have been playing with the
register writes in hdmi_v14_mode_set() but I can't quite get a perfect
output.

Is there any documentation available for these registers? Why do we
have to program the numbers twice (once in HDMI regs, once in timing
generator regs)?

Specifically, I have not yet found an explanation for why the first
row gets rendered right, and I haven't found a way to reduce the size
of region X, although I have figured out how to move it around:

The standard timings for 1024x768 are:
hdisplay=1024
hsync_start=1048
hsync_end=1185
htotal=1344

Using these numbers, exynos-drm writes:
tg->hact_st = 320
tg->hact_sz = 1024

If I subtract and add 257 (the size of the black region X)  respectively, i.e.
tg->hact_st = 63
tg->hact_sz = 1288

Then I get the following:

AAAAAAAAAAAAAAAAAAAAAAAAXXXXXXXXX
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

i.e. all rows of displayed output are now fine, except for the first.
On the first row, the leftmost 257 pixels of output are no longer
visible anywhere, the rest of them start in the wrong place (top left,
rather than 257 pixels in), and the black region X is now positioned
at the right hand side of the first row.

That is the closest I have found so far.

Any thoughts or tips much appreciated.

Thanks
Daniel
