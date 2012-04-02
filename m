From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS: autodetect enabled serial port in uncompress
Date: Tue, 3 Apr 2012 06:06:19 +0900
Message-ID: <CAH9JG2Uh0FvO=3fzPGiZvfvS2r-xDrJ2953m+o2NO82UvTtn_w@mail.gmail.com>
References: <1333394227-21986-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:63876 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167Ab2DBVGT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 17:06:19 -0400
Received: by iagz16 with SMTP id z16so4609357iag.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Apr 2012 14:06:19 -0700 (PDT)
In-Reply-To: <1333394227-21986-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Colin Cross <ccross@android.com>

Hi,

On Tue, Apr 3, 2012 at 4:17 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Colin Cross <ccross@android.com>
>
> Check the ULCON register of each serial port to determine if
> it has been enabled by the bootloader. =A0If only one serial port
> is found enabled, use that one. =A0Otherwise, use the value from
> CONFIG_S3C_LOWLEVEL_UART_PORT.
>
> Signed-off-by: Colin Cross <ccross@android.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos/include/mach/uncompress.h | =A0 25 ++++++++++=
++++++++++++-
> =A01 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/uncompress.h b/arch/ar=
m/mach-exynos/include/mach/uncompress.h
> index 2979995..0d17a43 100644
> --- a/arch/arm/mach-exynos/include/mach/uncompress.h
> +++ b/arch/arm/mach-exynos/include/mach/uncompress.h
> @@ -25,6 +25,25 @@ static unsigned int __raw_readl(unsigned int ptr)
> =A0 =A0 =A0 =A0return *((volatile unsigned int *)ptr);
> =A0}
>
> +static volatile u8 *exynos_autodetect_uart(volatile u8 *base)
> +{
> + =A0 =A0 =A0 int i;
> + =A0 =A0 =A0 int found =3D 0;
> + =A0 =A0 =A0 int port;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (__raw_readl((unsigned int)base + S3=
C_UART_OFFSET * i)) {
1. Even though ULCON has offset 0, it's better to add ULCON_OFFSET.
2. In our case, we disable the unused UART at bootloader except the
debug uart, then does it possible to read this value at kernel?
I think it's hang at here. So read it correctly it should enable the
required uart clock before read it.
3. As similar tegra, how about to read specific value from RX
register. e.g., 'D'?
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 port =3D i;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found++;
To match the description, it should brake at here. if not it detects
the last uart at several detected uarts.

BR,
kmpark
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (found !=3D 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 port =3D CONFIG_S3C_LOWLEVEL_UART_PORT;
> +
> + =A0 =A0 =A0 return base + S3C_UART_OFFSET * port;
> +}
> +
> =A0static void arch_detect_cpu(void)
> =A0{
> =A0 =A0 =A0 =A0u32 chip_id =3D __raw_readl(EXYNOS_PA_CHIPID);
> @@ -38,9 +57,11 @@ static void arch_detect_cpu(void)
> =A0 =A0 =A0 =A0chip_id &=3D 0xf;
>
> =A0 =A0 =A0 =A0if (chip_id =3D=3D 0x5)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_base =3D (volatile u8 *)EXYNOS5_PA=
_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_base =3D (volatile u8 *)EXYNOS5_PA=
_UART;
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_base =3D (volatile u8 *)EXYNOS4_PA=
_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uart_base =3D (volatile u8 *)EXYNOS4_PA=
_UART;
> +
> + =A0 =A0 =A0 uart_base =3D exynos_autodetect_uart(uart_base);
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * For preventing FIFO overrun or infinite loop of UAR=
T console,
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
