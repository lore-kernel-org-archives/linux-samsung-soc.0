Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38103AAF45;
	Tue,  1 Sep 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272830; cv=none; b=hbOz8lEUCxuzvPLt09Z3RPMXGqkrF9B2wnRCLHLKGkE6TrD2oAxPkFV5GNabiE3wAlnP401z1P7u3bDtIH+avO4tFHCv6C8VRGqPr4o2HnGTkwM4zO44C2/XqNNoCj/fI9yqV/qj20O/ERLMRDmEAdBUTQiVG7/KpHLVOjpGef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272830; c=relaxed/simple;
	bh=AhJNT/NbiwuvDf+yhvjO9/pLXEAE/7mBodgsYiWNRmo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AXdnULtukFKyolXdXmYhS3Qpg/h8PL6HBaxCRvbqxPohQp6+SQBrxncUCF1/6QlWL7DHHQrrE0LoplhO5x0YCLcVlR7lUb1dGLAF8+dcU5KS2usgLfLccRuYVLiNS/x4faob8XMUbAd7EE/LS7I7mfIYqVCdY8yh/mSTF1WZHP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=jLL8kVCh; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="jLL8kVCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1788272825;
	bh=AhJNT/NbiwuvDf+yhvjO9/pLXEAE/7mBodgsYiWNRmo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jLL8kVChJrcMXifFJ8V/P84E0/24nUQgS+ci5c89I5Fexk2RNxA74Cv69rgGSgM7W
	 rQHAChMAv3g9HY3iwr6Kw56w5MEP8Io2TobR78vxtSl9grpjaf/h8qdC9GeChqHLiY
	 NTPzjFZz+65dnrasrThCDW2RX88SfcCLwHG2XhX0=
Message-ID: <be168b7cd89c23855dc4e5b0df57940e902afa27.camel@crapouillou.net>
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS
 in Bluetooth node
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Sep 2026 16:27:03 +0200
In-Reply-To: <20260829101509.138284-1-paul@crapouillou.net>
References: <20260829101509.138284-1-paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le samedi 29 ao=C3=BBt 2026 =C3=A0 12:15 +0200, Paul Cercueil a =C3=A9crit=
=C2=A0:
> The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-
> rtscts'
> property.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Changes:
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Blue=
tooth node"
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 -v2: Drop max-speed property. It's only supposed to be=
 used in
> some
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cases, which don't apply=
 here. As this was the "fix" for
> getting
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bluetooth to work on my =
device, which will be applied to the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver instead, the Fixe=
s: tag was removed.

I'll V3. I think I did not understand properly what 'max-speed' was
for, and indeed it does apply in this case - the Bluetooth chip's
maximum rate is 4 Mbps while the max baudrate of the SoC's UART is 3
Mbps.

Cheers,
-Paul

>=20
> =C2=A0arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> index 8a635bee59fa..95964be7daa8 100644
> --- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> +++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> @@ -875,6 +875,7 @@ &serial_0 {
> =C2=A0	status =3D "okay";
> =C2=A0
> =C2=A0	pinctrl-names =3D "default";
> +	uart-has-rtscts;
> =C2=A0	pinctrl-0 =3D <&bt_en>, <&bt_res>, <&uart0_data>,
> <&uart0_fctl>;
> =C2=A0
> =C2=A0	bluetooth {
