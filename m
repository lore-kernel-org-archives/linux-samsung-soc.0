From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Peach Pi/Pit boot failures in linux-next  (was Re: [RFC PATCH 1/1]
 drm/exynos: Move platform drivers registration to module init)
Date: Fri, 21 Nov 2014 14:03:51 +0100
Message-ID: <546F3837.5020706@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>	<7hh9xwxsev.fsf@deeprootsystems.com>	<546CCAB8.9050402@collabora.co.uk>	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>	<7hppchsu29.fsf@deeprootsystems.com>	<546E293D.9000300@collabora.co.uk> <7hbno1spdt.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34348 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755095AbaKUNEE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 08:04:04 -0500
In-Reply-To: <7hbno1spdt.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

[adding Kukjin as cc and dropping dri-devel]

Hello Kevin,

On 11/20/2014 07:22 PM, Kevin Hilman wrote:
>> My kernel command line is almost the same with the difference that
>> I'm using clk_ignore_unused and I just checked that not passing
>> that parameter, makes linux-next to hang showing the same output
>> log that Kevin reported.
> 
> Ah!  Good find.  I confirm that adding clk_ignore_unused is getting
> me booting again, but of course that is just masking a problem, so I
> hope someone can shed light on which clock isn't being correctly
> managed.
> 

True, I'm renaming the thread subject to track these issues separately
of the original Exynos DRM bug since these are unrelated.

So, I see two different boot failures on the Peach Pi[t] Chromebooks:

1) next20141121 boot fails due snd-soc-snow

Disabling CONFIG_SND_SOC_SNOW makes the boot to got a little further
but still fails with the second issue:

2) next20141121 boot hangs if unused clocks are disabled.

I tried to root cause these two issues but didn't see anything evident
so I'll find a last known good commit and bisect. If anyone has an
idea of the possible causes for these issues that would be appreciated.
 
> Might I also suggest that folks have their default command-line to
> *not* use clk_ignore_unused, since it's primary job is to workaround
> clock bugs.
> 

Agreed, I disabled now as well to catch regressions early. I carried
those parameters from Snow since I needed clk_ignore_unused to have
simplefb working on that machine.

> Kevin
> 

Best regards,
Javier
