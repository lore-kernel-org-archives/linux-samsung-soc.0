Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB86211290
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 06:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759212114; cv=none; b=LQjlgNRT1oDRFWtMu4HQ4OVIC0aOK7zz0idR9QOmBL0RqMfsbYm69WpVX5ZoJK82WWVMnOV2EZJCxtp285T/1MZ8PPnXbK0+9bjlrH20F8Msdd7TxWgUBazodme8vIxFO7HdPUV/8vJe2SZ4662FEX2LUg5BEPrl1acc7AKSwtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759212114; c=relaxed/simple;
	bh=tZFFRFKg0PUHDS6qSpNivs8Es7wMQjxESPTNTDMPml0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=If7LcnwSe8cQkg0szsgfVMjc6Kqqxb3ZQXlmaOyBrb+Jj3UdOU35kPgIP+3sOT4rrRqTp8AbpGwlyo7YLxMdtJDzfHfUjGNRvd4HDrugI/pRhbUtUteymGZ+y9wrPH4dCnEhlgR1s7MeooB4ACQz7V3EKOkJPRGjfMhlZBEEdG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLxhi1Cv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLxhi1Cv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39E0C19421
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 06:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759212113;
	bh=tZFFRFKg0PUHDS6qSpNivs8Es7wMQjxESPTNTDMPml0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XLxhi1CvzOKNDGiOPSiJnKK0WeN6K0SSaPz1FVlANT+wEp0VU5yXdizG65L3VNObk
	 8lbHU0vEXEjlJykluoK3Y2eWmxkO3keifks3tg6+iQustVWM2sgySl3y4YnwrEZajz
	 KxNNn19DFc/RfVgL9shJsK6MpsDGZLt7KJgJtuRqVObY9d/yIQ4z0BMtdv2Aozi0B1
	 2Y8S6HMkqLJXyi8ENAICuobWEUv6TYvLiWtszTCA09VtWNgAX1sgejIjsQ8hKvyYWh
	 +Z2+AEq1TTwSyyAnwIoIdepLBVKVLZSLORs8z1vnOBZ1X/6z9bHTUaUo+vq4wlubyx
	 PMr+luFX95Wbw==
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b58445361e8so2105634a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 23:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwS+SnBJKNFfZyRd5y09AV2g9pRze9oX9G+di6oDehxWBLmX9aAh5biHsLVlEaXwpVwi+1Yn544CBc3EoMq3H1IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAgI+mFa2cvtOpM/looNAiZFugdA72TPIPmnHcTdEtMuFIhoqN
	qrrcv28XLYYDU4slNRbd8hbk9FaL3ol7v7lNCQQouMDHAg1DnhUUxUEchU5DyQc3rD+bg+Lqw5R
	bGep6b9eAFKYORrB2iaSvg6U5O2sLdjs=
X-Google-Smtp-Source: AGHT+IErIwwKQvXadjo8YStieZUDut9jWiBGKRpZXkgYC3IZFhh1kNcaf5JtiD61ISPp+z4nkDRXWDsI/3DHVQYxgZE=
X-Received: by 2002:a17:902:f647:b0:269:aba9:ffd7 with SMTP id
 d9443c01a7336-28d1713873fmr34808755ad.25.1759212113208; Mon, 29 Sep 2025
 23:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-2-h.dewangan@samsung.com>
In-Reply-To: <20250930040348.3702923-2-h.dewangan@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 30 Sep 2025 15:01:41 +0900
X-Gmail-Original-Message-ID: <CAJKOXPcpybYa4hvVohkRVv5WaRv3ydK-BY4i3i5WA5fD07osoA@mail.gmail.com>
X-Gm-Features: AS18NWDDL4MOuOFlHqi4tRhQ26U6NLLMNyO6K7Q2H3O7rRfBNx3jEQQzLl1jkIs
Message-ID: <CAJKOXPcpybYa4hvVohkRVv5WaRv3ydK-BY4i3i5WA5fD07osoA@mail.gmail.com>
Subject: Re: [PATCH 01/29] dt-bindings: media: mfc: Add Exynos MFC devicetree binding
To: Himanshu Dewangan <h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com, 
	ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Sept 2025 at 12:55, Himanshu Dewangan <h.dewangan@samsung.com> w=
rote:
>
> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>
> Introduce a new DT binding file for exynos-mfc
>
> Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> which describes the Exynos Multi=E2=80=91Format Codec (MFC) IP.  The sche=
ma
> covers the core node properties, required fields, and provides an
> example snippet.
>
> Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
> Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
> ---
>  .../bindings/media/samsung,exynos-mfc.yaml    | 77 +++++++++++++++++++
>  MAINTAINERS                                   | 10 +++
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/samsung,exyno=
s-mfc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/samsung,exynos-mfc.y=
aml b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> new file mode 100644
> index 000000000000..fbed987fb9cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/samsung,exynos-mfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Multi Format Codec (MFC)
> +
> +maintainers:
> +  - Nagaraju Siddineni <nagaraju.s@samsung.com>
> +  - Himanshu Dewangan <h.dewangan@samsung.com>
> +
> +description:
> +  Multi Format Codec (MFC) is the IP present in Samsung SoCs which
> +  supports high resolution decoding and encoding functionalities.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - samsung,exynos-mfc            # Exynos920
> +          - samsung,mfc_core0_mem         # Reserved Memory
> +          - samsung,mfc_core1_mem         # Reserved Memory


NAK

These bindings duplicate existing ones, do not follow any existing
standards (wrong compatible) and are written completely different than
any other binding, which means you probably created big AI slop.

I'm not going to review this, it's quality is just beyond basic
standards. Sending something like this from Samsung means you do not
respect our time. You need to stay from scratch and read existing
documentation and existing bindings

I'll be organizing a mini meeting with Samsung on 13th Oct in Seoul,
feel free to join if you are around. I can explain then more why
wasting our time is making me very grumpy.

Best regards,
Krzysztof
