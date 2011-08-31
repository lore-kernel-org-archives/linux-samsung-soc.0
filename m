From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: Add clkdev support to HSMMC
Date: Wed, 31 Aug 2011 10:42:50 +0200
Message-ID: <4E5DF40A.1040707@samsung.com>
References: <0LQO00HOLZVZDW20@ms6.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29665 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752772Ab1HaIm4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 04:42:56 -0400
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LQS00HYJAVFSJ@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:42:51 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LQS0031XAVE6X@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 09:42:51 +0100 (BST)
In-reply-to: <0LQO00HOLZVZDW20@ms6.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: banajit.g@samsung.com
Cc: RAJESHWARI S SHINDE <rajeshwari.s@samsung.com>, PADMAVATHI VENNA <padma.v@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Banajit,

(added Mr. Kim at cc)


On 08/29/2011 03:52 PM, BANAJIT GOSWAMI wrote:
> Hi Sylwester,
>=20
>  Thanks once again for your suggestions and help.
>=20
>  I have tried to put down some points (attached doc) regarding the ne=
ed of
> registering some clocks separately (with original names).
>=20
>=20
>  Kindly let me know your opinion regarding the same.

Here is your original text as in the attachment:


> Clkdev Changes Analysis

> Following are few of the points due to which we are reluctant on chan=
ging the
> current implementation of Clkdev in Samsung SoC=92s:
>
> 1)Adding more lines of code: Currently Samsung uses a static clock ar=
ray to
> register the clocks. Breaking them up into individual clock structure=
 object=20
> and again registering them by creating a lookup table will add more l=
ines of
> code which might not be accepted.

IMHO this is insignificant increase in LOC which will result in less co=
de
in the future.

> 2) Confusion due to clock names: If we register the clock with generi=
c
> connection ids which are common across the platforms and then try to =
access
> same for some generic functions like set_parent () or clk_get_rate ()=
, which
> would be confusing for the developer modifying the code.

It's just a matter of chossing meaningfull names to avoid confusion.
But all this require a look from wider perspective, not only problem
of a single device driver.
I'm not the Samsung clock code maintainer. I just expressed my concerns
and want to let Mr. Kim judge and take care of further development.
Unfortunately I can invest much time to this issue ATM.

> Same is explained below with an example:

> In SD/MMC driver we use a bus clock with name =93sclk_mmc=94 which wo=
uld be
> registered with generic connection id =93mmc_busclk.2=94 to clkdev an=
d same is
> used by driver for best source calculation.
> In case we need to set parent for the same at kernel side we would ha=
ve to do
> the same using set_parent (=93mmc_busclk.2=94, parent) which would cr=
eate
> confusion to the person reading where as set_parent (=93sclk_mmc=94, =
parent)
> would be clearer.

> 3) In the proposed implementation where we create connection ids only=
 for the
> bus clocks we are creating an extra node for the same in the clkdev t=
able,

> where as the clock is getting registered only once with the kernel.=20

I don't agree with this last statement, the same struct clk is added to=
=20
the list of clocks known by the system twice, in s3c24xx_register_clock=
s()
and clkdev_add_table(). This is only what I have been pointing out.=20
Please correct me, if I missed anything.


Here is an original patch:

8----------------------------------------------------------------------=
-------

=46rom 04e1949999ad4f3639e7266b4a8750b13a6d9e5e Mon Sep 17 00:00:00 200=
1
=46rom: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Date: Fri, 19 Aug 2011 12:14:10 +0530
Subject: [PATCH 2] ARM: S5PV210: Add Clkdev support for SDHCI

This patch registers the SDHCI bus clocks to Clkdev.

Signed-off-by: Rajeshwari Shinde <rajeshwari.s@samsung.com>
---
 arch/arm/mach-s5pv210/clock.c              |  178 ++++++++++++++++++--=
--------
 arch/arm/plat-samsung/include/plat/clock.h |    8 ++
 2 files changed, 122 insertions(+), 64 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/cloc=
