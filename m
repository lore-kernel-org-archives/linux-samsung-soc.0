From: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH] usb: phy: Cleanup error code in **_usb_get_phy_**() APIs
Date: Mon, 19 Aug 2013 11:00:53 -0700
Message-ID: <CAODwPW-uK59vA1OeyWCXmm0szkfmDn+HgPEithYWGhywVaMaVA@mail.gmail.com>
References: <1375880938-6979-1-git-send-email-gautam.vivek@samsung.com>
	<CAODwPW8X-sVj1XPmZsFNtUtb-LQG96omNwOqdqh8UQMDsupvVg@mail.gmail.com>
	<CAFp+6iEFibXaXOUq2Aqkt5EGeGJEuc65+_fnHpoME9QOkhArwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:38582 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751211Ab3HSSA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Aug 2013 14:00:56 -0400
Received: by mail-ob0-f173.google.com with SMTP id ta17so5942404obb.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2013 11:00:54 -0700 (PDT)
In-Reply-To: <CAFp+6iEFibXaXOUq2Aqkt5EGeGJEuc65+_fnHpoME9QOkhArwA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Julius Werner <jwerner@chromium.org>, Vivek Gautam <gautam.vivek@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@ti.com>, kishon <kishon@ti.com>

>> I liked the ones where we had IS_ERR_OR_NULL() here (and in all the
>> ones below)... you sometimes have to handle PHYs in
>> platform-independent code where you don't want to worry about if this
>> platform actually has a PHY driver there or not. Any reason you
>> changed that?
>
> The **get_phy_*() APIs never return a NULL pointer now, do we still
> need to handle that in that case.
> Or are we assuming that code will use these phy operations without
> getting a phy in the first place ?

In our 5420 PHY tune patch (which I think has not made it upstream
yet), we're calling usb_phy_tune(hcd->phy) from the USB core. This
pointer is usually NULL unless it has been explicitly set by the
platform specific HCD driver. For situations like that I think it's
convenient if you can just fire-and-forget a generic PHY method
without worrying whether the particular PHY implements it or whether
it has a driver at all.
