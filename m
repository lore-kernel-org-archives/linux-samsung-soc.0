Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D1413D96
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Jun 2026 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572201; cv=pass; b=TBR+jQ/deASrraiycgAL/lrcDzUtqfBCwaCyaI/ytabbmb56YLeSiEH0urjKCCk0/7T1IbvmiisSTnfuyDmW6UjP8JsTtSWjmDKh0urdNLwr1nz8ooDLPH2y2sFiE7Yd3OK3I91eiWhw14Okg7ELFEExfVAVAza7wTZnjcWgDmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572201; c=relaxed/simple;
	bh=G9nFh7v8j7acwr3OyC0fVYembfzlnZt3C5JR+74mpZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7B2rNmMVFAJC1Q9fZ/2LLP8WebTJ9l8zXsvDfERevcm1uU27WrsdqI90wWr5kjijFxkP8afm98yDTeB8/8vmbE65y34KPRQh5RPESp/SWspSwNeVuQ/mOPjgH9rzhWNsfgykRWn2IULedAa6BIgU+1whRbTq/Re4q1wDgGXRtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dvx6AsfG; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dvx6AsfG"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68c32f3c6d6so574115a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Jun 2026 04:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780572198; cv=none;
        d=google.com; s=arc-20240605;
        b=N55HuGFFhpCpVDXeMCkuKY1G3r+7jZtYhdVxFFzXUjqH3OXJlm8u6Jm82bYmCJWL/F
         5TuY4hjS6tL4Q3jlzLYygwhzhAd8+aDH3K+oOE2J9iiayxMuTeCI4SidZO5RJLrnX4kA
         GneFJW6HqfXWl/ZAYJ1v/6Ac7fmHcjXJ0eV39PkLgSYF6du9aLidkG55GOHjr4dThRgb
         vjf8Hn7YCnnzvN/r2JAJN6/zMVW6kwPtz4/TC4Y5FYZWZUGGgbO8HuddGL8c3rMUT6dw
         AP8SksWFLDpH1ajSapfSaLcCQgXJr8QYdRodusm4oV2wn8pfBj8n+l1EMg+ebzgSgfel
         jS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        fh=KOwhOTX4fUxegfPiDhyofutFSNZ0ZExeyj/XhIMlvv8=;
        b=dAWH4yiFv7ok2wAJioi3h3weM/e9NMmsIo7aL6vxc3wlXt8OhheGMBDQiaeA6sxDZc
         HJEqEEzek/tIIAubshkZ+EwRZ1iZdotQocK0ZKOUca3kMs2g7ejYAA8KlL4vo+o5sSIT
         e2M/aU+7ZiOjpiSHXoPaI9hMiO9KYuIn/Th/Fkz492ROMi3YZHLdbVIXMIJrA0p5Hsjw
         K3jIYUVFA4k1WwO/u6xWvRjKdgYDn7vPIbpHiE1xhQgV9m7OGaC2RmzSiHWqRETTNVuw
         L/oUqdlMM8YsKW4hEUdaNjzY91VAe4fShoMDLx7GiXWxEXXJmqjpBClr/+UTKq/Pmco2
         ax/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780572198; x=1781176998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        b=Dvx6AsfGD02bweAo0ZEINt0kOaCQzPJ1S2+optCdZlXmIr23h/q3YrAsWtupnJ7l45
         c98RGB5NER11WyEenOQEJiqhh0Iy88ubfgMHy7ZCJvzG2v1t15JKlK6T9311q8noIq+t
         CIZFHD1fklBLj0B/CUVGk6CwALZ5FSxxbvzILufg+xELUDVYcg7x8Dzt4jUQgXPvImP0
         asnJzap0HrzweOPVSCBiRJoqC/iBCnwf872TLf/em3etyORjPOjuF6gZ+HpaBwCgLQoX
         tRYik6X8LflxAyu8m7Z91oJSEuFcJ5WhN2i2BEU/P/RNYSQjh2eEM0nx19hgLjtmepPp
         Xv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780572198; x=1781176998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSZAPul0pXkxx09T12pErJ7HwDU4RDxf16+6acHgaAM=;
        b=OGzsn7W93tBDien/13OCdHOE6ZPTsXFQ5JZbfbUj7etYNp82LWLG/p8dMrpLjdBHhR
         6DipQqFP8kWTHwczydyOAiZN3bP70gnqd0hLKWqw6sNcQzTaLsS+IBiaWezrjmnXxM1E
         TVEf4w8ipja+Refbe5nATqZkr7qUYQcvhWubs0cY2K2xaf/Cm1MF8v9HAfYqx+wne6rJ
         MiYw4EqAIix7AuGcpmLSDMZSDxg2j1Em6yAgwb654JVeQv4dRMeE+9DxM6uZPYaH57au
         XWPVq+rDkhNqIA9h1HgSi5eZjO5hI/p7PEObcas/6EFhRMvKMOIQHxd8JEfYGIgaaWkM
         2jXA==
