From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/8] S3C2416: move io-init to SoC specific files
Date: Tue, 17 Jan 2012 21:43:36 +0000
Message-ID: <20120117214336.GX1068@n2100.arm.linux.org.uk>
References: <201201172210.51953.heiko@sntech.de> <201201172213.26769.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:57270 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755923Ab2AQVnu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 16:43:50 -0500
Content-Disposition: inline
In-Reply-To: <201201172213.26769.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

On Tue, Jan 17, 2012 at 10:13:26PM +0100, Heiko St=FCbner wrote:
> +/* minimal IO mapping */
> +
> +static struct map_desc s3c_iodesc[] __initdata =3D {
> +	IODESC_ENT(GPIO),
> +	IODESC_ENT(IRQ),
> +	IODESC_ENT(MEMCTRL),
> +	IODESC_ENT(UART)
> +};
> +
> +void __init s3c2416_init_io(struct map_desc *mach_desc, int size)
> +{
> +	/* initialise the io descriptors we need for initialisation */
> +	iotable_init(mach_desc, size);
> +	iotable_init(s3c_iodesc, ARRAY_SIZE(s3c_iodesc));
> +
> +	samsung_cpu_id =3D __raw_readl(S3C24XX_GSTATUS1);
> +	s3c24xx_init_cpu();
> +
> +	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
> +}

Why do we need this implemented in every Samsung mach directory?
Why not provide a new function in arch/arm/plat-s3c24xx/cpu.c:

void __init s3c24xx_common_init_io(void __iomem *id_reg, struct cpu_tab=
le *ids,
	size_t nr_ids)
{
	iotable_init(s3c_iodesc, ARRAY_SIZE(s3c_iodesc));

	samsung_cpu_id =3D __raw_readl(id_reg);
	s3c24xx_init_cpu();
	s3c_init_cpu(samsung_cpu_id, ids, nr_ids);
}

and then this becomes:

void __init s3c2416_init_io(struct map_desc *mach_desc, int size)
{
	/* initialise the io descriptors we need for initialisation */
	iotable_init(mach_desc, size);
	s3c24xx_common_init_io(S3C24XX_GSTATUS1, cpu_ids, ARRAY_SIZE(cpu_ids))=
;
}
