Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBEE1C230A;
	Tue,  9 Jul 2024 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542178; cv=none; b=ITAu3yP+IF71TVF+eJfVd5WwRgLA1Jv5Vj0iNZkrqOHnvvsIhImIZ+1gEufHRXwuuLbCN25PM7RhIjr5eSC3Pabo5/obVH7h0Z6qBXDEazNaR5wlR1voSXgdzGyt1qmCVdY8Q4ut2Sz4pgthfNrC9uL1WaMnVZZ1h9/s/03hjOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542178; c=relaxed/simple;
	bh=8082rWkAR8IgTw+ArT/i9Zh9oV0i6nYGOgdRqR/CthE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDCpffKiprG7onrHEThfpCvPyuuE+r79n95wJO/MsAarI80IQzSpzqyjP54u1c5AH1co76WS9eVhJc2IhKCYRFDn6Ks7JcRxfDw1tkJAhxJXIbrEDCnDLIJMrFBAtdxyzlfRO18onbn/o63YvV4CNFoe3XX0IEoX0aqeOs3sFEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUC5vETC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUC5vETC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA25C32782;
	Tue,  9 Jul 2024 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542178;
	bh=8082rWkAR8IgTw+ArT/i9Zh9oV0i6nYGOgdRqR/CthE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUC5vETCz5KVR5sdZ89iOaxsISoYw5db/iXuSdBl1fsYS14xFSMnErsyxuBrTyGLm
	 1DNobR3rYhAtYMq0u3YJAlXhLZ792OGEapN1gqx2juCvtrmN16aua+WRBM/dgMslSS
	 qpkns/rr1bfJHg+NWuAQmP/MBYvbdlVs6BKyAB59cD73Ex0glDaO1HWMseIs1jTLq3
	 JR8q87eo3LBDaCDSQLwcJshY21U63QqfIxZhPwx0i1/W2QuRkO+7Nm5wR4OsvggHy+
	 VFJ2FKCMsd7q4qbUkrlcSug+Zeu8z/a8z1M8b6LmE4Kic0Fnxq9jpoph2O6zPQvoqR
	 qU3XMa7TEyKJw==
Date: Tue, 9 Jul 2024 10:22:55 -0600
From: Rob Herring <robh@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: 'Sunyeal Hong' <sunyeal.hong@samsung.com>,
	'Krzysztof Kozlowski' <krzk@kernel.org>,
	'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
	'Chanwoo Choi' <cw00.choi@samsung.com>,
	'Michael Turquette' <mturquette@baylibre.com>,
	'Stephen Boyd' <sboyd@kernel.org>,
	'Conor Dooley' <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: add Exynos Auto v920 SoC CMU
 bindings
Message-ID: <20240709162255.GA3676452-robh@kernel.org>
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
 <CGME20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73@epcas2p1.samsung.com>
 <20240707231331.3433340-2-sunyeal.hong@samsung.com>
 <000001dad121$bf3c0a80$3db41f80$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001dad121$bf3c0a80$3db41f80$@samsung.com>

On Mon, Jul 08, 2024 at 03:59:40PM +0530, Alim Akhtar wrote:
> Hello Sunyeal
> 
> > -----Original Message-----
> > From: Sunyeal Hong <sunyeal.hong@samsung.com>
> > Sent: Monday, July 8, 2024 4:43 AM
> > To: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> > <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> > Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> > <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob
> > Herring <robh@kernel.org>; Conor Dooley <conor+dt@kernel.org>
> > Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Sunyeal Hong <sunyeal.hong@samsung.com>
> > Subject: [PATCH v2 1/4] dt-bindings: clock: add Exynos Auto v920 SoC CMU
> > bindings
> > 
> > Add dt-schema for Exynos Auto v920 SoC clock controller.
> Prefer to have Exynos Auto -> ExynosAuto to match with the naming convention and the UM.
> 
> > Add device tree clock binding definitions for below CMU blocks.
> > 
> > - CMU_TOP
> > - CMU_PERIC0
> > 
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> >  .../clock/samsung,exynosautov920-clock.yaml   | 115 +++++++++++
> >  .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
> >  2 files changed, 306 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clock.yaml
> >  create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clock.yaml
> > b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clock.yaml
> > new file mode 100644
> > index 000000000000..ade74d6e90c0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-
> > clo
> > +++ ck.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/clock/samsung,exynosautov920-
> > clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung Exynos Auto v920 SoC clock controller
> > +
> > +maintainers:
> > +  - Sunyeal Hong <sunyeal.hong@samsung.com>
> > +  - Chanwoo Choi <cw00.choi@samsung.com>
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> > +
> > +description: |
> > +  Exynos Auto v920 clock controller is comprised of several CMU units,
> > +generating
> > +  clocks for different domains. Those CMU units are modeled as separate
> > +device
> > +  tree nodes, and might depend on each other. Root clocks in that clock
> > +tree are
> > +  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI
> > (32768 Hz).
> > +  The external OSCCLK must be defined as fixed-rate clock in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared using
> > + PLLs and  dividers; all other clocks of function blocks (other CMUs)
> > + are usually  derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this
> > + identifier  to specify the clock which they consume. All clocks
> > + available for usage  in clock consumer nodes are defined as
> > + preprocessor macros in  'include/dt-
> > bindings/clock/samsung,exynosautov920.h' header.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - samsung,exynosautov920-cmu-top
> > +      - samsung,exynosautov920-cmu-peric0
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-cmu-top
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynosautov920-cmu-peric0
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (38.4 MHz)
> > +            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
> > +            - description: CMU_PERIC0 IP clock (from CMU_TOP)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +            - const: noc
> > +            - const: ip
> These are too generic name, please add peric0_noc and peric0_ip, and this is to match with the UM.
> I am sure in future you would like to add other IPs like USI, I2C etc for the peric0 block

Names are local to the block, so adding the block name is redundant.

Wouldn't USI and I2C clocks be outputs? This property is input clocks.

The names and descriptions should be defined at the top level and then 
here should be just 'minItems: 3' (And above 'maxItems: 1').

Rob
