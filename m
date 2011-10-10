From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/3] ARM: plat-samsung: use Kconfig choice for debug UART selection
Date: Mon, 10 Oct 2011 17:26:24 +0530
Message-ID: <CAJuYYwRPwALAQcvsMPuz8XYsDicCmB52HzZehppUnKqv5itPEQ@mail.gmail.com>
References: <1313530873-24961-1-git-send-email-will.deacon@arm.com>
	<1313530873-24961-2-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43877 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753886Ab1JJL4Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 07:56:25 -0400
Received: by ywb5 with SMTP id 5so5258941ywb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Oct 2011 04:56:24 -0700 (PDT)
In-Reply-To: <1313530873-24961-2-git-send-email-will.deacon@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Will,

On 17 August 2011 03:11, Will Deacon <will.deacon@arm.com> wrote:
> Now that the DEBUG_LL UART can be selected by a Kconfig choice, conve=
rt
> the Samsung UART selection to use a set of bools rather than an int.
>
> Signed-off-by: Will Deacon <will.deacon@arm.com>
> ---
> =A0arch/arm/Kconfig.debug =A0 =A0 =A0 =A0| =A0 45 +++++++++++++++++++=
+++++++++++-----------
> =A0arch/arm/plat-samsung/Kconfig | =A0 =A07 ++++++
> =A02 files changed, 40 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 11604c9..2f80564 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -94,6 +94,39 @@ choice
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Saying N will cause the debug mess=
ages to appear on the first
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0serial port.
>
> + =A0 =A0 =A0 config DEBUG_S3C_UART0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 depends on PLAT_SAMSUNG
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bool "Use S3C UART 0 for low-level debu=
g"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Say Y here if you want the debug pr=
int routines to direct
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 their output to UART 0. The port mu=
st have been initialised
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 by the boot-loader before use.
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The uncompressor code port configur=
ation is now handled
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 by CONFIG_S3C_LOWLEVEL_UART_PORT.
> +
> + =A0 =A0 =A0 config DEBUG_S3C_UART1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 depends on PLAT_SAMSUNG
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bool "Use S3C UART 1 for low-level debu=
g"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Say Y here if you want the debug pr=
int routines to direct
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 their output to UART 1. The port mu=
st have been initialised
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 by the boot-loader before use.
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The uncompressor code port configur=
ation is now handled
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 by CONFIG_S3C_LOWLEVEL_UART_PORT.
> +
> + =A0 =A0 =A0 config DEBUG_S3C_UART2
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 depends on PLAT_SAMSUNG
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bool "Use S3C UART 2 for low-level debu=
g"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Say Y here if you want the debug pr=
int routines to direct
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 their output to UART 2. The port mu=
st have been initialised
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 by the boot-loader before use.
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The uncompressor code port configur=
ation is now handled
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 by CONFIG_S3C_LOWLEVEL_UART_PORT.
> +
> =A0endchoice
>
> =A0config EARLY_PRINTK
> @@ -124,16 +157,4 @@ config OC_ETM
> =A0 =A0 =A0 =A0 =A0buffer driver that will allow you to collect trace=
s of the
> =A0 =A0 =A0 =A0 =A0kernel code.
>
> -config DEBUG_S3C_UART
> - =A0 =A0 =A0 depends on PLAT_SAMSUNG
> - =A0 =A0 =A0 int "S3C UART to use for low-level debug"
> - =A0 =A0 =A0 default "0"
> - =A0 =A0 =A0 help
> - =A0 =A0 =A0 =A0 Choice for UART for kernel low-level using S3C UART=
S,
> - =A0 =A0 =A0 =A0 should be between zero and two. The port must have =
been
> - =A0 =A0 =A0 =A0 initialised by the boot-loader before use.
> -
> - =A0 =A0 =A0 =A0 The uncompressor code port configuration is now han=
dled
> - =A0 =A0 =A0 =A0 by CONFIG_S3C_LOWLEVEL_UART_PORT.
> -
> =A0endmenu
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kc=
onfig
> index b3e1065..49b14b1 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -367,4 +367,11 @@ config SAMSUNG_PD
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Say Y here if you want to control Power Domain by =
Runtime PM.
>
> +config DEBUG_S3C_UART
> + =A0 =A0 =A0 depends on PLAT_SAMSUNG
> + =A0 =A0 =A0 int
> + =A0 =A0 =A0 default "0" if DEBUG_S3C_UART0
> + =A0 =A0 =A0 default "1" if DEBUG_S3C_UART1
> + =A0 =A0 =A0 default "2" if DEBUG_S3C_UART2
> +
> =A0endif
> --
> 1.7.0.4


What is your opinion about the following diff instead of the above one?


diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 65cf8c6..035f5cd 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -120,6 +120,15 @@ choice
 		  Say Y here if you want the debug print routines to direct
 		  their output to the second serial port on these devices.

+	config DEBUG_SAMSUNG_UART
+		bool "Kernel low-level debugging messages via samsung serial port"
+		depends on PLAT_SAMSUNG
+		help
+		  Say Y here if you want the debug print routines to direct
+		  their output to the serial port for Samsung platforms. Choose
+		  the uart port with the "S3C UART to use for low-level debug"
+		  config option.
+
 endchoice

 config EARLY_PRINTK
@@ -139,7 +148,7 @@ config OC_ETM
 	  kernel code.

 config DEBUG_S3C_UART
-	depends on PLAT_SAMSUNG
+	depends on DEBUG_SAMSUNG_UART
 	int "S3C UART to use for low-level debug"
 	default "0"
 	help


Thanks,
Thomas.
