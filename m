Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC5369964
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806942; cv=pass; b=tCo1a9LS7aI5Ak5G9jE6L1yCRspI4bDyGltqBg5KognceBMOxqTFwDkdYiCsXMUl1+W0JT7zcOL4rIVUC2Co9caqTFgfPljq5areX4SiTrHGdPjOnjdxYCX4OutyLT/Pk94WRQAWQOCD8xfv7EkCfkCTR5MTABfz94AH2XjIlwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806942; c=relaxed/simple;
	bh=asPIn/f86xwbt8KjfFnsZWBynaeK9J7DlOKrjInPb7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBicQe4MhLCk2xtqWLCIeYEeO7eY6pcvsBISLipIr93QfbitnpYskDJASUt0UT/cviHleLjtXK/McvDv8b9tlPyIWfs2+c07sCI9hQJ2bVhv66c9km+TcAAUwe169H1Teff9Vtmo/waF7i7vbq/vSElFb5gJsK1XVH0rr9MSkRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PVLD/KKQ; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PVLD/KKQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso2366561a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 06:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772806939; cv=none;
        d=google.com; s=arc-20240605;
        b=SO7aK4cEJIBUP48adI1JPeDz3AUzCPj+Z1VyrGJrqto5b8V9kkH5qGhM9YE7W5bf/u
         X2gWEjIVpkddx1SRvACBiQRF0weEMcfYyw3G/bYkRvhnogtq+qAClpgoT6AyBwpPp1+E
         FyapnUO6+KDv5jcHYcV6Q79ypdsRzeTgeBAHaofMVVSmXi0gTlZQaogJgpJ83SveG8Dy
         qzf9dNwV+mLDC3urB5ADNEyQHdS6CDhjrMt1TY4lQfyJwz29bmEtrT7Paj9cIIkkPyD/
         b/ycXjfVxMtxb9yFmJVXL93ILGNzfcuP15yopws16GEvx/dZUHdfwrt6jTeEBCPPJyCm
         LrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V6ojT6B2pOAcNJA8AKYZusnktwWBE0CvG4HxrGkb5jw=;
        fh=kYSmTCe4dVTJzgMSbu3BniYisKI+RRLHE0kLMAduZRI=;
        b=VXk2g8ExEb9/QT0+ftdJQFWvgmnw4mvlS/H5pN83zq3OMNjv1Suf5QpNAFeLY0V1sh
         /2THe4hMsDV3AmSju0HPKeEN3bnNHl7LCN53fQSW8DUWReuDimmlAeDROTX1N783anaP
         dgJ68OVrmqKRmrY8A3Bppejs6p3rDAIr8BNn1dNdm3WU2yYLGEFaFYecHf63Rx7lg1I4
         8txjVHf7c+i0I/2K0fx+rIZ4tKiq9NaSA0A6so3CquWc7jeUG055cJxypnUyS5EhF0Qj
         Pv7G7a6pKl3+4R9jDDT5gfnxiHfQv/OcXKmSG0Ki8kifex+VFS5bjF8cO3oubpr9phUX
         G3fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772806939; x=1773411739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V6ojT6B2pOAcNJA8AKYZusnktwWBE0CvG4HxrGkb5jw=;
        b=PVLD/KKQcY1K+ZMVH90gInGPHMohIGBcmoZomiOxL/sYxDdM6IhWDfPO4UFzoEzq18
         pHrN/gQLEZU4/+c7dVixVnk2mJ8AbSg4lsCwEuH5U67UUZ5ijIB0d4/Rk6+TEPiEcc7j
         auLdxHvYaqW01BW7a9kv9BwIXjTkR0LUFj34pyR3BguANuT4M4uXf2u+iUEGNYdMyPWO
         JSXq6TgXmqdQrPCrU4VIJP+u+Vdjh9WJ6cYfj71uQjk2sp6XKDXwbF/GeWPiBLOYmHfJ
         BjMwXcEPTPh5qXqDS5Gn7SECQxMWxne80I9xci5aA/qP3fjhln1bH0VrfjblUNc0jZ9e
         nR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806939; x=1773411739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6ojT6B2pOAcNJA8AKYZusnktwWBE0CvG4HxrGkb5jw=;
        b=MG29KLRCJotAixf7bAzFdEth+rniaNJfM89XZ5ZqbUF1KCdpdVIr5jhNJxwKn6AJCJ
         POqqjxPKH6YHEU60xM95M8SuYN7NHuA60VuAuOG1PuDvQzna/9NEXv+rQk1isGrIFPfZ
         eZY0Ixu00GeXnbHheaebFK8LMt38btSkrWPOcurdtMIIP9BtGI85fsIZjjVNfVGNwTPs
         WpJBoeeuJx3LuHpUiLu0iN91KAiQNYLkpJRNnEY79tHgOqgUheuH7x7KmP6MpQX3z5Hh
         ZUeJ5ZYF4lNZkk0e+ouI3I0x7OPJKD7C+Rf5EKzhBFAEvipe0nw1E9FgeGZJ/076hALr
         /h9A==
