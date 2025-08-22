Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD72311C2A;
	Fri, 22 Aug 2025 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870924; cv=none; b=AZczcVnokfzKPlOgbfpMO5s4u3o5q74tF38wBXuh8DO4f5hN/O3Z60amjc7j+N/ld0tmo9PBLwvLNbs18QGS7Y8dKITp/eFaWoWB4PZl6xuHVnVKkpKQ5faWnfwt/FoCJD//l4lx13EiEJ7cVdSI7KGEMlr9gvyuLs/v/h3dfMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870924; c=relaxed/simple;
	bh=zSm1zQkFdhpmY/HgWj2Qj7y/a2Z/6Ftha+/cqaK8MEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovLFglyICsbjPQvwHPEPDfaXk9Qm6h1Bn0bzdqc4RuStR+7nIu+qoK+VTCbm9c7SUQR1xcee3bFpc2zX6EbLEQquagRho5BTjF6/u7kflAflYCG2P7gPvAsRJQ3JXEl8Nmisf4wpQDgjmff2qvjgVm6mkCKG2w1QHILxNMtHsHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLkkNl3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLkkNl3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3125CC113CF;
	Fri, 22 Aug 2025 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755870923;
	bh=zSm1zQkFdhpmY/HgWj2Qj7y/a2Z/6Ftha+/cqaK8MEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLkkNl3dXIsDnJZtsoiU1Vm9inBEz27/WByO/q5z3/GGf24wqq7LFXOKlQqSAmwYH
	 XEsmcwA495cLpTYMi23yUD7uVqMpOUQ/kZM+5scQWVBWtf+Lfhg3JUpDBbAUjaqA0z
	 Kr9az9pakd2wZhulu7Z5YD6wRAaqk9jjK74McEH8yyrQi8CGpWwhmFejwAC3/t7jxf
	 G3VHJqB3aLMYeMBfkXWdDt8dhy2d4GczXYyAmLuBQhAyJLMH+pbZ0DyyGIOa2xs57m
	 1JLxMstwbqwUAttH0HW+mnZVdVUNYVlLtvAJvhw7tQv74IvFdTtjsF7TLFdNzauyb0
	 9od25tu/b7Tgg==
Date: Fri, 22 Aug 2025 08:55:21 -0500
From: Rob Herring <robh@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
Message-ID: <20250822135521.GA3487754-robh@kernel.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>

On Tue, Aug 19, 2025 at 11:45:36AM +0000, Tudor Ambarus wrote:
> The firmware exposes clocks that can be controlled via the ACPM
> interface. Describe the clocks exposed by the APM firmware.

ACPM? APM is Advanced Power Management aka the predecessor to ACPI?


> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 28 ++++++++++++++++++++++
>  include/dt-bindings/clock/google,gs101.h           | 15 ++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> index 9785aac3b5f34955bbfe2718eec48581d050954f..27cdf9c881ca680e78e77a0e14ffcffeba970871 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> @@ -27,6 +27,29 @@ properties:
>    mboxes:
>      maxItems: 1
>  
> +  clocks:
> +    description:
> +      Clocks that are variable and index based. These clocks don't provide
> +      an entire range of values between the limits but only discrete points
> +      within the range. The firmware also manages the voltage scaling
> +      appropriately with the clock scaling.
> +    type: object
> +    additionalProperties: false

You don't need a child node. Just add #clock-cells to the parent.

> +
> +    properties:
> +      compatible:
> +        const: google,gs101-acpm-dvfs-clocks
> +
> +      "#clock-cells":
> +        const: 1
> +        description:
> +          The argument is the ID of the clock contained by the firmware
> +          messages.
> +
> +    required:
> +      - compatible
> +      - "#clock-cells"
> +
>    pmic:
>      description: Child node describing the main PMIC.
>      type: object
> @@ -59,6 +82,11 @@ examples:
>          mboxes = <&ap2apm_mailbox>;
>          shmem = <&apm_sram>;
>  
> +        clocks {
> +            compatible = "google,gs101-acpm-dvfs-clocks";
> +            #clock-cells = <1>;
> +        };
> +
>          pmic {
>              compatible = "samsung,s2mpg10-pmic";
>              interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
> index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
> --- a/include/dt-bindings/clock/google,gs101.h
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -634,4 +634,19 @@
>  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
>  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
>  
> +#define CLK_ACPM_DVFS_MIF				0
> +#define CLK_ACPM_DVFS_INT				1
> +#define CLK_ACPM_DVFS_CPUCL0				2
> +#define CLK_ACPM_DVFS_CPUCL1				3
> +#define CLK_ACPM_DVFS_CPUCL2				4
> +#define CLK_ACPM_DVFS_G3D				5
> +#define CLK_ACPM_DVFS_G3DL2				6
> +#define CLK_ACPM_DVFS_TPU				7
> +#define CLK_ACPM_DVFS_INTCAM				8
> +#define CLK_ACPM_DVFS_TNR				9
> +#define CLK_ACPM_DVFS_CAM				10
> +#define CLK_ACPM_DVFS_MFC				11
> +#define CLK_ACPM_DVFS_DISP				12
> +#define CLK_ACPM_DVFS_BO				13
> +
>  #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
> 
> -- 
> 2.51.0.rc1.167.g924127e9c0-goog
> 
