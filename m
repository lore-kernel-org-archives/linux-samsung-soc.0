From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v6 6/8] mfd: cros_ec: Support multiple EC in a system
Date: Mon, 8 Jun 2015 13:46:14 -0700
Message-ID: <20150608204614.GA20574@quad.lixom.net>
References: <1433405154-16273-1-git-send-email-javier.martinez@collabora.co.uk>
 <1433405154-16273-7-git-send-email-javier.martinez@collabora.co.uk>
 <20150605101730.GE7058@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:33555 "EHLO
	mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752584AbbFHUp6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jun 2015 16:45:58 -0400
Received: by qkhg32 with SMTP id g32so84401735qkh.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jun 2015 13:45:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150605101730.GE7058@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Samuel Ortiz <sameo@linux.intel.com>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

On Fri, Jun 05, 2015 at 11:17:30AM +0100, Lee Jones wrote:
> On Thu, 04 Jun 2015, Javier Martinez Canillas wrote:
> 
> > From: Gwendal Grignou <gwendal@chromium.org>
> > 
> > Chromebooks can have more than one Embedded Controller so the
> > cros_ec device id has to be incremented for each EC registered.
> > 
> > Add a new structure to represent multiple EC as different char
> > devices (e.g: /dev/cros_ec, /dev/cros_pd). It connects to
> > cros_ec_device and allows sysfs inferface for cros_pd.
> > 
> > Also reduce number of allocated objects, make chromeos sysfs
> > class object a static and add refcounting to prevent object
> > deletion while command is in progress.
> > 
> > Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> > Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > 
> > Changes since v5:
> >  - Don't allow to change the device name from DT. Suggested by Lee Jones.
> >  - Expand error messages in case of mfd_add_devices() failure.
> >    Suggested by Lee Jones.
> > 
> > Changes since v4:
> >  - Use cros-ec-name DT property instead of devname. Suggested by Lee Jones.
> >  - Pass PLATFORM_DEVID_AUTO directly to mfd_add_devices().
> >    Suggested by Lee Jones.
> >  - Add Heiko Stuebner tested-by tag.
> >  - Fix get_version by passing the cmd_offset to EC_CMD_GET_VERSION.
> > 
> > Changes since v3:
> >  - Add defines for the EC and PD index constants.
> >  - Remove cros_ec_dev_register() and declare the mfd_cells as static structs.
> >    Suggested by Lee Jones.
> >  - Add a new line before the return statement in cros_ec_dev_register().
> >    Suggested by Lee Jones.
> > 
> > Changes since v2: None
> > 
> > Changes since v1:
> >   - Squash patch that adds support to represent EC's as different
> >     char devices (e.g: /dev/cros_ec, /dev/cros_pd):
> >     https://chromium-review.googlesource.com/#/c/217297/
> >     Suggested by Gwendal Grignou
> >   - Use cros_ec instead of cros-ec in the subject line to be consistent.
> >     Suggested by Gwendal Grignou
> > ---
> >  drivers/input/keyboard/cros_ec_keyb.c      |   2 +-
> >  drivers/mfd/cros_ec.c                      |  52 ++++++++++--
> >  drivers/mfd/cros_ec_i2c.c                  |   1 -
> >  drivers/mfd/cros_ec_spi.c                  |   1 -
> >  drivers/platform/chrome/cros_ec_dev.c      | 130 ++++++++++++++++++++---------
> >  drivers/platform/chrome/cros_ec_dev.h      |   7 --
> >  drivers/platform/chrome/cros_ec_lightbar.c |  75 +++++++++--------
> >  drivers/platform/chrome/cros_ec_lpc.c      |   1 -
> >  drivers/platform/chrome/cros_ec_sysfs.c    |  48 +++++------
> >  include/linux/mfd/cros_ec.h                |  44 ++++++++--
> >  10 files changed, 234 insertions(+), 127 deletions(-)
> 
> For my own reference:
>   Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> Let me know when you have all the appropriate Acks and I'll apply the
> set.

Whole series:

Acked-by: Olof Johansson <olof@lixom.net>

I'm OK with this going through the mfd tree, since there's nothing queued up
for chrome-platform that this would conflict with.


-Olof
