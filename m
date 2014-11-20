From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to module init
Date: Thu, 20 Nov 2014 10:22:54 -0800
Message-ID: <7hbno1spdt.fsf@deeprootsystems.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hh9xwxsev.fsf@deeprootsystems.com>
	<546CCAB8.9050402@collabora.co.uk>
	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
	<7hppchsu29.fsf@deeprootsystems.com>
	<546E293D.9000300@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:50683 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755125AbaKTSW6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 13:22:58 -0500
Received: by mail-pa0-f49.google.com with SMTP id eu11so3011924pac.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 10:22:58 -0800 (PST)
In-Reply-To: <546E293D.9000300@collabora.co.uk> (Javier Martinez Canillas's
	message of "Thu, 20 Nov 2014 18:47:41 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

> Hello,
>
> For completeness I'll comment what we talked with Kevin on IRC
> since probably this is the same issue that Paolo is facing.
>
> On 11/20/2014 05:41 PM, Kevin Hilman wrote:
>> Peach # setenv preboot "usb start; sleep 1"setenv bootargs
>> console=tty1 console=ttySAC3,115200 debug earlyprintk rw
>> root=/dev/mmcblk1p3 rootwait rootfstype=ext3
>
> My kernel command line is almost the same with the difference that I'm using
> clk_ignore_unused and I just checked that not passing that parameter, makes
> linux-next to hang showing the same output log that Kevin reported.

Ah!  Good find.  I confirm that adding clk_ignore_unused is getting me
booting again, but of course that is just masking a problem, so I hope
someone can shed light on which clock isn't being correctly managed.

Might I also suggest that folks have their default command-line to *not*
use clk_ignore_unused, since it's primary job is to workaround clock
bugs.

Kevin
