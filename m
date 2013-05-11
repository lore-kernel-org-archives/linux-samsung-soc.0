From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5] pinctrl: Add pinctrl-s3c24xx driver
Date: Sat, 11 May 2013 17:26:49 +0200
Message-ID: <201305111726.49491.heiko@sntech.de>
References: <201305031552.45410.heiko@sntech.de> <046401ce4d15$ccba0c80$662e2580$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:53141 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752950Ab3EKP05 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 May 2013 11:26:57 -0400
In-Reply-To: <046401ce4d15$ccba0c80$662e2580$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linus.walleij@linaro.org, thomas.abraham@linaro.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Freitag, 10. Mai 2013, 02:32:05 schrieb Kukjin Kim:
> Heiko St=C3=BCbner wrote:
> > The s3c24xx pins follow a similar pattern as the other Samsung SoCs=
 and
> > can therefore reuse the already introduced infrastructure.
> >=20
> > The s3c24xx SoCs have one design oddity in that the first 4 externa=
l
> > interrupts do not reside in the eint pending register but in the ma=
in
> > interrupt controller instead. We solve this by forwarding the exter=
nal
> > interrupt from the main controller into the irq domain of the pin b=
ank.
> > The masking/acking of these interrupts is handled in the same way.
> >=20
> > Furthermore the S3C2412/2413 SoCs contain another oddity in that th=
ey
> > keep the same 4 eints in the main interrupt controller and eintpend
> > register and requiring ack operations to happen in both. This is so=
lved
> > by using different compatible properties for the wakeup eint node w=
hich
> > set a property accordingly.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Looks good to me.
>=20
> Linus, if you want me to take into samsung tree, please let me know.

in v4 Linus said:

"Are you taking this through the Samsung tree?"

This would also enable me to put the s3c2416 devicetree support on top =
of it=20
in this cycle, which of course needs the pinctrl driver.


Heiko
