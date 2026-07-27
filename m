Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F13EEACF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150237; cv=none; b=TRVmt7zNGiiZvx/OPFOuQ/yAO69rHNAU8XFCDr8IWbvfajJnw96+JmJtwquS5Pksek9CgdGxzuer0rPMcW69H+hfX/lxkvcs3wqmUQVkqSPqAJ00jK1HU70cICTtEdcrRogoX/Euiu3Rd8m5X5RthMF3wnRKODaA5CwFiSHwqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150237; c=relaxed/simple;
	bh=A40gJm3ekO82idnf30xDmSrw698dEBPTF6CCNVxUp2Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pVtmAVQWuof3OhiqUeb2VDGCM2tNktuQxOLesY5ZUsusrIqxDzCj2EGOmgu/GR6CfuqVDqahNA2tZm1Tb3QNMTeT8beVUrB7AL9KLZUf6BxdmfoaXa0JM3UsUF+YRH17m7rBzrGpmKVjNj00IWTKldKtBpkkZT5n1SkAREJfizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tca2zV6j; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tca2zV6j"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c160420289bso324410566b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jul 2026 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150233; x=1785755033; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ia0G9LEkGdE7OHYonYczpOBgN2i+djSgDVIwUI3fTYI=;
        b=tca2zV6jyFryLgAnWaSDAg/d8rXdQ5Lag+z7wyLd5eksf8N4t1CLO2aca2d3KzKeAi
         NrekyJoKcOq/FlQNBqTmeesCZX1hFvGCuuzLLnT/+LjZm1lK6ufnvJCvLkY8wvMJcb6Z
         LZQNvg/vbg16aXSUHf98vOcOd8zg42wVb7yXKmZRP3sh6qKe7q2tN0zseAym4N4GrZom
         PgCToJ+9VK9dRStoNn3w82td/i2dKYGIqIa+IBOCn8ATHs8SJQ0Bx+S7L3sjkB0paG2e
         RMyui6Uo6vEupyH6SYzX8R+aS36bEFJaG8IK6xyUeypIe+GNTuC7nbFN237iaVWB3oxK
         lR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150233; x=1785755033;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia0G9LEkGdE7OHYonYczpOBgN2i+djSgDVIwUI3fTYI=;
        b=YucgC6ss9GJziYkcxrM8yUqsfJ/SF8UgvSg1IhVwg9bcsUqOGFa35DiSXAGGh+Nk3Y
         6Gul/teYaD8F40nE0abrQhjfLGg2lXBvXD44LFCaRFRjzL4x61gwVBTCxfEcewnpAsS4
         TlUIj8KoB8yGowuTlaZLz/NbSiHNxkmF9mzsWRbKuRZun5k+QXi3eQAam566jwdbVvhE
         lZXtvvUzE5Ks55cDYhuNMwLFaUdkOgHjOilTBKiqY9QCb299QsVHikDKHm+TnXGX3u9K
         I/ItV1tnaY8PfdtzTG2LWzY0Q43YDQiLUodvCyaMuBtOtsr0eWqOkYrm1H6LTC6e4don
         CTxQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYnHmAd39TDkSWWluNm4bVNt0REqZqw9wr83RFZEPJFpjDhaZYqJGygQNuNcqHpgIlUbPrP2aHQ3eFnGilFhYCJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQuPceflnXGyv2yvZL3r5CW8T2cgY8xVg2EFDt62lBhc+Nk3EI
	MzLUpBmeqS9gEkbnyB5bNeNWOYyD6fL6sOWSAlJTzIHvFWjhJo/fZCYrXqZKOlwB9jI=
X-Gm-Gg: AR+sD10ou/2KtTDtl1WxyFXGntsLuPad1W4NfNayNKOjnwA51z9H6sC1oc4z8Ik28yu
	ShrP02Prp9YBKTL1H9arhDFD/ALhoa0udMD7X1D0ybqhw/9+xLPDdHpKoG74jPacmNLjxaYBFO9
	VAJbfxG2sUSSaAjAPw4UmKPQXlnnEInt76Mpi21VMzTTnfBeUmSgE0FDiid6QhHlVQvFvmE4R0Y
	UY36tVVcfjLY3Ud+jlleqeesL8xbusM4Lw63WMVhPd8s7xZhhLprvrh7v6q/MPaMGzv5J40xSGk
	PkaSVqUz3Yzu+iFVfQ7ACLYdSr2P8BnUfnrTmQKhS7FfZq8kMuxIJc9haEkoutPnBLiCtokOLW+
	VodYwAxnVzDZfsuW6C8Tp5oQccQxQ2SwkPGBlj8Mo2zlz0y1VHl5ZO5wOYuGH3o1xn8NpaVeDRf
	ci3vxBUN1dkP6I21Zl
X-Received: by 2002:a17:907:9994:b0:c1c:22d4:3a9b with SMTP id a640c23a62f3a-c1f1f153e8emr313513666b.43.1785150233167;
        Mon, 27 Jul 2026 04:03:53 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c4bsm635352466b.18.2026.07.27.04.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:03:52 -0700 (PDT)
Message-ID: <81160ceaf02ad31c4b86c00dd4bcdcf1fe624788.camel@linaro.org>
Subject: Re: [PATCH 1/8] arm64: dts: exynos: Move 'status' to the end to
 match coding style
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
Date: Mon, 27 Jul 2026 12:04:11 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-1-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-1-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index fa2029e280a5..17b13a586973 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -755,6 +755,7 @@ tmu_atlas0: tmu@10060000 {
> =C2=A0				<&cmu_peris CLK_SCLK_TMU0>;
> =C2=A0			clock-names =3D "tmu_apbif", "tmu_sclk";
> =C2=A0			#thermal-sensor-cells =3D <0>;
> +
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> =C2=A0
> @@ -766,7 +767,9 @@ tmu_atlas1: tmu@10068000 {
> =C2=A0				<&cmu_peris CLK_SCLK_TMU0>;
> =C2=A0			clock-names =3D "tmu_apbif", "tmu_sclk";
> =C2=A0			#thermal-sensor-cells =3D <0>;
> +
> =C2=A0			status =3D "disabled";
> +
> =C2=A0		};

This adds an extra empty line.


Cheers,
A.
