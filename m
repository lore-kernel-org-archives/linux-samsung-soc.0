From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 00/14] drm/exynos: rewrite fimg2d error handling
Date: Thu, 27 Aug 2015 18:21:36 +0100
Message-ID: <CACvgo51Je-ACgn36cUpRF8XKrftYhk12Pf0NuvGGZWoPp8EDCQ@mail.gmail.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:37484 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606AbbH0RVg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Aug 2015 13:21:36 -0400
Received: by igui7 with SMTP id i7so41436031igu.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Aug 2015 10:21:36 -0700 (PDT)
In-Reply-To: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

Hi Tobias,

On 24 August 2015 at 15:13, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> Hello,
>
> during the discussion about the last patchset touching the
> fimg2d code, it became apparent that the error handling for
> the command submission is currently unsatisfactory.
>
> This series rewrites the handling. All functions that submit
> command buffers now first check if enough space is available
> and only then proceed to build the command buffers.
>
> In particular the command buffer is no longer left in a
> half-finished state, since parameters passed to the functions
> are now validated before command submission. For this some
> validation functions are introduced.
>
> This should also increase performance if the bottleneck is
> the submission part, since adding commands to the buffer
> is now more lightweight.
>
> Last but not least some prefix was added to messages printed
> by fprintf and printf, and the G2D context struct was moved
> out of the public header.
>
>
Thanks for going with my earlier suggestion and untangling all this.

I've went through the lot and it looks great afaict. Fwiw for the series
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

As pretty much none of this is hardware specific and/or requires
additional knowledge of the kernel module I'm inclined to pull this in
even if we don't get too many reviewers. We better keep it around for
a couple of weeks in case others are swamped with unrelated work atm,
yet willing to take a look.

Cheers,
Emil
