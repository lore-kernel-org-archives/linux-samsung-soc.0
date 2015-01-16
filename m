From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH v2 0/6] Enable HDMI support on Exynos platforms
Date: Fri, 16 Jan 2015 23:32:24 +0100
Message-ID: <54B99178.1060006@gmx.net>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com> <54B68A74.8070405@math.uni-bielefeld.de> <54B79123.4090200@samsung.com> <54B8533C.3070000@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:52702 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751441AbbAPWcd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 17:32:33 -0500
In-Reply-To: <54B8533C.3070000@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello,

so OK, this doesn't look too good.

Tobias Jakobi wrote:
> I checked with my panel just now and played around a bit with the DRM
> (opening, vsync, etc.). However on deinitialization the entire system
> locked up. I currently haven't hooked the board up to the serial
> console, otherwise I would've tried to extract some more meaningful
> information.
> 
> Going to check again more thoroughly on the weekend what exactly
> triggers the lockup.

So, first of all I did my initial test with the exynos video backend of
RetroArch. But it turns out that there's no fancy application needed. I
now tested this with the 'modetest' application from libdrm, and did this:

./modetest -M exynos -s 16@13:1920x1080
setting mode 1920x1080-60Hz@XR24 on connectors 16, crtc 13
^C
./modetest -M exynos -s 16@13:640x480
setting mode 640x480-60Hz@XR24 on connectors 16, crtc 13
^C
./modetest -M exynos -s 16@13:640x480
setting mode 640x480-60Hz@XR24 on connectors 16, crtc 13
^C
./modetest -M exynos -s 16@13:640x480

The board instantly died then. No kernel log output from the serial
console, the heartbeat just stops and the board is dead. Need to
power-cycle to get it running again.

I'm unsure how to triage this at all.

@Marek: Could you check if this also happens for you?

With best wishes,
Tobias
