From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 3/4] regulator: max77686: Add suspend disable for some
 LDOs
Date: Wed, 29 Oct 2014 11:18:54 +0100
Message-ID: <1414577934.18868.7.camel@AMDC1943>
References: <1414411911-5539-1-git-send-email-k.kozlowski@samsung.com>
 <1414411911-5539-4-git-send-email-k.kozlowski@samsung.com>
 <20141028223121.GH18557@sirena.org.uk> <1414574413.18868.6.camel@AMDC1943>
 <20141029100142.GR18557@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13704 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932091AbaJ2KS7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Oct 2014 06:18:59 -0400
In-reply-to: <20141029100142.GR18557@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>

On =C5=9Bro, 2014-10-29 at 10:01 +0000, Mark Brown wrote:
> On Wed, Oct 29, 2014 at 10:20:13AM +0100, Krzysztof Kozlowski wrote:
> > On wto, 2014-10-28 at 22:31 +0000, Mark Brown wrote:
>=20
> > > This looks wrong, you're using the regular enable operation as su=
spend
> > > enable.  How does that work without disrupting the current runtim=
e
> > > state?
>=20
> > Currently it shouldn't disrupt state of regulator because during ru=
ntime
> > it may only be only: on (0x3) or off (0x0). Suspend enable in max77=
686
> > writes 0x3 to the register which means - always on.
>=20
> > If regulator was disabled before suspend then it has to be enabled
> > during suspend_enable() call which is exactly what max77686_enable =
does.
> > If it was enabled then nothing happens.
>=20
> No, this isn't suspend enable control - this is normal, standard enab=
le
> control and the device has no suspend enable control.

You mean that for such regulator the driver shouldn't implement
suspend_enable()?

Best regards,
Krzysztof
