Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA772D7394
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763024716; cv=none; b=R16/zUqbfOmXVVhXPeLasDcvJe5itFCTi0lVBVIcLUoBL/sjWvF8CZKtKmLjBCnhAakkSbWZ5D7JMJlr0uIqjxGaV3NIBBGW6gnJGRlGR/j9CrWU9Y+pz89zADx+0V2LNwT+B0qKtf1K76NwuRl8vav5cqU8LwB8OOAO0gMrdXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763024716; c=relaxed/simple;
	bh=3UjOMsFb9kbRymmKpTR/5HYw4uxQJJRFpFEQGX6ehQ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=crJlQi+JCcb4Wi2vsebIZduQRfl46PsxE2oKYKfSnV2+oGCuDGH6odLQkXLmqL77/TzEu/Lruq7C1PI+9boG96b5P25BE0+TVslnm28ezUjm7UFUjh8+lTD/7O1eNciyqsCkJXuzlMZ8Sgp8c72gx7Zr4gbp9D3RNCn+RXU5YOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ETK0wmAc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ETK0wmAc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so6429255e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 01:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763024713; x=1763629513; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3UjOMsFb9kbRymmKpTR/5HYw4uxQJJRFpFEQGX6ehQ0=;
        b=ETK0wmAcq4nSLOjQOFfUeAkCIIl+h1s2voNEnzZWznsB18q5WDplOTjpXFmyueQIco
         Ohwhi3N86hVSztcZyWD2OVGTIZ8fAYs3zh/jcXjRaVzboD+cpV58BWFnxj2cCpV2isjG
         rzONsJPUaHwS0T6YsTT7icw9ggCIuCiYNmKwVroxnaIdiwRsON3fDMvMqwDSMDLA1FFU
         tHtDGeEBz2BUcaZ+GSYtjo1kBAq85rIvvRWvARVRyi1OrhfswUww7M5t8z4ApORijDkD
         yhdMdJliL5FhXjxUaQSiqT9nyDjq8t4ALjFV5Q4SRvLZPHoL4Uu5Mw5mvMGSeNJlOUFw
         bdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763024713; x=1763629513;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UjOMsFb9kbRymmKpTR/5HYw4uxQJJRFpFEQGX6ehQ0=;
        b=t0RgW2KsdHXHI3yEE6pavNYJc5UwEpHrjntg81MgTl6x+a1nRtPOMY/6cV3DFZqcvz
         CygFE6SpkhvOOsGRgqNAlRiyDq2jsZWQWteZmbfrvVUaxssewXagHbASmc9j/VYeHdnC
         C50C5iVRZ0ARmP5+AhTETus6ZY1Gff2kovZke/6TfT2kVMFULXOUWoR9DOsDKPisUgSf
         vg1ko7X9Tt39kJn1KCU/tIjhgziHB4Fv/7evnRoQPmIrq2MURB6FxlFL6P61WxUVFZNL
         lWwWENoLF/14aAo5VQVSb/oVB6MTZATl1z/hIGlgsb1Kakigvezg0JhtYZgMhJSW6Pdv
         rXqA==
X-Forwarded-Encrypted: i=1; AJvYcCXID3N4SeCal/YliZ8M0wIYmPMSTawdT0LAZvjgYdKAGDDO85ukgZGbXlQU5VY/+opEQqKwWOS96HMjb7J+OhDwtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2BGtuXiRk5HFLl+/6f7ljGZVjWGwLIux+xl2pVRhk94EJqqux
	gHfZea7oqIga0Ie9ENglKGEjJn1JkhZSnVLulUnkR8cvLN4FToV2l7hsu8MLiukf8wc=
X-Gm-Gg: ASbGnct2Gu7eMbF9WCdB7Dlw7wR+B880rAvyyF3yelPePlpI4QoMCWdAWMmBEi52/u+
	M8eAsSli9ic1IUIXppZqXeVRzilASd+UpRonUVJL6m6XyoZcoMAR8vJiEOMuk1sWb3eMoeNrNjh
	iSqM1UAlgMwMFAsS4/QrFmWYIh7dIXrkGfG+/P6FSDoiyBE2I6O0/O5RT1uzq7aWZlKk6+pmQGe
	cMyqxq6Vq7oiLDqza7kGyOQuOQZ0HlxhRu6qFL0EbwOC43ujIl2U9hqiWRMHvHVDbnsW/i+wDoN
	5RexhQ3oGTLx/nC+SAIXpqmWkJ3/OOxADusp0SwsmD9lPHuVbPEqIpEmBVDRq3r5076PcBFr4gE
	IifZo2vbGjbE3tL7o04nqySEmmt7+mjJoH5mowUl/SlKqjZQzQp7amXbQsxM6Fpng42G9+wsS0v
	6Cx8fd
X-Google-Smtp-Source: AGHT+IEtWoaffuaVTqHh20HuWI5Dpw76dp6as3Uhkrib83c8uxD8cJiQ4F+dYLKDixdUDUaZQUzkpA==
X-Received: by 2002:a05:600c:4455:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47787071919mr61751085e9.6.1763024713192;
        Thu, 13 Nov 2025 01:05:13 -0800 (PST)
Received: from [10.1.1.59] ([212.129.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f203afsm2532796f8f.39.2025.11.13.01.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 01:05:12 -0800 (PST)
Message-ID: <27a5521cd7ddbed0e870ac416dc829722f1b36a5.camel@linaro.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: nvmem: add google,gs101-otp
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Srinivas Kandagatla	
 <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski	 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter
 Griffin	 <peter.griffin@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 13 Nov 2025 09:05:10 +0000
In-Reply-To: <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
	 <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-12 at 08:29 +0000, Tudor Ambarus wrote:
> Add binding for the OTP controller found on Google GS101.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0.../bindings/nvmem/google,gs101-otp.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 56 ++++++++++++++++++++++
> =C2=A01 file changed, 56 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yam=
l b/Documentation/devicetree/bindings/nvmem/google,gs101-
> otp.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ea87216761dbab9a7a5cecd87=
a553a6a2a1783f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 OTP Controller
> +
> +maintainers:
> +=C2=A0 - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |
> +=C2=A0 OTP controller drives a NVMEM memory where system or user specifi=
c data
> +=C2=A0 can be stored. The OTP controller register space if of interest a=
s well

If there's another version:

-> if of interest
-> is of interest

In any case:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Cheers,
Andre
