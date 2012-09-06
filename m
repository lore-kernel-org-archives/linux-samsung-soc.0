From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] gpio: samsung: add devicetree init for s3c24xx arches
Date: Fri, 07 Sep 2012 07:25:38 +0900
Message-ID: <241b01cd8c7e$8b07bb00$a1173100$%kim@samsung.com>
References: <201208282355.44268.heiko@sntech.de> <503D4FB1.1020206@samsung.com>
 <CACRpkdYqYhtHHVw8C5HhDr96V6diV-0M+55xCHnoATOiyDp3Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <CACRpkdYqYhtHHVw8C5HhDr96V6diV-0M+55xCHnoATOiyDp3Jg@mail.gmail.com>
Content-language: ko
Sender: linux-doc-owner@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Linus Walleij' <linus.walleij@stericsson.com>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, 'Rob Herring' <rob.herring@calxeda.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Linus Walleij wrote:
>=20
> On Wed, Aug 29, 2012 at 1:09 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > On 08/28/12 14:55, Heiko St=FCbner wrote:
> >>
> >> Until now the Exynos-SoC was the only Samsung-SoC supporting the G=
PIOs
> >> via the device tree. This patch implements dt-support for the
> >> s3c24xx arches.
> >>
> >> The controllers contain only 3 cells, as the underlying gpio contr=
oller
> >> does not support controlling the drive strength on a gpio level.
> >>
> >> Tested with the gpio-keys driver on a s3c2416 based machine.
> >>
> >> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> >> Reviewed-by: Thomas Abraham<thomas.abraham@linaro.org>
> >
> >
> > Yeah, looks good to me...
> >
> > Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>=20
> OK are you taking this into the Samsung tree or shall I take care of =
it?
>=20
Hmm...yeah, Samsung tree is better.
Applied with your ack :-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

