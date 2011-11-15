From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Save/restore GPIO drive strength across
 suspend/resume
Date: Tue, 15 Nov 2011 11:07:40 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740805E0D@HQMAIL01.nvidia.com>
References: <1321074108-10025-1-git-send-email-inderpal.singh@linaro.org>
	<CACRpkdbC=w5vRvgLVpAcmcampt-baTydpLHBexak4RzxUcO32Q@mail.gmail.com>
	<CAJuYYwSvRYWdoccSN3nU7G4zXyTjt7vkjAd_vDx=QchG+yd5Cg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF1740805B13@HQMAIL01.nvidia.com>
 <CAJuYYwQNQZmMYgwcZr1M2dxfhjuJvL6AimfkQQoG_arxi6UwGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate04.nvidia.com ([216.228.121.35]:5318 "EHLO
	hqemgate04.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757058Ab1KOTHo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 14:07:44 -0500
In-Reply-To: <CAJuYYwQNQZmMYgwcZr1M2dxfhjuJvL6AimfkQQoG_arxi6UwGg@mail.gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Inderpal Singh <inderpal.singh@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "patches@linaro.org" <patches@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Thomas Abraham wrote at Monday, November 14, 2011 12:37 PM:
...
> I am not sure how this works, but with dynamic transitioning, will it
> be possible to program the pinmux registers dynamically when a
> driver/controller decides to idle for sometime and come back up again
> (not a system wide suspend-resume cycle). There might be a need for
> the driver to inform the pinmux subsystem of this case and allow the
> pinmux subsystem to re-program pinmux registers as required.

Well, such a feature doesn't exist yet.

But, I envisaged extending the existing:

pmx = pinmux_get()
pinmux_enable(pmx)
...
pinmux_disable(pmx)
pinmux_put(pmx)

to something like:

pmx = pinmux_get(active)
pinmux_enable(pmx)
...
pinmux_switch(suspend)
...
pinmux_switch(active)
...
pinmux_disable(pmx)
pinmux_put(pmx)

(I think LinusW proposed an alternative a while back last time we talked
about this)

This has received only limited discussion though, and there are probably
many gotchas to think through; I imagine any such feature is a way off.

-- 
nvpublic