X-Forwarded-Encrypted: i=1; AFNElJ+4RqAYKTcVbRKLJq/KMnjDvKtVtl3BZC6DxFT4/D55NlANp1bkIV9z1WedvbXqKN2re4qxIo5v7ePiSAgw4UpzYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaD2iwcPN6qPhSS1YJpg76aVjHb40WYDAdwKJXnOEFKiCeFxj/
	6kcFbCDSJXmiQLinWIPfFBNP+F3qFNHI3zzi8nfYAi2uFeiPq/l8lBsGe7qvplqNgvO/nLaB3lC
	/XZwfpHi25NeDP6YBDvrsF/NzatEQt8KFmkg8TNjlHg==
X-Gm-Gg: Acq92OG3TR2zx4iAuKZdDcXg2IqMlr3gfqAfHC7KtmiNQOVIxzNxpsystMBssxPMrbn
	WdaqshXAz9bwUCoATJEzgiiLoqWjilG88xxdX7XCannwVanUW0O5IVaCab93LybMHEHruMWA0nj
	1NpjTIvkQTrYX6DIo9zaWVPi36n+gidsXjPoVEzKP1PcyLrUK4X3u8x/aQqU5LnEIQlz2re4imn
	6kIs6TGLONND6ZC844E6cGnUXBmnD+7G4fwTX0IrfE8cS1HjrX7PU4Jjwf+QJclTAxf3monWy5L
	v7inu/o2Pr34ILDW9C9/Pi/4O3VWIFc44s6OBNRk9ECa7sSh
X-Received: by 2002:a05:6402:3215:b0:68b:539c:d269 with SMTP id
 4fb4d7f45d1cf-68e710ebc51mr4043117a12.12.1780572197841; Thu, 04 Jun 2026
 04:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org> <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 4 Jun 2026 12:23:06 +0100
X-Gm-Features: AVHnY4Ia0mw8gm7Hj0ZlJv6TfIxLHonorNGMBp2ITPuIwQPM__6LAPjP3GLorns
Message-ID: <CADrjBPqhrnMv0xoMK+K=rMmd9jKAHYqFkn6y7EKoqm=i9o656A@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, jyescas@google.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 14:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.
>
> The GS101 TMU utilizes a hybrid control model shared between the
> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
> firmware. This hybrid ACPM TMU architecture is also present on other
> Samsung Exynos SoCs (e.g., AutoV920, Exynos850).
>
> While the TMU is a standard memory-mapped IP block, on this platform
> the AP's direct register access is restricted to the interrupt pending
> (INTPEND) registers for event identification. High-level functional
> tasks, such as sensor initialization, threshold programming, and
> temperature reads, are delegated to the ACPM firmware.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> new file mode 100644
> index 000000000000..75560ebca48d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos ACPM Thermal Management Unit (TMU)
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description:
> +  The Samsung Exynos ACPM TMU is a thermal sensor block found on Exynos
> +  based platforms (such as Google GS101 and Exynos850). It supports
> +  both direct register-level access and firmware-mediated management
> +  via the ACPM (Alive Clock and Power Manager) firmware.
> +
> +  On these platforms, the hardware is managed in a hybrid fashion. The
> +  Application Processor (AP) maintains direct memory-mapped access
> +  exclusively to the interrupt pending registers to identify thermal
> +  events. All other functional aspects - including sensor
> +  initialization, threshold configuration, and temperature acquisition
> +  - are handled by the ACPM firmware. The AP coordinates these
> +  operations through the ACPM IPC protocol.
> +
> +properties:
> +  compatible:
> +    const: google,gs101-tmu-top
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB peripheral clock (PCLK) for TMU register access.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +  samsung,acpm-ipc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the ACPM IPC node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - "#thermal-sensor-cells"
> +  - samsung,acpm-ipc
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/google,gs101.h>
> +
> +    thermal-sensor@100a0000 {
> +        compatible = "google,gs101-tmu-top";
> +        reg = <0x100a0000 0x800>;
> +        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
> +        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #thermal-sensor-cells = <1>;
> +        samsung,acpm-ipc = <&acpm_ipc>;
> +    };
>
> --
> 2.54.0.1013.g208068f2d8-goog
>
