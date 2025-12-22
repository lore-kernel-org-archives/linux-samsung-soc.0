Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FA2FF65F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414367; cv=none; b=ozcqPZeTCMD7TKzToOUdP1Ik+Nl4k/JK41c1T2v6q6X2hs0O1R3oJjeFe4ceUQllP9WINNyT9FOf5+ZbuO2L2O/Oo1dGnzi4suVdVRLCMa6jhNcOZRGz33BlaYk1osqCQ7D0SACLRh5tAu9ygQajb/HlErAsIk0uWMA0LBtmarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414367; c=relaxed/simple;
	bh=DoUjpY5UCM+p1ACxy0sD1JEJ5bi7jqykWMV8BytUF/8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s6NO7NFcrkgXJpDetkdxDDIUBV4igcSN1AlCP5hSJyz3KnTY5VzpTBPrc5VyguymAmNiivRZvuakOWH8fqcp37yslULUXjaNGQecfoAwUHCv9xyFmOA4IgFkhjXPibCf1tVPZFaLraFatsZ7ms9lBqKL/9cLMJO1QjQEaa8jyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ntnqbn4G; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ntnqbn4G"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0a33d0585so37657695ad.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766414365; x=1767019165; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RDtdE0Cxu7Gss8LSXL9OkFlTQfXFyy8lzvBUAY3ZMaw=;
        b=Ntnqbn4G5OsHAsI7Jx3EI3FPnsKftX7GzihQpWhLElbHs3je2n45SCYwq+W3sM5hI3
         cUTRiBNJClnEOJXA4mIukBTmAFM1+7smYVwqe/cbzcdnOmXQKEZ5JS2Xk3Yzj4VgZ/tN
         6NT/uqEUnvAOtrcHLylJnl+iaa202briuAYFinkf6ZUU3en4fDMpzpxaossk6NVmRNbM
         0RhBfsFNDsN/OWuPIVjkUQCfGStZsvfpuXeVBNVyMvrCLlvxeo9hPtX+dTWDienxWTSR
         RQOHUQk6dS+CugDrL5iMCA3DnDoF1wocEshx2RCrckuqnFzaPukeEu95fKKZsqeGrF95
         YNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766414365; x=1767019165;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDtdE0Cxu7Gss8LSXL9OkFlTQfXFyy8lzvBUAY3ZMaw=;
        b=Qm4yEbSoloKpQ9+9CQQ18Q3y5Y3UD2hlgYOtS9ZrtuHVwRENT7pr2NO+mrnqVpkatP
         gow7M7gZJq1HrJNKy/L3P62DCzZAyLxXK/DnuSFU2mLWOsM0EO7ih2tQNN7C81+elXMD
         MfMFBFSLLrN6LmUk4ZCcOUm+91/JjEgO2kpOGzgnrINcavq0rn2fzdKAHDrO7T15yfhy
         ppequHKDSCST39fm+XxQOhX2B3N+yyD3CqW6b2rO3lkk/iF6+M5Vp5WhkrJFA0e63/Ni
         jLD63YLz9e4G3wnVTfrjDseYCwaVyQddUF55fsYOMuJadVkxAehRdT3RmGm7W6ir8vxp
         0Pxg==
X-Forwarded-Encrypted: i=1; AJvYcCUHKSOGHP2w2M2SyuiE7+RzOGjHEyuMvaPVFuZVMGdUvEaCqOxhoV35iXBj4P5P851xqf9r2Njzrioc12X6eU0Dyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IXbE3EqabCXclCSZmy0Zfmdec0K0P7xYsQL9w/dX+3q3gYNw
	wyrfTj2suJdkhpdibwZqg0w7JZfOdEcbCRKAb7McDs3ZqT6WN4sSv0jK8VAnYs6Sfws=
