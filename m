From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/8] S3C2416: move io-init to SoC specific files
Date: Tue, 17 Jan 2012 23:23:12 +0100
Message-ID: <201201172323.12958.heiko@sntech.de>
References: <201201172210.51953.heiko@sntech.de> <201201172213.26769.heiko@sntech.de> <20120117214336.GX1068@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:43890 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755560Ab2AQWXY convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 17:23:24 -0500
In-Reply-To: <20120117214336.GX1068@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

Am Dienstag 17 Januar 2012, 22:43:36 schrieb Russell King - ARM Linux:
> On Tue, Jan 17, 2012 at 10:13:26PM +0100, Heiko St=FCbner wrote:
> > +/* minimal IO mapping */
> > +
> > +static struct map_desc s3c_iodesc[] __initdata =3D {
> > +	IODESC_ENT(GPIO),
> > +	IODESC_ENT(IRQ),
> > +	IODESC_ENT(MEMCTRL),
> > +	IODESC_ENT(UART)
> > +};
> > +
> > +void __init s3c2416_init_io(struct map_desc *mach_desc, int size)
> > +{
> > +	/* initialise the io descriptors we need for initialisation */
> > +	iotable_init(mach_desc, size);
> > +	iotable_init(s3c_iodesc, ARRAY_SIZE(s3c_iodesc));
> > +
> > +	samsung_cpu_id =3D __raw_readl(S3C24XX_GSTATUS1);
> > +	s3c24xx_init_cpu();
> > +
> > +	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
> > +}
>=20
> Why do we need this implemented in every Samsung mach directory?
> Why not provide a new function in arch/arm/plat-s3c24xx/cpu.c:
>=20
> void __init s3c24xx_common_init_io(void __iomem *id_reg, struct cpu_t=
able
> *ids, size_t nr_ids)
> {
> 	iotable_init(s3c_iodesc, ARRAY_SIZE(s3c_iodesc));
>=20
> 	samsung_cpu_id =3D __raw_readl(id_reg);
> 	s3c24xx_init_cpu();
> 	s3c_init_cpu(samsung_cpu_id, ids, nr_ids);
> }
>=20
> and then this becomes:
>=20
> void __init s3c2416_init_io(struct map_desc *mach_desc, int size)
> {
> 	/* initialise the io descriptors we need for initialisation */
> 	iotable_init(mach_desc, size);
> 	s3c24xx_common_init_io(S3C24XX_GSTATUS1, cpu_ids, ARRAY_SIZE(cpu_ids=
));
> }

this looks nice, and you're right of course, this is much saner.
