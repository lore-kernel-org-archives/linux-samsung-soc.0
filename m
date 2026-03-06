Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0C33AEF40
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809216; cv=pass; b=AmYuBy+gg/2r+379FGaMuXtamoVtzJo9YzyJvBaKq67Hv1AJpsXFbGCpMyJqWoOuOkuZULKsGdsAON+M2t9DwgjZWrPUq223Dlrqf/LvD+T1biGmOn3lxOey2PRQxYTmKzay9vxZZIFvZsFQJtBNz9/+x/Hg256FE37Di+JSKkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809216; c=relaxed/simple;
	bh=uura52BWg09fTSKw/snQHdZ0LDso4ffMBuCWX5PPr7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Er77iwbD+GGYzn5Yf5C7KByfHg7CAcdYE1ODu3m8i8RkvcaGqo0sqO3W3j3Cxdj0F1vU8Gxi9ihxSZHlHZwQzq9tgh86tl7CF03VlMTgMsMu67erpzphRPnZ+b0JE/A/f9vKE7zZWfr+mabDuSRQ22ZLJSZyEjI8zlUyRhejYbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E06WX1nX; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E06WX1nX"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94dd06a96easo5748429241.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 07:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809213; cv=none;
        d=google.com; s=arc-20240605;
        b=UFNK+uqGsC0DK/ZDmdM02G2HMwAruzPcyPtmZfVz1y/KrOmC5aYFXz2e3aow5vxnXJ
         flXsCJ1dK4AMJ2Ytp2m4QJdqQ99NgRZctLMI5ifI0KuF4JS4SCutUOJ9dbXXyqOI8Rhy
         7moZ2ehSYoC815ylKuphAlzpQX0x04Fg2t85yDZmWits/703VHhUXO9FMdUA5KD/82xa
         i60DTworL2D0oHfb9CUSjAI4MU6vcVa3PefVF52GsTgR+RwvzZvP0xh1qt3GLvuVANJ8
         747Hq2PtuUHjV/0yxdPM4gTKVUCKWZ7mi5JQLeLrp+xhbeIli7OLqlgGyhzS6eFnJwPI
         59Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J/Bpufq2xekGRgCcsd2+UGC/FPMgrs977MI+bXws1l0=;
        fh=k7sPaHHhL0iujXeDFzwz1/ZMoSB39ySqCgJwzfRxyOM=;
        b=NLTw99QZEbeKnx+aDOydvLbDHqTDGR8xuWLPX4Gq8K1EHB16Wx7IEaiO+L0UY8ngZg
         Qf0N81LnAPZYm8VbZ/WNGJwdK0gaDBtLYtEan+2Hbch8onqX2ppbobktvx9fxpl3o74z
         N9YTVhSr6ais2HNXPdiBCRy3a71ObkTDv09D3B6bEUHXHQZ9lddDD0U/evaOHUmT+6Jl
         KThW/gR/pXMEVU/homAfTNARwoqQTXS0aY14jhSrXX5qnShdFzg0HTr47LMe00uwkrEb
         ESK3VZH3SHweczCQ6cnOnheX7GYkXbg/r0kgiLPvQnWeETG/eQNt3ESM9dOiowFTvdVU
         u/Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772809213; x=1773414013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/Bpufq2xekGRgCcsd2+UGC/FPMgrs977MI+bXws1l0=;
        b=E06WX1nXcE4hSb9+D0BmRGd/uAqyLIZgN6gvpJqj5a/f+JLIIW2kWq3H2y12V2b4hE
         r4g5KVl1nfm6MNV5KxhXldbLodtTKzM811zXErjwFZRVkgZwBvBo73/w2YEJes3lPvIB
         fFzUyDuAgyEaxi1cv2LYIOcwLFEfZ6RoPOlh1S4CxZ3bPzZvhlWpBJd+BQJkVzTqSrEs
         GxhGjK/sIJtI92LPhKc8EpenM3WAUaoLRgMqph6LrryY8VEOeHe7eiK8+i3R3VIFcKY5
         FVVTcy19mM/6CRSLHgeAVJ2D0ayvP8Tsd72X4yg5WI05f2MwLwmnrvcnNJnGus3/Fiq5
         HZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809213; x=1773414013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/Bpufq2xekGRgCcsd2+UGC/FPMgrs977MI+bXws1l0=;
        b=Oi9rhp7bMV3xK9XBXw8ofiYQN//bycIRUMSRBYjuqFkiI7jkDtAYxzp3UD0M6KzXH1
         r+vDqeuNnaT+ieUFcz/ds5x0Eh3LaJcxtDHY0B934YKp3Osse+hBy3qUfsTj56QMG4r7
         HVv0rZD9UtJbq5bHM3v2dMlCjfmWckUxPDSL4lJjwi8LRWw+mrbJHKIgD1RioGKhwS2Y
         Zv57m6A6I9VBIoZAMkfpG8/89vdJQfU06l3MtDpqkDj6ZMOJLAdnz61h/fYSpBST+D2n
         sHoTugRZSuuXXNGyCudZah5Q7Q5tuacngadDn7q96sWgnN5/LRTtUakca98gKRV9vZrq
         LSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9XUmiOPGlWqtZdyNxrj568br6UZv+3S+uEEkvMRtzsSMzUKrf2J8o/yiJZe7+ZHUIsOydda5aszyu96A+CXkrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXuyFVIokTmX8C6QMGGEEdOZpfNLDLpGMaK7KGe6pTj8C8+/D
	9rhHm0EWZYE/XDFVyXPa/wTMO/OTwYQLPAqmIoaUuL3vUd1hmFL/OswHCBoWoV8sM5R0cQQHMdm
	gwhu5gnRGKNfkwgbBrilDSM0hKcmOG9TjBJDQNRDsBw==
