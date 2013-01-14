From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: phy: samsung: Add support to set pmu isolation
Date: Mon, 14 Jan 2013 14:11:42 -0800
Message-ID: <CAD=FV=Vxdjo5aOU25a-iDNDaiGZCu0+G-p5y1NifXHUJBF0AHg@mail.gmail.com>
References: <1357891738-26259-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1357891738-26259-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, gregkh@linuxfoundation.org, balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com, Ben Dooks <ben-linux@fluff.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, l.majewski@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Praveen Paneri <p.paneri@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Vivek,

Sorry for being so absent from these reviews.  I'll try to look over a
few patches today, but please don't hold up anything on account of my
reviews.  I'm definitely a bit of an interested bystander in USB land.
 ;)

In general things look pretty good here.  :)  One last comment below...

On Fri, Jan 11, 2013 at 12:08 AM, Vivek Gautam
<gautam.vivek@samsung.com> wrote:> +static int
samsung_usbphy_parse_dt(struct samsung_usbphy *sphy)
> +{
> +       struct device_node *usbphy_sys;
> +
> +       /* Getting node for system controller interface for usb-phy */
> +       usbphy_sys = of_get_child_by_name(sphy->dev->of_node, "usbphy-sys");
> +       if (!usbphy_sys)
> +               dev_warn(sphy->dev, "No sys-controller interface for usb-phy\n");

Seems like you ought to return with an error here.  Calling of_iomap()
with a NULL value seems undesirable.

> +
> +       sphy->pmuregs = of_iomap(usbphy_sys, 0);
> +
> +       of_node_put(usbphy_sys);
> +
> +       if (sphy->pmuregs == NULL) {
> +               dev_err(sphy->dev, "Can't get usb-phy pmu control register\n");
> +               return -ENODEV;
> +       }
> +
> +       return 0;
> +}
> +
> +/*
> + * Set isolation here for phy.
> + * Here 'on = true' would mean USB PHY block is isolated, hence
> + * de-activated and vice-versa.
> + */

Thank you very much for this comment.  :)  This explains one of the
confusions I had earlier...


Once you fix the one error condition above you can add my
"Reviewed-by".  Thanks!

-Doug
