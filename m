From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: drm: exynos: mixer: fix using usleep() in atomic context
Date: Wed, 21 Jan 2015 23:46:39 +0100
Message-ID: <54C02C4F.4080307@math.uni-bielefeld.de>
References: <1417307725-5975-1-git-send-email-tjakobi@math.uni-bielefeld.de>	<1417307725-5975-2-git-send-email-tjakobi@math.uni-bielefeld.de>	<20141201155447.GE11943@ulmo.nvidia.com>	<7454d0630d95195d41c3906637e223af@math.uni-bielefeld.de>	<20141217075433.GA2814@ulmo> <CAAQKjZMu=CwXZdUdo505ZLn+eWRPzMwXMJ3zmo0kT+Dji2y33Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40390 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752001AbbAUWqr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jan 2015 17:46:47 -0500
In-Reply-To: <CAAQKjZMu=CwXZdUdo505ZLn+eWRPzMwXMJ3zmo0kT+Dji2y33Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hello!


Inki Dae wrote:
> The use of spin lock, reg_slock, has been used for a long time and we
> hadn't some cleanups to spin lock codes so far. The spin lock is also
> used in here and there of mixer driver. And at least, it seems that
> the use of spin lock isn't required in mixer_win_reset. I don't see
> any atomic contexts in mixer module except interrupt handler.
> 
> To Seung-Woo,
> I know that you referred to mixer codes of v4l2 based mixer driver. So
> was the spin lock used in origin v4l2 driver? or Is there any reason
> that you used the spin lock?
> 
> Anyway, we will have some testing to check hdmi and mixer drivers
> without spin lock. So we will remove or replace it with mutex if
> needed.
> 
> Thanks,
> Inki Dae

So it's some weeks later and as far as I can see there has been no
changes to the spinlock usage. Wouldn't it be better to apply this patch
_now_ (since the use of 'usleep_range' is just plain wrong while under
spinlock). When the spinlock setup gets cleaned up later, then we can
always change back to 'usleep_range' again.

Any thoughts?

With best wishes,
Tobias
