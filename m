From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 7/8] S3C2412: move io-init to SoC specific files
Date: Tue, 17 Jan 2012 21:50:24 +0000
Message-ID: <20120117215024.GY1068@n2100.arm.linux.org.uk>
References: <201201172210.51953.heiko@sntech.de> <201201172216.06542.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:59350 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755118Ab2AQVug (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jan 2012 16:50:36 -0500
Content-Disposition: inline
In-Reply-To: <201201172216.06542.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

On Tue, Jan 17, 2012 at 10:16:06PM +0100, Heiko St=FCbner wrote:
> @@ -103,15 +83,6 @@ static struct map_desc s3c_iodesc[] __initdata =3D=
 {
> =20
>  /* read cpu identificaiton code */
> =20
> -static unsigned long s3c24xx_read_idcode_v5(void)
> -{
> -#if defined(CONFIG_CPU_S3C2412) || defined(CONFIG_CPU_S3C2413)
> -	return __raw_readl(S3C2412_GSTATUS1);
> -#else
> -	return 1UL;	/* don't look like an 2400 */
> -#endif
> -}
> -
>  static unsigned long s3c24xx_read_idcode_v4(void)
>  {
>  	return __raw_readl(S3C2410_GSTATUS1);
> @@ -123,11 +94,7 @@ void __init s3c24xx_init_io(struct map_desc *mach=
_desc, int size)
>  	iotable_init(mach_desc, size);
>  	iotable_init(s3c_iodesc, ARRAY_SIZE(s3c_iodesc));
> =20
> -	if (cpu_architecture() >=3D CPU_ARCH_ARMv5) {
> -		samsung_cpu_id =3D s3c24xx_read_idcode_v5();
> -	} else {
> -		samsung_cpu_id =3D s3c24xx_read_idcode_v4();
> -	}
> +	samsung_cpu_id =3D s3c24xx_read_idcode_v4();

I really don't like seeing patches which do this kind of thing:

patch 1: move A
patch 2: move B
patch 3: move C and delete D which A,B,C all depend on

It means that if, for whatever reason, patch 2 has to be reverted or
removed, you also have to revert patch 3.  Rather than this:

patch 1: move A
patch 2: move B
patch 3: move C
patch 4: delete D which A,B,C all depend on

This makes each 'move' patches _totally_ independent of each other, and
of the delete D patch, and makes the interdependencies of the patches
easier to express and understand.

Note that you didn't say you deleted D, which the others rely upon, in
the patch commentry:

> Move s3c2412 specific code from s3c24xx_init_io to s3c2412.c
> and make the s3c2412.h header obsolete.
