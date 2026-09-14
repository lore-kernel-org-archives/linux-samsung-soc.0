Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A038A728
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411418; cv=pass; b=YtpclGOqRWcmmAgwfVAcHDRi2kNb4M73zgy+hDe5rPrCIx8yBh9u8Xb0dS38oX6JlPwLkcE1U6eBE0NRqFY8LSH3IuUt3INOELdNf9w6t9LVGjM0kwM5m6W3+n2PcQvyxD4dL/Mfj/Vdl/rtnBC2lp5cH2BbVizr+9Redi4Pzo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411418; c=relaxed/simple;
	bh=D60AujOfPZ0xT2zKJkyrcq2Rg0wSz8afS1KCAGi/hDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk3kWUi7QNJThTZdxrEnQ9j7O3JXKt4F6yv7m0uVSGur9I+mgp+s+v5yFNyVhzVJ9qNyzzK5l08saWCTQlSbS/gh9we5kSuY7WIRU/078rGFp817SGSe+q40Xz7F9L6NDx30osaCkf2A+cWKJltPk8WLnnXcO5tUFFDcaqe1pFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oehiCSal; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oehiCSal"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67149cfbcb7so1481855d50.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 11:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789411413; cv=none;
        d=google.com; s=arc-20260327;
        b=oPIZQOncIwjtTV1VnFWp55GEIBC3zIsBoy28RCGCsZfoDXzlOvHeN20J0REBHTcT8r
         +tmRFGCzSLQ+WZyypXLV2KezoyzSVXoJZGVcNGxS+UiFFcArGB560T/YFqW448s1+uIW
         VB+whwDzW69AC8YeELAWjwdyi7IvgKGd2pKezZHDeh/6QvFhDMFdWE3nYYEwDPC9C52+
         8tQzQ1xvo7x3hp8TbLKvjbNPP0pmrw0pWoxqgkuDAfX0C5S2f5V+sS0v9yXuL1fqRj4y
         HkWowHs/J5uzGRCy1m95UdAeLDeIeoeE2rEp/yHrN6q75HC8zMz27dO7nYfr/5J9xO/F
         cpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        fh=zQawJ4snOIgXMMCoSgvgaJgNPPObygo/4QRF7z4f0wk=;
        b=aSX2CnD3SOoG1Sy3LfVr46EETqvP0zitTQiQUUVo+vpJKC7NsvT2A1AnYqAZY8sxIt
         DfBONKDHluKPS1jH0TtUqbFbIGmIOTXC+DFpaprwScopelxQwKRglbAk62epj+lbDvY6
         SAwakbLhZQhIgi0/N4RxBzNz8rUrOYZiRd9WvI88HUi0+zU4cWEKVFK3crF78QjX2Hw7
         kMS2pofvTBjxCgsnEdjgGURl+HGA2FmuVvhIqgoHU9AliiLrNj6xgLVZbLl7FViWEo7Z
         yiEJM9AThu1FnnDIEJD/Q4wrMggnSrua1Dc4sqjmICRp1wSSH6DWeVxUtSMM2Z1e68GT
         F8YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789411413; x=1790016213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        b=oehiCSal6mkocd3l0eyyBhL6M49PFLZaKereHNIo5IKdRfOHE+M3YJIhgLtEKXbxE4
         m4YguuBA5Fjy6vxGvM9k2PVI2arPGhcAcUgIEslDJtyXnTt3VEqkcp2GyKBnxj5XjSoA
         OgprWDC8XQ7QSThSf+bV7qKJD5kV4KnCwHqm2OxnB8ryopEewVbE47kPodAssBGF9eD8
         X9xq44zO/4g+gewqab4YmfR9vjJB1JLxSvAPacrNyhpEFfGgfLWKyzsLy5epmVXyed7N
         UbMmwPWFdRr3c0XsPIST9/hhnsCiTqZYMvmqfLiuk81/7MEcsJupEhE4MbOmTFN+SV2k
         PNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411413; x=1790016213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTTwCzG+E2m003pB6kHU8/AZNGM2MnXKny9rOvXi4p4=;
        b=GIaKUZ1iC/M0vze7af62QuUx7abvLP6zn9qaTTWop3yEkVWLqpEihHUbngG3HLleI7
         k0pxdSfwS5prP2sXkCaRlw7eVhkP5UBMrJvO/xZKM8crKN8bOxfEYeemp6SCPx6wWRDU
         GKNGYJIv3ty2bmrwuL2HH2TDG/1/aGDlL3kb7hnZ+HaWTPuavwmMwXvrtxMA6a4BMNS/
         N0wHN6inURIqs6ND41uaFjm+GFsxQnBX7b2apE1Na4IHoOgXYcAM43if1tF/yX7NpPBh
         ui3IM2pNIsN4CA6onAPJe0zT2GseVT6cVALlYJngsSS5A8x1/su8OYFCzMsQtLD71xX0
         39fQ==
X-Forwarded-Encrypted: i=1; AKwUvByW0cDg9ZgIKhkaINqrkXE56KlzjYuh68HlwEPLeVVnJU5I7LEJAfnMylt85m6hB+x7oAqCJr7Bmsb1WP06exQfgw==@vger.kernel.org
X-Gm-Message-State: AFuF++nXE2Hko7tvO+evA8e533QI1XndZYq5Kkjzcd1R3Jfx4x85dGVX
	DVJtXyXvUmTfN6LwnAc+ldV3MAxdWwA9ppIsvdBVWy74LDxKOfe1LsInZfnEku5S2h+wmxFB3aZ
	xTr2EYwHEyPQ00DG8E2fUMj9IeXVB9LNVAUMtOZ16Tw==
X-Gm-Gg: AYBFou0kowSp8KqvJq1gB5VlAV40cO6fr1T432eMSc4kjBoNpSG7FFkqL8U7uHUg7iR
	hPWHs2T0F478zw/39QCRzXK/0A4mO7wX0kbsGniWviKg4bOdm9OhIuN8YvlEL6zsL25HGCsI7gA
	bJ/yHZQpF5WepOKee+yYxSzoOjq7kMAaO6YEa0x9sj80XzJQd96e+98A2SbQyWU6GoupCDqSMFx
	TqBrqWYceLDGGuuTSZMwgpnRDnpSDFKLca3d3hQWixvYsBc+3Fx0mCrTbT+93z2wRMV6hSKj9lZ
	RA4jOtD5Tq36Az4qNGoKQH6p4jSIJTaFGe9kT4+Mu/79htzCcr2ZknTW1m+qSvW+sVHut2ROHFI
	goEmEUwpudfjO6nOOHxLGWLhX
X-Received: by 2002:a05:690e:43cd:b0:671:2d01:48e3 with SMTP id
 956f58d0204a3-6714dff5dd3mr885822d50.29.1789411412494; Mon, 14 Sep 2026
 11:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 14 Sep 2026 13:43:18 -0500
X-Gm-Features: AcwNN1X6rEhWyvGZGxC5VaFgYQL-l7UNaKIM-imvsW05a09IZ7DLJYvbUNRH2HQ
Message-ID: <CAPLW+4=5KqfFxUQ5Td6PXfoKG-vdTkzYDF-sDAyODdXKSripzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:58=E2=80=AFAM Alexey Klimov <alexey.klimov@linar=
o.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..2128749d7647 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -176,6 +176,11 @@ soc: soc@0 {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible =3D "samsung,exynos850-acpm-sram";
> +                       reg =3D <0x2039000 0x30000>;
> +               };
> +
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos850-chipid";
>                         reg =3D <0x10000000 0x100>;
>
> --
> 2.51.0
>