k.c
index 52a8e60..a95a14b 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -350,30 +350,6 @@ static struct clk init_clocks_off[] =3D {
 		.enable		=3D s5pv210_clk_ip1_ctrl,
 		.ctrlbit	=3D (1<<25),
 	}, {
-		.name		=3D "hsmmc",
-		.devname	=3D "s3c-sdhci.0",
-		.parent		=3D &clk_hclk_psys.clk,
-		.enable		=3D s5pv210_clk_ip2_ctrl,
-		.ctrlbit	=3D (1<<16),
-	}, {
-		.name		=3D "hsmmc",
-		.devname	=3D "s3c-sdhci.1",
-		.parent		=3D &clk_hclk_psys.clk,
-		.enable		=3D s5pv210_clk_ip2_ctrl,
-		.ctrlbit	=3D (1<<17),
-	}, {
-		.name		=3D "hsmmc",
-		.devname	=3D "s3c-sdhci.2",
-		.parent		=3D &clk_hclk_psys.clk,
-		.enable		=3D s5pv210_clk_ip2_ctrl,
-		.ctrlbit	=3D (1<<18),
-	}, {
-		.name		=3D "hsmmc",
-		.devname	=3D "s3c-sdhci.3",
-		.parent		=3D &clk_hclk_psys.clk,
-		.enable		=3D s5pv210_clk_ip2_ctrl,
-		.ctrlbit	=3D (1<<19),
-	}, {
 		.name		=3D "systimer",
 		.parent		=3D &clk_pclk_psys.clk,
 		.enable		=3D s5pv210_clk_ip3_ctrl,
@@ -844,46 +820,6 @@ static struct clksrc_clk clksrcs[] =3D {
 		.reg_div =3D { .reg =3D S5P_CLK_DIV1, .shift =3D 20, .size =3D 4 },
 	}, {
 		.clk		=3D {
-			.name		=3D "sclk_mmc",
-			.devname	=3D "s3c-sdhci.0",
-			.enable		=3D s5pv210_clk_mask0_ctrl,
-			.ctrlbit	=3D (1 << 8),
-		},
-		.sources =3D &clkset_group2,
-		.reg_src =3D { .reg =3D S5P_CLK_SRC4, .shift =3D 0, .size =3D 4 },
-		.reg_div =3D { .reg =3D S5P_CLK_DIV4, .shift =3D 0, .size =3D 4 },
-	}, {
-		.clk		=3D {
-			.name		=3D "sclk_mmc",
-			.devname	=3D "s3c-sdhci.1",
-			.enable		=3D s5pv210_clk_mask0_ctrl,
-			.ctrlbit	=3D (1 << 9),
-		},
-		.sources =3D &clkset_group2,
-		.reg_src =3D { .reg =3D S5P_CLK_SRC4, .shift =3D 4, .size =3D 4 },
-		.reg_div =3D { .reg =3D S5P_CLK_DIV4, .shift =3D 4, .size =3D 4 },
-	}, {
-		.clk		=3D {
-			.name		=3D "sclk_mmc",
-			.devname	=3D "s3c-sdhci.2",
-			.enable		=3D s5pv210_clk_mask0_ctrl,
-			.ctrlbit	=3D (1 << 10),
-		},
-		.sources =3D &clkset_group2,
-		.reg_src =3D { .reg =3D S5P_CLK_SRC4, .shift =3D 8, .size =3D 4 },
-		.reg_div =3D { .reg =3D S5P_CLK_DIV4, .shift =3D 8, .size =3D 4 },
-	}, {
-		.clk		=3D {
-			.name		=3D "sclk_mmc",
-			.devname	=3D "s3c-sdhci.3",
-			.enable		=3D s5pv210_clk_mask0_ctrl,
-			.ctrlbit	=3D (1 << 11),
-		},
-		.sources =3D &clkset_group2,
-		.reg_src =3D { .reg =3D S5P_CLK_SRC4, .shift =3D 12, .size =3D 4 },
-		.reg_div =3D { .reg =3D S5P_CLK_DIV4, .shift =3D 12, .size =3D 4 },
-	}, {
-		.clk		=3D {
 			.name		=3D "sclk_mfc",
 			.devname	=3D "s5p-mfc",
 			.enable		=3D s5pv210_clk_ip0_ctrl,
@@ -1011,6 +947,112 @@ static u32 epll_div[][6] =3D {
 	{  50000000, 0, 50, 3, 3, 0 },
 };
=20
+static struct clk hsmmc_clk0 =3D {
+	.name		=3D "hsmmc",
+	.devname	=3D "s3c-sdhci.0",
+	.parent		=3D &clk_hclk_psys.clk,
+	.enable		=3D s5pv210_clk_ip2_ctrl,
+	.ctrlbit	=3D (1<<16),
+};
+
+static struct clk hsmmc_clk1 =3D {
+	.name		=3D "hsmmc",
+	.devname	=3D "s3c-sdhci.1",
+	.parent		=3D &clk_hclk_psys.clk,
+	.enable		=3D s5pv210_clk_ip2_ctrl,
+	.ctrlbit	=3D (1<<17),
+};
+
+static struct clk hsmmc_clk2 =3D {
+	.name		=3D "hsmmc",
+	.devname	=3D "s3c-sdhci.2",
+	.parent		=3D &clk_hclk_psys.clk,
+	.enable		=3D s5pv210_clk_ip2_ctrl,
+	.ctrlbit	=3D (1<<18),
+};
+
+static struct clk hsmmc_clk3 =3D {
+	.name		=3D "hsmmc",
+	.devname	=3D "s3c-sdhci.3",
+	.parent		=3D &clk_hclk_psys.clk,
+	.enable		=3D s5pv210_clk_ip2_ctrl,
+	.ctrlbit	=3D (1<<19),
+};
+
+static struct clksrc_clk sclk_mmc0 =3D {
+	.clk		=3D {
+		.name		=3D "sclk_mmc",
+		.devname	=3D "s3c-sdhci.0",
+		.enable		=3D s5pv210_clk_mask0_ctrl,
+		.ctrlbit	=3D (1 << 8),
+		},
+	.sources	=3D &clkset_group2,
+	.reg_src	=3D { .reg =3D S5P_CLK_SRC4, .shift =3D 0, .size =3D 4 },
+	.reg_div	=3D { .reg =3D S5P_CLK_DIV4, .shift =3D 0, .size =3D 4 },
+
+};
+
+static struct clksrc_clk sclk_mmc1 =3D {
+	.clk		=3D {
+		.name		=3D "sclk_mmc",
+		.devname	=3D "s3c-sdhci.1",
+		.enable		=3D s5pv210_clk_mask0_ctrl,
+		.ctrlbit	=3D (1 << 9),
+	},
+	.sources	=3D &clkset_group2,
+	.reg_src	=3D { .reg =3D S5P_CLK_SRC4, .shift =3D 4, .size =3D 4 },
+	.reg_div	=3D { .reg =3D S5P_CLK_DIV4, .shift =3D 4, .size =3D 4 },
+};
+
+static struct clksrc_clk sclk_mmc2 =3D {
+	.clk		=3D {
+		.name		=3D "sclk_mmc",
+		.devname	=3D "s3c-sdhci.2",
+		.enable		=3D s5pv210_clk_mask0_ctrl,
+		.ctrlbit	=3D (1 << 10),
+	},
+	.sources	=3D &clkset_group2,
+	.reg_src	=3D { .reg =3D S5P_CLK_SRC4, .shift =3D 8, .size =3D 4 },
+	.reg_div	=3D { .reg =3D S5P_CLK_DIV4, .shift =3D 8, .size =3D 4 },
+};
+
+static struct clksrc_clk sclk_mmc3 =3D {
+	.clk		=3D {
+		.name		=3D "sclk_mmc",
+		.devname	=3D "s3c-sdhci.3",
+		.enable		=3D s5pv210_clk_mask0_ctrl,
+		.ctrlbit	=3D (1 << 11),
+	},
+	.sources	=3D &clkset_group2,
+	.reg_src	=3D { .reg =3D S5P_CLK_SRC4, .shift =3D 12, .size =3D 4 },
+	.reg_div	=3D { .reg =3D S5P_CLK_DIV4, .shift =3D 12, .size =3D 4 },
+};
+
+static struct clk_lookup s5pv210_clks[] =3D {
+	CLK("s3c-sdhci.0", "mmc_busclk.0", &hsmmc_clk0),
+	CLK("s3c-sdhci.1", "mmc_busclk.0", &hsmmc_clk1),
+	CLK("s3c-sdhci.2", "mmc_busclk.0", &hsmmc_clk2),
+	CLK("s3c-sdhci.3", "mmc_busclk.0", &hsmmc_clk3),
+	CLK("s3c-sdhci.0", "mmc_busclk.2", &sclk_mmc0.clk),
+	CLK("s3c-sdhci.1", "mmc_busclk.2", &sclk_mmc1.clk),
+	CLK("s3c-sdhci.2", "mmc_busclk.2", &sclk_mmc2.clk),
+	CLK("s3c-sdhci.3", "mmc_busclk.2", &sclk_mmc3.clk),
+};
+
+static struct clk *bus_clk[] =3D {
+	&hsmmc_clk0,
+	&hsmmc_clk1,
+	&hsmmc_clk2,
+	&hsmmc_clk3,
+};
+
+static struct clksrc_clk *bus_clksrc[] =3D {
+	&sclk_mmc0,
+	&sclk_mmc1,
+	&sclk_mmc2,
+	&sclk_mmc3,
+};
+
 static int s5pv210_epll_set_rate(struct clk *clk, unsigned long rate)
 {
 	unsigned int epll_con, epll_con_k;
@@ -1156,10 +1198,18 @@ void __init s5pv210_register_clocks(void)
 		s3c_register_clksrc(sysclks[ptr], 1);
=20
 	s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
+	for (ptr =3D 0; ptr < ARRAY_SIZE(bus_clksrc); ptr++)
+		s3c_register_clksrc(bus_clksrc[ptr], 1);
+
 	s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clocks));
=20
 	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
 	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
=20
+	s3c24xx_register_clocks(bus_clk, ARRAY_SIZE(bus_clk));
+	for (ptr =3D 0; ptr < ARRAY_SIZE(bus_clk); ptr++)
+		s3c_disable_clocks(bus_clk[ptr], 1);
+
 	s3c_pwmclk_init();
+	clkdev_add_table(s5pv210_clks, ARRAY_SIZE(s5pv210_clks));

 }
diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat=
-samsung/include/plat/clock.h
index 87d5b38..03f70ba 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -29,6 +29,14 @@ struct clk;
  * not be a problem as it is unlikely these operations are going
  * to need to be called quickly.
  */
+
+#define CLK(dev, con, ck)	\
+	{			\
+		.dev_id	=3D dev,	\
+		.con_id	=3D con,	\
+		.clk	=3D ck,	\
+	}			\
+
 struct clk_ops {
 	int		    (*set_rate)(struct clk *c, unsigned long rate);
 	unsigned long	    (*get_rate)(struct clk *c);
--=20
1.7.4.4

8----------------------------------------------------------------------=
------


>=20
> Thanks and Regards,
> Banajit Goswami
=2E..
>=20
> ------- *Original Message* -------
> *Sender* : Sylwester Nawrocki<s.nawrocki@samsung.com> Software Engine=
er/Poland
> R&D Center-Linux (MSD)/Samsung Electronics
> *Date* : Aug 24, 2011 22:29 (GMT+09:00)
> *Title* : Re: Add clkdev support to HSMMC
>=20
> Hi Banajit,
>=20
> On 08/24/2011 07:47 AM, RAJESHWARI S SHINDE wrote:
>> Hi Sylwester,
>>
>>
>> This is with regards to your reply for Padmavathi's mail regarding d=
ouble
>> registration of clocks with clkdev in case of SPI.
>>
>> In the attached patch set registration of bus clocks is happening tw=
ice, once
>> with actual clock name and another with generic connection id. This =
is being
>> done to avoid issue as explained below.
>>
>> When trying to add Clkdev support for the HSMMC, was facing the foll=
owing issue:
>>
>> We have a peripheral clock with name "hsmmc " which is also being us=
ed  as a
>> bus clock, for best source calculation in  SoC's  like S3C64XX, S3C2=
416,
>> S5PC100 and S5PV210 as shown below:
>>
>> char *s5pv210_hsmmc_clksrcs[4] =3D {
>>         [0] =3D "hsmmc",          /* HCLK */
>>         /* [1] =3D "hsmmc",       - duplicate HCLK entry */
>>         [2] =3D "sclk_mmc",       /* mmc_bus */
>>         /* [3] =3D NULL,          - reserved */
>> };
>>
>> Hence when we try to add this "hsmmc" as a bus clock in the clkdev l=
ookup table
>> with a generic name across all the platforms, which will be used by =
the
>> HSMMC driver, the problem arises as the driver also tries to search =
for this
>> peripheral clock using the clock name "hsmmc" as shown below and fai=
ls:
>>
>>   sc->clk_io =3D clk_get(dev, "hsmmc");
>>   if (IS_ERR(sc->clk_io)) {
>>                 dev_err(dev, "failed to get io clock\n");
>>                 ret =3D PTR_ERR(sc->clk_io);
>>                 goto err_io_clk;
>>   }
>>
>> I cannot alone use a generic connection id for getting the periphera=
l clocks as
>> SoC's like S5P64X0 and Exynos4 do not use this peripheral clock as b=
us clock.
>=20
> Could you create two separate clock 'connection id' name classes for =
each SoC ?
> One for the 'bus clock' and one for the the 'other' (hsmmc) clock ?
> Then each mach-* could assign proper struct clk to for the "clk_io" a=
t the driver.
>=20
> Now you're registering both current "hsmmc" and "sclk_hsmmc" clocks u=
nder
> "mmc_busclk.?" name only.
>=20
> For instance:
>=20
>=20
> +static struct clk_lookup s5pv210_clks[] =3D {
> + CLK("s3c-sdhci.0", "mmc_busclk.0", &hsmmc_clk0),
> + CLK("s3c-sdhci.1", "mmc_busclk.0", &hsmmc_clk1),
> + CLK("s3c-sdhci.2", "mmc_busclk.0", &hsmmc_clk2),
> + CLK("s3c-sdhci.3", "mmc_busclk.0", &hsmmc_clk3),
> + CLK("s3c-sdhci.0", "mmc_busclk.2", &sclk_mmc0.clk),
> + CLK("s3c-sdhci.1", "mmc_busclk.2", &sclk_mmc1.clk),
> + CLK("s3c-sdhci.2", "mmc_busclk.2", &sclk_mmc2.clk),
> + CLK("s3c-sdhci.3", "mmc_busclk.2", &sclk_mmc3.clk),
>=20
> + CLK("s3c-sdhci.0", "mmc_ioclk", &hsmmc_clk0),
> + CLK("s3c-sdhci.1", "mmc_ioclk", &hsmmc_clk1),
> + CLK("s3c-sdhci.2", "mmc_ioclk", &hsmmc_clk2),
> + CLK("s3c-sdhci.3", "mmc_ioclk", &hsmmc_clk3),
>=20
> +};
>=20
> Then in the driver:
>=20
>=20
> -   sc->clk_io =3D clk_get(dev, "hsmmc");
> +   sc->clk_io =3D clk_get(dev, "mmc_ioclk");
>    if (IS_ERR(sc->clk_io)) {
>                  dev_err(dev, "failed to get io clock\n");
>                  ret =3D PTR_ERR(sc->clk_io);
>                  goto err_io_clk;
>    }
>=20
> Does it make sense?
>=20
> I guess you don't want to modify every mach-s* for this ?
>=20
> I'm mostly OK with your patches, as they are a step in good direction=
=2E
>=20
>>
>> Hope you understood the problem; do refer the attached patch set for=
 more
>> clarification.
>>
>> Do suggest me if any better solution.
>>
>=20

Regards,
--=20
Sylwester Nawrocki
Samsung Poland R&D Center
