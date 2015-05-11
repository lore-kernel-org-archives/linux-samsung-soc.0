From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 00/10] mfd: cros_ec: Add multi EC and proto v3 support
Date: Mon, 11 May 2015 22:51:47 +0200
Message-ID: <2097516.kqJHpBxff0@phil>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk> <3484439.G156sKhj6L@phil> <CAHNYxRw3eShch-kYNvuyrzPfUDT+Sc4b_Z141fTM_s3LmuX57w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:51248 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752553AbbEKUvG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 16:51:06 -0400
In-Reply-To: <CAHNYxRw3eShch-kYNvuyrzPfUDT+Sc4b_Z141fTM_s3LmuX57w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandru Stan <amstan@chromium.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Am Montag, 11. Mai 2015, 13:08:27 schrieb Alexandru Stan:
> On Mon, May 11, 2015 at 10:53 AM, Heiko Stuebner <heiko@sntech.de> wrote:
> > Doing an evtest /dev/input/event0 does not result in key events, now after
> > some keypresses I got a
> > [   48.352023] cros-ec-spi spi0.0: EC failed to respond in time
> > [   48.357695] cros-ec-spi spi0.0: Error transferring EC message -110
> > [   48.363884] cros-ec-spi spi0.0: failed to get keyboard state: -110
> > [  226.478588] cros-ec-spi spi0.0: Error transferring EC message -11
> > [  226.484690] cros-ec-spi spi0.0: failed to get keyboard state: -11 well
> > as the touchpad) the keyboard
> At first I tought it was because your EC firmware version is pretty old.
> A while ago we fixed a pretty nasty scheduler bug that would have
> caused similar symptoms:
> https://chromium-review.googlesource.com/#/c/248681/
> 
> I did my own testing with the trees you provided (v1 and v2) on
> veyron-minnie and
> I can definatelly confirm that v2 is broken.

for completenes sake, branches in use where:

clean apply of v2 on top of 4.1-rc3 + clk-next
(already emits the error when using evtest):
https://github.com/mmind/linux-rockchip/commits/tmp/crosec_v3_2

merged into working branch that produces something usable for veyron devices:
https://github.com/mmind/linux-rockchip/commits/devel/somewhat-stable

same branch rolled back to patch-series v1
(working keyboard on both pinky and minnie):
https://github.com/mmind/linux-rockchip/commits/tmp/cros_ec_to_v1


I'm at least somewhat sure, that there shouldn't be any big merge errors in 
there :-)


> 
> Here's a snippet of what a key press generates on the EC log:
> > [950.749097 KB poll]
> 
> [950.760357 HC 0x60]
> [950.760555 HC err 6]
> +[950.903657 HC 0x60]
> [950.905243 HC err 6]
> +[950.926239 KB wait]
> 
> Same key press on v1:
> > [37.107390 KB poll]
> 
> [37.118457 HC 0x60]
> [37.209218 HC 0x60]
> [37.278431 KB wait]
> 
> In the EC code, error 6 is defined as EC_RES_INVALID_VERSION.
> 
> > in my very first try it started similarly non-working but after some time
> > started magically working again, but now in subsequent tries I always get
> > the spi error + working keyboard after a reboot.
> 
> At first the keyboard doesn't work for me either (20 or so seconds).
> Then all keys show up and everything's fine (besides the errors on the EC
> log).
> > Strangely this really seems to be limited to the keyboard, touchpad works
> > flawlessly it seems.
> 
> Touchpad doesn't go through the EC, it's just a standard i2c device
> directly connected to the AP.

I should've looked at the dts before then to not overlook this ;-)


Heiko
