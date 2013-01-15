From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH v2] arch/arm/mach-s5pv210: adding ifdef CONFIG_CPU_S5PV210
 to fix compiling issue
Date: Tue, 15 Jan 2013 18:02:49 +0800
Message-ID: <50F52949.6010808@asianux.com>
References: <50EA972E.3040404@asianux.com> <50EAC016.6090707@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:34393 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369Ab3AOKCF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 05:02:05 -0500
In-Reply-To: <50EAC016.6090707@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hello kgene.kim

  when you have free time, please give a glance for this patch.

  I sent it according to script/get_maintainter.pl.
  if I sent to an incorrect member, please tell me, thanks.


  Regards

gchen.


=D3=DA 2013=C4=EA01=D4=C207=C8=D5 20:31, Chen Gang =D0=B4=B5=C0:
>=20
>   if not define CONFIG_CPU_S5PV210
>=20
>     it will define NULL in common.h for:
>       s5pv210_map_io, s5pv210_init_clocks, s5pv210_init, s5pv210_init=
_uarts
>=20
>     so need using #ifdef CONFIG_CPU_S5PV210 for them too, in common.c=
=2E
>       or compiling issue will occur.
>=20
>=20
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  arch/arm/mach-s5pv210/common.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/mach-s5pv210/common.c b/arch/arm/mach-s5pv210/c=
ommon.c
> index 9dfe93e..5c88f88 100644
> --- a/arch/arm/mach-s5pv210/common.c
> +++ b/arch/arm/mach-s5pv210/common.c
> @@ -167,6 +167,8 @@ void __init s5pv210_init_io(struct map_desc *mach=
_desc, int size)
>  	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
>  }
> =20
> +#ifdef CONFIG_CPU_S5PV210
> +
>  void __init s5pv210_map_io(void)
>  {
>  	/* initialise device information early */
> @@ -209,6 +211,9 @@ void __init s5pv210_init_clocks(int xtal)
>  	s5pv210_setup_clocks();
>  }
> =20
> +#endif /* CONFIG_CPU_S5PV210 */
> +
> +
>  void __init s5pv210_init_irq(void)
>  {
>  	u32 vic[4];	/* S5PV210 supports 4 VIC */
> @@ -227,6 +232,8 @@ struct bus_type s5pv210_subsys =3D {
>  	.dev_name	=3D "s5pv210-core",
>  };
> =20
> +#ifdef CONFIG_CPU_S5PV210
> +
>  static struct device s5pv210_dev =3D {
>  	.bus	=3D &s5pv210_subsys,
>  };
> @@ -249,3 +256,5 @@ void __init s5pv210_init_uarts(struct s3c2410_uar=
tcfg *cfg, int no)
>  {
>  	s3c24xx_init_uartdevs("s5pv210-uart", s5p_uart_resources, cfg, no);
>  }
> +
> +#endif /* CONFIG_CPU_S5PV210 */
>=20


--=20
Chen Gang

Asianux Corporation
