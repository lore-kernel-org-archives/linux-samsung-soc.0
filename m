From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: exynos4412: powerdomain issues with HDMI PHY and VP
Date: Sat, 24 May 2014 22:45:51 +0200
Message-ID: <538104FF.7070601@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:57436 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751228AbaEXUp4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 May 2014 16:45:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, tomasz.figa@gmail.com, arun.kk@samsung.com

Hello,

I'm still working on getting HDMI output on my ODROID-X2 board (based on
Exynos4412 Prime) working. My tree is a 3.15-rc6 with some patches on
top to get it boot on the board.

You can find the tree here:
https://github.com/tobiasjakobi/linux-odroid/commits/odroid-3.15.y

Here is the DTS:
https://github.com/tobiasjakobi/linux-odroid/blob/odroid-3.15.y/arch/arm/boot/dts/exynos4412-odroidx2.dts

I encountered two issues with powerdomains. On related to HDMI PHY and
the other one related to the VP (video processor).

The pd the mixer is in, is currently set to pd_tv. I can't seem to
specify multiple powerdomains for one device. However the PHY seems to
need both TV and LCD0 pd to function properly.

If TV is on, but LCD0 is not, then all that is shown on the display are
vertical colored lines. I have applied a hack that forces LCD0 on all
the time. This way I get correct output on the display connected via HDMI.

I use the simple modetest test from the libdrm repository
(http://cgit.freedesktop.org/mesa/drm/tree/tests/modetest):
modetest -M exynos -v -s 15@6:640x480
(this issues a continuous vblank test)

So, this is the first issue. The second one, related to the VP, popped
up when I tried to issue modetest more than once. I've included the
kernel warning output in the commit
(https://github.com/tobiasjakobi/linux-odroid/commit/cba8b0fd687e0e60107cf19fc5305e71e524e969).

For some reason disabling the TV pd times out, which in turn then lets
the reset of the VP fail. After that happens, the modetest test becomes
non-functional. If have to reboot the system to get it into useable
state again.

Applying the same hack for the TV pd fixes this issue. The VP reset
works again. That is the second issue.

With best wishes,
Tobias

P.S.:

CCing Inki Dae (since this involves exynos-mixer)
CCing Tomasz Figa (I can see that there were plans to move to more
general pd DT bindings, which may help here)
CCing Arun Kumar K (recent work on pd code that is related to powering
on/off -- might be related to this issue)
