Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05C31D759;
	Fri, 24 Jul 2026 06:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873602; cv=none; b=bs50n7CGQ1uE/lhzIfKehPGrGUGbhJ21HWDu0EjMkLiErQeJl5kHK0ncX0+pJOs9kDSMi6UL3YrAuc+Ey00LOOJ9sKVOCG0mnG5KA3gvaGUxR1DG9XuTj+FtSpolziXjiL//tDWoq2wOJJtDKch5JyhMX1SlHGTLpItnQNDTNgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873602; c=relaxed/simple;
	bh=kTZ3hJAAPFuWYR99LIjYjPGx2LVwfemSN8h55mQBEUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Byj8EoWYgcLHG/NfosjgE0MYKZaVqSkeHGxNxmGy6poSxGNIDDOhElO5BraLeu7bCTaQngJnZtu5FjK0+l4NxgLyTBjqP6TKAD9z+X0VQkL1kjFW55SGashzsFFYeUJ6qRWsOc7JJCyH0x0UqYaI/YyjRlLAmUnsbcYvZlzg1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1KrhkvO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1KrhkvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FF31F000E9;
	Fri, 24 Jul 2026 06:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784873601;
	bh=RfjwbfsQ14hba1yTFrgAkcK+sVOtX/bwEy3i4fFxYwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A1KrhkvOe2L8dF3SlAmNpCVPP90aghPO8cUbh+1QhKH81maj0qMhltP7AVu/vODle
	 ktmB/rqKNFV4USPGY9bdLCKphLTgrgyaobIsvASO5pHlA8YyarjxT31kNUX67bpSp/
	 QfYQAmZY16FkXNXJa4B0ssq1x1c3wHyjd855pWID5WC+2R9qsmBqwLKPDaZLZ6upti
	 C/05Eknl4lRQhS8lVTc5Tbly3z7uABietA3nrw3wTXRImVBXB+uy32OgN4LXiO5d5a
	 7huYezwQpNxqgFt//oNM6Jy61l660XkC+ZGPnZlLq+wA6j20vXK8+VU9V3K5gLhvQn
	 MWf5pEx0Ns8gw==
Date: Fri, 24 Jul 2026 08:13:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: samsung: Add Exynos9610 CMU
 bindings
Message-ID: <20260724-supportive-jasmine-bandicoot-ed2c8c@quoll>
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
 <20260722-exynos9610-clocks-v3-1-c672a2a30889@chimac.ro>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-exynos9610-clocks-v3-1-c672a2a30889@chimac.ro>

On Wed, Jul 22, 2026 at 11:44:02PM +0300, Alexandru Chimac wrote:
> This clock management unit has a topmost block (CMU_TOP)
> that generates top clocks for other blocks, alongside 20
> other blocks, out of which 11 are currently implemented.

This feels not properly wrapped.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../bindings/clock/samsung,exynos9610-cmu.yaml     | 335 ++++++++++
>  include/dt-bindings/clock/samsung,exynos9610-cmu.h | 722 +++++++++++++++++++++
>  2 files changed, 1057 insertions(+)

...

> +  compatible:
> +    enum:
> +      - samsung,exynos9610-cmu-top
> +      - samsung,exynos9610-cmu-apm
> +      - samsung,exynos9610-cmu-cam
> +      - samsung,exynos9610-cmu-cmgp
> +      - samsung,exynos9610-cmu-core
> +      - samsung,exynos9610-cmu-cpucl0
> +      - samsung,exynos9610-cmu-dispaud
> +      - samsung,exynos9610-cmu-fsys
> +      - samsung,exynos9610-cmu-g2d
> +      - samsung,exynos9610-cmu-g3d
> +      - samsung,exynos9610-cmu-peri
> +      - samsung,exynos9610-cmu-usb

List should be ordered alphabetically.

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
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
> +  - clocks
> +  - clock-names
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos9610-cmu-top

And then the same order of "if:then:" cases.

> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26MHz)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos9610-cmu-apm
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26MHz)
> +            - description: CMU_APM bus clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_cmu_apm_bus

...


> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock controller node for CMU_FSYS

Drop comment, compatible defines that this is CMU FSYS

> +  - |
> +    #include <dt-bindings/clock/samsung,exynos9610-cmu.h>
> +
> +    cmu_fsys: clock-controller@13400000 {

Drop unused label.

> +        compatible = "samsung,exynos9610-cmu-fsys";
> +        reg = <0x13400000 0x8000>;
> +        #clock-cells = <1>;
> +
> +        clocks = <&oscclk>,
> +                 <&cmu_top CLK_DOUT_CMU_FSYS_BUS>,
> +                 <&cmu_top CLK_DOUT_CMU_FSYS_MMC_CARD>,
> +                 <&cmu_top CLK_DOUT_CMU_FSYS_MMC_EMBD>,
> +                 <&cmu_top CLK_DOUT_CMU_FSYS_UFS_EMBD>;
> +        clock-names = "oscclk",
> +                      "dout_cmu_fsys_bus",
> +                      "dout_cmu_fsys_mmc_card",
> +                      "dout_cmu_fsys_mmc_embd",
> +                      "dout_cmu_fsys_ufs_embd";
> +    };
> +...

...

> +/* CMU_CAM muxes */
> +#define CLK_MOUT_PLL_CAM_BUS_USER			1
> +
> +/* CMU_CAM dividers */
> +#define CLK_DIV_CLK_CAM_BUSP				2
> +
> +/* CMU_CAM gates */
> +#define CLK_GAT_CLK_CAM_CMU_PCLK			3
> +#define CLK_GAT_CLK_CAM_OSCCLK_CLK			4
> +#define CLK_GOUT_CAM_BUSD				5
> +#define CLK_GOUT_CAM_BTM_ACLK				6
> +#define CLK_GOUT_CAM_BTM_PCLK				7
> +#define CLK_GOUT_CAM_LHS_ATB_CAMISP_CLK			8
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_3AA			9
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS0		10
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS1		11
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS2		12
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_CSIS3		13
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_RDMA			14
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS0		15
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS1		16
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS2		17
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_GLUE_CSIS3		18
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_PAFSTAT_CORE		19
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_PPMU_CAM		20
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_DMA			21
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_SMMU_CAM		22
> +#define CLK_GOUT_CAM_IS6P10P0_ACLK_XIU_D_CAM		23
> +#define CLK_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM0	24
> +#define CLK_GOUT_CAM_IS6P10P0_PCLK_PGEN_LITE_CAM1	25
> +#define CLK_GOUT_CAM_IS6P10P0_PCLK_PPMU_CAM		26
> +#define CLK_GOUT_CAM_LHM_AXI_P_CLK			27
> +#define CLK_GOUT_CAM_LHS_ACEL_D_CLK			28
> +#define CLK_GOUT_CAM_BUSD_CLK				29
> +#define CLK_GOUT_CAM_BUSP_CLK				30
> +#define CLK_GOUT_CAM_SYSREG_PCLK			31
> +
> +/* CMU_CMGP muxes */
> +#define CLK_MOUT_CLK_CMGP_ADC			0

Use consistent indexing - either start from 0 or from 1. All other cases
started from 1.

> +#define CLK_MOUT_CLK_CMGP_I2C			1
> +#define CLK_MOUT_CLK_CMGP_USI00			2
> +#define CLK_MOUT_CLK_CMGP_USI01			3
> +#define CLK_MOUT_CLK_CMGP_USI02			4
> +#define CLK_MOUT_CLK_CMGP_USI03			5
> +#define CLK_MOUT_CLK_CMGP_USI04			6

Best regards,
Krzysztof

