From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] pinctrl: Add pinctrl-s3c24xx driver
Date: Wed, 10 Apr 2013 19:10:44 +0900
Message-ID: <30fe01ce35d3$a9b7ce10$fd276a30$%kim@samsung.com>
References: <201304100135.12471.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47171 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558Ab3DJKKp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 06:10:45 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0ML100JRPAXW2KB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Apr 2013 19:10:44 +0900 (KST)
In-reply-to: <201304100135.12471.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, 'Tomasz Figa' <tomasz.figa@gmail.com>

Heiko St=C3=BCbner wrote:
>=20
> The s3c24xx pins follow a similar pattern as the other Samsung SoCs a=
nd
> can therefore reuse the already introduced infrastructure.
>=20
> The s3c24xx SoCs have one design oddity in that the first 4 external
> interrupts do not reside in the eint pending register but in the main
> interrupt controller instead. We solve this by forwarding the externa=
l
> interrupt from the main controller into the irq domain of the pin ban=
k.
> The masking/acking of these interrupts is handled in the same way.
>=20
> Furthermore the S3C2412/2413 SoCs contain another oddity in that they
> keep the same 4 eints in the main interrupt controller and eintpend
> register and requiring ack operations to happen in both. To solve thi=
s
> a ctrl_type enum is introduced which can keep the type of controller
> in the samsung_pin_ctrl struct for later retrieval.
>=20
> The ctrl_type enum contains only S3C24XX and S3C2412 types, as the
> eint-speciality is currently the only use-case. But it can be expaned
> if other SoCs gain special handling requirements later on.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me, need to implement more for other s3c24xx though.

Linus, if you want, please add:

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin
