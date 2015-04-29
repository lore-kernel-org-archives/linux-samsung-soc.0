From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH 1/8] mfd: cros ec: Remove parent field
Date: Wed, 29 Apr 2015 11:37:34 +0100
Message-ID: <20150429103734.GU9169@x1>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
 <1428336906-14906-2-git-send-email-javier.martinez@collabora.co.uk>
 <CAMHSBOV3PxRqeHtMsDvqOaCLX7QpJ-ncvrfES_oixWAG1ZkDQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMHSBOV3PxRqeHtMsDvqOaCLX7QpJ-ncvrfES_oixWAG1ZkDQg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gwendal Grignou <gwendal@chromium.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 23 Apr 2015, Gwendal Grignou wrote:

> Be consistent, use cros_ec instead of "cros ec" or "cros-ec".

What is this in reference to?

> Otherwise:
>=20
> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> Tested-by: Gwendal Grignou <gwendal@chromium.org>
>=20
> On Mon, Apr 6, 2015 at 9:14 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
> > From: Gwendal Grignou <gwendal@chromium.org>
> >
> > parent and dev were pointing to the same device structure.
> > parent is unused, removed.
> >
> > Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> > Reviewed-by: Stephen Barber <smbarber@chromium.org>
> > Tested-by: Stephen Barber <smbarber@chromium.org>
> > Reviewed-by: Puthikorn Voravootivat <puthik@chromium.org>
> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.=
co.uk>
> > ---
> >  drivers/mfd/cros_ec_i2c.c             | 1 -
> >  drivers/mfd/cros_ec_spi.c             | 1 -
> >  drivers/platform/chrome/cros_ec_lpc.c | 1 -
> >  include/linux/mfd/cros_ec.h           | 2 --
> >  4 files changed, 5 deletions(-)

=46or when you re-submit:

Acked-by: Lee Jones <lee.jones@linaro.org>

> > diff --git a/drivers/mfd/cros_ec_i2c.c b/drivers/mfd/cros_ec_i2c.c
> > index c0c30f4f946f..82b4d6148698 100644
> > --- a/drivers/mfd/cros_ec_i2c.c
> > +++ b/drivers/mfd/cros_ec_i2c.c
> > @@ -145,7 +145,6 @@ static int cros_ec_i2c_probe(struct i2c_client =
*client,
> >         ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_i2c;
> >         ec_dev->ec_name =3D client->name;
> >         ec_dev->phys_name =3D client->adapter->name;
> > -       ec_dev->parent =3D &client->dev;
> >
> >         err =3D cros_ec_register(ec_dev);
> >         if (err) {
> > diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> > index bf6e08e8013e..27bd52e5e8b7 100644
> > --- a/drivers/mfd/cros_ec_spi.c
> > +++ b/drivers/mfd/cros_ec_spi.c
> > @@ -363,7 +363,6 @@ static int cros_ec_spi_probe(struct spi_device =
*spi)
> >         ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_spi;
> >         ec_dev->ec_name =3D ec_spi->spi->modalias;
> >         ec_dev->phys_name =3D dev_name(&ec_spi->spi->dev);
> > -       ec_dev->parent =3D &ec_spi->spi->dev;
> >         ec_dev->din_size =3D EC_MSG_BYTES + EC_MSG_PREAMBLE_COUNT;
> >         ec_dev->dout_size =3D EC_MSG_BYTES;
> >
> > diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platfo=
rm/chrome/cros_ec_lpc.c
> > index 8f9ac4d7bbd0..860310513cf0 100644
> > --- a/drivers/platform/chrome/cros_ec_lpc.c
> > +++ b/drivers/platform/chrome/cros_ec_lpc.c
> > @@ -214,7 +214,6 @@ static int cros_ec_lpc_probe(struct platform_de=
vice *pdev)
> >         ec_dev->dev =3D dev;
> >         ec_dev->ec_name =3D pdev->name;
> >         ec_dev->phys_name =3D dev_name(dev);
> > -       ec_dev->parent =3D dev;
> >         ec_dev->cmd_xfer =3D cros_ec_cmd_xfer_lpc;
> >         ec_dev->cmd_readmem =3D cros_ec_lpc_readmem;
> >
> > diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_e=
c.h
> > index 324a34683971..14cf522123dd 100644
> > --- a/include/linux/mfd/cros_ec.h
> > +++ b/include/linux/mfd/cros_ec.h
> > @@ -85,7 +85,6 @@ struct cros_ec_command {
> >   * to using dword.
> >   * @din_size: size of din buffer to allocate (zero to use static d=
in)
> >   * @dout_size: size of dout buffer to allocate (zero to use static=
 dout)
> > - * @parent: pointer to parent device (e.g. i2c or spi device)
> >   * @wake_enabled: true if this device can wake the system from sle=
ep
> >   * @cmd_xfer: send command to EC and get response
> >   *     Returns the number of bytes received if the communication s=
ucceeded, but
> > @@ -113,7 +112,6 @@ struct cros_ec_device {
> >         uint8_t *dout;
> >         int din_size;
> >         int dout_size;
> > -       struct device *parent;
> >         bool wake_enabled;
> >         int (*cmd_xfer)(struct cros_ec_device *ec,
> >                         struct cros_ec_command *msg);
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
