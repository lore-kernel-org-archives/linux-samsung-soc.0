Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DBD6027B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520503; cv=none; b=JAGzyk3m9+7zNiUopCn9/150J+wdicRDkEejQW9Sb/RimPDmVnKP5zZkmPxVs9PhbKrHEMTXh+5+TZyyiNxoTG0hyQkP1XVqdFxj0B4fqw0XJaP7KiMls+3WfTSqp6DfQvOOJU3MTueoeEk/0l4dk/mVMy32Ga5cEtZRS7GW9co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520503; c=relaxed/simple;
	bh=fqIQss9YrlmVdaiZwyyrl0wDsFJ+mHTn4IZB8IBL3MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXKaRKC7cuM4LCEb5H+c7rBFgEJnvY6jAHx97C0FiA6gyYRjqA1wnFJGgL+lm73j97fPVYotkxl3RnUhmIVz7tMRaqZr/yBTEovbtaTxwb29KIqZEcLeRnk3EKWDOdCxR8poFau9xrgXHEtiUnn+RUJnoqGt9B6KpkqGabmhnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UAqxeE3C; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UAqxeE3C"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-783f0994eeeso84320985a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 01:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706520500; x=1707125300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4q8db41yY87l7MxKvbYpo3+xjJtcNE9e9gSZAUqcvLs=;
        b=UAqxeE3C1ZxyM2d2BcPUz99YFgY/WnpE58yTZkT2naebUlL7SubL8kkSiabXMf0TCL
         2jBd2kmLxdmLs5nJVLW6okr+qCnMXLfqLaUmuLkjD0WIJc7PvvPQi2LItnGUqM2Cid4M
         JEmOAq9lMYPdVa1C48P3/ZLqm9EKNuQJr5bQlNJR7JZhNAfRb6aeALC0SaFap2AFPCKx
         6YL50Fk2DykjfGJ/2iy1EJM63y8s7H9G384FOvboiqe5DFOCChe6g8rEcsbGYrMDPQCy
         EJqH7aHMuAPxIhsehOi9HyZBwkPd+aUcOZ64yknNFWtt3lvM6HTPbqOSUcaBTDbSnfBR
         VIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706520500; x=1707125300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4q8db41yY87l7MxKvbYpo3+xjJtcNE9e9gSZAUqcvLs=;
        b=I6PdKqphCKHbfgc669U8sgzKi0O7+fl7lFQ26SU5kWISQAvMS9xaGzQ72U5UMvT5Na
         HYhgAtMx+tTqF4IAm6YGEHoiY5AN6ntFaUKeBs8e0SEc1bz3epZGoeuyiFVOsAaRHNos
         cv3OO0VJYARytgghtJdwlNkG88w1v6mQ1Kzqr/2aRn579FeTzXnT40cfX9imjM3OiRM1
         HlOJh5BtcEqRgMv+w1zmAOms7x22lKic0sxnn4Ib5rW5/3v4zs4yld9v9jwqhQDBV+6C
         JznfJal+nXiDSx3nvgAaUVgfkN/s9Ly7G7ck3mvpbMP+LfVyXkdl1pjcg4YpiUL14xYA
         SYbg==
X-Gm-Message-State: AOJu0Yz3HpgZZvDjEGP8azFcFtNVahSmt94rzxN0x7ZtAE1JQOZmjaQu
	NSkQT6tuhxzhkZMEc62HaOR0wdsUFQVQXilN4sJEo+Fon9YZsJqhHFBZfNO9LI3YeJ08JwhH4x1
	EQrLZNGp4obXQUr2AUeIHvCRrBdwvT1OQYnpQ9g==
X-Google-Smtp-Source: AGHT+IGYFxZ7DGE0AfRt4ew5dYvWGTQXLN6eczBCd27vBSvEmlBwqJjbpYwEvVAfNowUSbRibLTBmiPYXnGcFr6dY2E=
X-Received: by 2002:a05:6214:2a87:b0:68c:5337:b717 with SMTP id
 jr7-20020a0562142a8700b0068c5337b717mr677358qvb.18.1706520500069; Mon, 29 Jan
 2024 01:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-7-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-7-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 09:28:07 +0000
Message-ID: <CADrjBPoTPzWo10VvFX1m83q72xqzR_y83TZ4JSFgK+YtyaRsPA@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> This bus has various USB-related devices attached to it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

As Sam said, you could be a bit more verbose on what those USB devices
are on the bus as they aren't enabled in this series. But apart from
that

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index cb4d17339b6b..c8f6b955cd4e 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -72,6 +72,10 @@ eeprom: eeprom@50 {
>         };
>  };
>
> +&hsi2c_12 {
> +       status =3D "okay";
> +};
> +
>  &pinctrl_far_alive {
>         key_voldown: key-voldown-pins {
>                 samsung,pins =3D "gpa7-3";
> @@ -113,6 +117,11 @@ &usi8 {
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
