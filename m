Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8F913D898;
	Tue, 23 Jul 2024 20:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721768235; cv=none; b=K/s3Q8g5L8fStSlRK5FDhotVyCyzbZVs2s2pHdxZfbfsYs7L8QPQWbzjx6GNxmAdh4h41aruwWYKdjU0+Uh0iRRQL5crjws5Vb2BFFo6XnLHkiteOymJVhJfcUwW1aAaWKLfFqU1vigYG9AS9nJnwNL0bXLV3qBBRLZ53u8dUyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721768235; c=relaxed/simple;
	bh=bUppBWqZH2uLys4TfLAbBxHCtv32OZjdBJVR4LSQNHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Grxx1JrLouetW9AOLEhLszhFRpq4Laf6fvgJ/TGd/bwSjduoQZc0GrP759I4X0hNJbtT3u1gXXfO45iamNkvjowcchMLKYJ31VR340G18/zEYLQYfI8dl2hdM73NfLaH0eGur3nuIiqC19IHScWWqfNNYnR94IooBleXkH0jhMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rInKOLlY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rInKOLlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EC0C4AF09;
	Tue, 23 Jul 2024 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721768235;
	bh=bUppBWqZH2uLys4TfLAbBxHCtv32OZjdBJVR4LSQNHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rInKOLlYARp2bm42ZHYHmmhJMT2LQ0QLzVRmo/rTy+vCUxHU4zLDx3y9Z9JzyNhuu
	 jMQjAPU0VUltwAsf9tkxAfGY6mcM+LxG2AFtR7L+MNKk8bgnIdpOSDmxv/X5h7ZC3W
	 TUja5feINGe5X1EN1oC+s2uZshIJhKO5/eu5CSUiMWToMDDIutDuBhtIN3HK+6HH5M
	 9IMXoA8PcVIFA5cvOt/i5mgHzYHBIzMPoc2mYSisiuGoKx+iipYIMRAvIxIjuqJ7HY
	 +dSwtsnpQxJptJi11yAZ2BmbZSEnY+q9RlRjxaf/wj/84EUhhjRzgS1JcfFS9BFO+a
	 bVo+2i/TLilwA==
Date: Tue, 23 Jul 2024 15:57:14 -0500
From: Rob Herring <robh@kernel.org>
To: Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Message-ID: <20240723205714.GA1093352-robh@kernel.org>
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
 <CGME20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d@epcas2p4.samsung.com>
 <20240722223333.1137947-2-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722223333.1137947-2-sunyeal.hong@samsung.com>

On Tue, Jul 23, 2024 at 07:33:30AM +0900, Sunyeal Hong wrote:
> Add dt-schema for ExynosAuto v920 SoC clock controller.
> Add device tree clock binding definitions for below CMU blocks.
> 
> - CMU_TOP
> - CMU_PERIC0
> 
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 115 +++++++++++
>  .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
>  2 files changed, 306 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
>  create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> new file mode 100644
> index 000000000000..90f9f17da959
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynosautov920-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung ExynosAuto v920 SoC clock controller
> +
> +maintainers:
> +  - Sunyeal Hong <sunyeal.hong@samsung.com>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +description: |
> +  ExynosAuto v920 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI (32768 Hz).
> +  The external OSCCLK must be defined as fixed-rate clock in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other clocks of function blocks (other CMUs) are usually
> +  derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'include/dt-bindings/clock/samsung,exynosautov920.h' header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynosautov920-cmu-top
> +      - samsung,exynosautov920-cmu-peric0
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3

Move the descriptions and names here. Then in the if/then schemas just 
set the number of items to 1 or 3 as appropriate.

Rob
