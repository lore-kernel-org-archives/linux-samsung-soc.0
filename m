Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C22F363E;
	Wed, 22 Oct 2025 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119083; cv=none; b=Q3u39RxM4euu5ss7U4ioNu9Lg5Nc+OLb+ur7Uudv1eaxJzfXkzabt+AujZvgRI+2wQJd+AuQ90567Fg9d5QsacKNfIpX4QDlig+bmP+y1aj/XVak31odd1blo4Jnh9SqFoNUaooYsr5LcAIJzjxtbfsy0r+3zn7xFWX+jFdkI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119083; c=relaxed/simple;
	bh=dOaaUGpCoWK/3UecfDVD5nwyOjAWut3PtEie6hbPpME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlpesaSYb8LD1YYSsoec7VWDJ+60E6ze03BeC+CX7THE280lciaGWARstSCQMo3aHzgPxDkuDDD+h+X0oLUnl0SNFRGNkcZne/IPzOfB9HGL5y8UPnEJzMaHQqVmxyb3fTG0bf6NxcwQosTTLrLga2+ydwfjquFUCn/vxEPFqZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtxWl178; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtxWl178"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFA7C4CEE7;
	Wed, 22 Oct 2025 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761119083;
	bh=dOaaUGpCoWK/3UecfDVD5nwyOjAWut3PtEie6hbPpME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtxWl178ZkpUUG2PeSVOEvkUfpCWl2Z9D/H7AHnF49qhriBnzBKTAomAu0XHM79kP
	 Qh4OA2nyXfP5c3KXZ0bfpbmrVC+k5IjtHeOjePT3P7vUUM40/ju8ykgOCgjSB84+dP
	 bvbrOYvPJ6wwSG0253pFzGmNSLmLGf5E4TnWr07wd/Gh8I4DbbSTNMYqwl/DknLWb6
	 qzzegwwkCUrCNpyA3hXYOCjS8jSsHhuI/GptCDOl0udsIx8KnGUdMOyZpOfaYqlope
	 2vTADlxjpsBfJtJQj5KU5Bo6lmoUNqFseRrxGFBV/eqaJ5uAyB+JlEndQ8AA/s3wKj
	 7z2frVqTgDKUw==
Date: Wed, 22 Oct 2025 09:44:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add exynos8890 SoC
Message-ID: <20251022-affable-arrogant-coucal-3f7fbc@kuoka>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251017161334.1295955-2-ivo.ivanov.ivanov1@gmail.com>

On Fri, Oct 17, 2025 at 07:13:29PM +0300, Ivaylo Ivanov wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-aud
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_AUD PLL clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: pll
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-bus0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_BUS0 ACLK 528MHz clock (from CMU_TOP)
> +            - description: CMU_BUS0 ACLK 200MHz clock (from CMU_TOP)
> +            - description: CMU_BUS0 PCLK 132MHz clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "528"
> +            - const: "200"
> +            - const: "132"

We do not want the frequency here, for sure not frequency alone. There
is no such code/syntax. Really.  Please do not invent your own style.
That's just pclk. You describe here the logical name of this clock
input.

ACLK is AXI bus clock, so if this block receives only one ACLK, then
this is just "axi" or "bus". Recently we were calling this "bus".

Same in other places. If two AXI bus clocks come in, they could be named
bus0 and bus1, or in this case - because these are sources for
generating further ACLKs - bus_528 and bus_200, to indicate that one
will be for AXI bus clocked 528 MHz and other for 200 MHz.

Please wait for some other opinions, because same rule I would like to
apply to ExynosAuto, Artpec and Google GS.

@Raghav Sharma, @Alim Akhtar, @Sam Protsenko, @Peter Griffin, @Andr=C3=A9
Draszik  - share your thoughs please?

