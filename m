From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: check for NULL pinctrl handle
Date: Mon, 25 Feb 2013 01:02:43 +0100
Message-ID: <2474544.LLiqKSFeoG@flatron>
References: <201302231855.47560.heiko@sntech.de> <CACRpkdbfQOeJ3u8_UvgVMRyu_MMmOZD0tjQT+qNr9iOEpAHLWQ@mail.gmail.com> <201302250016.49773.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201302250016.49773.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Monday 25 of February 2013 00:16:49 Heiko St=FCbner wrote:
> Am Sonntag, 24. Februar 2013, 23:39:44 schrieb Linus Walleij:
> > On Sun, Feb 24, 2013 at 6:00 PM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
>=20
wrote:
> > >> > Note that we are talking here about a temporary solution. The
> > >> > legacy
> > >> > DT- based pin configuration will go away after all the DT-enab=
led
> > >> > platforms using this driver get migrated to pin control and so
> > >> > will
> > >> > the need to check if pin control is available.
> > >>=20
> > >> So use AUXDATA, and you get a pdata for that driver?
> > >=20
> > > Hmm, and then have some platform data passed statically and some
> > > parsed
> > > from device tree?
> >=20
> > This is done by several in-tree drivers today. It is even necessary
> > for
> > things like machine-specific callbacks.
> >=20
> > > Not even saying that we are going towards getting rid of
> > > auxdata, not adding further dependencies for it.
> >=20
> > The other option is to do the non-temporary solution you are
> > referring to below...
> >=20
> > > Sorry, but this sounds more broken to me than checking the return
> > > value
> > > of devm_pinctrl_get_select_default for NULL in the driver.
> >=20
> > Both are bad solution, auxdata is less bad than trying to check
> > struct pinctrl * handles for non-NULL, which has *never* been a
> > good thing to do and should never have been merged in the first
> > place.
> >=20
> > (Maybe I ACKed that, then I was doing something stupid.)
> >=20
> > > Still, all the platforms relying on the legacy DT GPIO support
> > > should
> > > have been already migrated to pin control, so ideally instead of
> > > "fixing" the drivers to continue supporting the deprecated method=
,
> > > such
> > > platforms should be fixed.
> >=20
> > I agree.
>=20
> Fine by me ... I'll work on a pinctrl driver for s3c24xx then :-)

Good.

I belive that pinctrl-samsung driver can be easily used for s3c24xx, wi=
th=20
minor modifications to remove some assumptions that are true for all th=
e=20
newer Samsung SoCs.

I'm currently working (in my free time) on pinctrl driver for s3c64xx (=
as=20
a part of my DT-enablement work), so possibly some of the code I will=20
create may be useful for s3c24xx as well.

Best regards,
Tomasz
