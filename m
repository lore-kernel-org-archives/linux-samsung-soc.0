From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/6] mfd: cros_ec: Instantiate sub-devices from device
 tree
Date: Thu, 18 Sep 2014 17:15:12 -0700
Message-ID: <20140919001512.GA29852@lee--X1>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk>
 <1410428289-18229-7-git-send-email-javier.martinez@collabora.co.uk>
 <20140917163114.GL30918@lee--X1>
 <541A8E88.6050707@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <541A8E88.6050707-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Todd Broch <tbroch-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andreas Faerber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 18 Sep 2014, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> On 09/17/2014 06:31 PM, Lee Jones wrote:
> >> =20
> >> -static const struct mfd_cell cros_devs[] =3D {
> >> -	{
> >> -		.name =3D "cros-ec-keyb",
> >> -		.id =3D 1,
> >> -		.of_compatible =3D "google,cros-ec-keyb",
> >> -	},
> >> -	{
> >> -		.name =3D "cros-ec-i2c-tunnel",
> >> -		.id =3D 2,
> >> -		.of_compatible =3D "google,cros-ec-i2c-tunnel",
> >> -	},
> >> -};
> >> -
> >>  int cros_ec_register(struct cros_ec_device *ec_dev)
> >>  {
> >>  	struct device *dev =3D ec_dev->dev;
> >> +	struct device_node *node =3D dev->of_node;
> >>  	int err =3D 0;
> >> =20
> >>  	if (ec_dev->din_size) {
> >> @@ -140,12 +129,12 @@ int cros_ec_register(struct cros_ec_device *=
ec_dev)
> >> =20
> >>  	mutex_init(&ec_dev->lock);
> >> =20
> >> -	err =3D mfd_add_devices(dev, 0, cros_devs,
> >> -			      ARRAY_SIZE(cros_devs),
> >> -			      NULL, ec_dev->irq, NULL);
> >> -	if (err) {
> >> -		dev_err(dev, "failed to add mfd devices\n");
> >> -		return err;
> >=20
> > So these devices will only ever probe with DT now ...
> >
>=20
> Well, these are preparatory patches to reduce the delta between upstr=
eam and
> the downstream so the missing functionality could be added. One of th=
e missing
> drivers is the cros_ec_dev.c [0] which allows user-space to access th=
e
> ChromeOS Embedded Controller using a virtual character device (/dev/c=
ros_ec).
>=20
> Since that is a virtual device, it does not fit on the DT which only =
describes
> hw and also is used on x86 machines so that subdevice is still probed=
 using
> mfd_add_devices() and the mfd_cells array is not empty in the downstr=
eam
> cros_ec driver [1].
>=20
> That's why I didn't just made the cros_ec MFD to depend on OF, since =
I didn't
> want to diverge too much from the downstream driver because the idea =
of the
> series was to reduce the difference in order to add the missing bits =
on top.
>=20
> >> +	if (node) {
> >=20
> > So it would be wrong for dev->of_node not to be populated.
> >=20
>=20
> As explained above, DT, non-DT and x86 platforms instantiate the cros=
-ec-dev
> cells but DT platforms can define other child nodes. But I can remove=
 the
> conditional if you want and reintroduce it once cros-ec-dev support i=
s added.

Yes, that makes sense.  I only care about doing what's right for
Mainline, so if it doesn't make sense here, then we shouldn't be doing
it.

> >> +		err =3D of_platform_populate(node, NULL, NULL, dev);
> >> +		if (err) {
> >> +			dev_err(dev, "Failed to register subordinate devices");
> >> +			return err;
> >> +		}
> >>  	}
> >> =20
> >>  	dev_info(dev, "Chrome EC device registered\n");
> >=20
>=20
> Best regards,
> Javier
>=20
> [0]:
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chr=
omeos-3.8/drivers/mfd/cros_ec_dev.c
> [1]:
> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chr=
omeos-3.8/drivers/mfd/cros_ec.c#93

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
