From: Daniel Drake <drake@endlessm.com>
Subject: Re: exynos-drm 1024x768 HDMI output
Date: Thu, 12 Dec 2013 16:46:52 -0600
Message-ID: <CAD8Lp47N_E-ANOA4QH4UaDyeDJE59XdHH1K9shKQREegaeTnPw@mail.gmail.com>
References: <CAD8Lp47ya+nX5S2aZOYVzg+Qx11jhcnf+hvVONpBtGVdKHtwfA@mail.gmail.com>
	<CAOw6vb+58XZFzxkzfBRfRFObfY5+q29Yk9_qkesGg+kqSYYB+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:49183 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571Ab3LLWqx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 17:46:53 -0500
Received: by mail-we0-f181.google.com with SMTP id x55so1128657wes.40
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2013 14:46:52 -0800 (PST)
In-Reply-To: <CAOw6vb+58XZFzxkzfBRfRFObfY5+q29Yk9_qkesGg+kqSYYB+w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Wed, Dec 4, 2013 at 12:14 PM, Sean Paul <seanpaul@chromium.org> wrote:
> I assume this is the "1024x768@60Hz" mode in drm_edid.c?
>
> hdisplay = 1024
> hsync_start = 1048
> hsync_end = 1184
> htotal = 1344
> vdisplay = 768
> vsync_start = 771
> vsync_end = 777
> vtotal = 806

That's the one.

> I don't have any documentation for the 4412, so I'm flying blind as well.

What about documentation for exynos5, which runs from the same driver?

>> Specifically, I have not yet found an explanation for why the first
>> row gets rendered right, and I haven't found a way to reduce the size
>> of region X, although I have figured out how to move it around:
>>
>> The standard timings for 1024x768 are:
>> hdisplay=1024
>> hsync_start=1048
>> hsync_end=1185
>> htotal=1344
>>
>> Using these numbers, exynos-drm writes:
>> tg->hact_st = 320
>> tg->hact_sz = 1024
>>
>> If I subtract and add 257 (the size of the black region X)  respectively, i.e.
>> tg->hact_st = 63
>> tg->hact_sz = 1288
>>
>> Then I get the following:
>>
>> AAAAAAAAAAAAAAAAAAAAAAAAXXXXXXXXX
>> BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
>> CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
>
> Have you tried:
>
> hact_st = 320
> h_fsz += 257?
>
> hact_st specifies where to start scanning out the buffer, so it's not
> surprising that you're missing the first 257 pixels in this case.
> Maybe bumping up the full size of the h_line will help?

If I do:
hact_st = 320 (no change)
hact_sz += 257
h_fsz = h_line = 1344 (no change)
then I don't see any change in behaviour to the base case, where the
second line is 'indented' by 257 black pixels.

If I change h_fsz alone, or h_line alone, I get no display at all on
the TV. I can only change them in harmony.

If I do:
hact_st = 320 (no change)
hact_sz = 1024 (no change)
h_fsz += 257
h_line += 257
then my TV thinks it is outputting at 1281x768. To the left and right
of the image, where I would expect black side bars (its a widescreen
TV, so it will pad the sides with black to fit a 4:3 resolution on), I
now get visual corruption (basically one of the pixels from the screen
repeated forming a horizontal line).

The first 257 pixels of the first row of the image output are not
shown anywhere.
The second row of pixels (and the ones that follow) start roughly in
the right place but the final 257 pixels are not displayed anywhere.

What I feel we are missing here is an explanation for why the first
row of pixels is treated differently from the rest. Every value that I
tweak seems to have an effect on the first line (which was rendered
OK) as well as all the others (which were bad). If it were just a
matter of tweaking e.g. h_fsz then I would expect *all* rows of pixels
to have been rendered badly in the first place.

Nevertheless, I'm happy to continue throwing values at the variables
if that is our best option... We need to find a way of making a change
that effects the only first line, or all the lines except the first.

Daniel
