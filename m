Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A423F8248
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150387; cv=none; b=kE2DY7FDMW7bedYzhK667sqOO2AjgLjAXPlkvvm+S4CZjHdWdI3zpbXqfj8XT3QHBUOTVi+SZ7tV2xtYO+LwsjGEb7RVbcUNznWdKyN3kTO1c7l8ztqWdq6cPX0GreuQl3+Oh2w7sN+E7tvCtlGN0RLgkRGuN7lR0yefSKcALn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150387; c=relaxed/simple;
	bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fs0TfEEmok/WIs3NrelCOfu+v+Yw135kU1rnckuP2od8r30vCfX+UeDGe121DxAaevY5szK9AY92nZmnRpUJ8kVd73i6ve6V1k1VVFNkEQNcXDarEIG6UMvFOq4DvHgckeJoXT6/h7lvE2GlxsIpwbfUvlD84/Ulq1W78AKmVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NdgIsk8X; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NdgIsk8X"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so3130175a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150384; x=1785755184; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=;
        b=NdgIsk8XCg3LLIhLHMixB9MG8CZxscoycsRQ7vWldblSaT46VykeBq/lUJLRo46CpC
         JoH3bRqVF3p1xeAlVQQHVLuIGWesxKy5lm3VXTSkHUa+b2JRFHF8Sl5L3of2K7YXikuK
         Xk0HUYS1e7ChaThWGGU7c0tO67Zu47XeRrMYYPvtvjB5VA/aR0NEba7f01aMe4/qMPFx
         PaLiE5gj+RuGH6ukUBOgD2vHPUkA8dCxl9OoWKxueOxlrLxwyrW1OUKAw62WRJE2dRHW
         NAfNmkS8g+SbMZGxrGtGeNMuE/bdsC6Q01gZuc9mhIbClzoLW+2LjPprWuuAYFrmUASq
         xMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150384; x=1785755184;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+pIXqI4Yn7FIR8fGNeli3S1YAjHULa95SiXJrMUGHo=;
        b=NeFHyK0VfIFgWEqCdL6L4ZlgIQBIuKuZPXb5w6oEiAeG5J3xaLpTSDtqyELlbS0ikX
         0njXiem4wtzbE1nYXEMzSmTpjUi5HGS5XeBujyzfzYhfl2b1f9lwv1ZUBbJXKid/+IuU
         XkPphLukY/ZzEJgnFeDnqRfxs4G09f6evbDmdoaeEjwBxFkvRxIzjJO6LShcW8MXwrFU
         yiEMFH1qtOlmd5Ft7r+xywLVnyMxFb45ZhwRnvbGAP60TfYltWJIoQ2gRgGUc69DiK05
         is7KO3rCzBYez8heYBGrcUfqBxAUk2wQ9Gq7oWJIUyaDQayzo8S3sKbQgLnUpApMaXvZ
         tl2w==
X-Forwarded-Encrypted: i=1; AHgh+Ro4zmlviwuPwTaP1pxDFLSQEA26B1bgY7wVzYVCmL4iz9NB0a/97Vas/Pn4NwcDw1Kj1dWDz3HfRlFdDUluqtVTsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwiZfovW4PXwJj/t3rddT+UmJp2f/1WEr1fZ+K5FzwvAMVLbVy
	Xkv0PoTBImbQLyZTRTCu64QrAM6/juXY5iC8MLtMOmdcexOzKrDSvXCKtZbvjrBk8dE=
X-Gm-Gg: AR+sD10+VY310QSBmfwvqvZXpND1nbDluavYhkrI4eLf7DDat6ZTuLAOJMoV1prsdyk
	hmyyY/UqnuF7JiS8Botk1Q9vTKKcXcYVc1ZN0xoBD5w2oMvK5HeY5nPiTn/zHnk2kf0aLilOGlB
	aNjVYDLd7+AqIKzCmTXFPN/03HHnkVlsURjPdtsUke1O8PUl17aSEWy74SeB6VqHy5n8+JE5xSf
	4eyu5UyCG3BGYbvp95FhzEDlJOoJdoveghUQZvqOZH9RZq2tmESKtcNDolRraITm7D/t4pOBGKM
	hOOxnDgpoQ9bp/EEbQvsmrPI3PYeL1fHudOPr+ClT9eHI1A/MFP/6njO5B6a2Vh3E8wPNjTe9Zq
	UKnrLk1p2LOSr/jfaVAS5/HK6oX8/764Q1tTXt5pulRnSlov2yrkZm7xt3xxy3pVP1oSZ7Fdgye
	AW2KBx4g==
X-Received: by 2002:a05:6402:28c9:b0:699:e496:870e with SMTP id 4fb4d7f45d1cf-69fc1159931mr2804954a12.20.1785150384355;
        Mon, 27 Jul 2026 04:06:24 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb55439absm2454955a12.19.2026.07.27.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:06:23 -0700 (PDT)
Message-ID: <32582351575d8cbc06fc68ab3d12d598bd317ab5.camel@linaro.org>
Subject: Re: [PATCH 3/8] arm64: dts: exynos5433: Override thermal zones by
 phandle
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:06:41 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-3-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Fix indentation of DTSI file with thermal zones (two opening { brackets,
> but only one indent) by using a safer choice of phandle/label override.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 4 +---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 =
| 3 +++
> =C2=A02 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
