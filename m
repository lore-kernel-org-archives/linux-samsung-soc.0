Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A11384B1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228039; cv=none; b=XN12OmqYgspfHIkWK7POy5+7v+7lZSot0xcO29zlscj6U1XS558j8TQ3/RPHy9hYYZ9QqTZQzTFcGTTQoXhI+NS/5Db/KOEMm8qgclITKoG4ZRYWCwJzfp3l591UiZhBz0Efg20B1gTIx+A1L92GpdcrbuC0HMyMW6gazT1YEZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228039; c=relaxed/simple;
	bh=8SljLriCQU/R9iZ5gWt9zSCnrJAdSlcr5Md1yQsHitk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCt+SDNVNL5Lj+K6Nj0wr8Y+wNg4fnDkN5r2fRa0NSE8M+nMyCar+f9P/4GdCFo5URwBJJbwleaeUAkl7e2DMdLzbsfFd7wxuNaxacti7JuCpo4mkW52+APgXNK/dwpe2Z8a9ncQmIPkYXF3Y0dWtNIFAHlRkv3WRaCFOsbqjSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmuiA2J2; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmuiA2J2"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5c2011716a3so266335eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 04:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719228037; x=1719832837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiWe4k8FtBd5fLnyYS4pxEhg5OzBr8vUWEFs5mIbuS4=;
        b=HmuiA2J2rC+CpZ6U6KTdguUb92pH7DT52mE3U8EnDhUKPXpB49IFYd3c+oLszwXYBg
         w8X5wMXwZCjFsvwgS4z3BHXvgGPrjfk92jQCVTVqTkDE8+5MHThp4TI6Tj5KtrPPLzm8
         GsDWLqIlxIzdXvAWzRq0iDGDE+lV7FDMldHSy4pzBnBdq9b/b2u9wRsMb9BM//CDlhjX
         UQmVsAzr/NJHb1inZCmDFLg3d5o98EFVFVaLE+B50Z/WjDLdE7vsh8HKDIXL0qlGuPg0
         DFHWNSXElIibyfEhOT0gSMBg3br4W6qT9V2v4v6vFoH0AA6i/UtP0jqpBwTuCbX4rpU/
         frMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228037; x=1719832837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiWe4k8FtBd5fLnyYS4pxEhg5OzBr8vUWEFs5mIbuS4=;
        b=kE5Ij9tPYZqEzh2mPfZC2kgSejo4sS0NuL+oe8xXfgZ3qITKihbudJIDbRW7ItWx11
         iBokbojhweIfdW8jWaKT1QKlhbYNGxsyvmwJJ6vU5DSpw91C3rhnRSxLVOICeBb+fo3y
         fOeIkwsJ/Plvs5Ez3nlNDy1crBSomH9KGhgzylQRukhGyVicD3VtYKFxHeEecfQwfDuZ
         I/ZlOIteq6OAZu2JCR4yMpo3ygiDYFslyXlwjisVDCXn+K9y6JBlkrb8+9NV8iKpfveB
         7jSVVoE3Xu6rEMZKTavuKVi5amI6pnu+sSpJrinWvhZ2ankpTSL+58ngOW8Z+MejfJsv
         d2EA==
X-Forwarded-Encrypted: i=1; AJvYcCWdad0c4RssZqugrZ54MROCGcH2Cy3PK0Fr3iaBaR+8GkOXxaMI2DfeL6Nj+XpCH2kMQAkN/IJ2a/AjfK+TLqSLLpzJ/B1bWOjlrmwU/kJB7xc=
X-Gm-Message-State: AOJu0Yy/C/wd4qoaki6fqu0f6QiCpkb3MscdHYEqxitls993S18tRUNV
	xbJGvRP0kb4YNR5w2EEqiMru0rap4lKn8FtK+7KFTvECTqcYMdccLCLK5HrR+vxslmzS2o636RG
	xgiME/40t5ikC+hDzZLrAW2+bQFnRMAl+tAG7nZ/kGu7zMM+lL3Y=
X-Google-Smtp-Source: AGHT+IHfldjpB99ZpNwFcajstPYz4MdvmrWm26sCR24wJ27onowRiUicbCtcbFxhvjwoR18exO9DD0r6k4/LILVcIj4=
X-Received: by 2002:a05:6820:2b0d:b0:5c1:eee6:6ed5 with SMTP id
 006d021491bc7-5c1eee66f99mr3951941eaf.2.1719228037550; Mon, 24 Jun 2024
 04:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org> <20240617-usb-phy-gs101-v3-2-b66de9ae7424@linaro.org>
In-Reply-To: <20240617-usb-phy-gs101-v3-2-b66de9ae7424@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Jun 2024 12:20:26 +0100
Message-ID: <CADrjBPpRCuQwLOG35mjAc==6mD4rgx2HzqLHgCA8fNGg79YOnw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] phy: exynos5-usbdrd: support isolating HS and SS
 ports independently
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 17 Jun 2024 at 17:45, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Some versions of this IP have been integrated using separate PMU power
> control registers for the HS and SS parts. One example is the Google
> Tensor gs101 SoC.
>
> Such SoCs can now set pmu_offset_usbdrd0_phy_ss in their
> exynos5_usbdrd_phy_drvdata for the SS phy to the appropriate value.
>
> The existing 'usbdrdphy' alias can not be used in this case because
> that is meant for determining the correct PMU offset if multiple
> distinct PHYs exist in the system (as opposed to one PHY with multiple
> isolators).
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>
and
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested using my Pixel 6 pro device. USB comes up and it is possible to
use adb from the host to the phone

regards,

Peter

[..]
