From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Thu, 20 Nov 2014 18:47:41 +0100
Message-ID: <546E293D.9000300@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>	<7hh9xwxsev.fsf@deeprootsystems.com>	<546CCAB8.9050402@collabora.co.uk>	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com> <7hppchsu29.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33286 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757555AbaKTRrr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 12:47:47 -0500
In-Reply-To: <7hppchsu29.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Hello,

For completeness I'll comment what we talked with Kevin on IRC
since probably this is the same issue that Paolo is facing.

On 11/20/2014 05:41 PM, Kevin Hilman wrote:
> Peach # setenv preboot "usb start; sleep 1"setenv bootargs console=tty1 console=ttySAC3,115200 debug earlyprintk rw root=/dev/mmcblk1p3 rootwait rootfstype=ext3

My kernel command line is almost the same with the difference that I'm using
clk_ignore_unused and I just checked that not passing that parameter, makes
linux-next to hang showing the same output log that Kevin reported.

Now, the question is why this does not happen with 3.18-rc+? My guess is that
the clock been disabled by the common clock framework got added recently and
it used to be unmanaged and left with the state set by the bootloader since
the kernel didn't know about it. That's why clk_ignore_unused was not needed.

Any ideas?

Best regards,
Javier
