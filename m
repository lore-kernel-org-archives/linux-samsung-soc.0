Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F6B335B5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 19:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706555959; cv=none; b=E3Ohz/tq+h5Nhzk96zPDhejKQ84wxF83nAqTi4Q+5RNYs/o9H7BZd7aVmiax0SJDXoksAQUnNo6lCdHvHptoCnr8hLd5CUhc9UTfZwCdkPCdkyCeCyQQyBINarQquHit8whgW0U7A6zgR3GaODw2ecJU7pke8x5h/bSAP26lHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706555959; c=relaxed/simple;
	bh=MU9MmIrHw/67BHQXkTPiEw0LVm/53Y+HFvPTcTiByUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RI5OxJGwl6zBVG40gAuu1PYSDAmwnNwuwKkoRtirvU7OgFtX+gT0BrJQEHMTN9tcsuED51Gkxc5gaS5p2AHMsaq4IcfRrfvd2wSRDsJyDl3otmIYd/Toov3/NpidLBMKzoEG9CMFrEpoLyh+erbOlI4GpeQ73BCoNtOWlE5pJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMJWo5EW; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMJWo5EW"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so2750950a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 11:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706555957; x=1707160757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwNx3opXJ2ZzqtnsIO+tSlRh7ps3K7+odFH9qGLZcmk=;
        b=dMJWo5EWp0G8AZCj11YBTvPKCS1jbvFZjd+LDLxLuvzdhZy9L2t/C5GpEzmS7fm72k
         WXZRGF/PpBishLnb1AnB0yCadAMEiSsJ1zzXIA0/q+eFK+oZKhPXMojIiPYNh+VMsMy8
         fcX2Fuol1mR/5KiaZPVhMYvdNFZuDXR5GDjXOlBF5RCcfTeyFgm2+cwY7kAUndGqmeNx
         rpyw6su5nMuK1XzKFFZ5XIrcBO08uHfYKbzLlnyIZ7CympM1FT4TbJaNh1aUrTw+CBN9
         NY1Pgscc2iNM79Y/ticootDwlf9qL8LYzQPvDMbwmgvYN0orI/YRg+qpmn2+P7+fDe5Q
         QUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706555957; x=1707160757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwNx3opXJ2ZzqtnsIO+tSlRh7ps3K7+odFH9qGLZcmk=;
        b=YrNM/7+T+0htd9uKYMcoze0UTZmX0p1LIsZVawqp6njpy3dhnDSpZb1X8Mw55+OrfH
         9B/PeN6nLollXpKVaoGkFaAhsqYqs2EAqFe2cdb2mknOQRQxvcggPbHrE7lo6oxJYaFF
         WuttiKZpJrPHoLRUcjssLYO0mKSf2flDtlauP3d3hiiZAFJ+RlbXhtCg0PmdEe1LHFyB
         AUCM98IJ4obVyrnMB/tkCMAY7LJZFAkrWrRx047PEcvdYNaKvPc8wr3ebpOGGOrplbF4
         HuyZPUj+5Tq5U2OE1nnr+ePM3DKA2/og384B1G0+NMoq8Bl50dm3+vw39MwfzWjED5VT
         rHAA==
X-Gm-Message-State: AOJu0Yw40Xi7XExIzI7a5JTrb2ewTJoJz4E1GGLpROYCh2LI02Y55AV6
	zdQxKWYXZtgNbM2Z1xmWe+YNnoEuGhoqjycepjwasSJM9d3Hzk5xjDHbq6xZbUT5Uej+aA3Ojq8
	HH4A0bZW35Y56JBRIz9gQuxSQXH760WrTc8Z99w==
X-Google-Smtp-Source: AGHT+IFb+2auluVYwWdveInazsXdiUFS1f7RHCk7mnkvW5QfiCQG437C2AdCz9+T7D1GFFP6s4m9rmFXc/Q+dxa9rI4=
X-Received: by 2002:a05:6a21:1506:b0:19c:a47d:874f with SMTP id
 nq6-20020a056a21150600b0019ca47d874fmr4648484pzb.34.1706555957344; Mon, 29
 Jan 2024 11:19:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129174151.1174248-1-andre.draszik@linaro.org> <20240129174151.1174248-8-andre.draszik@linaro.org>
In-Reply-To: <20240129174151.1174248-8-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 29 Jan 2024 13:19:06 -0600
Message-ID: <CAPLW+4nA4kzwdE5neOPvgEDAZ4RG0MBAkGKzFK=u3WG5FfZuMQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, 
	inux-kernel@vger.kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 11:42=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
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
