From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 3/7] mfd: cros_ec: Add cros_ec_lpc driver for
 x86 devices
Date: Tue, 20 Jan 2015 16:34:10 +0000
Message-ID: <20150120163410.GC30656@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-4-git-send-email-javier.martinez@collabora.co.uk>
 <20150120081104.GT21886@x1>
 <54BE7B08.1010900@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54BE7B08.1010900@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 20 Jan 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> On 01/20/2015 09:11 AM, Lee Jones wrote:
> > On Fri, 02 Jan 2015, Javier Martinez Canillas wrote:
> >=20
> >> From: Bill Richardson <wfrichar@chromium.org>
> >>=20
> >> This adds the LPC interface to the Chrome OS EC. Like the
> >> I2C and SPI drivers, this allows userspace access to the EC.
> >=20
> > I'm fairly certain that this is _not_ an MFD device.  Please locate=
 it
> > to the proper subsystem (input?).
> >=20
>=20
> Sorry, it wasn't my intention to use the mfd subsystem as a place to =
dump
> random drivers. Is that I still find hard to understand what is the l=
ine
> between what falls under mfd and what doesn't.
>=20
> For example, I see that mfd drivers are for devices which have multip=
le
> functions and the mfd driver is the one that spawns the platform devi=
ces
> and provide an interface to access the I/O registers used by the diff=
erent
> platform drivers of the sub-devices.
>=20
> So, the Embedded Controller driver (drivers/mfd/cros_ec.c) falls into=
 that
> category and in fact has been in the mfd driver for a long time. Now,=
 if
> an mfd device support different type of buses (e.g: i2c, spi, etc) I =
see
> that both the core driver and the driver for the transport method are
> in the drivers/mfd directory. As an example:
>=20
> drivers/mfd/arizona-{core,i2c,spi}.c
> drivers/mfd/da9052-{core,i2c,spi}.c
> drivers/mfd/mc13xxx-{core,i2c,spi}.c
> drivers/mfd/tps65912-{core,i2c,spi}.c
> drivers/mfd/wm831x-{core,i2c,spi,otp}.c
>=20
> In the cros_ec case, we already have drivers/mfd/cros_ec_{i2c,spi}.c =
so
> since the Low Pin Count is another transport method I thought that th=
is
> driver belonged to the drivers/mfd directory.
>=20
> Now, all those drivers may be wrong and the buses don't belong to the=
 mfd
> subsystem but then I think we need to document that since it seems th=
at is
> the correct way to do it just by looking at the other drivers.

I don't think the drivers you mentioned above do anything practical.
=46or instance, they are not SPI/IC2/etc drivers.  They should only
offer some abstraction layers which are used to communicate with the
device.  The driver you are submitting looks a lot more like a device
driver, which should live somewhere else.  Don't ask me where though,
I'm not even sure what a Low Pin Controller does.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
