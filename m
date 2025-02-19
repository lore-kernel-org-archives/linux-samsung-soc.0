Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E317F1B87F4;
	Wed, 19 Feb 2025 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952359; cv=none; b=AyLkEb94OovgOHgySarSHlwsmsemFf3ZgLPXV4qypw2CL5forC62ZDov9mnxdgptosB6HhrR+L5sx0GGiDTqDBGTYn7JV5HqFgoUMvJCrSJGXOeHcLVAIBQo9DNCbPESjInBTAVZGSk1wJZYQAk5kHh6D1BkA3npWsh3/ZpAyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952359; c=relaxed/simple;
	bh=mjCUzREEp607MSaIY9+burmTdQYRMJRZfKMZFQK9qjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRpEHFW5Ux7QYNZDTJNfMqmYd3wtVqWaEr/H7hlNwlZV6GpyUfXMtgP+YO28pCmIx/5K2kjfMw/+wwKF5VN4E/ui07OI4Y34g/1n6vjlKf6BUXsb+KtnteDAxrt1TwiRDb3SiGAgE/OyIKRrm0FmMQzURrwCv0UjutPTb5yLdpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtTs7k54; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtTs7k54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A40C4CEE6;
	Wed, 19 Feb 2025 08:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952358;
	bh=mjCUzREEp607MSaIY9+burmTdQYRMJRZfKMZFQK9qjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtTs7k5448c55/qTkprhKuOd2Qy3r5GNrqgGlI3kmpGlLZauRS0NkATXtOr23HMVF
	 oQv7yvc3HvB+7UwiknxrUblX+ci0rfWpcvSgff6Oo8/RpQl3SwAN9H9obgkP8x6r+z
	 YsBct4IZ5DzMQ+OUvPTVsPsJuXSLOElcyMwi+/lEYITH1jeR/3iiDJJVoJLzt4v2NF
	 GrEbwq2RWX2ALB3lRyEpGig0PpiGPmxmTyLkeSS0WR0jO74JDap/ZzYw7hoy4bOb/b
	 9C5DnzJRAxpGTp3xHScogUvHC6w+MqkDBrHTi7Wxs3dCCxZ6874M6KpSwnEphYyVlO
	 uw7so1h4DQJYg==
Date: Wed, 19 Feb 2025 09:05:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: document exynos7870 clock
 driver CMU bindings
Message-ID: <20250219-competent-bullfinch-of-justice-09cbfb@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-2-0d1e415e9e3a@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-2-0d1e415e9e3a@disroot.org>

On Wed, Feb 19, 2025 at 12:20:29AM +0530, Kaustabh Chakraborty wrote:
> +  Exynos7870 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. The root clock in that root tree
> +  is an external clock: OSCCLK (26 MHz). This external clock must be defined
> +  as a fixed-rate clock in dts.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'dt-bindings/clock/exynos7870.h' header.

Full path and drop quotes


> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos7870-cmu-mif
> +      - samsung,exynos7870-cmu-dispaud
> +      - samsung,exynos7870-cmu-fsys
> +      - samsung,exynos7870-cmu-g3d
> +      - samsung,exynos7870-cmu-isp
> +      - samsung,exynos7870-cmu-mfcmscl
> +      - samsung,exynos7870-cmu-peri
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 10
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 10
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "#clock-cells"

This goes after clock-names, to keep the same order. No need to repeat
old mistakes.

> +  - clocks
> +  - clock-names
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-mif
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-dispaud
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_DISPAUD bus clock (from CMU_MIF)
> +            - description: DECON external clock (from CMU_MIF)
> +            - description: DECON vertical clock (from CMU_MIF)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: decon_eclk
> +            - const: decon_vclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-fsys
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_FSYS bus clock (from CMU_MIF)
> +            - description: USB20DRD clock (from CMU_MIF)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: usb20drd_refclk

Drop _refclk suffix

Best regards,
Krzysztof

