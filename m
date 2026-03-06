Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE73B5847
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809954; cv=pass; b=uCk1XrnmRQ0nvmntqoBL3drj+wEjaP77moxdfRnITax5dvi6xd0ckb0afeLCNb3Be/yTNzmSzMUSJgHe4O+DwRvRiXhputkKsZTNLaKCr2Mo+IlDJ3Qagqe7VfgKzqvpilnRLTkciEVF8kaNJXLHm5kxMlRcqrGRTpZmwIm/PAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809954; c=relaxed/simple;
	bh=DJIrAPOjzVYlNzQFRb+nPE0bDvEsm0g1GvK4jt7OniE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBYs34odpQd6QCJdUH1aEsAUtm5j3C7+pNTR1vBGQlJnmzIIEoR36Lu9mdMjCtsvE0gAWMo5MnWj1CXkjZZZkqsHLS7TnYficOeBTFd4HvBFC17Ov1ro/DekBFmyX9Ed3UkdacU99JQ/b5BlNUb6AdPxwoj7c0FES6voAftyGDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QuYQw/Gy; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QuYQw/Gy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-661be3380adso729249a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 07:12:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809950; cv=none;
        d=google.com; s=arc-20240605;
        b=ZyVyo2ThtqDAu5+bXgmue+CSl9/nBgbNlKJ1mC3MT59fv5iX5tpLpjRSh9MHU6FaPs
         yIzAEjz64qVwFA1/LsJ57l41I6pPJUn0mCnFWg1l1L08gNGf75eLTM828nY8ShSJ2vEM
         IDSwF4IZuKH77UbSNYrfXemIVexKSUYUbKU2WofR0bfFK8LkCHBIBBn4cNjo5cVP3d7K
         aJrY0w9MfBhU1jJwLqsooQs80zM0Aor3LDtem+GVMzIPSMAyASCmzLkfKUkFTF9LmgRQ
         VxZR5w4QAZEcRCHtFrtaiGOSmJlUL9ZOpcdMDZm8YpniM+U8uAayzmaQbqOm4xQWJTSl
         H2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVem0P0AdsDnzJHzIyaxJZEVpAJaMe9yOv2rf1iAdzg=;
        fh=1w1+3ono9lfr0qi36BMz7UuZWOf+THXLb1M5wE56MTo=;
        b=D8uV9jrcaIWr3+uo1Q4FIqzk3b00yB3p2J+eQZPquFCJbVGcPJG0c3liKp2FM5xR40
         02uhNVvlKqbvuz/FkKRFliiTYTQHCVt6VMQDAwBPryQHcExUD7c4M31X710mamXTEnPT
         YqftRJUQ3exPco2P0drXRwaZ5il8AVktSlBSt5KJpVct5rfbx9mjo1CZEimbTUnBBhAA
         lOXt9GT1kJsvhz8u/xkOZvA/nNSsrc7avjKnF6B7GtZ5hqPHuwwGQCrzIn+tYZgO8u09
         U+mGCJ3gggpwBIuMe3I1SIWP0Vh/wQhNXz1XKz4+sgstOZRnfytuRTJTcImE8mvg2a5e
         TE3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772809950; x=1773414750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVem0P0AdsDnzJHzIyaxJZEVpAJaMe9yOv2rf1iAdzg=;
        b=QuYQw/Gyu/EpV7JIEcs3fH2Hrw9+w5z4nmZLEg0ZhNPjfI3rj02G13db+pu9ZB1Ni2
         RltXTC7qQM2cCgWjXNnjQnAUvgmWy8xjANpGJ19KusWek72cgD7+1A5m9J83K6POGXNY
         eAQMNjoYoHL0gjxU/E+cJ5wUs0R05blqVTlOs8bdIAe4Zh83LpZyUMlwWRtF7EfUXslf
         4qbdAm4+evuJB/cQgSvImPwLTVNYy1LO8jAIZHby/6x/jEehd3inUkmT865S2twyybb4
         Q1yils7YNUbBF233LoVDtq+0Fx/syiJJgla+/6LgjZuZUyorsHR60oqDCTfbvurSexQL
         HDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809950; x=1773414750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVem0P0AdsDnzJHzIyaxJZEVpAJaMe9yOv2rf1iAdzg=;
        b=afH6FikiNh3OH3bkt4IfW2a51aNpCEimnry+3+Zkys0OKBdEPh0hsAIyjlcWjJYefg
         HHZxQR2uyTeTTtDIbp1n9ovD7mx4M9GV1vqRWxo7IwzoFkonPsfLzRRgWMRT8wLm6ylS
         ZScOA5pdf2VwYmz5VENoel2jkKJdGEKtAIsvJlynspmW7g2uDQcjAq+V2V2Eogwz3rmc
         b0hFznC3puKRgY+0IQGMh4N6HPClLeAxBj22D0BtrWcxgc4eJA4Pz65x6HRbU0zY4JPT
         mBdAghHUQwQKQ67CGimgq2to56M57y6cpM7mTzaicYFtLBWQP7wxfGP51vlrxu3pnykI
         g2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBJoyIh85QeDsqsx/Hvg6UbMaIhTk2lzjVvq8PyHGb6pqdunIJtMDxIDK3LCVei8CEWU9eoOos7A+EKRYg9DZ8DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6G727cLVuYrPhhuPxQL35N2dWwzmJHEq8/I5lY2Hb0TFJtqGg
	7DA1O/0FXKtR9psmfoLvLDizkTZ0D26pfnQxNfQrf+aC+niL3ZEAqTBoKyGdXLsSQMn5/M6HVmk
	YUhtmkQPMHgxZpWs50jncneLFaifYebu+GJiciFLdGg==
