Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF2402BA9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005917; cv=none; b=LqVFwszkMJiJzqWf3lV/kmMJ8M9lFxbrfyVHZIMIKM3OormF3gcVEe41sGqmR/G6zfqIRJn7YHSDpvvwA4xUi8wIvebgQTlJU0LvZOKJa3QYCE8LqrbrKE4RZ8bB/0hsHXSmP0xcBS46Ebnw8wKoN2epJa3Bwzlr9la/WdrzO9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005917; c=relaxed/simple;
	bh=V0cxqAubJ6QT3mDQJiG+LniCIaTw7Cb6nFwnYjJCgPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OcQf10v/601OUsayKv6gsohWJ6B2pOiEQM28cWBO1RUI1+VK2myybjYr6klbNfl7F9fQALyAuxuxEOea0cVQsEcFaF9Bj/muxcYfRWNol58bW56uqvy6juF//lvRwlIxFFc5AZoGKmP5Q0xtOUk5cSOkVB/efsV4XWs/9eQdMGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOH+VyT9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOH+VyT9"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bef8b97655eso1015538566b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781005911; x=1781610711; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qh57ithdNaKLyKzJTn+bCZN9e6uxSJT+tkkVV1Puba8=;
        b=FOH+VyT9xEKbu6IWxcRRWvbBOc4pUiHnCvLgH+0Okbl4v9UNhkwko8KaN72jvaPDnZ
         ldDUMpvgJ8SCFf/VD9CgPO/T1+Thx/B2ABb8k+BtSLVMDSbK+4/AhF2mznW7tVZ1W8ZD
         gW2st3hsaJOBGJuExbYJRNFHPtParGC7GnW7YwpbGaEXbgULUoJkPVpgvaP8dy4h8hJZ
         5XKqZ+o4D8GHE31wlg24NSu1EU1eW0tmW0zn0pt672Aqv+bsaGREB7qihnBNyYhVBQVE
         +6D7+jxJ8cn6WQSn2hdarhOZmMAozy0o9OauH5XopxPKZJSloSBa7xIsMZbmky3UKgCD
         yZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005911; x=1781610711;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh57ithdNaKLyKzJTn+bCZN9e6uxSJT+tkkVV1Puba8=;
        b=YhtsT3cqoKOMT3LBa9jvIAViNKweXJu3Qu8UOm57yxODjWo1yMN52lrOKo58uBgtQu
         9yp4KSYkLpITv0fJ97dqY6UAXKQBN528qI9yzbnu+bC6njm8+eCUqTzFzQ7CvlP8tW8P
         7h0wBYyiL7ajmA93uHOAghBv3UpCrkv/ouhdSHA/BtNG3i9P62Ctj021NWb5+GpCMiCF
         KgTXBFwjg0K9g2Nh2lUkizZ3VlFkrB66Q0vdVL1A1X6Mt5VObUZhCSySGxi4akFhfFDA
         XGgijlJa2A+gh7aXnSP6BJF1SfV6GGlLkhTnsGrURVJO+grYnYeG/AyCWFE5RhaCGIVu
         t75Q==
X-Forwarded-Encrypted: i=1; AFNElJ9bwVdSMBHQgTOFvDJK4Gb4TZg97cJokNjMDnQYP1WWk9e58hcAHDuOPRnFx8CCjLT2jE/nNeFyufaTSnOeBMI2zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrcgQUb6ge6QTqnyJWtBrr3H/LNNTNy5RxCgep4zYENTNlla5
	I6UUNSEHxwQ/D+g8kYQDvXBpD3L+s6QDCWPKBIPciKJY3xX5gHZiCuoEe5sZrFuab8Q=
