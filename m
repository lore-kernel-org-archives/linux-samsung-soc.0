From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mmc: card: modify mmc_getgeo function
Date: Mon, 26 Sep 2011 10:28:14 +0200
Message-ID: <20110926082814.GA28149@pengutronix.de>
References: <1316516929-26694-1-git-send-email-girish.shivananjappa@linaro.org>
 <m2ty8520fb.fsf@bob.laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <m2ty8520fb.fsf@bob.laptop.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: Girish K S <girish.shivananjappa@linaro.org>, linux-mmc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Wed, Sep 21, 2011 at 02:52:08PM -0400, Chris Ball wrote:
> Hi,
>=20
> On Tue, Sep 20 2011, Girish K S wrote:
> > In the earlier code the cylinder, sector and head are assigned
> > independently. Current patch generates the cylinder number
> > with the values of sector and head.
> > This patch only makes they cylinder value to be dependent on
> > the sector and head.
> >
> > Signed-off-by: Girish K S <girish.shivananjappa@linaro.org>
> > ---
> >  drivers/mmc/card/block.c |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/mmc/card/block.c b/drivers/mmc/card/block.c
> > index 1ff5486..bebb13b 100644
> > --- a/drivers/mmc/card/block.c
> > +++ b/drivers/mmc/card/block.c
> > @@ -226,9 +226,10 @@ static int mmc_blk_release(struct gendisk *dis=
k, fmode_t mode)
> >  static int
> >  mmc_blk_getgeo(struct block_device *bdev, struct hd_geometry *geo)
> >  {
> > -	geo->cylinders =3D get_capacity(bdev->bd_disk) / (4 * 16);
> >  	geo->heads =3D 4;
> >  	geo->sectors =3D 16;
> > +	geo->cylinders =3D get_capacity(bdev->bd_disk) /
> > +		(geo->heads * geo->sectors);
> >  	return 0;
> >  }
>=20
> Thanks, pushed to mmc-next for 3.2 with a reworded commit message:
This (i.e. ee9e0e0 (mmc: card: Remove duplicated constants) in next)
makes gcc emit a reference to __aeabi_uldivmod in one of my nightly
builds which isn't defined.

The final linking stage fails with:

	  LD      .tmp_vmlinux1
	drivers/built-in.o: In function `mmc_blk_getgeo':
	clkdev.c:(.text+0xd1528): undefined reference to `__aeabi_uldivmod'
	make[2]: *** [.tmp_vmlinux1] Error 1
	make[1]: *** [sub-make] Error 2
	make: *** [all] Error 2

(I don't know why clkdev.c is referenced here. I'm not using ccache.)

It seems gcc isn't smart enough to notice that it can just use the same
generated code ...

Having said that AFAIK the code used before wasn't ok, too. (I.e. an u6=
4
division that was just noticed to be a shift by luck.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
