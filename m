From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c24xx: allow device core to setup default pin configuration
Date: Thu, 21 Mar 2013 11:50:05 +0100
Message-ID: <201303211150.06891.heiko@sntech.de>
References: <1362404573-30406-1-git-send-email-thomas.abraham@linaro.org> <20130321100032.GC19297@the-dreams.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130321100032.GC19297-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Am Donnerstag, 21. M=E4rz 2013, 11:00:32 schrieb Wolfram Sang:
> On Mon, Mar 04, 2013 at 07:12:53PM +0530, Thomas Abraham wrote:
> > With device core now able to setup the default pin configuration,
> > the call to devm_pinctrl_get_select_default can be removed. And
> > the pin configuration code based on the deprecated Samsung specific
> > gpio bindings is also removed.
> >=20
> > Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >=20
> > Hi Heiko, Tomasz,
> >=20
> > We have to make a choice on the path forward for pinctrl support
> > on Samsung platforms. We have three cases to deal with.
> >=20
> > A. Samsung platforms without DT support.
> > B. Samsung platforms with DT support using old Samsung specific
> >=20
> >    gpio bindings for pin-configuration (s3c24xx and s3x64xx).
> >=20
> > C. Samsung platforms with DT support using using pinctrl based
> >=20
> >    pin-configurations (Exynos4 and Exynos5).
> >=20
> > For [A], we just let the platform specific callbacks handle the
> > pin setup. For [B] and [C], based on Linus Walleij's pin grab
> > by device core patch and subsequent discussions with him on the
> > mailing list, would it be acceptable that we discontinue support
> > for [B] in Samsung SoC device drivers. This will impact your
> > current DT work on s3c24xx and s3c64xx platforms. Pinctrl is
> > inevitable and we have to migrate to it. Instead of workarounds
> > to maintain support for [B], it might be better that we migrate
> > s3c24xx and s3c64xx platforms to pinctrl.
> >=20
> > Please do let us know your opinion on this.
>=20
> Dropping [B] sounds good, but I think it makes sense to wait with thi=
s
> patch until pinctrl support for s3c24xx is in place?

s3c24xx does not currently have dt support in mainline at all and the n=
on-dt=20
init is not touched at all. Also it seems the legacy gpio based dt init=
 does=20
not work at all currently, because the pinctrl function are no-ops and=20
therefore the legacy gpio init is never reached on such systems.

So I would vote for dropping [B]. I'm already working a bit on a pinctr=
l=20
driver for s3c24xx, so when I reintroduce s3c24xx dt support again, it =
should=20
already have pinctrl support then.


Heiko
