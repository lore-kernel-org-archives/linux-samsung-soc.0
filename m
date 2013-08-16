From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 0/8] Common Clock Framework support for Samsung S3C64xx
Date: Fri, 16 Aug 2013 12:44:44 +0200
Message-ID: <2956608.dyLtqySMuJ@amdc1227>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
 <51FFDA70.7080900@samsung.com> <20130805180625.5348.79570@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=nextPart1560779.elQ0zaIA6Y;
 micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20130805180625.5348.79570@quantum>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--nextPart1560779.elQ0zaIA6Y
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

On Monday 05 of August 2013 11:06:25 Mike Turquette wrote:
> Quoting Kukjin Kim (2013-08-05 10:01:36)
> 
> > On 07/23/13 08:49, Tomasz Figa wrote:
> > > This series is an attempt to move clock support on Samsung S3C64xx
> > > SoCs
> > > to Common Clock Framework.
> > > 
> > > First, support for PLL types present on S3C64xx SoCs is added to
> > > Samsung
> > > Common Clock Framework driver. Then the main clock driver for
> > > mentioned
> > > SoCs is introduced. Further patches contain fixes for drivers to make
> > > them compliant with CCF semantics, migration of platform code to use
> > > the new clock driver and removal of old clock management code.
> > > 
> > > Depends on:
> > >   - [PATCH v4 00/20] Samsung PWM support cleanup
> > >   
> > >     http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20856
> > > 
> > > On S3C6410-based Tiny6410 board (Mini6410-compatible):
> > > 
> > > Tested-by: Tomasz Figa<tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > 
> > > For v1:
> > > 
> > > Acked-by: Mike Turquette<mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > 
> > > Changes since v1:
> > >   - added patch for read-only muxes,
> > >   - exported configurable muxes and dividers,
> > >   - defined mout_syncmux as read-only mux,
> > >   - in DT-enabled case fixed-clock binding is used to define external
> > >   clocks.> > 
> > > Tomasz Figa (8):
> > >    clk: mux: Add support for read-only muxes.
> > >    clk: samsung: pll: Add support for PLL6552 and PLL6553
> > >    clk: samsung: Add clock driver for S3C64xx SoCs
> > >    ARM: SAMSUNG: Add soc_is_s3c6400/s3c6410 macros
> > >    ARM: s3c64xx: dma: Use clk_prepare_enable/clk_disable_unprepare
> > >    usb: host: ohci-s3c2410 Use
> > >    clk_prepare_enable/clk_disable_unprepare
> > >    ARM: s3c64xx: Migrate clock handling to Common Clock Framework
> > >    ARM: s3c64xx: Remove old clock management code
> > >   
> > >   .../bindings/clock/samsung,s3c64xx-clock.txt       |   77 ++
> > >   arch/arm/Kconfig                                   |    2 +-
> > >   arch/arm/mach-s3c64xx/Makefile                     |    2 +-
> > >   arch/arm/mach-s3c64xx/clock.c                      | 1007
> > >   -------------------- arch/arm/mach-s3c64xx/common.c               
> > >        |   21 +-
> > >   arch/arm/mach-s3c64xx/common.h                     |   12 +-
> > >   arch/arm/mach-s3c64xx/dma.c                        |    4 +-
> > >   arch/arm/mach-s3c64xx/include/mach/regs-clock.h    |  132 +--
> > >   arch/arm/mach-s3c64xx/mach-anw6410.c               |    2 +-
> > >   arch/arm/mach-s3c64xx/mach-crag6410.c              |    2 +-
> > >   arch/arm/mach-s3c64xx/mach-hmt.c                   |    2 +-
> > >   arch/arm/mach-s3c64xx/mach-mini6410.c              |    2 +-
> > >   arch/arm/mach-s3c64xx/mach-ncp.c                   |    2 +-
> > >   arch/arm/mach-s3c64xx/mach-smartq.c                |   11 +-
> > >   arch/arm/mach-s3c64xx/mach-smdk6400.c              |    2 +-
> > >   arch/arm/mach-s3c64xx/mach-smdk6410.c              |    2 +-
> > >   arch/arm/mach-s3c64xx/pm.c                         |   21 -
> > >   arch/arm/mach-s3c64xx/s3c6400.c                    |    6 -
> > >   arch/arm/mach-s3c64xx/s3c6410.c                    |    7 -
> > >   arch/arm/plat-samsung/include/plat/cpu.h           |    4 +
> > >   drivers/clk/clk-mux.c                              |   10 +-
> > >   drivers/clk/samsung/Makefile                       |    1 +
> > >   drivers/clk/samsung/clk-pll.c                      |  160 ++++
> > >   drivers/clk/samsung/clk-pll.h                      |    4 +
> > >   drivers/clk/samsung/clk-s3c64xx.c                  |  465 +++++++++
> > >   drivers/usb/host/ohci-s3c2410.c                    |    8 +-
> > >   include/dt-bindings/clock/samsung,s3c64xx-clock.h  |  178 ++++
> > >   include/linux/clk-provider.h                       |    2 +
> > >   28 files changed, 943 insertions(+), 1205 deletions(-)
> > >   create mode 100644
> > >   Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
> > >   delete mode 100644 arch/arm/mach-s3c64xx/clock.c
> > >   create mode 100644 drivers/clk/samsung/clk-s3c64xx.c
> > >   create mode 100644
> > >   include/dt-bindings/clock/samsung,s3c64xx-clock.h
> > 
> > Basically, this series looks good to me, but I'm not sure how this
> > should be handled because of dependency with PWM cleanup and clk stuff
> > in clk tree now...
> 
> Patches 1-3 can go into the clk tree. 4-6 should go through their
> respective trees.

