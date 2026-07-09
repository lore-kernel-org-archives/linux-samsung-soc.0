Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4FE421A03
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600191; cv=pass; b=NQApQ+KgX9q3hEg8t82P0pJwx/tR2guL8xU/oJAFRb0PX6dM9WT1vvvmRAivsFugbpwqZ5bCVBc7RZ6g4Sr4P4Md5l1VZmzzY15Nw5w+zzZoq4/0Hv6KpZ1aL14o9Q/E/3HLPVihMCIm9mNmq4bWJueuOIKwQl0c7vAvqsCV7CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600191; c=relaxed/simple;
	bh=G0PslGe3kpFCA+8uA25BtvnVDVTOwMzK2ZCHyS7DQRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCr9kU2fcmVCWzCerZwUNDfuEP5Up0CjaE2ngJ64l2Zaw/b+5g24qgDkhR7f9dwtc+FX+HZsPfEdi1mcaSIOr5jXQDHy2Nvy/ctAY/ZzVlHz1jtWqlR5MMzGyFbPPtu0pLYMC1xAoWIvnHU6OMP6QapVrAoqueCRSFBAN81vPtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkQOnhR/; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkQOnhR/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so1186100a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 05:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600188; cv=none;
        d=google.com; s=arc-20260327;
        b=KjfofE2kwHVdn4+CKh4Pzc9b3NrQzcPDnVC2coO0CaRCSpQaTJlypcWTz96QbmH1J8
         W1NZg7Bh1JBi0bcriTWLxUxZ3OWlesspKo6R3IPAP1g0WctGGntqii7f++ryCL8KZLZW
         fwQ9qufUufxZYiuX6/mPQa4A8siuukmP9ol1QNDFRuy31YonzlLlSWiJVOT+JUr6aC4z
         zzgMreLI8ja1HbuVcjsbDUFe/OIalDIOEM0ZQwvCzlPyKucvrwEneT0lalggmURhp8Uz
         g7XcJDG944sdRwux+IBIyybZA77wedSg3OVFrrv9OLMzY5gCXsO3hNM/5cvGml3zSk0L
         TM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        fh=I6Q6lqadn8KgFVR5VgpllMw2wIGNYO98QTuJrgYw0K8=;
        b=piceirfGpOrqMyiX3oOHGHYX0l2+kbpUsI93CIBtRBkSgH+DcAcGZwZzVsa34q+Bb6
         nM1EJ5YL/aWsefsR6lZQfMv1OIa4Tfld1CxDxmMPz/NAPcvwgOqKgeRNlTLgpYzl3jOV
         DNMjHvWaSS7+IYaVAkupAwo7gKbQ1N/nD4qwdTvoSnQ7eqBzY3JzUl7pZHY+dpMf/SZs
         cLZYxofIYOixXMsJHfgil0EK0Wk7RjDJPVeyHKVkxD7VlIcLwZ/pa1i61STAzww0qZyC
         QmWinreLsSdNxksX15vPzxB/8iAOOBNuEe5iuIUf/4BFYz19h0/dOCoJyKBS5jV6SRS1
         Gi4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783600188; x=1784204988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        b=VkQOnhR/Ddqqw+wqT/cgWvKtcvTaxdqPtBeE34FXH54ESVC+TUiCOKcRczC6DJfC8Z
         xa7IxjSyjK4O6agALSuw5nGm/nx7pw5iqfJFyTdVW8vcsXKd7ymmi7s6nwF2r0zJtnur
         RniMKJRbgPWKjuYmXBe4Ya6hgylfzr8ssqvBRtPT9j5Nw/5xsQFkctGChmi9gdLSn3OJ
         M9ywrP0/EP64IMooBwbbluHgj67EAMykDDyiek0svAnuOx/mF/pSQeE2cMd4JYuf/6eO
         3/RKu+v62V49guG2P3Ah9JbWLuNM31qXW4SA61eCoFQxjs34g/sLXMHbf0aEqV4grSOf
         vBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600188; x=1784204988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        b=JQPugwsGaCAYL54u8czsCxSJjE1ZNp6sh1R5zgVVkUfYJQQ0go679G3YV0B/6IMIxD
         70tI2Qtonu+EEYJ3uxeq0rbJqEmvZ7cUByMiZOvCSLDFpfy5ShapzvHFJ1jY44n1IJ3n
         3vjU7tM3UczMVlaY3DzCb5FehcF8zesopsFhfg1pz9LsizEMukSpXgSdDvMXuxV6lxIz
         ywOVBrqmwS9/tDHQorvBvDnZ6RQS+LnUb7jglaQj4NgpePmbWBAQ7ZSJpE34F4Sn3H1f
         SGSNC04Cqy0oLpPwSSes3SbsTYiAfCXdb9yFiR30BL141khCNF1eIVrQPfEyGi3pSwbY
         om9A==
