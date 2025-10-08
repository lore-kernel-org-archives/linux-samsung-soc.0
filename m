Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC2E2F1FEF
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Oct 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759910194; cv=none; b=Qm8QbrsJCGY4lnW2AN10+ryqWvMOu+kbUkYtuYIzZsWpJXrRz75ii/wCuHFdn4952Ax9eiz1mbGFQB/ACaW+KjiWLcg0RhEAZ2m5cMy0OM2Ut6ZHBVNoMsc2x6yCn9CebrkhZHT5oc+vq9WtozhocTACeGGPGiEJ6gSg1+gZEO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759910194; c=relaxed/simple;
	bh=yY6/uGBggjr7DPOeg8CZY+oS1HkBeSOBG2tcETPEWsE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TtsLWjdZ2D+moaxzmnVDdiCXZVnmNUZMB9BLPZWMYojo7ThWk4526NQwWuUJZK4ZsFYM/K+F/zma+dkM3BKp5jMHZAvHdwxDq/IU3DeB+RGNsCX/scgaQuUFYw+qa/twocm2L9uyX7Uf1cn+4ujzEw9OjqOI/0d8ofJB00/8fJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FgKGoOFH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FgKGoOFH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b456d2dc440so1131072466b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2025 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759910191; x=1760514991; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yY6/uGBggjr7DPOeg8CZY+oS1HkBeSOBG2tcETPEWsE=;
        b=FgKGoOFHGZDoX2zKAwtxgvU1mPSAuFxSpRZkUpacp8RjZuub+9h+v6WL1ArT1GCdDe
         qLjWoW2xLCkVfb1xyOSkNzk32/8q3/uoEUwSxQLEKADoISWQ1kZ/3Oq8n5deKKMFV+2O
         6rkiUKMi7gR090cPNDiGhEbd8IcXJa5OfHq8VtPF6dFm7/wdYmbxUNYiiv0sXAwP2rqs
         vRiGNlMETRM7ESdmiLZdlPD6XodYPCQyxag+d0eBE474O2HDsTaaXx/wtSZozBx0yDa6
         vsVhTjBhLu0XQO9qd0YK8nhh2EnRcS3aC9bx+BT8imsVYTBqf9rDkQbhxvUkjyN2PSHI
         Bafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759910191; x=1760514991;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yY6/uGBggjr7DPOeg8CZY+oS1HkBeSOBG2tcETPEWsE=;
        b=pB0C4INNZXgqkAgfj3V98numBhKKbPfTbrW7dM6WpuMYGoSqfrPQn9VMN76XpbVKcP
         qZpgAfM291bqijhgJuBgXn2Eh9SxsS2l3DHsU2vIsKfbX2JlAicEHbXPkq6w1O5BPLyo
         M8RBYV34nf/EclPhI0uWnpSVA7Fpgk/+GkCdvkL8NgG4xvle1icPt4mH8vD6v/3YhRQQ
         aQGxiRHwumRQQ3HK95/JxFbL3EFXly9Ybr0o7xr41P3tblriBBQUI2bYt++PGu96LTvv
         3gVAXNoJe/m8mSyl0Gbg1bF4fINAGH/7OOX6plDf6H69jTLIlE2MeIX9TVI0bYFG1/UW
         vlNA==
X-Forwarded-Encrypted: i=1; AJvYcCVXXUe1RZJMmKF/A6vqWWR08Gt9jOold5Bu/K79zowWqrzqfbDqHM1b8+NKFbv41pOUJEeYobMNPHk7/gUf01BY/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJnpq2+P//xL3yd7UE5cFD2J+oFRKj/1M+E+gQL2SQRU6byii
	GUXv3gBoc+QDj+DEjWJ/bWU+3exSxDc2+cdecxLeG3QEfUNItBSP9NcP6Br7MoUYRk0=