X-Gm-Gg: AY/fxX7GRVCsKjTrLuQcIUKKsglLe7EV87BvmeSEyHtnPOpebxlQkyH6E8AED87IaKG
	T1OU3dcIXbPbeAY9vZ6JuykQaGho1zmAXeAngcxEDRIKylx/n5V/H6mVq/HB+mpqG36wru3Z9LP
	7LUreTHGXe0H/LcoRwg7TDe6tYvCcrpqlm59BZJm+8jr2Qaw0t3NbQavJZV4AGBf0SVVBvIaIrf
	yMahpqvDd9061+SvmZUZD8IHb5is+pHYyJrD7HTjppWDYGpmo9oVkCHQF5Aco6k7JYjkACbSdVd
	LRWBoGx9R927g7f5ymHXus39Dx4x1n196UJhNAma5MCLnQajW7v3XaYXrJdnOXQS0y6GrRi1p2V
	05yuuAcXlw+6PZIINjAT71tdwPEAzROdpOKlQyFCzhQn8KLHBgtC6Y6WV8Vjky7+E4V3srmjYWW
	TgzEQpRA+EC0FjX+6D6w==
X-Google-Smtp-Source: AGHT+IFT0I8sDRtDf0BsCDJnVlRiRHCTAs1BEHb9zVVMfBwunpVujshPU39ZkSJmVXwxlUzcoBFaJg==
X-Received: by 2002:a17:903:1105:b0:2a0:f83d:c321 with SMTP id d9443c01a7336-2a2f23289cemr104685085ad.23.1766414362089;
        Mon, 22 Dec 2025 06:39:22 -0800 (PST)
Received: from draszik.lan ([212.129.78.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d77566sm101023635ad.97.2025.12.22.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 06:39:21 -0800 (PST)
Message-ID: <a7af16e25ad6403e867a32d9d0f26931ac40199d.camel@linaro.org>
Subject: Re: [PATCH v3 5/6] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 22 Dec 2025 14:39:20 +0000
In-Reply-To: <e9a39590-39ce-43ae-8f44-1edd137d4ade@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
	 <653202f78f060b7e001b78604dd26d0f18ab76f9.camel@linaro.org>
	 <e9a39590-39ce-43ae-8f44-1edd137d4ade@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tudor,

On Mon, 2025-12-22 at 16:12 +0200, Tudor Ambarus wrote:
> Hi!
>=20
> On 12/19/25 5:10 PM, Andr=C3=A9 Draszik wrote:
>=20
> cut
>=20
> > > =C2=A0static const char *exynos_product_id_to_name(unsigned int produ=
ct_id)
> > > @@ -93,19 +99,53 @@ static int exynos_chipid_get_chipid_info(struct d=
evice *dev,
> > > =C2=A0		return dev_err_probe(dev, ret, "failed to read Product ID\n")=
;
> > > =C2=A0	soc_info->product_id =3D val & EXYNOS_MASK;
> > > =C2=A0
> > > -	if (data->rev_reg !=3D EXYNOS_CHIPID_REG_PRO_ID) {
> > > -		ret =3D regmap_read(regmap, data->rev_reg, &val);
> > > +	if (data->sub_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID) {
> > > +		/* exynos4210 case */
> > > +		main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> > > +		sub_rev =3D (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> > > +	} else {
> > > +		unsigned int val2;
> > > +
> > > +		ret =3D regmap_read(regmap, data->sub_rev_reg, &val2);
> > > =C2=A0		if (ret < 0)
> > > =C2=A0			return dev_err_probe(dev, ret,
> > > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to read revision\n");
> > > +
> > > +		if (data->main_rev_reg =3D=3D EXYNOS_CHIPID_REG_PRO_ID)
> > > +			/* gs101 case */
> > > +			main_rev =3D (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK=
;
> > > +		else
> > > +			/* exynos850 case */
> > > +			main_rev =3D (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MAS=
K;
> > > +
> > > +		sub_rev =3D (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> >=20
> > The above looks a little fragile, comparing register offsets between di=
fferent
> > hardware platforms and macros, but I guess it works for now and isn't r=
eally
> > much different to before.
>=20
> Right, I thought we'll get this in faster if I keep the old style.
>=20
> I can introduce a drv_data->get_chipid_info() method and add methods for =
exynos4210
> and exynos850 before adding the g101 support. It duplicated a bit the cod=
e when I
> tried it, and I chose to keep it as it is now. Happy to switch to a drv d=
ata method
> if you prefer, just say.

The above was simply an observation, and as mentioned it's not really worse=
 than
before, therefore OK to leave from my pov.


Cheers,
A.