X-Gm-Gg: ATEYQzxYJu8XaVZup5Xr95XfRvd6BIT0E7qYugqBVsOkjYwzDSpfBjkNWSDqo/jTRt6
	RyEBaw03HfncmC2B49jPT/tXt7fS4nVN/viDCzRSc7gEiXTQf4PscXMysuCBllBYJwqN2FCv0s5
	QMI2ViuJdATJXARpgGeEJ4sdrsSHhChpusbLj78ZGJlljN6cyjOPIewB9HD+OBQM0O1uhg8/w04
	ezcwJ26rjPpqlLof77mH3m6VVY2TnUqXUTL35cX+k/rEPMAJnO9IU3NYh3v3aII2VTyUTWi1ZVJ
	Nh2ro0HZQJuKtq6cdCrZcxk8m3mkIUyEyH3zS8bNPQ==
X-Received: by 2002:a05:6102:4194:b0:5ff:b8d8:b40b with SMTP id
 ada2fe7eead31-5ffe5f5af96mr976076137.11.1772809211966; Fri, 06 Mar 2026
 07:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-3-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-3-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:59:55 +0000
X-Gm-Features: AaiRm52iLKW20Iji1D2QiNvWLmb7shRdq2i6p-ERiHTNgGNSGFd7-_UUwIqk2YY
Message-ID: <CADrjBPoN65zKrgZ-Hm7exbPK6-7DMSwUKjZ-zvkg_GG3fhn-jQ@mail.gmail.com>
Subject: Re: [PATCH v7 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
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
> The gs101-pmu binding is going to acquire various additional (pattern)
> properties that don't apply to other PMUs supported by this binding.
>
> To enable this, move google,gs101-pmu into a separate binding.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> v7:
> - drop invalid tested-by tag (Krzysztof)
>
> v4:
> - update since 'syscon' was removed from gs101-pmu compatibles
> - update since 'select:' was removed from google,gs101-pmu.yaml
>
> v3:
> - use additionalProperties, not unevaluatedProperties
> - fix path in $id (Rob)
> - drop comment around 'select' (Rob)
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 56 ++++++++++++++++=
++++++
>  .../bindings/soc/samsung/exynos-pmu.yaml           | 20 --------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 57 insertions(+), 20 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> new file mode 100644
> index 000000000000..a06bd8ec3c20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 Power Management Unit (PMU)
> +
> +maintainers:
> +  - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: google,gs101-pmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  reboot-mode:
> +    $ref: /schemas/power/reset/syscon-reboot-mode.yaml
> +    type: object
> +    description:
> +      Reboot mode to alter bootloader behavior for the next boot
> +
> +  syscon-poweroff:
> +    $ref: /schemas/power/reset/syscon-poweroff.yaml#
> +    type: object
> +    description:
> +      Node for power off method
> +
> +  syscon-reboot:
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    type: object
> +    description:
> +      Node for reboot method
> +
> +  google,pmu-intr-gen-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to PMU interrupt generation interface.
> +
> +required:
> +  - compatible
> +  - reg
> +  - google,pmu-intr-gen-syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    system-controller@17460000 {
> +        compatible =3D "google,gs101-pmu";
> +        reg =3D <0x17460000 0x10000>;
> +
> +        google,pmu-intr-gen-syscon =3D <&pmu_intr_gen>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..09368dbb6de6 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -12,8 +12,6 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> -      - enum:
> -          - google,gs101-pmu
>        - items:
>            - enum:
>                - samsung,exynos3250-pmu
> @@ -110,11 +108,6 @@ properties:
>      description:
>        Node for reboot method
>
> -  google,pmu-intr-gen-syscon:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      Phandle to PMU interrupt generation interface.
> -
>  required:
>    - compatible
>    - reg
> @@ -176,19 +169,6 @@ allOf:
>        properties:
>          dp-phy: false
>
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - google,gs101-pmu
> -    then:
> -      required:
> -        - google,pmu-intr-gen-syscon
> -    else:
> -      properties:
> -        google,pmu-intr-gen-syscon: false
> -
>  examples:
>    - |
>      #include <dt-bindings/clock/exynos5250.h>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 611fa8fb9f8f..6a00d97ccd09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10884,6 +10884,7 @@ C:      irc://irc.oftc.net/pixel6-kernel-dev
>  F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  F:     Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
>  F:     Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.y=
aml
> +F:     Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yam=
l
>  F:     Documentation/devicetree/bindings/soc/google/google,gs101-pmu-int=
r-gen.yaml
>  F:     Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
>  F:     arch/arm64/boot/dts/exynos/google/
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
