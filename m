From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/5] clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag for the sysreg clock
Date: Thu, 12 Dec 2013 10:53:52 +0100
Message-ID: <57785646.ACHYxksEZV@flatron>
References: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com> <CAD=FV=XG+5n+SW_bDiFtQB7ieViAxVAO5E12+y-DgY34maT6DQ@mail.gmail.com> <CAM4voanSSqqAzRqrNrRc+HYh4vtq3zgNeGQYCVG6sE6nB_eWGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:60458 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751396Ab3LLJx7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 04:53:59 -0500
Received: by mail-ea0-f171.google.com with SMTP id h10so94680eak.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2013 01:53:58 -0800 (PST)
In-Reply-To: <CAM4voanSSqqAzRqrNrRc+HYh4vtq3zgNeGQYCVG6sE6nB_eWGA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, jonghwa3.lee@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Olof Johansson <olof@lixom.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thursday 12 of December 2013 10:06:36 Abhilash Kesavan wrote:
> Hi Tomasz and Doug,
> 
> Thanks for the review.
> On Thu, Dec 12, 2013 at 6:00 AM, Doug Anderson <dianders@chromium.org> wrote:
> > Tomasz,
> >
> > On Wed, Dec 11, 2013 at 4:13 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
[snip]
> >> Still, I discussed about such cases as this with Sylwester a bit today and
> >> maybe a bit different approach would be better. There is a number of clocks
> >> that need to be always on, such as PMU (but also a lot of currently undefined
> >> ones). IMHO it would be nice to make sure they are enabled at boot time
> >> and do one of following:
> >> 1) claim and enable them directly from the clock controller driver
> >> 2) define them with CLK_IGNORE_UNUSED flag and enable them directly from
> >>    the clock controller driver (without increasing the refcount, so users could
> >>    possibly disable them later),
> >> 3) add a generic flag, such as CLK_BOOT_ENABLE (or something), that would
> >>    make the CCF enable such clock at bootup (in addition to implying
> >>    CLK_IGNORE_UNUSED).
> >>
> >> For me, the most sensible option would be 2) as it doesn't bloat the CCF with
> >> yet another flag and doesn't encourage people to leave clocks always on
> >> just because of laziness stopping them from implementing proper clock
> >> support in drivers.
> >
> > Right, we're using #2 for this now, but one problem is that it's
> > possible that the firmware may turn off one of these misc-type clocks.
> >  On exynos5250-snow we ran into this.  The firmware actually gates the
> > clock needed for accessing the chip_id, though perhaps that's not one
> > of the clocks that needs to be on all the time.
> 
> Yes, If the firmware gates sysreg then we should see failures at
> boot-up or later.
> Is this patch OK for now ? How would you guys like me to proceed on this ?

Yes, as I wrote in my original reply, for now your patch is fine as we
don't have the infrastructure for handling such clocks in a stricter
way yet.

Best regards,
Tomasz
