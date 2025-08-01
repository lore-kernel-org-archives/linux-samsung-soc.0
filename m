Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB91EF38F
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Aug 2025 22:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754086314; cv=none; b=so9h5k4lUWYtNLU9A5Mx08UIua4eYvEL4qzNfii6mD7i7ibNcT2w1/T0e2SgdxKCQZaTDW8u1L3kEC3I0QFHwqd5PjifK0pyM8LWNKHzJAkzu7zUXXcMXvmx0NiG91H6dxKO1tGlMD4lL+XlmDbf3LrNy+kEkYvi0oK6ORHOJI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754086314; c=relaxed/simple;
	bh=eHUeeGYj1DUUjEDytbOhyX4cEB/IIIVyN+YMyuRZU4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzWf7pXooOXvzntRKzYWAWQB9DbhVpok9ZDgTkeBrS317wr89JzR1EbTBzjOJkSeGWrwubQUXBm19bbDrBcCjILDN419im75AZT/Q3YrqQ+s1lgRfLzjwF2UQbeQ+kjc3QUhfINqSBiQD2pyTVdQtOcGbCm5FiZOzb8YjnLFN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ce4r4f0+; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ce4r4f0+"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71b5381f21aso21471927b3.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2025 15:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754086311; x=1754691111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZQ3ptl+nXCUruGL17lHqoeg1DTCDNqkoTZmaRK16Pk=;
        b=Ce4r4f0+V8yeZYA0C/KiFyR4R2kzMcdy6IqjxMmhqlbaKjNUZaQfnCkmysyi4xQMB9
         j9dv96OQMjY7qHiUrvBitOHN182R5TuWrsksf2UqPNOvShWc3VyZ88yxSz4igsgrRiSK
         FP/QtG3SlfFsqxbPS/xqyb5y1tmoAYaurrJavd1RvRZ0xyn1ajAh/DdaCMtDcl8FshsO
         A4y9xZe7CUSF+I6TPjheme2w4flBiVX2hsEt+c6sTyhUWtk97H4Wks3F5we0gaV4/Gw5
         TTbBSDDx9s60XNsf8vzvsq0g5yG8JJgLe7Tt1a+UYFPg6D0vAlmuZ6s91VmhOiGZ5hLF
         1OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754086311; x=1754691111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZQ3ptl+nXCUruGL17lHqoeg1DTCDNqkoTZmaRK16Pk=;
        b=HVpXc73lMkUpqJvIR1akLTiOLMLjtt7ar7oy5b/FmJJXlMeKPFY10M9QIgKxDIpxEX
         axzb9qQJeQVo2imkEcj80CqTpxx/Qap/T0fJCQyyau0Gjpnt1ez2NTcVveV59WHowXyr
         m9GDQt8Pz4vO40FskA/cOdXPqDm7t6Se+46Nbu/nx431eJ+/AWAhNLXjKAHZZyHpA1js
         I2pJ8QRKAd9cP0WaGtvZfhyry1cgJAQD4auamOK+bdBNQa/YMjDMqFSEsjLaXDnMFP/A
         SOpztwz/gV3ASDZJTbcHVgjHfzie3QeApBXcKfRDVTA0lWgCxikEywfUvuAATt8iamF0
         YyLw==
X-Forwarded-Encrypted: i=1; AJvYcCUbg0TG3pHBT64GJYDtMyzQL2+Hd5SvX2ob4rtiJVTtLI3qSYOSQPuWDrbupT959cbjD/MoZ6MCCmQeqCjB3gZ7Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGBKUVOlSovLqVi/I/DSfSRTB6T+WJro/ZYS1uTd+5sRLgqtd6
	yhmEPtxx2sp7htfBjwrup8i9I30kxfj/DkgOPhP/is+KeJmovMGUt1Evn8SzjIERnv5AijEa27p
	qGuDM4Itq+H8KUWaZxw1vQPqYeL+IzU1GHka17Fag2w==
X-Gm-Gg: ASbGncu8EqiB7j0SWmy7EtmSzGOGSTyFRmc230J40MD6j5MHO7030ckHNAw9ORjFauE
	fJHt3PFpzpA3P0SZlrBJiuAvHSQUufP8Z4JBezOv60vkCzy22s7y1piQo6OXu/6WHHOCSxg2VG3
	wsftRKObC1HVjw8Fu3/8eZluxZS7Roy5iQZbg7d/t5dTr5s2PhW4zHOhlwSzkS3P8UY0L6v10Xe
	q9c9Q==
X-Google-Smtp-Source: AGHT+IHHqeJHNAbgmM8GMieWnZy5D9PazvXOXJxMb+nmM8OfoRPhTwJEHb5ZjR+06/LLEwPYiHrsAqqhXrmv7gbk9Bc=
X-Received: by 2002:a05:690c:d8c:b0:71a:27d2:2bdd with SMTP id
 00721157ae682-71b7f62d7famr21657777b3.13.1754086311325; Fri, 01 Aug 2025
 15:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-4-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-4-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 17:11:39 -0500
X-Gm-Features: Ac12FXwPXRZu6Ot3_0uSchflAwrF7qDuOzVPDdy_jKO2tY1n3bXW3MwJ9wqx3gQ
Message-ID: <CAPLW+4=QwTv96KMdJ7tcWd+Swh-fC7+h9bo22e2aZMeRbg4wKQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: exynos2200: increase peric1 and cmgp
 syscon sizes
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 2:43=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Some USI instances have swconfig offsets that reside over the currently
> defined syscon ranges for peric1 and cmgp. Increase their sizes.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index 943e83851..bab77b442 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
>
>                 syscon_peric1: syscon@10720000 {
>                         compatible =3D "samsung,exynos2200-peric1-sysreg"=
, "syscon";
> -                       reg =3D <0x10720000 0x2000>;
> +                       reg =3D <0x10720000 0x3000>;

Exynos850 TRM says that all System Register instances (in Exynos850
SoC) use 16 KiB (0x4000) of address space for their registers. And I
can see some SYSREG registers actually have offsets over 0x3000. In
reality though all IP cores are aligned by 0x10000. I have a feeling
Samsung does the IP cores integration in the same way for all their
modern Exynos SoCs. It can be actually deduced by looking at the
starting addresses of the nodes in the device tree, they are always
aligned by 0x10000.

Hence I'd recommend doing this:
  1. Use either 0x4000 or 0x10000 size (not 0x3000). For the
reference, Exynos850 and gs101 use 0x10000 value.
  2. Replace the size values for all sysreg nodes in your device tree
(not only peric1 and cmgp), for consistency and to prevent possible
issues in future.

Also, maybe it'd be better to use "sysreg_" prefix for these node
labels (not "syscon_"), as it's called System Register in TRM. But
that's minor, and probably out of scope for this patch.

>                 };
>
>                 pinctrl_peric1: pinctrl@10730000 {
> @@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
>
>                 syscon_cmgp: syscon@14e20000 {
>                         compatible =3D "samsung,exynos2200-cmgp-sysreg", =
"syscon";
> -                       reg =3D <0x14e20000 0x2000>;
> +                       reg =3D <0x14e20000 0x3000>;
>                 };
>
>                 pinctrl_cmgp: pinctrl@14e30000 {
> --
> 2.43.0
>
>
