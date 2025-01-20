Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01151A238D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365316; cv=none; b=QPxxOyTygyBn+fiaTiYFNUwEVQrrJYqufP+oSq/RKxa5fgmeGfoQerWsc2AjeQuyOO75NOQ7ZP2Y2EK410IuJ921k+VGlhQRInsrnzmMONBccEFfxOi3bRJuOJQuUoVp/Bg0BU3E/TBS/aQk08U5i1osCNQY5ZjT2q95DnAUegc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365316; c=relaxed/simple;
	bh=yKO1dErrLvjMfdSewDQ07rRwqndJYUit3ARaF6YS4nY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=au8qblBxIjICWd6RxgRDa+i0u/yrJ9M2TOdOVXWJSoyBaDWGQhGsubGZOn/gTJJxz5QbLSm8NQZc5G5HhabvRpYgIsVJkx/TKD84QnAQGZD+ltKJXdCJhAMkmCoW7bynatxsRUdJFHuvZCEhbjZJNqdKRUqvycPV8c4NmhixzSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ccLFrUWF; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ccLFrUWF"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71e3eb8d224so1204108a34.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jan 2025 01:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365314; x=1737970114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYGLOqLJI/lW+IWCjzP3HZh5juvPKFXunICLVY7TykY=;
        b=ccLFrUWFpET7GHetfDy6zWtScnRtnClw4J97y8r2nQunMOPnpCQJKVEaqe1YxPg2Mm
         x4X7+B9JlZWUhf4eXCW82l7ikNZJw+MFLk5fErhKNLXZHVnngep0vG/+jrPd4tcV6RFC
         5HsGISK9m5yF+WwE1iQF8I0SlkqSKsNfGfLTEU3GaNn1HVcUTvrKJD2aDt0D8+RGAhHj
         kpNYfQqwIjMYgreNuiSzBnUfNyqIqiCDmbxpQR+Xf+cht9JOmyLHoCyf2BN+0/YdPmZ5
         /necHzQs1VRKdlRl5roIHA2dPMno/JF2thXfr/IOGfWDnQdyla3fSk/VQc5RUnUW8qCT
         wJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365314; x=1737970114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYGLOqLJI/lW+IWCjzP3HZh5juvPKFXunICLVY7TykY=;
        b=XlGc6cwI9vGZvpRi6cqRG0O4CM6cFAExUqoLVWMrPVmU8BIECGJBCesIJ/3RrzmwIN
         FoKkU4b9U3A/RNI2Q0IkSOuAlBp+vFlvCLbyANgay0TBRiDqzf4UKR3EAXmx3k1PlCS7
         R+ZsQREEwoYK4OSj7H3feYaw3Dkeb1zlK28GAotmM/aU6JejhtjX+vP2C38AOxThJdsK
         rJfZ4NUC0rylD23hNvi4PP0rnsx9287SG6idG8m6jEDug5l+P8itAUjFnHPqzpEclKQz
         9ZxRLY19d3N8Aem7Qcp5hsHt2IrRW5Qznc1QGbD1gNLAQSQVg1c55bQFnOAH9mWz1EQp
         /tpg==
X-Forwarded-Encrypted: i=1; AJvYcCVX+sbpy2Q6a98k8CM656Nj6iUkoc6ehU1chYAAmnD9dpwVCaCKpGD9rvLyWSnNPhbZ27Up9FiBMKD/YHnypyTozg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw74BtkVthjeJBTEUyICN6Ud+PhDui4s0gvzvBeFrDTrHdcFN7V
	V96SWjiZA74HbDFpQg7y1yaR7vjOGM4VzH0KpA18vYN7YWjCo+UQ+I0VKoIjm6YCbjHt71oP+Lm
	aPvhD+VIKRlYetU8u70JYpIKvJQ9KNVLD13dn+g==
X-Gm-Gg: ASbGncuDFbtGBC+YlzuR9/roSw9IwsSI5bc7e96pVaI4OwVI0mQ57xBSuUmstdVte8+
	AbWcbmZSp2w0/2KYuPwciy18A3UFHesB1YHtxaf72R/a4ZNgxYQs=
X-Google-Smtp-Source: AGHT+IHXz5HIC/kgE9od/pXjpeXL85g5TtU1kd4nNrj3YOkf2uo9+V0+NxvurprGGTgRz/bnU3Uh1RFDsHX7Xc/0ROA=
X-Received: by 2002:a05:6830:6985:b0:718:18d6:a447 with SMTP id
 46e09a7af769-7249dafed00mr7355548a34.24.1737365313775; Mon, 20 Jan 2025
 01:28:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org> <20250117-gs101-simplefb-v4-2-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-2-a5b90ca2f917@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Jan 2025 09:28:22 +0000
X-Gm-Features: AbW1kvbVsVjCqWD9KbWL_JuAvkdmtbEPoznpA_6Z-NiivZwNyEvlPb517uEKv3g
Message-ID: <CADrjBPpbAXWxAkGShO2-kC2Fa1LvaNQ=JZoOcawKou=9NL0o+w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Fri, 17 Jan 2025 at 17:09, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The bootloader configures the display hardware for a framebuffer at the
> given address, let's add a simple-framebuffer node here until we get a
> proper DRM driver.
>
> This has several benefits since it's an OLED display:
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
