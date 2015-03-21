From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: drm/exynos: add async G2D execution to libdrm
Date: Sat, 21 Mar 2015 15:03:37 +0100
Message-ID: <550D7A39.4080502@gmx.net>
References: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:64568 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751349AbbCUODw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Mar 2015 10:03:52 -0400
In-Reply-To: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, inki.dae@samsung.com

Tobias Jakobi wrote:
> Hello,
> 
> this series exposes async execution of G2D command buffers to userspace. Also includes is a small performance analysis test, which can also be used to 
> stress test the engine. The async operation is of course also tested.
> 
> Please review and let me know what I can improve.
> 
> With best wishes,
> Tobias
Almost forgot this. In case someone is interested in the solid fill
performance, I've uploaded a plot here:
http://www.math.uni-bielefeld.de/~tjakobi/exynos/g2d_clear_perf.pdf

And yes, that should be _nano_seconds on the y-axis. What I find
interesting that despite the performance being linear (well, affine
linear, since we have a setup time) in the number of pixels to process,
you can still see some kind of 'clustering'.
I wonder where this comes from, maybe some small alignment penalty, or
something?

With best wishes,
Tobias
