From: armdev <armdev.ftm@gmail.com>
Subject: Re: Enabling uart 3 in arndale
Date: Fri, 28 Mar 2014 15:12:09 +0530
Message-ID: <1F300D52-7D5A-47FA-B3B4-7254C5A409E8@gmail.com>
References: <0259D8EA-B62C-4D07-8661-ED2CF6E53779@gmail.com> <53259EB5.8090202@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:48855 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbaC1JmT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Mar 2014 05:42:19 -0400
Received: by mail-pb0-f47.google.com with SMTP id up15so4771060pbc.34
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2014 02:42:18 -0700 (PDT)
In-Reply-To: <53259EB5.8090202@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, u-boot@lists.denx.de

Dear Tomasz,

On 16-Mar-2014, at 6:23 pm, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> Hi,
>=20
> On 14.03.2014 09:04, armdev wrote:
>> Hi,
>>=20
>> We are trying to enable the UART3 on COM18 pins of arndale board. Th=
e UART3 RXD and TXD are on pins 2 and 4 which as per the base board spe=
cification is connected as
>>=20
>> XuRXD3 : UART_3_RXD/GPA1[4] : 2
>> XuTXD3 : UART_3_TXD/GPA1[5] : 4
>>=20
>> As per the public reference manual of exynos 5250, there is a regist=
er GPACON (0x1140_0000)
>> Setting GPACON |=3D 0x0010_0000 should enable the pins, but I am not=
 able to see any output on UART3.
>>=20
>> Can you please suggest what is the right procedure
>=20
> The register is GPA1CON and its GPA1CON[4] and [5] bit fields need bo=
th to be set to 0x2 - see Pad Control chapter of Exynos5250 public data=
sheet. Also GPA1PUD should be reconfigured to disable default pull-down=
 on both pins, again you can find details of the register in the datash=
eet.
>=20
> Best regards,
> Tomasz

Based on the steps provided, we are still not able to get some output o=
n UART3 simultaneously with UART2.
Can you please help us find out what we are missing.

On the current u-boot, Following was the observation and steps to enabl=
e UART3 on arndale

Observations / Questions
=97=97=97=97=97=97=97=97=97=97=97=97=97=97
a) The board has the default UART set to UART2 which is at 0x12c20000, =
while the include/configs/arndale.h has the UART_OFFSET set to 0x010000=
=2E
Shouldn=92t it be set to 0x20000 ?

b) board_uart_init in board/samsung/arndale/arndale.c is configuring al=
l the uarts,=20
Clocks would be set properly for all 4 uarts ?

Steps / Code Modified
=97=97=97=97=97=97=97=97=97=97=97=97=97=97
a) GPAICON[4] and [5] set to 0x2 in board/samsung/arndale/arndale.c
b) GPA1PUD [4] and [5] set to 0.

diff --git a/board/samsung/arndale/arndale.c b/board/samsung/arndale/ar=
ndale.c
index 9efc355..4fb291e 100644
--- a/board/samsung/arndale/arndale.c
+++ b/board/samsung/arndale/arndale.c
@@ -102,12 +102,18 @@ static int board_uart_init(void)
 int board_early_init_f(void)
 {
 	int err;
-
+	volatile unsigned int *gpa1con =3D (volatile unsigned int *)0x1140002=
0;
+	volatile unsigned int *gpa1pud =3D (volatile unsigned int *)0x1140002=
8;
 	err =3D board_uart_init();
 	if (err) {
 		debug("UART init failed\n");
 		return err;
 	}
+	serial_init_dev(2);
+	serial_setbrg_dev(2);
+	*gpa1con |=3D 0x00220000;=09
+	*gpa1pud &=3D 0xfffff0ff;=09
+
 	return err;
 }
 #endif
