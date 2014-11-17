From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v7 1/2] usb: host: xhci-plat: Get PHYs for xhci's hcds
Date: Mon, 17 Nov 2014 19:16:36 +0300
Message-ID: <546A1F64.7000209@cogentembedded.com>
References: <1414761989-21088-1-git-send-email-gautam.vivek@samsung.com>	<1414761989-21088-2-git-send-email-gautam.vivek@samsung.com>	<545393CE.8070102@cogentembedded.com> <CAFp+6iG37uE1uB5Z8B-hM3nKyBeR6Vxb-YKegd7MrRB3wuA9xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:58982 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbaKQQQk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 11:16:40 -0500
Received: by mail-lb0-f179.google.com with SMTP id l4so16283386lbv.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2014 08:16:38 -0800 (PST)
In-Reply-To: <CAFp+6iG37uE1uB5Z8B-hM3nKyBeR6Vxb-YKegd7MrRB3wuA9xw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Vivek Gautam <gautam.vivek@samsung.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Greg KH <gregkh@linuxfoundation.org>, kishon <kishon@ti.com>, Felipe Balbi <balbi@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Kukjin Kim <kgene.kim@samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Julius Werner <jwerner@google.com>, Jingoo Han <jg1.han@samsung.com>

Hello.

On 11/17/2014 9:36 AM, Vivek Gautam wrote:

>>> The host controller by itself may sometimes need to handle PHY
>>> and re-initialize it to re-configure some of the PHY parameters
>>> to get full support out of the PHY controller.
>>> Therefore, facilitate getting the two possible PHYs, viz.
>>> USB 2.0 type (UTMI+) and USB 3.0 type (PIPE3), and initialize them.

>>> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>>> ---
>>>    drivers/usb/host/xhci-plat.c |   74
>>> ++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 74 insertions(+)

>>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>>> index 3d78b0c..5207d5b 100644
>>> --- a/drivers/usb/host/xhci-plat.c
>>> +++ b/drivers/usb/host/xhci-plat.c
[...]
>>> @@ -204,6 +271,8 @@ static int xhci_plat_suspend(struct device *dev)
>>>          struct usb_hcd  *hcd = dev_get_drvdata(dev);
>>>          struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>>>
>>> +       phy_exit(hcd->phy);

>>     Hm, in the suspend() method?

> phy_exit() should eventually be suspending the PHY and put it to
> low power state.

    I thought it's a role that the power_off() mothod should play, considering 
that the power_on() method gets called after the init() method....

> phy_init() in resume() will then take up the task of activating the
> PHY again.

> phy_power_on() and phy_power_off() are called at xhci_probe() and remove() time.

    Of course.

> Does this makes sense ?

    Not much, really.

WBR, Sergei