It looks like version 2 of patch 2/8 has been applied by mistake, breaking 
compilation (and operation) of the clock driver added in patch 3/8.

Could you please fix this up? Thanks in advance.

Best regards,
Tomasz

> If you want I can take 7 & 8 through the clk tree.
> 
> Alternatively I can provide patches 1-3 in a separate stable topic
> branch for you to pull in as a dependency. We'll both merge that stable
> topic branch into our trees and you can make a note of it for the
> arm-soc folks.
> 
> Regards,
> Mike
> 
> > - Kukjin
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--nextPart1560779.elQ0zaIA6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAABAgAGBQJSDgKgAAoJEIv3Hb8G/XruEbgQAKse3gzqmuNFdJThcWKkynG3
MH6NjgVrwQO0uaoZRpLH/IwF4grNtvHzCJR1IeEuTe/NZRWrsBEV9V4vFNg5tl54
U8cXVHIjltoX8qPTSsGu45VjaMiOfEX52GZgV2Qk4hACIIgA892eygWyl+04wMqH
YzC7xU5jZAIb9ntK1LjZo7qTlX6MNUnIGaqNNr5UlAqS9cN89aNkE0TbRLH2WjZB
xccXiQu7A4oO57yYI046ZW0K2bNHNHvseO5os/urmWZlpNuF29nmpkouei2tt2mU
jGa/yooO+5elnvjWvtdKXKyGQG1qGrDCaxrjgVGN85wuKbT+MfvH35kvNd6LyQgM
zQiBcnObmcBQL02xtCi/4ONIGupKgYK/82/G9Lvn2GgVhB7aLL0qkND+lPsnoBdU
5xPRlw0ASS6E7KoivRNWAGEyCn1xHVK2RiznaIhuSIx3nhjVMzLBBq9kd0pf43i6
GU5glM/6Wrav9Osz51cv4yd1qVddHVhoI83la4Hc7d/nzZfGrf9Do6kuNGmbDQIQ
Dg0uNvN/ckLx21HlI1nC2ahvDboLtbwgzwclxeyY3IiyWw4yKEQQEtxxcrSqs+uR
lYkd5m8Y5dHTrcIBvRHU7JY7X1lRNH8sTDH0bf791SEJo/FPthPF07/mdGpjZUHY
YB955ofaxqxCAph0FG/R
=dKwN
-----END PGP SIGNATURE-----

--nextPart1560779.elQ0zaIA6Y--

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