X-Forwarded-Encrypted: i=1; AJvYcCWYw1LPw0WrwKRC0XQdaKXhiPZzFKVu/+M26gEOOyY2yiWen/6r3Pi9O2U942HxZoQ7+GxHm9oZOZDoI4pfxtnhdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy6KTq8m0lp8Naq9KDIHBpMvDObo/Uqr0v4kkW0MiYUG3Q5d5G
	fSG/QkdojdrVqzSLcQXEgCxcy2ijC+9WjttK6YRdMQmeFdCcwaR3277P73lHs5ed5GDmd2H0+CT
	B2H8Ao40+r7ObwtyWgiVzGHLgmuTD8WzK5rEtzWB3Aw==
X-Gm-Gg: ATEYQzycw5F9RAfnmR4AFwmgp2I3sM4uhLAtlIj8chu7/Cy9o/hPKcQiOv8VrCvT3O/
	Ut8KP+3x5/mfcc34/F7vVv/ASmP+15S0qv57Af1WT/O66ViuMFMxHu+u5x/xPQBsvtNIqotEYGq
	aTVLBXGFAg2J39U1P3+W9Kc10AgNlSnO1DRRk3Msz2E0EtRhrxIPTTKQtn0TL/MzvIZZ9nyQrfs
	JufdRj7eBjWK8POt4QsOj9TO6eHSrGSFMrV0n5P7HWkbSwn+FbWko++WaAw+2wqErb8HrdD70Ek
	j93jZMmL9TIgVQXewxEd2Xng8yH/KZLwBC69ysF5zw==
X-Received: by 2002:a05:6402:13d6:b0:660:f1a1:e8fa with SMTP id
 4fb4d7f45d1cf-6619d51f8a8mr1194732a12.15.1772806938879; Fri, 06 Mar 2026
 06:22:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org> <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:22:05 +0000
X-Gm-Features: AaiRm50tjNf_4y_LSd43JUB-JI4HV8BibVu6BzHdRNYQHYI0j8IJYTG4MdR3kHI
Message-ID: <CADrjBPpfSLN9A7jjxiVSYL_5__kZmxdP0H6+UJiK563KpvxTLg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The GS101 PMU interrupts generation block is actually a standard Samsung
> Exynos IP block found in older SoCs like the Exynos 850 and others and
> not exclusive to Google SoCs. Thus, renaming to
> samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
> directory to reflect its origin, since Exynos850 predates GS101 SoCs,
> and preparing for adding Exynos850 description.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

I'll leave it to Krzysztof to decide if renaming/moving makes sense
and if there are any guidelines/rules around this. From my PoV it
seems likely that there will be many more Samsung Exynos based SoCs
with this IP than Google designed ones (Google SoCs I'm aware of with
the IP being gs101, gs201, zuma and zuma pro).

regards,

Peter

>  .../samsung,exynos850-pmu-intr-gen.yaml}                              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
> similarity index 80%
> rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
> rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
> index 2be022ca6a7d..f9b40f3fd165 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
> +$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Google Power Management Unit (PMU) Interrupt Generation
> +title: Samsung Power Management Unit (PMU) Interrupt Generation
>
>  description: |
>    PMU interrupt generator for handshaking between PMU through interrupts.
>
> --
> 2.51.0
>
