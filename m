From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix for S3C2412 EBI memory mapping.
Date: Thu, 10 May 2012 18:25:16 +0900
Message-ID: <036701cd2e8e$cf4cc100$6de64300$%kim@samsung.com>
References: <1336607209-6409-1-git-send-email-jose.goncalves@inov.pt>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1336607209-6409-1-git-send-email-jose.goncalves@inov.pt>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?'Jos=C3=A9_Miguel_Gon=C3=A7alves'?= <jose.goncalves@inov.pt>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Jos=C3=A9 Miguel Gon=C3=A7alves wrote:
>=20
> While upgrading the kernel on a S3C2412 based board I've noted that i=
t was
> impossible to boot the board with a 2.6.32 or upper kernel.
> I've tracked down the problem to the EBI virtual memory mapping that =
is in
> conflict with the IO mapping definition in arch/arm/mach-s3c24xx/s3c2=
412.c.
>=20
> Signed-off-by: Jos=C3=A9 Miguel Gon=C3=A7alves <jose.goncalves@inov.p=
t>
> ---
>  arch/arm/plat-samsung/include/plat/map-s3c.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/arm/plat-samsung/include/plat/map-s3c.h b/arch/arm/=
plat-
> samsung/include/plat/map-s3c.h
> index 7d04875..c0c70a8 100644
> --- a/arch/arm/plat-samsung/include/plat/map-s3c.h
> +++ b/arch/arm/plat-samsung/include/plat/map-s3c.h
> @@ -22,7 +22,7 @@
>  #define S3C24XX_VA_WATCHDOG	S3C_VA_WATCHDOG
>=20
>  #define S3C2412_VA_SSMC		S3C_ADDR_CPU(0x00000000)
> -#define S3C2412_VA_EBI		S3C_ADDR_CPU(0x00010000)
> +#define S3C2412_VA_EBI		S3C_ADDR_CPU(0x00100000)
>=20
>  #define S3C2410_PA_UART		(0x50000000)
>  #define S3C24XX_PA_UART		S3C2410_PA_UART
> --
> 1.7.5.4

Yeah, as you said, the mapping for SSMC invade EBI area but I think, ju=
st SZ_4K is enough for SSMC. So following is better in this case. How d=
o you think? And there is no problem on your board?

diff --git a/arch/arm/mach-s3c24xx/s3c2412.c b/arch/arm/mach-s3c24xx/s3=
c2412.c
index d4bc7f9..ac906bf 100644
--- a/arch/arm/mach-s3c24xx/s3c2412.c
+++ b/arch/arm/mach-s3c24xx/s3c2412.c
@@ -72,7 +72,7 @@ static struct map_desc s3c2412_iodesc[] __initdata =3D=
 {
 	{
 		.virtual =3D (unsigned long)S3C2412_VA_SSMC,
 		.pfn     =3D __phys_to_pfn(S3C2412_PA_SSMC),
-		.length  =3D SZ_1M,
+		.length  =3D SZ_4K,
 		.type    =3D MT_DEVICE,
 	},
 	{

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
