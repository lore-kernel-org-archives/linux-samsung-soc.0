From: Daniel Drake <drake@endlessm.com>
Subject: Re: exynos-drm 1024x768 HDMI output
Date: Fri, 13 Dec 2013 10:45:09 -0600
Message-ID: <CAD8Lp47G_eyAi_gUC47HQqE_pnORs+kq5vt4Kp1LVsPF7MSVpA@mail.gmail.com>
References: <CAD8Lp47ya+nX5S2aZOYVzg+Qx11jhcnf+hvVONpBtGVdKHtwfA@mail.gmail.com>
	<CAOw6vb+58XZFzxkzfBRfRFObfY5+q29Yk9_qkesGg+kqSYYB+w@mail.gmail.com>
	<CAD8Lp47N_E-ANOA4QH4UaDyeDJE59XdHH1K9shKQREegaeTnPw@mail.gmail.com>
	<CAD8Lp46m5VqNNbM2rSEFsOxUT1XW=35FUo6We_u0f8jNP+=dag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:64521 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752318Ab3LMQpK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Dec 2013 11:45:10 -0500
Received: by mail-we0-f180.google.com with SMTP id t61so2129957wes.39
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2013 08:45:09 -0800 (PST)
In-Reply-To: <CAD8Lp46m5VqNNbM2rSEFsOxUT1XW=35FUo6We_u0f8jNP+=dag@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Fri, Dec 13, 2013 at 9:46 AM, Daniel Drake <drake@endlessm.com> wrote:
> Lets just accept the fact that the first line of the output image is
> rendered badly. Specifically, it has 257 black pixels added onto the
> end of it. The following rows do not exhibit that problem.
>
> To accept and ignore this oddity, I want to make the device start
> outputting the image exactly 1024+257 pixels too early. i.e. I want
> 1281 junk pixels before the image starts.
>
> Then, I want to adjust the timing parameters appropriately so that
> those junk pixels do not appear on the display. I want those 1281 junk
> pixels to be sent to the display during the horizontal scans that
> happen before the top left visible pixel is clocked. I think I'm
> saying: I want to adjust the field of view so that those 1281 junk
> pixels are rendered inside the vertical back porch.

Nearly got something working along these lines:

tg->vact_st -= 1
tg->vact_sz += 1

Now the 257 bad pixels start at the top left of my display (rather
than on the second row of visible pixels), and that causes the
annoying horizontal wrap that I wrote about in my first mail.
So add from earlier:
tg->hact_st -= 257
tg->hact_sz + 257

Now the displayed image looks good.

But looking closer, I am missing the first horizontal row of pixels,
and the rightmost vertical column of pixels.

Daniel
