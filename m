From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform support
Date: Sat, 13 Apr 2013 00:22:48 +0200
Message-ID: <201304130022.49987.heiko@sntech.de>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:45386 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751998Ab3DLWXB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 18:23:01 -0400
In-Reply-To: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de

Hi Tomasz,

Am Freitag, 12. April 2013, 21:17:16 schrieb Tomasz Figa:
> This series is an attempt to make the samsung-time clocksource driver=
 ready
> for multiplatform kernels. It moves the driver to drivers/clocksource=
,
> cleans it up from uses of static platform-specific definitions, simpl=
ifies
> timer interrupt handling and adds Device Tree support.
>=20
> The samsung_pwm clocksource driver is made the master driver, which
> exposes a single function to the PWM driver to get required data. Onl=
y
> samsung-time driver is reworked to use the master driver at this time=
,
> since the PWM driver can be already considered broken at the moment a=
nd
> needs separate series of several patches to fix and clean it up, whic=
h
> I am already working on.
>=20
> Tested on Universal C210 board with Device Tree. Not tested without
> Device Tree, since it has been already broken before this series.
> Compile tested for other related SoCs.

On a s3c2416 based board with both non-dt and preliminary-dt support
Tested-by: Heiko Stuebner <heiko@sntech.de>

One nitpick:

Without dt support, you get this:

  CC      drivers/clocksource/samsung_pwm.o
drivers/clocksource/samsung_pwm.c:620: warning: =E2=80=98samsung_pwm_cl=
ocksource_init_of=E2=80=99 defined but not used

So, something like the following might be necessary

-------------- 8< -------------------
diff --git a/drivers/clocksource/samsung_pwm.c b/drivers/clocksource/sa=
msung_pwm.c
index a12ee08..2bf8303 100644
--- a/drivers/clocksource/samsung_pwm.c
+++ b/drivers/clocksource/samsung_pwm.c
@@ -617,6 +617,7 @@ static void __init __samsung_pwm_clocksource_init(
        samsung_clocksource_init();
 }
=20
+#ifdef CONFIG_CLKSRC_OF
 static void __init samsung_pwm_clocksource_init_of(struct device_node =
*np)
 {
        __samsung_pwm_clocksource_init(NULL, np);
@@ -629,6 +630,7 @@ CLOCKSOURCE_OF_DECLARE(s5p6440_pwm, "samsung,s5p644=
0-pwm",
                                        samsung_pwm_clocksource_init_of=
);
 CLOCKSOURCE_OF_DECLARE(s5pc100_pwm, "samsung,s5pc100-pwm",
                                        samsung_pwm_clocksource_init_of=
);
+#endif
=20
 void __init samsung_pwm_clocksource_init(struct platform_device *pdev)
 {
-------------- 8< -------------------


Heiko
