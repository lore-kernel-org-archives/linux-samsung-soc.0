From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RESEND PATCH 0/8] cros_ec: Add multiple EC and protocol v3 support
Date: Thu, 16 Apr 2015 11:49:58 +0200
Message-ID: <2595984.H9vRKj1ZfJ@diego>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <552F64F7.80908@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:55887 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753242AbbDPJuE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 05:50:04 -0400
In-Reply-To: <552F64F7.80908@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Javier,

Am Donnerstag, 16. April 2015, 09:29:59 schrieb Javier Martinez Canillas:
> Hello,
> 
> On 04/06/2015 06:14 PM, Javier Martinez Canillas wrote:
> > Newer Chromebooks have more than one Embedded Controller (EC) in the
> > system. These additional ECs are connected through I2C with a host EC
> > which is the one that is connected to the Application Processor (AP)
> > through I2C, SPI or LPC.
> > 
> > So on these platforms, sub-processors are chained to each other:
> > 
> > AP <--> Host EC <--> Power Delivery (PD) EC
> > 
> > The AP sends commands to the additional EC through the host EC using
> > a set of passthru commands and the host redirects to the correct EC.
> > 
> > This series adds support for multiple EC in a system and also for the
> > protocol version 3 that is used on newer ECs.
> 
> Any comments about this series? I know that we are in the middle of the
> merge window but it would be great if I can get some feedback to get it
> ready and re-post for 4.2 (addressing any issue) once 4.1-rc1 is out.
> 
> > Most patches were taken from the downstream ChromiumOS v3.14 tree with
> > fixes squashed, split to minimise the cross subsystem churn and changes
> > for mainline inclusion but were not modified functionality wise.
> > 
> > The series depend on "platform/chrome: Add user-space dev inferface
> > support" [0] that is already merged in the chrome-platform tree so
> > probably these patches should also go through that tree once the mfd
> > patches are acked.
> > 
> > The series is a resend of a patch-set posted a month ago [1]. The only big
> 
> As I said, the original patchset was post about a month ago and this re-sent
> 10 days ago so it would be great to have some feedback on the series.

on a veyron-pinky-rev2, with
cros-ec-spi spi0.0: using proto v3
cros-ec-spi spi0.0: no PD chip found: -19

Tested-by: Heiko Stuebner <heiko@sntech.de>


with the catch of the device needing two additional patches from the Chromeos-
tree:

c7ae1e2ef996 mfd: cros ec: spi: put the delay and send msg in one cycle
8558460450c1 mfd: cros ec: spi: Add delay for asserting CS

and I'm not sure if they are submitted yet.


Heiko
