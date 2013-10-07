From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v5 2/4] dmaengine: add driver for Samsung s3c24xx SoCs
Date: Mon, 7 Oct 2013 20:03:51 +0530
Message-ID: <20131007143351.GK2954@intel.com>
References: <201309182118.28391.heiko@sntech.de>
 <201309182119.54560.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201309182119.54560.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, Dan Williams <djbw@fb.com>, linus.walleij@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2013 at 09:19:54PM +0200, Heiko St=FCbner wrote:
> This adds a new driver to support the s3c24xx dma using the dmaengine
> and makes the old one in mach-s3c24xx obsolete in the long run.
>=20
> Conceptually the s3c24xx-dma feels like a distant relative of the pl0=
8x
> with numerous virtual channels being mapped to a lot less physical on=
es.
> The driver therefore borrows a lot from the amba-pl08x driver in this
> regard. Functionality-wise the driver gains a memcpy ability in addit=
ion
> to the slave_sg one.
>=20
> The driver supports both the method for requesting the peripheral use=
d
> by SoCs before the S3C2443 and the different method for S3C2443 and l=
ater.
>=20
> On earlier SoCs the hardware channels usable for specific peripherals=
 is
> constrainted while on later SoCs all channels can be used for any per=
ipheral.
>=20
> Tested on a s3c2416-based board, memcpy using the dmatest module and
> slave_sg partially using the spi-s3c64xx driver.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Vinod Koul <vinod.koul@intel.com>

--
~Vinod
