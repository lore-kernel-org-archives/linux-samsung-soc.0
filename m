From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 3/7] mfd: cros_ec: Add cros_ec_lpc driver for
 x86 devices
Date: Thu, 22 Jan 2015 09:46:08 +0000
Message-ID: <20150122094608.GA5769@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-4-git-send-email-javier.martinez@collabora.co.uk>
 <20150120081104.GT21886@x1>
 <54BE7B08.1010900@collabora.co.uk>
 <20150120163410.GC30656@x1>
 <54BE87C4.4040108@collabora.co.uk>
 <20150122084244.GP22024@x1>
 <54C0BE21.7020008@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:36543 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbbAVJqR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jan 2015 04:46:17 -0500
Received: by mail-ie0-f181.google.com with SMTP id rp18so454544iec.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2015 01:46:14 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54C0BE21.7020008@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de

On Thu, 22 Jan 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> On 01/22/2015 09:42 AM, Lee Jones wrote:
> >> >=20
> >> > I don't think the drivers you mentioned above do anything practi=
cal.
> >> > For instance, they are not SPI/IC2/etc drivers.  They should onl=
y
> >> > offer some abstraction layers which are used to communicate with=
 the
> >> > device.  The driver you are submitting looks a lot more like a d=
evice
> >> > driver, which should live somewhere else.  Don't ask me where th=
ough,
> >> > I'm not even sure what a Low Pin Controller does.
> >> >=20
> >>=20
> >> The driver added by $subject doesn't really do anything practical =
either.
> >> LPC [0] is just another transport method like i2c or spi that is u=
sed on
> >> x86 Chromebooks to access the Embedded Controller.
> >=20
> > I'm not sure that's true.  It's pretty simple I grant you, but it
> > still looks like a driver, rather than an abstraction layer.
> >=20
> > I would expect to see something more like:
> >=20
> > static int cros_ec_lpc_readmem(...)
> > {
> > 	return call_to_driver_to_read_memory(...);
> > =09
> > }
> >=20
> > ... instead of all those memory/register reads/writes.
> >
>=20
> Yeah... in that sense I've to admit that is more complex than the I2C=
 and SPI
> drivers, yet those have a subsystem in the kernel with helpers functi=
ons to
> do most of the communication:
>=20
> static int cros_ec_cmd_xfer_i2c(struct cros_ec_device *ec_dev,
> 				struct cros_ec_command *msg)
> {
> ...
> 	ret =3D i2c_transfer(client->adapter, i2c_msg, 2);
> ...
> }
>=20
> static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
> 				struct cros_ec_command *ec_msg)
> {
> ...
> 	spi_message_add_tail(&trans, &msg);
> 	ret =3D spi_sync(ec_spi->spi, &msg);
> ...
> }
>=20
> But there doesn't seem to be a LPC subsystem in the kernel so we don'=
t have a
> nice abstraction layer in this case.

This is the crux of the problem.  However, I feel bad for MFD, as it
is, once more, being used as an "well it doesn't fit anywhere else, so
let's shoehorn it in there" type of dumping ground.

> > Are there any other Low Pin Count drivers in the kernel?
> >
>=20
> I don't know tbh, I didn't even know what LPC was before I picked thi=
s patch
> to push it upstream. I searched in the Linux codebase for other LPC d=
rivers
> but I didn't find anything, that doesn't mean that it doesn't exist t=
hough.

I agree.  Perhaps a suitable driver should live in drivers/misc until
there are enough of them to warrant its own subsystem.

Anyone else have an opinion?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
