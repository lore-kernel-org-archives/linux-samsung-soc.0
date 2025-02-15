Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557AC191F88
	for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2025 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739635795; cv=none; b=mYenYIybJby9M9qCYnImtieSOXYziDQGtZ68oqMIn3wWFJf7pZLDVUAg00ZS/QYn32GJtES9/3E4QLu1WI0S8eOvRPnzR6clP3oHUT2SwnCOIzrTAEyuPemNbWL7GWEW8knkB3Dbzo+bnk67EiMkZ9H9YLHHi7Evwuja7Mkg1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739635795; c=relaxed/simple;
	bh=opms8UCS9LYJLLcSJRpnd0wIsY3oJHC+FtApr0MI6Y0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H9bls2jq78EtQntFt41EP1DtqdIAF9l1R4E8pM/+w9nKVr7tA6C6/uKWbWLsOmS6EBEXENJzrL0E9FCRjAnYVuj6F9dA5HNpnGguyU6xcRYCiAPLrubSFQM31z/NOTqnbC4HvNDi0Pj5LuTwWR9lpU9BbdiG0G4SjcloUOmJ1rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsliz8nl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsliz8nl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4395a06cf43so18962355e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2025 08:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739635791; x=1740240591; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6bmNv65WfRWb5QFz5Qsh8fW49RgHC55otbly3llCagw=;
        b=gsliz8nlNShEDElNkYYGB3FWngloWz7WUXFG8hPzEHlJ37JrhxUaFhk+E+CkaFGZQU
         CndIFUIpnvs27j5xzcOKeb8F/mfzZGHR+r8Cxa4ClyOJATKpH5kB4kOT9RJ8l0Icf5fK
         zFFiJMHWiumCRDCawDMkANvc6E/Ljk5fZR7tr46XtSsT5TYG3Scsu+JBwWUJpzO1torD
         EqegYObpAMzNFvWBoS7WITyBcOx1EzuE+CL2W+ZY/jRRafvLUrtMgMXNgml/MpgXU4X+
         Z7YSsESFohLrciXAy3jWWF+iuVYld7XCSpHwxbxJdbRd/xfQuA/vFY5a2WOmWyQegdlW
         iT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739635791; x=1740240591;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bmNv65WfRWb5QFz5Qsh8fW49RgHC55otbly3llCagw=;
        b=CIw/rDzwmTCBuKJ4lIm6IAH0FZ4d1It9A6Qm0CTg5gpDcYpPGJEokbf+b48UcbXUAp
         ghaQCvIlP8QKVfB0K/K+dgVgMHvwVtHZdGlFoCVoJrwfEPpT+mchiGWXwIznEfUz8QrV
         eIcuS1IJUJTvUmzQ40bnqOdw43zB2EcXvyts8X78uBm4XOBwd/wcg65a9pP0x1gadve+
         KcZAkVg2Wp4ZLuNViNlTnWMkIYC8m9QLc6eSXxogydQe9hbkK6OQLS17m5myBewNd2kN
         ChZGUVIfl3X5TkzX2Fw/NrkV8E/M6nuhawCLGC/pymGJyhJMrrolFWVa0pclLgrVGHa8
         umOA==
X-Forwarded-Encrypted: i=1; AJvYcCXYkrcERn39l3shDKT/JZd79vyZixxUmjLNvWJWdITDayBD69+vgvfL1EwuTflcnrEIgJEud3tpkWMX335aYYHmnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ts1dc+CxGqnAnw6U5Yre4UopnrHz3rNOsn3X8XzuoFWETCCP
	UVtdJhethUiUmGHigryzxxIXQWN4urAypPbA+419duz/dbflnjSpuNuRRqwbA44=
X-Gm-Gg: ASbGncvfXY3+wNTpiTF/mZyDP5OmGd/eETb34L39OhtpDtlaBI0ZpQ6RKWS4VWVxmLj
	OMy2R6spwFprZi5WGoRqZzjN0u7yEpP0wBrYe3tSVmG90Qd7HD5+41bOAcUThH9gUMb6sNEM6/u
	Rl2QolMwZk56k90Vj7zKq9W5i6K5MtHSyOgP5X+Oo5KBlG5wGwjGmiyswEOK9ZvO/Imq5fcRuRC
	GSTymN0u0o+gtsh6e6VXbVk7F0b/znvbMcMVosGGLPxEz7enzcuI+5CEva+RUwDszthIIEMkR9P
	RaSQipXCt2Q/mV7d1I0=
