From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/4] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Mon, 15 Feb 2016 08:21:02 +0000
Message-ID: <20160215082102.GB3455@x1>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-3-git-send-email-javier@osg.samsung.com>
 <56C1762E.9040208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56C1762E.9040208@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 15 Feb 2016, Krzysztof Kozlowski wrote:

> On 12.02.2016 13:30, Javier Martinez Canillas wrote:
> > The driver's init and exit function don't do anything besides addin=
g and
> > deleting the I2C driver so the module_i2c_driver() macro could be u=
sed.
> >=20
> > Currently is not being used because the driver is initialized at su=
bsys
> > initcall level, claiming that this is done to allow consumers devic=
es to
> > use the resources provided by this driver. But dependencies should =
be in
> > the DT and consumers drivers should not rely in the registration or=
der.
> >=20
> > Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> > ---
> >=20
> >  drivers/mfd/max77686.c | 13 +------------
> >  1 file changed, 1 insertion(+), 12 deletions(-)
> >=20
>=20
> In the past not all dependencies supported deferred probing so such
> ordering was required.
>=20
> I don't like the "dependencies should be in DT" reason for the change=
=2E..
> because it is kind of wishful thinking. Yeah, the dependencies should=
 be
> in DT, but are they?
>=20
> Instead *please check it* and write:
> "Dependencies are in DT so manual ordering of init calls is not
> necessary any more".
>=20
> My fast tests of this patch shown that it works good... but some more
> thorough tests should be done.

See to all of this, collect the Acks you've received and re-submit
please.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
