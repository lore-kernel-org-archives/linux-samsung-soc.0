Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCB81DED60
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173273; cv=none; b=aR97wM6gQFslYyUJk5n7/8rHfcUEU/xHH+sBjSF0Z0qaAs4li4LQH6ns9okOYy9JhETh8WwbZoyffdBWoSTDhr0x48VTSQuTMCd0e8tDmgoylSqGHn4+nz+RiyWcnXXxUNCe6YqVJf4lBxoRJYUa0LZfAzqhY0TM74zyb6jEO8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173273; c=relaxed/simple;
	bh=gkocBbD/9MpvN7JKLxtV833Am9tKamxaXDw5KYVVQuI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uzrk0+XMsnAwEkaWudLE/oyT+ntKgcKggcwGZ9NcBMZI+1OCXCX13dqsWBawQS9nnfITS0O2JCZKFgHWr4BFavIcCNMgXw6D9qBl+iB2G2+j53HARNb/7d+Ac9udhUYKR0ktfwA+ARpxjeA0ZDnR+2vl5CJO7Np0i6dyUbV8lwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htyQbFHR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htyQbFHR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso146733645e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 06:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173269; x=1736778069; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=evV3vfqPSZenjkxuiuVbkt4Uo538mTCtLcz2OWZzZEw=;
        b=htyQbFHRJ2XNBhNuiNfSYTNqWcfACobYB0ZTyiQaO8yoUt2ma+CBsMp1VAp4SSvn7Y
         B0B3V2MIMUXJiIZn8rFwfpKvdQBmNAZ1RDbjCMPKk0wT2UKlNkkqxICfsCgr+FvD5N9C
         r0yGc4rg4oNpCMBTfdQqDIoBcYO+aGVpA4xsN8A70LdDu1/JQvQF7vaoXOVs/jk8HHz1
         6RNsLym6Z41bZYnlRjVy5KSxaLTMthuupcQpsScuLxlqIGyOeYTeNilbD/T81OChzDJ4
         IEDWZwkx4JAU2LNzBtghGLgvFMBPKMkudGNlFJsJ6Qkbwte0drv1usRjnjB+1vVYgUke
         nR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173269; x=1736778069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evV3vfqPSZenjkxuiuVbkt4Uo538mTCtLcz2OWZzZEw=;
        b=pJkOWzSrh8bsI0npjjW0XXZgzJNT/9Qs8Ww8GmXWerSDrrkIDDGTcDUr7fgSNWK4W4
         N6hCKHmxJkgei1ocilJBuULpma6btTVmO38+U5a8JEr5wmuxROiOxDHF2ain08ZDjiJ7
         9xFmWlBwDrSK7MPaHo4iscF+VSd7pT6M8EwTW1WKoIAVo9AVlyhbB/1YpwAEwuKBALBT
         HmwH0Ue9gR0lg7JaOROCMjRXuSe15fNmXC+efwpxLnsMmN6rEtVLXssvwqifu8J7BKUh
         EwtSM9U+wlsnrK/OkEk4Lm8azw24ublgv1JrlyS+1QJww5IFznSiVI2Q5OtCvPG8g8lw
         c71w==
X-Forwarded-Encrypted: i=1; AJvYcCU1C9vlO3+i889tQlsKn+hrrZOnDDOiU+gdwF+SGxJ5a6vJXUkTCfrpMtv60ng0Bqx3NfU8fsUQZOcFRf/XNSrkXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDAl/AD/mTb4N8Tf+EVXUZUuvF3BGQYVNYZDsuDoCCrU1rnHhW
	VbQnzsFlAviEjqhKjrN+7rwg9inCDPFOKTFgiYqM5r3rstXKXtCEcxFRtsVbP1s=
X-Gm-Gg: ASbGncs11G85jNmTmMqRs72EfPAYcuXOzUPoNT510qpRz3UD3fUJWfcrJckGKGzIChk
	ulke7csNFLzP6/zFNg8nUYixT+RXmSVV89fK9snYYSyKiVV7NyWPjb4VFqLEqpA4whKlYdvAdC6
	Wik9aB5Y86DyLZOxe+GaR1DSD8sei+/ormVurjgxDNtxkCwdqtSN4VWBl/aHPqgNxqyKtxp3m/w
	ulP7/5cLlw5Fugm/Ff1t9ZRRnqxdymly3Rglzb9FYzQFOLfSrjz06/HY91TdA==
X-Google-Smtp-Source: AGHT+IGaidTwju8f4iTgTdz1EKQVrkbPeOyWSscY7DkQ0gKgcAzgpgkJvVTjzuCMb4bNihTY/QOv0Q==
X-Received: by 2002:a05:600c:35c1:b0:434:a94f:f8a9 with SMTP id 5b1f17b1804b1-43668b7873emr393116775e9.28.1736173269113;
        Mon, 06 Jan 2025 06:21:09 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b1f6sm609901075e9.31.2025.01.06.06.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:21:08 -0800 (PST)
Message-ID: <8563b573d3d545bbe11298774202fcbfa4dcb13b.camel@linaro.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 TCPCi
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, Roy
 Luo <royluo@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Mon, 06 Jan 2025 14:21:07 +0000
In-Reply-To: <8f75da5d-ef9f-4324-9b8e-bcb1e8741a8f@kernel.org>
References: 
	<20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
	 <20241203-gs101-phy-lanes-orientation-dts-v2-4-1412783a6b01@linaro.org>
	 <8f75da5d-ef9f-4324-9b8e-bcb1e8741a8f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Mon, 2025-01-06 at 14:33 +0100, Krzysztof Kozlowski wrote:
> On 03/12/2024 13:40, Andr=C3=A9 Draszik wrote:
> > =C2=A0
> > =C2=A0&pinctrl_gpio_alive {
> > @@ -142,9 +228,16 @@ &usbdrd31_dwc3 {
> > =C2=A0	role-switch-default-mode =3D "peripheral";
> > =C2=A0	maximum-speed =3D "super-speed-plus";
> > =C2=A0	status =3D "okay";
> > +
> > +	port {
> > +		usbdrd31_dwc3_role_switch: endpoint {
> > +			remote-endpoint =3D <&usbc0_role_sw>;
> > +		};
> > +	};
> > =C2=A0};
> > =C2=A0
> > =C2=A0&usbdrd31_phy {
> > +	orientation-switch;
> This shows now warnings on linux-next.
>=20
> Is this because of unapplied
> https://lore.kernel.org/all/20241206-gs101-phy-lanes-orientation-phy-v4-2=
-f5961268b149@linaro.org/
> ?

Yes, that's the reason

Cheers,
Andre'

