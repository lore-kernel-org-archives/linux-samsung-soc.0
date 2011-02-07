From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [RFC 2/5] ARM: P2V: avoid initializers and assembly using
 PHYS_OFFSET
Date: Mon, 7 Feb 2011 17:51:50 +0100
Message-ID: <20110207165150.GG27982@pengutronix.de>
References: <20110104202052.GE24935@n2100.arm.linux.org.uk>
 <E1PaDOv-00023d-Gi@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1PaDOv-00023d-Gi@rmk-PC.arm.linux.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Nicolas Pitre <nico@fluxnic.net>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@codeaurora.org>, Bryan Huntsman <bryanh@codeaurora.org>, Amit Kucheria <amit.kucheria@canonical.com>, Sascha Hauer <kernel@pengutronix.de>, Eric Miao <eric.y.miao@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "Hans J. Koch" <hjk@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Russell,

On Tue, Jan 04, 2011 at 08:22:37PM +0000, Russell King - ARM Linux wrot=
e:
> As PHYS_OFFSET will be becoming a variable, we can't have it used in
> initializers nor assembly code.  Replace those in generic code with
> a run-time initialization.  Replace those in platform code using the
> individual platform specific PLAT_PHYS_OFFSET.
>=20
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  ....
>  arch/arm/mach-mx5/board-cpuimx51.c       |    2 +-
>  arch/arm/mach-mx5/board-cpuimx51sd.c     |    2 +-
>  arch/arm/mach-mx5/board-mx51_3ds.c       |    2 +-
> ...
> diff --git a/arch/arm/mach-mx5/board-cpuimx51.c b/arch/arm/mach-mx5/b=
oard-cpuimx51.c
> index 6a9792f..c4c3a9c 100644
> --- a/arch/arm/mach-mx5/board-cpuimx51.c
> +++ b/arch/arm/mach-mx5/board-cpuimx51.c
> @@ -292,7 +292,7 @@ static struct sys_timer mxc_timer =3D {
> =20
>  MACHINE_START(EUKREA_CPUIMX51, "Eukrea CPUIMX51 Module")
>  	/* Maintainer: Eric B??nard <eric@eukrea.com> */
> -	.boot_params =3D PHYS_OFFSET + 0x100,
> +	.boot_params =3D PLAT_PHYS_OFFSET + 0x100,
>  	.map_io =3D mx51_map_io,
>  	.init_irq =3D mx51_init_irq,
>  	.init_machine =3D eukrea_cpuimx51_init,
> diff --git a/arch/arm/mach-mx5/board-cpuimx51sd.c b/arch/arm/mach-mx5=
/board-cpuimx51sd.c
> index 4b3a611..b887381 100644
> --- a/arch/arm/mach-mx5/board-cpuimx51sd.c
> +++ b/arch/arm/mach-mx5/board-cpuimx51sd.c
> @@ -323,7 +323,7 @@ static struct sys_timer mxc_timer =3D {
> =20
>  MACHINE_START(EUKREA_CPUIMX51SD, "Eukrea CPUIMX51SD")
>  	/* Maintainer: Eric B??nard <eric@eukrea.com> */
> -	.boot_params =3D PHYS_OFFSET + 0x100,
> +	.boot_params =3D PLAT_PHYS_OFFSET + 0x100,
>  	.map_io =3D mx51_map_io,
>  	.init_irq =3D mx51_init_irq,
>  	.init_machine =3D eukrea_cpuimx51sd_init,
> diff --git a/arch/arm/mach-mx5/board-mx51_3ds.c b/arch/arm/mach-mx5/b=
oard-mx51_3ds.c
> index 79ce8dc..10e6ce3 100644
> --- a/arch/arm/mach-mx5/board-mx51_3ds.c
> +++ b/arch/arm/mach-mx5/board-mx51_3ds.c
> @@ -186,7 +186,7 @@ static struct sys_timer mxc_timer =3D {
> =20
>  MACHINE_START(MX51_3DS, "Freescale MX51 3-Stack Board")
>  	/* Maintainer: Freescale Semiconductor, Inc. */
> -	.boot_params =3D PHYS_OFFSET + 0x100,
> +	.boot_params =3D PLAT_PHYS_OFFSET + 0x100,
>  	.map_io =3D mx51_map_io,
>  	.init_irq =3D mx51_init_irq,
>  	.init_machine =3D mxc_board_init,
nack.  7608d7d2b4a146f560436f5b99b1b93d30049e4e has a better fix.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-arm-msm=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