X-Gm-Gg: Acq92OEl+9cz5eQK5RdBUVNaeSONEm7HQIAeRhf9ha6rOfMeYWUZrkOFn28AJE49N4t
	gDmLLUircqOACYhbkLspG7oNig4FA7aze0yn6TlEnCD9v9DilJpeNOC9LEkfL+dhZGyRqehbLff
	GkZiJ1w1p/VppMz47u0xiOaDQdMDG/gbuNh0FsmzLEx51t8hHdatdaQFScDq1jwCQJrCb/RPMCc
	o1R9IuAnl1MyHHF2HKl9RnWe2G1bFGBDtmdVYAJTZJ3gVsMHV3kQYRSy1YkoLpurEOU/Sd52LMY
	x5P80uXeWOMMbgeQahc+XtQqmf4gcfykeppzvLTHZdpg322STtMcsq682k8mcjdn9GnDjghMqOt
	wisjYMZk3+desYR7IOL1F0aqPcIl3a733+5ReBaSl4a0xiRKMcVMZIcWCBaEJjd/Yfu0x1OiLW7
	lIkmlkUN0WTBe7whiOorPn/cXhw8o7C54QvZLWD4eR3lJx
X-Received: by 2002:a17:906:5a69:b0:bc5:2352:555c with SMTP id a640c23a62f3a-bf3a841c5c1mr624677366b.14.1781005910578;
        Tue, 09 Jun 2026 04:51:50 -0700 (PDT)
Received: from [192.168.107.26] ([80.233.69.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553fd86csm1037260966b.46.2026.06.09.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:51:50 -0700 (PDT)
Message-ID: <5d6f1195a7ba54d41063b44d3907b7a22f620ae5.camel@linaro.org>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"	
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui	
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski	 <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva"	 <gustavoars@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 12:51:47 +0100
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
	 <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-06-03 at 13:00 +0000, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> the Google GS101.
>=20
> The TMU on the GS101 utilizes a hybrid management model shared between
> the Application Processor (AP) and the ACPM firmware. The driver
> maintains direct memory-mapped access to the TMU interrupt pending
> registers to identify thermal events, while delegating functional
> tasks - such as sensor initialization, threshold configuration, and
> temperature acquisition, to the ACPM firmware via the ACPM IPC
> protocol.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0drivers/thermal/samsung/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++
> =C2=A0drivers/thermal/samsung/Makefile=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/thermal/samsung/acpm-tmu.c | 651 ++++++++++++++++++++++++++=
+++++++++++
> =C2=A03 files changed, 672 insertions(+)
>=20
> diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kc=
onfig
> index f4eff5a41a84..bf9fb52e848e 100644
> --- a/drivers/thermal/samsung/Kconfig
> +++ b/drivers/thermal/samsung/Kconfig
> @@ -9,3 +9,22 @@ config EXYNOS_THERMAL
> =C2=A0	=C2=A0 the TMU, reports temperature and handles cooling action if =
defined.
> =C2=A0	=C2=A0 This driver uses the Exynos core thermal APIs and TMU confi=
guration
> =C2=A0	=C2=A0 data from the supported SoCs.
> +
> +config EXYNOS_ACPM_THERMAL
> +	tristate "Exynos ACPM thermal management unit driver"
> +	depends on THERMAL_OF
> +	depends on HAS_IOMEM
> +	depends on EXYNOS_ACPM_PROTOCOL
> +	default ARCH_EXYNOS
> +	help
> +	=C2=A0 Support for the Thermal Management Unit (TMU) on Samsung Exynos =
SoCs
> +	=C2=A0 utilizing the ACPM IPC protocol, such as the Google GS101.
> +
> +	=C2=A0 The TMU on these platforms is managed through a hybrid architect=
ure.
> +	=C2=A0 This driver handles direct register access for thermal interrupt=
 status
> +	=C2=A0 monitoring and communicates with the Alive Clock and Power Manag=
er
> +	=C2=A0 (ACPM) firmware via the ACPM IPC protocol for functional sensor =
control
> +	=C2=A0 and configuration.
> +
> +	=C2=A0 Select this if you want to monitor device temperature and enable
> +	=C2=A0 thermal mitigation on Samsung Exynos ACPM based devices.

If you're sending a new version, it might make sense to add a brief
clarification to the existing CONFIG_EXYNOS_THERMAL in that it only
supports (the older?) non-ACPM designs.

In any case:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
