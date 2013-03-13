From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] USB: ehci-s5p: Fix phy reset
Date: Wed, 13 Mar 2013 10:28:50 -0700
Message-ID: <CAD=FV=UXaZvZJOZwAguwi=iyYO1iMSvt8fdEsDhr96pgMXDYSg@mail.gmail.com>
References: <1363136988-3704-1-git-send-email-agraf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:38636 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756491Ab3CMR2w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 13:28:52 -0400
Received: by mail-la0-f47.google.com with SMTP id fj20so1442450lab.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 10:28:51 -0700 (PDT)
In-Reply-To: <1363136988-3704-1-git-send-email-agraf@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Graf <agraf@suse.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dmueller@suse.de, Vivek Gautam <gautam.vivek@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Alexander,

On Tue, Mar 12, 2013 at 6:09 PM, Alexander Graf <agraf@suse.de> wrote:
> -       err = gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "ehci_vbus_gpio");
> -       if (err)
> +       /* reset pulls the line down, then up again */
> +       err = gpio_request_one(gpio, GPIOF_OUT_INIT_LOW, "ehci_vbus_gpio");
> +       if (err) {
>                 dev_err(&pdev->dev, "can't request ehci vbus gpio %d", gpio);
> +               return;
> +       }
> +       mdelay(1);
> +       __gpio_set_value(gpio, 1);
> +       gpio_free(gpio);

Freeing the gpio is a little on the iffy side since you actually care
about keeping the value.  Perhaps you can change this to
devm_gpio_request_one() and avoid the free?  I was about to submit a
patch to do just that (since otherwise you run into trouble if you
ever defer the probe) but then ran across your patch.

Thanks!

-Doug
