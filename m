From: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH] USB: core: Add warm reset while reset-resuming SuperSpeed HUBs
Date: Wed, 11 Dec 2013 11:00:13 -0800
Message-ID: <CAODwPW_ZUgHWymOF7Fzxh7sbhrvV0-g-pMXWQm=eSz2U8EBRtQ@mail.gmail.com>
References: <CAGm_ybgC6Ca0qz6zJL0PkEUiyUi=Ct0L5t2GJOt9ZU-buP+wBQ@mail.gmail.com>
	<Pine.LNX.4.44L0.1312111204220.1531-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:46154 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922Ab3LKTAP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 14:00:15 -0500
Received: by mail-ob0-f176.google.com with SMTP id vb8so1899365obc.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2013 11:00:14 -0800 (PST)
In-Reply-To: <Pine.LNX.4.44L0.1312111204220.1531-100000@iolanthe.rowland.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Vikas Sajjan <sajjan.linux@gmail.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Sarah Sharp <sarah.a.sharp@linux.intel.com>, Vincent Palatin <vpalatin@chromium.org>, Julius Werner <jwerner@chromium.org>, Lan Tianyu <tianyu.lan@intel.com>, burzalodowa@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vivek Gautam <gautam.vivek@samsung.com>, Douglas Anderson <dianders@chromium.org>, Felipe Balbi <balbi@ti.com>, sunil joshi <joshi@samsung.com>

> I don't know what you mean by "fails".  The system goes to sleep and
> then later on wakes up, doesn't it?
>
> Do you mean that the Jetflash device gets disconnected when the system
> wakes up?  That's _supposed_ to happen under those circumstances.
> When hub_activate() sees HUB_RESET_RESUME, all child devices get
> disconnected except those where udev->persist_enabled is set.

This patch was written in response to the same bug as my "usb: hub:
Use correct reset for wedged USB3 devices that are NOTATTACHED"
submission. My patch only helps when the port gets stuck in Compliance
Mode, but Vikas reports that he can sometimes see it stuck in Polling
or Recovery states as well.

The underlying issue is a deadlock in the USB 3.0 link training state
machine when the host controller is unilaterally reset on resume
(without driving a reset on the bus). The host port starts out back in
Rx.Detect without remembering anything about its previous state, but
the device is still in U3. The host detects Rx terminations, moves to
Polling and starts sending LFPS link training packets, but the device
doesn't expect those and interprets them as link problems (moving to
Recovery). What happens next seems to be device specific, but
apparently the device can end up in SS.Inactive while the host port
gets stuck in Polling or Recovery (or some kind of livelock between
those).

This patch tries to warm reset all USB 3.0 ports on reset-resume
(after xhci_reset() was called) that had devices connected to them
before suspend. This seems to be the only way to ensure the devices'
state machines get back to a well-defined state that the host can work
with. I don't think this is a specific hardware bug, it's just an
unfortunate design flaw that the USB 3.0 spec doesn't account for a
root hub port being reset independently of its connected device. I
think Sarah is correct that it could be limited to root hubs, though.
