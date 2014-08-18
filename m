From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/5] usb: phy: samsung: remove old USB 2.0 PHY driver
Date: Mon, 18 Aug 2014 13:02:49 +0200
Message-ID: <3463371.y41zGdSnsX@amdc1032>
References: <1408026327-31437-1-git-send-email-b.zolnierkie@samsung.com>
 <1408026327-31437-4-git-send-email-b.zolnierkie@samsung.com>
 <34FCC3B2EE8F481198CEF3037F168FB3@sisodomain.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <34FCC3B2EE8F481198CEF3037F168FB3-htTAPpqcxwk4Q++5jOxPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Thursday, August 14, 2014 08:07:40 PM Vivek Gautam wrote:
> Hi Bartlomiej Zolnierkiewicz,
> 
> 
> On Thursday, August 14, 2014 7:55 PM, Bartlomiej Zolnierkiewicz 
> <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote
> 
> Subject: [PATCH 3/5] usb: phy: samsung: remove old USB 2.0 PHY driver
> 
> I would say it co-incidence that both of us sent the patch-series for 
> similar cleanup at the same time. ;)

:)

> There's one thing that I would want to comment here, since we don't have any 
> new usb-phy driver for S3C64XX,
> so we can't simply remove this entire driver.
> I have posted my patch-series [1], which does cleanup while keeping the 
> support for S3C64XX.

AFAIK S3C64XX code from drivers/usb/phy/phy-samsung-usb2.c has
never been used as this platform still uses its own code from
arch/arm/mach-s3c64xx/setup-usb-phy.c (there are no users in
the kernel tree of either s3c64xx-usb2phy platform device or
"samsung,s3c64xx-usb2phy" DT compatible) .  Therefore I think
that the entire drivers/usb/phy/phy-samsung-usb2.c driver
should be removed (somebody with the hardware can as well add
S3C64XX support to the new drivers/phy/phy-samsung-usb2.c
driver and port the platform to use it).

> Please let me know what you think of that series.
> 
> [1] [PATCH 0/7] usb-phy: samsung: Cleanup the unused drivers
>       https://lkml.org/lkml/2014/8/14/235

Looks fine to me except the above mentioned issue with S3C64XX
platform support.

> > drivers/usb/phy/phy-samsung-usb2 driver got replaced by
> > drivers/phy/phy-samsung-usb2 one and is no longer used.
> >
> > Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
