From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 3/7] mfd: cros_ec: Add cros_ec_lpc driver for
 x86 devices
Date: Thu, 22 Jan 2015 08:42:44 +0000
Message-ID: <20150122084244.GP22024@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-4-git-send-email-javier.martinez@collabora.co.uk>
 <20150120081104.GT21886@x1>
 <54BE7B08.1010900@collabora.co.uk>
 <20150120163410.GC30656@x1>
 <54BE87C4.4040108@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54BE87C4.4040108@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 20 Jan 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> On 01/20/2015 05:34 PM, Lee Jones wrote:
> >>=20
> >> So, the Embedded Controller driver (drivers/mfd/cros_ec.c) falls i=
nto that
> >> category and in fact has been in the mfd driver for a long time. N=
ow, if
> >> an mfd device support different type of buses (e.g: i2c, spi, etc)=
 I see
> >> that both the core driver and the driver for the transport method =
are
> >> in the drivers/mfd directory. As an example:
> >>=20
> >> drivers/mfd/arizona-{core,i2c,spi}.c
> >> drivers/mfd/da9052-{core,i2c,spi}.c
> >> drivers/mfd/mc13xxx-{core,i2c,spi}.c
> >> drivers/mfd/tps65912-{core,i2c,spi}.c
> >> drivers/mfd/wm831x-{core,i2c,spi,otp}.c
> >>=20
> >> In the cros_ec case, we already have drivers/mfd/cros_ec_{i2c,spi}=
=2Ec so
> >> since the Low Pin Count is another transport method I thought that=
 this
> >> driver belonged to the drivers/mfd directory.
> >>=20
> >> Now, all those drivers may be wrong and the buses don't belong to =
the mfd
> >> subsystem but then I think we need to document that since it seems=
 that is
> >> the correct way to do it just by looking at the other drivers.
> >=20
> > I don't think the drivers you mentioned above do anything practical=
=2E
> > For instance, they are not SPI/IC2/etc drivers.  They should only
> > offer some abstraction layers which are used to communicate with th=
e
> > device.  The driver you are submitting looks a lot more like a devi=
ce
> > driver, which should live somewhere else.  Don't ask me where thoug=
h,
> > I'm not even sure what a Low Pin Controller does.
> >=20
>=20
> The driver added by $subject doesn't really do anything practical eit=
her.
> LPC [0] is just another transport method like i2c or spi that is used=
 on
> x86 Chromebooks to access the Embedded Controller.

I'm not sure that's true.  It's pretty simple I grant you, but it
still looks like a driver, rather than an abstraction layer.

I would expect to see something more like:

static int cros_ec_lpc_readmem(...)
{
	return call_to_driver_to_read_memory(...);
=09
}

=2E.. instead of all those memory/register reads/writes.

Are there any other Low Pin Count drivers in the kernel?

> So the driver is really not that different than the cros_ec_{i2c,spi}=
=2Ec
> drivers.
>=20
> Best regards,
> Javier
>=20
> [0]: http://en.wikipedia.org/wiki/Low_Pin_Count

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
