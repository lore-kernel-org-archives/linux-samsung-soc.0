From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 00/10] mfd: cros_ec: Add multi EC and proto v3 support
Date: Mon, 11 May 2015 19:53:31 +0200
Message-ID: <3484439.G156sKhj6L@phil>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:50470 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751527AbbEKRws (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 13:52:48 -0400
In-Reply-To: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Javier,

Am Samstag, 9. Mai 2015, 12:10:31 schrieb Javier Martinez Canillas:
> Newer Chromebooks have more than one Embedded Controller (EC) in the
> system. These additional ECs are connected through I2C with a host EC
> which is the one that is connected to the Application Processor (AP)
> through different transports (I2C, SPI or LPC).
> 
> So on these platforms, sub-processors are chained to each other:
> 
> AP <--> Host EC <--> Power Delivery (PD) EC
> 
> The AP sends commands to the additional EC through the host EC using
> a set of passthru commands and the host redirects to the correct EC.
> 
> This is a v2 of a series that adds support for multiple EC in a system
> and also for the protocol version 3 that is used on newer ECs.
> 
> Most patches were taken from the downstream ChromiumOS v3.14 tree with
> fixes squashed, split to minimise the cross subsystem churn and changes
> for mainline inclusion but were not modified functionality wise.
> 
> This version addresses a lot of issues pointed out by Gwendal Grignou
> and Heiko Stuebner on the v1 posted before [0].
> 
> The patches were tested on a x86 Pixel Chromebook 2 (Samus) that uses the
> new protocol v3 and has 2 EC (cros_ec and cros_pd) using a modified ectool
> [1] that supports the new cros_ec IOCTL API.
> 
> Also, testing was done on some Chromebooks that have a single EC and support
> protocol v2 such as the Exynos5250 Snow, Exynos5420 Peach Pit and
> Exynos5800 Peach Pi to be sure that no regressions were introduced for
> these machines.
> 
> Gwendal Grignou and Heiko Stuebner tested the first version of the series
> but I did not carry their Tested-by tags for the patches that had not
> trivial changes. So testing on more platforms will be highly appreciated.

hmm, while it largely works (generally, as well as the touchpad) the keyboard 
seems to have some problem on rk3288-pinky, it didn't have before with v1 + 
the two patches on top that are now folded into this v2.

Doing an evtest /dev/input/event0 does not result in key events, now after 
some keypresses I got a
[   48.352023] cros-ec-spi spi0.0: EC failed to respond in time
[   48.357695] cros-ec-spi spi0.0: Error transferring EC message -110
[   48.363884] cros-ec-spi spi0.0: failed to get keyboard state: -110
[  226.478588] cros-ec-spi spi0.0: Error transferring EC message -11
[  226.484690] cros-ec-spi spi0.0: failed to get keyboard state: -11

a (regular) reboot seems to result in a working keyboard, while a 
poweroff+poweron via dut-control brings me again back to a non-working 
keyboard.


in my very first try it started similarly non-working but after some time 
started magically working again, but now in subsequent tries I always get the 
spi error + working keyboard after a reboot.


Strangely this really seems to be limited to the keyboard, touchpad works 
flawlessly it seems.


Heiko
