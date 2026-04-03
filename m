Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDB239E6F5
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Apr 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211466; cv=none; b=uXDmh3HvC7exfb0ggRfHX7K8b0yzsf07tMBGYfhHjGwJa8vcltvRSs7SH4S4qoRh4naZbEoM7r6J6ycxnyZjakssM0xOTVOaKIHDV+qhGKZahifzGBLuDY5CBKIEutPWsciHEB/O91q2ttrHLtrzZj7TMD+q1Zpukb64JrP1XVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211466; c=relaxed/simple;
	bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jmpc18whcu8XWT1+4h29aUnlaO18eQUl9J2bpYrH8j6xqEddga1dU2zC5AhbbKQWplZYh9uaKs2XBvOgxG8nYMnC+Sne0hqdYaMU6py91yC4zFIgAZbMQoMOVwfWIKy7iBYD8I4P2cyqJycuF5E6+N74fe+TS2mXcMC2MY1mfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDInQkxx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDInQkxx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d029f346eso1669227f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Apr 2026 03:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775211461; x=1775816261; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=;
        b=aDInQkxxkCYy0vyDhVJGYB38p/hCgGUxQ0BaaP3++gpOMAwLy0bAWC8wKjKuf6IRJJ
         1eNB5vJUUQlPdA3bZuvi4X4oS4TWlLw+UScaQ5qeTkq2vDUHiePR9wluVtqCSQ9vCWuA
         8uj2LtvbfPbe7k4ncMf5JkQOpEUy4Jc57qsnCNRzE+prgF6UlYnaDk/r4mflompe6C/l
         Xzafc3ZBfy31q1iWSJrdp03govsQUwrMvqlqpsRFCMJdshWqFZktFhe+YuOgG+JBXUgY
         GoMROXUYtYAWklQFA4X8jie6+Kw3Fo751h6eHZ+y0wCeqA+P9wNra0betG3CheRfl/Rh
         2Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211461; x=1775816261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=;
        b=XwrXafSYD78F273S6ZnECmR1C1Ps+Gd3IzleTpF4uPZLRRjdEz7RxbRBrqfn/qItun
         9TsvS5swfDsaykkYUtBchWDKcG2UI3RFgpUtKxCq07ZodRu4SZG0LhKbnncDitA8uc9f
         b8afgG2jp369pS07MsTCzI6QFZSvAV0haWjeOGX9nbG819vcCSkUNu51FfMghlae83i+
         9CZfVd5GV7MP3lJeogfi2gzYq8IxPBStmgJAzOobaOTNxVLaqW/VnipkexL/2Xu6XnQ7
         0FplJveoT6qZbpEnyfBHEhgLjRjc/lMyp0THXumpWS/Nlfdn3HH2Lxizc2MRVJ6JRduc
         qsfg==
X-Forwarded-Encrypted: i=1; AJvYcCUGY8YDzIAVD+8BEYuFkHB8RNEjV7Xy8vl02mqBlmIUwk8Ltqbzfy40N/yk2CfQz7Bva2PhHOAAQUx5u6xxXjMB1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEu8DB6aCy/tXw/OzCwNtX7fIXnFNEe3MnrxaaDaIT26r6jQST
	PE9+o0qKAC1WFjPukqtRknCKtIe2xf8d2gGxVDWE6tFnHWGNXP9iZmOI8yY9EN6L0xY=
X-Gm-Gg: AeBDiesBppESU+JtLT4kZRcQIrlyLXAAYvb3kjHv0mK5gc+NBqplVUM+0yHG4dGNFq4
	nw9qbyhm4vp7DmgBKL5l29Q2Ur7BuEplXh2g0DbjwN0R445hSOUdpiQhQ7K4xqetbjIPwsaQ3/H
	oUvoWYEwRRuoaLIs0kmfKCatzmbkDSkGUagXuUjl7oKFDRj7U0aPLHiTKTiyRS2GKsW8WsqWsRe
	W++XUTs1abpfTmdC8578HW/3CwZrgkZWBHsILwmtwj/0HXvJwYAlwFZlxqsfHLbjzVGVB3I1ash
	cGm83C0cPjQH24N3vNc6/qlyDaB8GiEf2Kmh8BNIo/F1N2cBY0kMbsW3gGE+eh64LcPUEfxesFh
	NcTX7Q36kXJsbE+kQqcRyEEUxcleq6CoGa8UEpKd1tLzLE/9JiBO8isA76wRMOjHxZg+T0as0XE
	D6BNrgLFMwZb2HoCY0VORJuhigZE3k
X-Received: by 2002:a05:6000:4201:b0:43c:f976:b8ee with SMTP id ffacd0b85a97d-43d292dab19mr3932897f8f.26.1775211460610;
        Fri, 03 Apr 2026 03:17:40 -0700 (PDT)
Received: from draszik.lan ([212.129.76.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm16791493f8f.1.2026.04.03.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:17:40 -0700 (PDT)
Message-ID: <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 03 Apr 2026 11:17:47 +0100
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
	 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Alexey,

On Wed, 2026-04-01 at 05:51 +0100, Alexey Klimov wrote:
> Some Exynos-based SoCs, for instance Exynos850, require access
> to the pmu interrupt generation register region which is exposed
> as a syscon. Update the exynos-pmu bindings documentation to
> reflect this.

You could mention that this is similar to the existing google,...
one due to same requirement, hence a new and more general property.

>=20
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/exynos-pmu.yaml=C2=A0=C2=A0=C2=
=A0 | 18 ++++++++++++++++++
> =C2=A01 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-
> pmu.yaml
> index 76ce7e98c10f..92acdfd5d44e 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -110,6 +110,11 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Node for reboot method
> =C2=A0
> +=C2=A0 samsung,pmu-intr-gen-syscon:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to PMU interrupt generation inter=
face.
> +
> =C2=A0=C2=A0 google,pmu-intr-gen-syscon:

Please keep alphabetical order of vendors.

Cheers,
Andre'