X-Forwarded-Encrypted: i=1; AHgh+RoVRliUZdRPr+phYWfkk9YxKn+ATzLYwpoPbtGGLjMdkYwQqoexdmRjfSihgyxYsOYdD9bKH7FBrZG18OxlTYG+kA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm9dbxqZHsfmRZpq9ihyh7yasa/z46FQpgp5wkSpJ+dRayi4ae
	MSGZRokQ61MWDE3Dc0SQuS2zOOX2aovFzRz2KwF2RX8FhimE+Qps9airb6Jfb76yXjt8cdgaQRb
	xq7uBz0bGUdaG6Y7vCiMW8uBvBYk7TTOUsoMNV2fS2Q==
X-Gm-Gg: AfdE7cnkZcbQhL5RtlzAxNgx9vNgvYJNxx8qOiDwhUeYVCiCtbPlJfgnCq+Wg+asQG4
	sALj3dwbuDhVmQY42ywSoXKkTNcObhAfeyDlJg5FRQ+evUUq5+QMULgyfff9hFe0ZDjs4AtBLf2
	16Dqv1pyRo9ONHP3iVmOfe2CRMMClSArLESfsargrTzOQMaxZ+2e25aq8GE8cBAUq4Hmsanh6HK
	HvIYixblUBnMXI8gD9XjruhOo3ckCHQlOSndO1V/Jfeth10chtIFs6gd3HSBYDffnZXzYVNU2jh
	fr9zufu6+xLBVuKOgiZcr/xSs8JZRLY=
X-Received: by 2002:a05:6402:3788:b0:698:3ce6:767f with SMTP id
 4fb4d7f45d1cf-69ab445dd6amr2888399a12.12.1783600187901; Thu, 09 Jul 2026
 05:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com> <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
 <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com> <49883bf8-1c7d-4708-9d38-07767b6b229e@kernel.org>
In-Reply-To: <49883bf8-1c7d-4708-9d38-07767b6b229e@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 13:29:36 +0100
X-Gm-Features: AUfX_mxLAIz9GenjSL4rKk7I5VYNpMJH1YlyVSe7GNzqspORApk7jhTGMyL-e6o
Message-ID: <CADrjBPq59s8A3Qp_RU_kabscafMZWUfEsGWNzKNxp0O1BSd4OA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim / Ivaylo / Krysztof

On Mon, 6 Jul 2026 at 17:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 06/07/2026 05:44, Alim Akhtar wrote:
> > Hi Ivaylo,
> > Thanks for your review.
> >
> >> -----Original Message-----
> >> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> >> Sent: Monday, July 6, 2026 4:11 AM
> >> To: Alim Akhtar <alim.akhtar@samsung.com>; krzk@kernel.org;
> >> peter.griffin@linaro.org; robh@kernel.org; conor+dt@kernel.org;
> >> linusw@kernel.org
> >> Cc: linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> >> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org;
> >> hajun.sung@samsung.com
> >> Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung
> >> Exynos8855
> >>
> >> On 6/27/26 20:12, Alim Akhtar wrote:
> >>> Add Samsung Exynos8855 smdk board to documentation
> >>>
> >>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> >>> ---
> >>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> index 753b3ba1b607..273464400477 100644
> >>> ---
> >>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-
> >> boards.yam
> >>> +++ l
> >>> @@ -235,6 +235,12 @@ properties:
> >>>                - winlink,e850-96                 # WinLink E850-96
> >>>            - const: samsung,exynos850
> >>>
> >>> +      - description: Exynos8855 based boards
> >>> +        items:
> >>> +          - enum:
> >>> +              - samsung,exynos8855-smdk         # Samsung SMDK
> >>> +          - const: samsung,exynos8855
> >>
> >> Is there any particular reason for using "exynos8855" rather than the
> >> commercial name - exynos1580? We've already established using the latter
> >> naming scheme as a convention (e.g. exynos3830 -> exynos850, exynos9830 ->
> >> exynos990) rather than the development model numbers, so I don't think
> >> breaking that will help anyone with the already painful model number confusion.
> >>
> > The reason for using Exynos8855 is that it comes from the chip-id register, which is RO register.
> > And in my opinion it has to be chip-id, maintaining two names is confusing (as you also mentioned).
> > Yes, there were couple of deviation but let's come back to the "original" convention (which is to use chip-id).
> >
> > @ Krzysztof, Peter
> > Any input on this?
>
> Back in Exynos850 upstreaming, my preference was the chipid value, but I
> agreed for marketing name. Marketing names are tricky, because:
> 1. They change,
> 2. They might multiply (two or three marketing names for the same die -
> common case in Qualcomm),
>
> That's why for Samsung SoCs, I rather prefer chipid value. For
> Google/Axis/Tesla the case is different and we should use their naming -
> some engineering name for example.

Using the chip ID value for Samsung Exynos SoCs and an engineering
name for ASICs sounds like a good approach to me.

For gs101 I also tried to document the various names in
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/arm/google.yaml.

Peter
