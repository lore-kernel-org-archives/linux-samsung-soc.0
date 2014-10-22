From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] clocksource: exynos_mct: fix exynos4_mct_write
Date: Wed, 22 Oct 2014 08:57:03 -0700
Message-ID: <CAD=FV=WET_mdjaYP330bm2gmEiBY9BsnxMHLO9LMMTtgeHhNCw@mail.gmail.com>
References: <1413941828-5547-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f182.google.com ([209.85.216.182]:62903 "EHLO
	mail-qc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932142AbaJVP5K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 11:57:10 -0400
Received: by mail-qc0-f182.google.com with SMTP id i17so2935417qcy.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2014 08:57:04 -0700 (PDT)
In-Reply-To: <1413941828-5547-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Chirantan Ekbote <chirantan@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, GP Orcullo <kinsamanka@gmail.com>

Tobias,

On Tue, Oct 21, 2014 at 6:37 PM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> EXYNOS4_MCT_L_MASK is defined as 0xffffff00, so applying this bitmask
> produces a number outside the range 0x00 to 0xff, which always results
> in execution of the default switch statement.
>
> Obviously this is wrong and git history shows that the bitmask inversion
> was incorrectly set during a refactoring of the MCT code.
>
> Fix this by putting the inversion at the correct position again.
>
> Reported-by: GP Orcullo <kinsamanka@gmail.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/clocksource/exynos_mct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Wow, the old code was pretty broken.  Nice find!  Was this found by
code inspection / analysis or were you seeing some actual bug?  I
think it was broken back in March 2013 in (a1ba7a7 ARM: EXYNOS: add a
register base address variable in mct controller driver), so 1.5
years.  The broken code has been running for a long time, but that
doesn't mean that there isn't a subtle issue...

In any case, it seems like we should take this fix, assuming someone
has tested it well.

Reviewed-by: Doug Anderson <dianders@chromium.org>
