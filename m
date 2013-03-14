From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] USB: ehci-s5p: Fix phy reset
Date: Wed, 13 Mar 2013 20:38:47 -0700
Message-ID: <CAD=FV=UyCUMZss36Fw3VZSGgi56CToewEaOjUo95z6=vJreysg@mail.gmail.com>
References: <1363219179-14900-1-git-send-email-agraf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:39975 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755722Ab3CNDit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 23:38:49 -0400
Received: by mail-lb0-f175.google.com with SMTP id n3so1534442lbo.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 20:38:47 -0700 (PDT)
In-Reply-To: <1363219179-14900-1-git-send-email-agraf@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Graf <agraf@suse.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dmueller@suse.de, Vivek Gautam <gautam.vivek@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Alexander,

On Wed, Mar 13, 2013 at 4:59 PM, Alexander Graf <agraf@suse.de> wrote:
> On my Exynos 5 based Arndale system, I need to pull the reset line down
> and then let it go up again to actually perform a reset. Without that
> reset, I can't find any USB hubs on my bus, rendering the USB controller
> useless.
>
> We also only need to reset the line after the phy node has been found.
> This way we don't accidently reserve the vbus GPIO pin, but later on
> defer the creation of our controller, because the phy device tree node
> hasn't been probed yet.
>
> This patch implements the above logic, making EHCI and OHCI work on
> Arndale systems for me.
>
> Signed-off-by: Alexander Graf <agraf@suse.de>
> CC: Vivek Gautam <gautam.vivek@samsung.com>
> CC: Jingoo Han <jg1.han@samsung.com>
> CC: Alan Stern <stern@rowland.harvard.edu>
> CC: Kukjin Kim <kgene.kim@samsung.com>
> CC: Felipe Balbi <balbi@ti.com>
> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CC: Doug Anderson <dianders@chromium.org>
>
> ---
>
> v1 -> v2:
>
>   - remove gpio_free call
>   - move reset logic after phy node search

Seems fine to me.  I guess the earlier problem you wrote about was the
probe failure, then?  I think that the reason I don't tend to get the
probe failure is that I've got my device tree ordered differently so
that the phy gets initted in a different order.

I'll send up the devm_ patch atop this.

Reviewed-by: Doug Anderson <dianders@chromium.org>

Thanks!  :)

-Doug