X-Gm-Gg: ASbGncvxGrfTHLQiQ0fDfPO2aUg8jRYThg845XR23/DiofeaO1ykXPdzXBwVucbJWJv
	N5bGUZhOhxhhRrfI62KjkLm7wGaCOylasD1mI73PXANkwGLSyJ7dit6BkmuvpEx0Eg+5ylSKXQJ
	S6NfnObaHF1XoWmw/izeOsegJPGMLp6msvj1TRxitRb8L+5tmPp2FU2dnytVEIOjK+6MeO0VynO
	eKbKKAC5+4G9ulesNQjdClUCpfxYCyiEhEmCzEiU/Mzc5Uwp2d65uSi1W70fCgYKY6O2MR/1pF0
	SbpWz2tLOsxMl6sKSnCknTjyHiUTVd7JeIS2Cohl6Ue6W2djnaJyBHuwfs/MJ/xNFap9cOTjTeG
	DG4jA/O8VOHQ6d4IJBaE0Fe62tN3YECfXrX1C51R0dED5HLWNFNLN7g==
X-Google-Smtp-Source: AGHT+IFp07FRs5tCn/Ul46jxxqRkTyRGCpgeXeTG3+gc53OiL7gYrGNYmAqkEff6f/cTzyfRxNMOiQ==
X-Received: by 2002:a17:907:72d3:b0:b4f:4940:6a23 with SMTP id a640c23a62f3a-b50aa899e80mr258485166b.24.1759910190618;
        Wed, 08 Oct 2025 00:56:30 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4d9f5sm1618847766b.66.2025.10.08.00.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:56:30 -0700 (PDT)
Message-ID: <ff3a0b96980669f326ed02ed81b97d34c104b09d.camel@linaro.org>
Subject: Re: [PATCH] scsi: ufs: dt-bindings: exynos: add power-domains
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 'Avri Altman'
 <avri.altman@wdc.com>,  'Bart Van Assche'	 <bvanassche@acm.org>, 'Rob
 Herring' <robh@kernel.org>, 'Krzysztof Kozlowski'	 <krzk+dt@kernel.org>,
 'Conor Dooley' <conor+dt@kernel.org>
Cc: 'Peter Griffin' <peter.griffin@linaro.org>, 'Tudor Ambarus'	
 <tudor.ambarus@linaro.org>, 'Will McVicker' <willmcvicker@google.com>, 
	kernel-team@android.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Wed, 08 Oct 2025 08:56:29 +0100
In-Reply-To: <001501dc3815$601ec450$205c4cf0$@samsung.com>
References: 
	<CGME20251007155631epcas5p2cbf4c7b52bd217128c156bf6f5f1ea82@epcas5p2.samsung.com>
		<20251007-power-domains-scsi-ufs-dt-bindings-exynos-v1-1-1acfa81a887a@linaro.org>
	 <001501dc3815$601ec450$205c4cf0$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-10-08 at 11:05 +0530, Alim Akhtar wrote:
>=20
>=20
> > -----Original Message-----
> > From: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > Sent: Tuesday, October 7, 2025 9:26 PM
> > To: Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman
> > <avri.altman@wdc.com>; Bart Van Assche <bvanassche@acm.org>; Rob
> > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
> > Conor Dooley <conor+dt@kernel.org>
> > Cc: Peter Griffin <peter.griffin@linaro.org>; Tudor Ambarus
> > <tudor.ambarus@linaro.org>; Will McVicker <willmcvicker@google.com>;
> > kernel-team@android.com; linux-scsi@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux=
-
> > samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Andr=C3=A9 D=
raszik
> > <andre.draszik@linaro.org>
> > Subject: [PATCH] scsi: ufs: dt-bindings: exynos: add power-domains
> >=20
> > The UFS controller can be part of a power domain, so we need to allow t=
he
> > relevant property 'power-domains'.
> >=20
> In Exynos, power domains has a boundary at _block_ level. I assume in thi=
s
> case it is BLK_HSI, which contains, multiple IPs within block, including =
UFS
> controller.

On gs101, there are three hsi power domains:
* hsi0 (USB)
* hsi1 (PCIe)
* hsi2 (UFS)

I have not looked at hsi1 so far.

From what I can gather, hsi2-pd affects:
* cmu_hsi2
* sysreg hsi2
* pinctrl (gpio) hsi2
* ufs
* ufs-phy
(not sure if there is more)

hsi0-pd is similar, except that there is no pinctrl (gpio) hsi0.

They're all modelled as individual nodes in DT, so we need to add the
power-domains =3D <>
to each of them.

> I hope you will be sending the corresponding DTS changes as well.=20

Yes, of course :-)

> Feel free to add=20
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Thanks :-)

Cheers,
Andre'
