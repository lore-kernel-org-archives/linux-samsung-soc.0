Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39100406297
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554479; cv=none; b=PPM6itnImzSF9hAvUrN0LWRUpEnyaN6Fj7pSkRatPbn5yC9m2PJcP1M0xpPynoRw8c7H/KUfBOetDyDr+Utyi2xh5Q3HJQeWtB1qJqg31V3BWuWlI3EKOA83gAHwr16c1ligjf4iqUb+fO9ZK1bdBQFywYt1q5Qxo50/OsRnLGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554479; c=relaxed/simple;
	bh=KhRQj+iRqtW+9HWFZenOFSuPZ0WQQSN49Yl9CqgIP6A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FZGOx78Vro99k6JaRur1ymmE5+B4gu71Y29WIekhiNFHUY2q95OvoGh+sCJ0hlKnoaWwoa0Ch6fqb2kwo3s0fy4lytiz1YvdvAAWYzDUTwn9PtvY/rQa1gtM2uuvMotNR6VkeYLdltLZvCQuMbLDOBa1JheOe9r5o+QKNFbgF44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ttx6BUAe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ttx6BUAe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so12378185e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777554475; x=1778159275; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvDuNaRN8hH9izY7kpqOKXTCHfnDxHlyvhuaEy6Gtkk=;
        b=Ttx6BUAekpqaGc16Ygjpw/uU2dRApAkiv3xEZObvHlcKWC5otMLkdORqENVRXZaJxz
         0pnBJd2FuVIZXxBe6Led+GIDxzYGoTlSaNE0NoaWdbAR/6KMvzfuyk8cHWRCBd1Rsi/A
         0XrTFrIlAoRVazq3ThcTRMFZL3SWuRdrKPmOvftVEexLSEYzEALy+Vx53YgRzAjVX27J
         FZj+iDDY1EvD6un8sRQ94LWTNG9Y8ZnFD4OCfD/BsXH9v33Yyf9t/TRX84c9LdLEwLwJ
         DauQlxuv4zVHq4ZwdxE995o0BvgMbE+cseFlc6S0XXQgXh6KRUyR7AUPjQjwoNj7jAwz
         m4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554475; x=1778159275;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvDuNaRN8hH9izY7kpqOKXTCHfnDxHlyvhuaEy6Gtkk=;
        b=pLv/WLUwVTQ6IQUoAMqDA4pWEfiPVBBsxhqN021vT6vYP9Na2MNbSynnQyZ0/o3WJA
         maQ1GEiglX0TUwWiKBzRt/DHd+sqpK4BJmFZ7eOTzsmCbjcUbK/B3CRkFwdHMAwrmeJQ
         2t7e+cwbxX0s5nL97cJTCUspkvGEx2WYq/5EzUM+NnY2ME1lbCNHlF2Lv7Fh/olQ1KaN
         m8OrkbCfnfB8lzo2/tvHkkCe1TMrN1VRX7VvVTgNG5zr2BRKisiClx51U6/o0jYOT+pO
         96UMQZFrAR+Dq4lp1b/f70u7A7/NpTacKSM5mcuaN1fnH4olXNYIbn/sjzpI2F9gfVhG
         xgQg==
X-Forwarded-Encrypted: i=1; AFNElJ+NqKUJr0RRR0VFu7ZTUWkdVo5fDswfJUuSi1QeN2x8ezIfL1jzpiI2eGGMVC1f1ier5jnVud1DtO3YeSkT/8yv1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2R1IDlKMZ03tS33wBtJgs5Bh2XNcUgEpaRPMcMny6uHkLh1Pf
	LIk1iu3/3HbwnWDUFnmahGxTybOlfAH/OlP9RkJgG8DvrSVzMNpCdd6AyNTiRx7MHYA=
X-Gm-Gg: AeBDieugicKosdNqge5bGI7agScHpDRDg2gJirAJXrz3+j2eJW1viioB9c/YdJae8Gu
	/vFuDhAs0aY4di0KMS636ekT5IOY9mvnP6zYnjFrmhYcqN1yUWAtT2iMNcFA9zjgizZJ5uSqqCN
	tVm1LCRKEVNc0EbDRF3sReAGNgrEh0hXK5ts6F39vHVQs21YVbXXpx3cXaqDX8Trz7qa2vtOWra
	vBbLdcgKZJyrcvikbCWKSlEGAOQZUs6QtDeMZFMMO9taEZDgzInR+TikIaj3pD+MsnFGaQieMid
	LpHhqFS03aWmHCKqtM6/7SdkBn22KSr4VL0yH8fmBlX6xlKxOa2Q9cJn9Bsu9tQVu2vBgX9z1v2
	jewtytw+lqKyLYhogjmOkO6+Dt/MkVwgUOMK035wJw5DmKQBaMr96xZueRgaZxVfOpqGcv4dI8h
	FhPq1Qt8/PVCS7zX52Y3fBebV3VTWkfNoFOfkyBq54lNQU8+pJTnDKMf1o45iNltHhjxEsbWekA
	MFy1EO8pyUXH+H3HvAMA8LeNw==
X-Received: by 2002:a05:600c:4b1a:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48a85dc37c2mr23717425e9.0.1777554474275;
        Thu, 30 Apr 2026 06:07:54 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:b0e1:a8:4337:b2a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822d4a9asm71861585e9.14.2026.04.30.06.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 14:07:52 +0100
Message-Id: <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>

On Thu Apr 23, 2026 at 4:22 PM BST, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> Google GS101 (and Exynos850, autov920, etc.).
>
> The TMU on utilizes a hybrid management model shared between the
> Application Processor (AP) and the ACPM firmware. The driver maintains
> direct memory-mapped access to the TMU interrupt pending registers to
> identify thermal events, while delegating functional tasks - such as
> sensor initialization, threshold configuration, and temperature
> acquisition - to the ACPM firmware via the ACPM IPC protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/thermal/samsung/Kconfig    |  17 ++
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 547 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 566 insertions(+)

[...]

> +static struct platform_driver acpm_tmu_driver =3D {
> +	.driver =3D {
> +		.name   =3D "gs-tmu",

What "gs" stands for in the name?
Shouldn't it be called something more acpm-ish generic like acpm-tmu
at least?

Best regards,
Alexey
