Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99AC6F099
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706556054; cv=none; b=sAHn6NaWy4ahtQeAEkhlWF1izLEZ/19575TD5oHqmkchvcrBr3vVoFKtRfrRwsYjN3EQ55C7QvmcxLLCW/alTjYie/BcCz8b9sC8Nbqu1q3Ctlqyj9iH9biau30VFYEBjwzw2l7ciIZ1kJMY91ra3/nZVlsY3QJfDnwdgGcD0iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706556054; c=relaxed/simple;
	bh=JvbWfOz11vNiFRX0wX7ECmpupNbMxltE2NEJ+NK26YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGPFRLjy8ZOO0Fsp/rPE68g4fv2oWo+3OlXj3XVtoGyIdsIolXcp6BfGERtOaw880l9XZ+yYkzyyQp2aaWIK4rZTiAnIbxTow+8a9RhvoP4lA6egCa/W67hQsZPCB2Hvg5/xloz7jaE9ecXxo8CIXyPsSk0UtkMKCHhjcqINCeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xzd/H3Xg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xzd/H3Xg"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ddc1fad6ddso2644856b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 11:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706556052; x=1707160852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIeL+ClHde5Q0WzDNwjmOu8VjZIU0zrITXV3DaJ0q2I=;
        b=Xzd/H3XgGlDjYlu8FfjjiEInVw51TK2rHCsbuQHe1NeluwgOGEJUHaeuxtFc1Jj1aS
         /Bo8GbZVNgJ/Ga8uFsxH/XoZht2+Y5AvSEPM4pC3OM+uNSnSk3MJY9awP4KC0sqZBpR/
         7vAO3ZevW6U/njj37tlOpJZjBz3afTo90AcqBncn0iSBtS9AmP4KXLBhyXo43BVwtx7b
         h5L7WrwjDpnjsxrIADEnzO/hfEbLkzbvznMC8vdgeD+hFmsEP0vxOLZh91/RN6vQdJWR
         p4MClD+0K3PYnWouFV/+aSREFVdh0AeJdi2AudMpV/9B9/Zq5iXn0/S/+cdRy+7gFPeZ
         ryrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706556052; x=1707160852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIeL+ClHde5Q0WzDNwjmOu8VjZIU0zrITXV3DaJ0q2I=;
        b=sKt1IJrhQoFyjyuPlZR0LzjnZzEMoRJBjC1wtiRHL+slJSduE+2Iq6eWphkgB8HEN9
         1WqsXXmbEmbiD/coIV7fUyziWgaj+6iKyR/FnaJic8RMT3gdXN3VuNVU0zRCxx9IURFP
         81C0uBfp5NIU/9hvtgffu81ZH34rFMqIkC0q4RonGaS+Q7DpCgTJngU60fPmUr+WrsyS
         J6McPb4Vk6u+iKv7BxUG6snPyu2cAnGZZn7cSlGjq9c6bHyiVCnZT39KoxUXTJ0tqkev
         xPbgooE3wDRopy9VNzdv1qqrP7vomxzdzJpR/9FfksPBgOFC4EyNdc51V2wJllTzhN3M
         Ittg==
X-Gm-Message-State: AOJu0YwSt2CzxDjKtz8lx9+rSBHUQmVPbtDOyM9/lf30i728olIQqvuV
	xBKsQUXygaF2IaILBNe9AOBOvS95id1cSAusL7TtZWa0n9T+l4TpWSmuGMZVMiJkJ5phjH7g+Jn
	wfA3YZs1xKFmr66Duk3M7ISKYwJBh/FsSuu4J2g==
X-Google-Smtp-Source: AGHT+IHOCPSaT+Nkr7VPs0AUYEN3NLE/Qj5EVmTGejdhU8hk4hJznc8UDvcuF7xGLhc3uOMKc9yfKfo97PeJPSw9pUo=
X-Received: by 2002:a05:6a00:1883:b0:6de:1d0b:b3cb with SMTP id
 x3-20020a056a00188300b006de1d0bb3cbmr4136434pfh.0.1706556051945; Mon, 29 Jan
 2024 11:20:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129174703.1175426-1-andre.draszik@linaro.org> <20240129174703.1175426-8-andre.draszik@linaro.org>
In-Reply-To: <20240129174703.1175426-8-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 29 Jan 2024 13:20:40 -0600
Message-ID: <CAPLW+4kRcozGqXEZZpEZVrhwD2VJA3Og+LA+2J3tOc9tGLKj8w@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 11:47=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> This bus has three USB-related devices attached to it:
>     0x25: Maxim 77759 Type-C port controller
>     0x35: Maxim 20339EWB Surge protection IC
>     0x36: Maxim 77759 Fuel gauge
>     0x57: NXP PCA9468 Battery charger
>     0x66: Maxim 77759 PMIC
>     0x69: Maxim 77759 Charger
> where the Maxim 77759 has multiple i2c slave addresses.
>
> These don't have (upstream) Linux drivers yet, but nevertheless we can
> enable the bus so as to allow working on them (and to make i2cdetect /
> i2cdump / etc. work).
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> v2:
> * add short summary of devices attached to this bus & add TODO
> * collect Reviewed-by: tags
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index cb4d17339b6b..6ccade2c8cb4 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -72,6 +72,11 @@ eeprom: eeprom@50 {
>         };
>  };
>
> +&hsi2c_12 {
> +       status =3D "okay";
> +       /* TODO: add the devices once drivers exist */
> +};
> +
>  &pinctrl_far_alive {
>         key_voldown: key-voldown-pins {
>                 samsung,pins =3D "gpa7-3";
> @@ -113,6 +118,11 @@ &usi8 {
>         status =3D "okay";
>  };
>
> +&usi12 {
> +       samsung,mode =3D <USI_V2_I2C>;
> +       status =3D "okay";
> +};
> +
>  &watchdog_cl0 {
>         timeout-sec =3D <30>;
>         status =3D "okay";
> --
> 2.43.0.429.g432eaa2c6b-goog
>
