Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C722A1D2;
	Wed,  5 Feb 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744857; cv=none; b=fa7zhw+5EC96ycFRrz5UKTXc/qDw0t46yK8CE+t0fbILOk1+h7OT7OTGiATdCVTmjJ9kk2m6iIyqyWrDpZZIxWcw43pxwp/jbN3/ugqoir+dkNIrsvYYtgp9yOgcdh2dVmATKzT0iqpoAG3e1Nqa6MYPwSGAfzIWMeCiIfjEypk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744857; c=relaxed/simple;
	bh=jvTNTCLskVe54PT32MkkrAsklH6ec39TVHdL3I3NtWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRJEGkWU0EWlUr17Qg7zDXzMWiwZzm4bc3Jy4E+rMVL/xfX2m+U87FmpD/QNm4FHrUcO6IQjfc+7+QmlqdWeD+ex+qG52QCXFzRvgfhXk5yi5rpGoYPMzjk0xJ6qfb1wdL8xnMwx9vaCE8NzNg7DruQNXRu19gH7G3v26ht0sig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pX3/jqY5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pX3/jqY5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296EEC4CED1;
	Wed,  5 Feb 2025 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744856;
	bh=jvTNTCLskVe54PT32MkkrAsklH6ec39TVHdL3I3NtWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pX3/jqY5KKsi2Er9JaDQlhNdVPwLbbL5xnh/tkIeRlipdfQ1SyRNypG01+9/jONf4
	 GlECZVGZ9Jio2wjXDx4RI+aMHNjyMxK8nKhmnUcndGKolqC5Q8Aq5wKfh8YbojKqqT
	 aYT+F0EA82WlSY6WVmH//6q/YlDewGd7ptrbt06uY/DLdmvzXstzxwCCkpjDnV+eOj
	 x7i9hcTnHcwbrilHl+WXTvyQdTTlTDLfJ+mWGPqmVxerhlM1czmwpVCWtscdioofbS
	 iZ9MgdZz9qLOx6jq+z63jqqaK+0TcoYApbTiz6Z06UEY8BsxCY8f32aClLX4VYTKgC
	 MxleMXVd7MWjA==
Date: Wed, 5 Feb 2025 09:40:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: document exynos7870 clock driver
 CMU bindings
Message-ID: <20250205-magnificent-spiffy-crab-54d631@krzk-bin>
References: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
 <20250204-exynos7870-pmu-clocks-v1-2-a3030ae5bb53@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-pmu-clocks-v1-2-a3030ae5bb53@disroot.org>

On Tue, Feb 04, 2025 at 02:07:30AM +0530, Kaustabh Chakraborty wrote:
> Provide dt-schema documentation for Exynos7870 SoC clock controller.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/clock/samsung,exynos7870-clock.yaml   | 246 +++++++++++++++++++++
>  1 file changed, 246 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..697e03ca191d685b71672d35257b022c663244ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml
> @@ -0,0 +1,246 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynos7870-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos7870 SoC clock controller
> +
> +maintainers:
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>

This should be someone responsible for this device rather.

> +
> +description: |
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
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-mif
> +
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
> +
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
> +            - const: gout_mif_cmu_dispaud_busa

We switched some time ago to what is usually recommended, so purpose of
the clock, not the actual source clock name. See Exynos8895.

I do not see any of my other comments implemented and you sent it AFTER
I replied already.

Also, this is not v1, but v2. Implement the feedback, add proper
changelog and version the patches.

Best regards,
Krzysztof