And to clarify in simple terms for others or for the future:
1. HCLK would be the AHB bus, so also bus. Both ACLK and HCLK are for
memory accesses.
2. PCLK is APB bus, for registers.
3. SCLK is for main operation of the block (called special clock, but no
clue what is so special about it).

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-bus1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_BUS1 ACLK 528MHz clock (from CMU_BUS0)
> +            - description: CMU_BUS1 PCLK 132MHz clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "528"
> +            - const: "132"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-ccore
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_CCORE ACLK 800MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE ACLK 264MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE ACLK G3D 800MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE ACLK 528MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE ACLK 132MHz clock (from CMU_TOP)
> +            - description: CMU_CCORE PCLK 66MHz clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "800"
> +            - const: "264"
> +            - const: g3d
> +            - const: "528"
> +            - const: "132"
> +            - const: "66"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-disp0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_DISP0 ACLK 0 400MHz clock (from CMU_TOP)
> +            - description: CMU_DISP0 ACLK 1 400MHz clock (from CMU_TOP)
> +            - description: CMU_DISP0 DECON0 ECLK0 clock (from CMU_TOP)
> +            - description: CMU_DISP0 DECON0 VCLK0 clock (from CMU_TOP)
> +            - description: CMU_DISP0 DECON0 VCLK1 clock (from CMU_TOP)
> +            - description: CMU_DISP0 HDMI audio clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "0_400"
> +            - const: "1_400"
> +            - const: eclk0
> +            - const: vclk0
> +            - const: vclk1
> +            - const: audio
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-disp1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_DISP1 ACLK 0 400MHz clock (from CMU_TOP)
> +            - description: CMU_DISP1 ACLK 1 400MHz clock (from CMU_TOP)
> +            - description: CMU_DISP1 DECON1 ECLK0 clock (from CMU_TOP)
> +            - description: CMU_DISP1 DECON1 ECLK1 clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "0_400"
> +            - const: "1_400"
> +            - const: eclk0
> +            - const: eclk01
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-fsys0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_FSYS0 ACLK 200MHz clock (from CMU_TOP)
> +            - description: CMU_FSYS0 USB30DRD clock (from CMU_TOP)
> +            - description: CMU_FSYS0 MMC0 clock (from CMU_TOP)
> +            - description: CMU_FSYS0 UFS UNIPRO20 clock (from CMU_TOP)
> +            - description: CMU_FSYS0 PHY 24MHz clock (from CMU_TOP)
> +            - description: CMU_FSYS0 UFS UNIPRO config clock (from CMU_T=
OP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "200"
> +            - const: usb
> +            - const: mmc
> +            - const: unipro20

Just "ufs"

> +            - const: 24m

No... really no. Half of these names feel random. ACLK 200 MHz is "200"
but PHY 24 MHz is 24m... That's SCLK but I don't know from where does it
come from, so what is the true source. Since it is used as ref clock for
PHY, I would rather assume this is not "SCLK" but some fixed oscillator
input. If you don't find the source of this clock giving any reasonable
name, let it be just "sclk".

I understand that without hardware manual it is difficult to figure all
this out and my requirements here do not make it easier. I appreciate
your work.

> +            - const: unipro_cfg

"ufs_cfg"

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8890-cmu-fsys1
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_FSYS1 ACLK 200MHz clock (from CMU_TOP)
> +            - description: CMU_FSYS1 MMC2 clock (from CMU_TOP)
> +            - description: CMU_FSYS1 UFS UNIPRO20 clock (from CMU_TOP)
> +            - description: CMU_FSYS1 UFS UNIPRO config clock (from CMU_T=
OP)
> +            - description: CMU_FSYS1 PCIe PHY clock (from CMU_TOP)
> +            - description: CMU_FSYS1 PCIe PLL clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: "200"
> +            - const: mmc2

mmc

> +            - const: unipro20
> +            - const: unipro_cfg

Please keep common part same with fsys0, so the lists share as much as
possible.  Same for other blocks.

Best regards,
Krzysztof