X-Gm-Gg: ATEYQzyecSpuB6ATNJQhPunHJkDyT2OMRp1wmAn1Q00E3de1RI7vFFUEzLUe87O4swI
	VQisCIwmjEO7QGDhqePFJdaxox3i3yrEQmI0Pq/UnVyjpX1n7w/XuV5WILOqQGEBFcTqFQBJExG
	MZ0rxTlSBt982zyDcdOnev5PW8cGfWVF1vL5kzibVAefUMTJd/FgfzhinEdp4KnQzHbg2QgCZ9P
	KlMVuD2iWo4lV/7ehE/uihMvSQc+MlZ2X/LgnsgAqbEdS4Vit0i+Duv2ZJiNo+HXci5RrG/z65M
	TxxH0lk2tnSCt9PFKiOaqRTVBMQUIi/5Y/UF3vwHQg==
X-Received: by 2002:a05:6402:3487:b0:660:b913:faa with SMTP id
 4fb4d7f45d1cf-6619d464e36mr1481328a12.7.1772809948849; Fri, 06 Mar 2026
 07:12:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:12:17 +0000
X-Gm-Features: AaiRm50bC_Zr0ksut70Q7jUwSUCXTU_SK0a7CwA46Jn7HCchhyT2HfXFov7-djc
Message-ID: <CADrjBPpiFR-T5SgnOAgt9U279esUYkdVn21Yy2TQnMvrd3VNUA@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> v7:
> - really be consistent with quoting (Krzysztof)
> - drop invalid tested-by tag (Krzysztof)
>
> v4:
> - consistent quoting using " (Krzysztof)
> - add samsung,dtzpc to example
>
> Note:
> Because the properties added are 'required', this commit breaks DT
> validation of the existing DT for Pixel 6, but a) that's simply because
> the DT is incomplete and b) a DT update will be posted once the binding
> is accepted.
> It is not possible to write the binding such that it supports old
> (incomplete) DTs in addition to the full version, but as per above
> it's not required to keep supporting old DTs.
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> index a06bd8ec3c20..dfe6f87e5949 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -16,6 +16,14 @@ properties:
>    reg:
>      maxItems: 1
>
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
>    reboot-mode:
>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml
>      type: object
> @@ -39,9 +47,23 @@ properties:
>      description:
>        Phandle to PMU interrupt generation interface.
>
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":
> +    type: object
> +    description: Child node describing one power domain within the PMU
> +
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: google,gs101-pd
> +
>  required:
>    - compatible
>    - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
>    - google,pmu-intr-gen-syscon
>
>  additionalProperties: false
> @@ -51,6 +73,25 @@ examples:
>      system-controller@17460000 {
>          compatible =3D "google,gs101-pmu";
>          reg =3D <0x17460000 0x10000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges;
>
>          google,pmu-intr-gen-syscon =3D <&pmu_intr_gen>;
> +
> +        pd_g3d: power-domain@1e00 {
> +            compatible =3D "google,gs101-pd";
> +            reg =3D <0x1e00 0x80>;
> +            #power-domain-cells =3D <0>;
> +            label =3D "g3d";
> +            samsung,dtzpc =3D <&pd_g3d>;
> +        };
> +
> +        power-domain@2000 {
> +            compatible =3D "google,gs101-pd";
> +            reg =3D <0x2000 0x80>;
> +            #power-domain-cells =3D <0>;
> +            power-domains =3D <&pd_g3d>;
> +            label =3D "embedded_g3d";
> +        };
>      };
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
