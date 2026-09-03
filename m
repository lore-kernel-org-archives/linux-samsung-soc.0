Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBE52D949C;
	Thu,  3 Sep 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442237; cv=none; b=U0ISuBon6/n9XvP/7EZ3q6F3EfYxsgK0elYo6UMGAQVY81CHvV4fFXVjSc+D/Gzt8zaKUxyGltoIu29RX+9oaB5q4Jq/BsCHlcCE7lT0ICXuJbsyIjPw1bjK4fum1rekgM+4J63SIDBEFcP2NGXV46b4wnRxbTFGRQfe9EZdOBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442237; c=relaxed/simple;
	bh=Iqe9spGh3XTkMw0WgH0pZdCzQfIL8GSoVCT8n0qhZk4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jN7MHDc/rOE9X4KeEeV2ZvA/I4yj7XTHSyDpmw5er5x5TtN0AqGe/6GTrB7Lt9jCs1ClGSFrB9w6trgY//kxviPBZJ9tTw7KkWNQIqoOvDXkNi5BObqZq9dYtRCwqxpqy+9vqsSTHRMKkaJnUOxp0RSCWVn4T65lQiM3QhI3hGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=U/hK9O8s; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="U/hK9O8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1788442199;
	bh=Iqe9spGh3XTkMw0WgH0pZdCzQfIL8GSoVCT8n0qhZk4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=U/hK9O8sx/Ej3wJEDLagfRm90spdB8oagI/tMQa+wm4eHs6IxoZsNSk44TMPsnRII
	 /Xpg3qvDhSglx+uQdaOfQ+mf9mO8K77agxy8r7yceDxqPdlYw/uCEbZKye4SHxIb6C
	 4IV0ndZQwdxyW+o8x/50o0Ry2UA5eoDqJZDvl1p4=
Message-ID: <1666390417d0d9b8f58a7bdad1b8ecb475ba0d4f.camel@crapouillou.net>
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS
 in Bluetooth node
From: Paul Cercueil <paul@crapouillou.net>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 15:29:57 +0200
In-Reply-To: <6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
References: 
	<CGME20260829101532eucas1p29f4e04d4dfd169377793c276221059a6@eucas1p2.samsung.com>
		<20260829101509.138284-1-paul@crapouillou.net>
	 <6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Marek,

Le mercredi 02 septembre 2026 =C3=A0 10:36 +0200, Marek Szyprowski a =C3=A9=
crit=C2=A0:
> On 29.08.2026 12:15, Paul Cercueil wrote:
> > The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-
> > rtscts'
> > property.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
>=20
> Indeed the CTS/RTS pins are used for BT on most of the ARM=C2=A0Exynos
> boards,
> as the "<&uartX_fctl>" property is assigned for pinctl-0. This is not
> really
> specific to i9100, so maybe this property should be added to other
> dts?

I can add it to all exynos4 boards that use the "uartX_fctl" property.


> However I wonder if Samsung UART driver actually use this "uart-has-
> rtscts"
> DT property? A quick "git grep uart-has-rtscts drivers/tty" shows
> nothing
> related to Samsung Exynos...

It looks like it does not. I still think the DT property should be here
but I won't fight over this.

Cheers,
-Paul

>=20
> > ---
> >=20
> > Notes:
> > =C2=A0=C2=A0=C2=A0 Changes:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Bl=
uetooth
> > node"
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 -v2: Drop max-speed property. It's only supposed to =
be used in
> > some
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cases, which don't app=
ly here. As this was the "fix" for
> > getting
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bluetooth to work on m=
y device, which will be applied to
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver instead, the Fi=
xes: tag was removed.
> >=20
> > =C2=A0arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> > b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> > index 8a635bee59fa..95964be7daa8 100644
> > --- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> > +++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> > @@ -875,6 +875,7 @@ &serial_0 {
> > =C2=A0	status =3D "okay";
> > =C2=A0
> > =C2=A0	pinctrl-names =3D "default";
> > +	uart-has-rtscts;
> > =C2=A0	pinctrl-0 =3D <&bt_en>, <&bt_res>, <&uart0_data>,
> > <&uart0_fctl>;
> > =C2=A0
> > =C2=A0	bluetooth {
>=20
> Best regards