X-Google-Smtp-Source: AGHT+IFtTB7CGPjbTTAj53WRDs4x+r/fRGZXIjaCmxUn1B9Qy804cPMYsoMFiSnj7hJuF9dY96O+yA==
X-Received: by 2002:a5d:6d8d:0:b0:38d:ce70:8bdf with SMTP id ffacd0b85a97d-38f3406ca2emr3643311f8f.37.1739635791490;
        Sat, 15 Feb 2025 08:09:51 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06c95bsm103459305e9.17.2025.02.15.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 08:09:50 -0800 (PST)
Message-ID: <8e06da42c86b29dcb645d1bceaedae879e6aeca0.camel@linaro.org>
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Date: Sat, 15 Feb 2025 16:09:48 +0000
In-Reply-To: <7c0dcf24-187c-4dc8-aa4a-4a8f814775b2@kernel.org>
References: 
	<20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
	 <CGME20241206163109eucas1p12aea3a9a6c404cd7c678009ea11aa5b3@eucas1p1.samsung.com>
	 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
	 <3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com>
	 <7c0dcf24-187c-4dc8-aa4a-4a8f814775b2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Sat, 2025-02-15 at 11:07 +0100, Krzysztof Kozlowski wrote:
> On 14/02/2025 20:30, Marek Szyprowski wrote:
> > On 06.12.2024 17:31, Andr=C3=A9 Draszik wrote:
> > > gs101's SS phy needs to be configured differently based on the
> > > connector orientation, as the SS link can only be established if the
> > > mux is configured correctly.
> > >=20
> > > The code to handle programming of the mux is in place already, this c=
ommit
> > > now adds the missing pieces to subscribe to the Type-C orientation
> > > switch event.
> > >=20
> > > Note that for this all to work we rely on the USB controller
> > > re-initialising us. It should invoke our .exit() upon cable unplug, a=
nd
> > > during cable plug we'll receive the orientation event after which we
> > > expect our .init() to be called.
> > >=20
> > > Above reinitialisation happens if the DWC3 controller can enter runti=
me
> > > suspend automatically. For the DWC3 driver, this is an opt-in:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 echo auto > /sys/devices/.../11110000.usb/po=
wer/control
> > > Once done, things work as long as the UDC is not bound as otherwise i=
t
> > > stays busy because it doesn't cancel / stop outstanding TRBs. For now
> > > we have to manually unbind the UDC in that case:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "" > sys/kernel/config/usb_gadget=
/.../UDC
> > >=20
> > > Note that if the orientation-switch property is missing from the DT,
> > > the code will behave as before this commit (meaning for gs101 it will
> > > work in SS mode in one orientation only). Other platforms are not
> > > affected either way.
> > >=20
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > >=20
> > > ---
> > > v3:
> > > * drop init to -1 of phy_drd->orientation (Vinod)
> > > * avoid #ifdef and switch to normal conditional IS_ENABLED() for
> > > =C2=A0=C2=A0 CONFIG_TYPEC
> > >=20
> > > v2:
> > > * move #include typec_mux.h from parent patch into this one (Peter)
> > > ---
> > > =C2=A0 drivers/phy/samsung/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > =C2=A0 drivers/phy/samsung/phy-exynos5-usbdrd.c | 56 ++++++++++++++++=
++++++++++++++++
> > > =C2=A0 2 files changed, 57 insertions(+)
> > >=20
> > > diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfi=
g
> > > index f10afa3d7ff5..fc7bd1088576 100644
> > > --- a/drivers/phy/samsung/Kconfig
> > > +++ b/drivers/phy/samsung/Kconfig
> > > @@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
> > > =C2=A0=C2=A0	tristate "Exynos5 SoC series USB DRD PHY driver"
> > > =C2=A0=C2=A0	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> > > =C2=A0=C2=A0	depends on HAS_IOMEM
> > > +	depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)
>=20
> BTW, this syntax never made any sense - it did not work. The optional
> dependency is expressed as:
> 	depends on TYPEC || !TYPEC

The depends is required to get it to link. PHY_EXYNOS5_USBDRD
defaults to Y, while TYPEC defaults to M in the arm64 defconfig.
Using this expression, PHY_EXYNOS5_USBDRD changes to M.

Otherwise it won't link.


> but what it epxressed is that it is possible to build it without typec
> only for compile test, which is odd if this was meant to be optional.
> And further code:
> 	if (!IS_ENABLED(CONFIG_TYPEC))
>=20
> clearly suggests this should be optional.

Yes, it's meant to be optional.

Cheers,
Andre'

