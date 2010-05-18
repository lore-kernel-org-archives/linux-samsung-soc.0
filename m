From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v3 8/9] ARM: S5PV210: Adds Touchscreen support for S5PV210
Date: Tue, 18 May 2010 21:20:29 +0900
Message-ID: <AANLkTin3WsmSTBN0lubg61s0opV9bTq-tLJ5jcR0Lt8W@mail.gmail.com>
References: <1274183102-16168-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:60039 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756954Ab0ERMUa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 08:20:30 -0400
Received: by vws9 with SMTP id 9so2599088vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 May 2010 05:20:29 -0700 (PDT)
In-Reply-To: <1274183102-16168-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Naveen Krishna <ch.naveen@samsung.com>, ben-linux@fluff.org

Hi,

>
> =A0void __init s5pv210_map_io(void)
> =A0{
> + =A0 =A0 =A0 s3c_device_ts.name =A0 =A0 =A0=3D "s3c64xx-ts";
> + =A0 =A0 =A0 s3c_device_adc.name =A0 =A0 =3D "s3c64xx-adc";
> +
> =A0 =A0 =A0 =A0iotable_init(s5pv210_iodesc, ARRAY_SIZE(s5pv210_iodesc=
));

Umm recent patches make a code as puzzle. Some codes use the wrapper
some use the *_setname functions.

        /* initialise device information early */
        s5pv210_default_sdhci0();
        s5pv210_default_sdhci1();
        s5pv210_default_sdhci2();
        s5pv210_default_sdhci3();

        /* the i2c devices are directly compatible with s3c2440 */
        s3c_i2c0_setname("s3c2440-i2c");
        s3c_i2c1_setname("s3c2440-i2c");
        s3c_i2c2_setname("s3c2440-i2c");

and finally assign the 'name' directly.

At some time later. Who know and remember the proper assignments for ne=
w SoCs.

Thank you,
Kyungmin Park
