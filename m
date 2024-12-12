Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BEE19CC0F;
	Thu, 12 Dec 2024 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734042628; cv=none; b=rB1gHVFHmyFBSQigvwsSsazk2CSX09wGmF3Jgqm76CIX0IjmPXS2C/aoimxeFZp9Q2iujltNNY7dwtx2viK74dJ0C6FrkbHyUKEqag2u/z1unPGihoexrnp3D9DqgdDdfvUYNAOey5AnuIcn2Y8a1rLU68tIlNqMFoHLxnBFUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734042628; c=relaxed/simple;
	bh=GfgvB7VvI35d4Y+A3lfg32jaJdQuBRvgZUCRKZU/NDA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=pwqLIb+pWjTJdvFLwHbAr6AHVl0G1KnUnS3tg2pE56knJ/VBeynE1Vz/LxxCgy2Tj23pq+Zd5IBIQrO/mUF2UFlVFnbpennW+Od0HzTazj0SPMdnZtPaWdoKiIPP2rAhycbM0b6GgNrJWo518AkGZ7DLE6x3XN65ls466QMDZPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLaq9Bxk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLaq9Bxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9691EC4CECE;
	Thu, 12 Dec 2024 22:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734042627;
	bh=GfgvB7VvI35d4Y+A3lfg32jaJdQuBRvgZUCRKZU/NDA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mLaq9Bxk3T7mh86p6zkb4Ec0ewssBIdzj4uNX3smwvAeWx1QasB99CUvJGH8qvWWf
	 6WyIdk8ECJXakyB7fSFlgipr8s2Ez2rCTtECyciq3x2iC+TATu9Sh18Coza/JnhMvL
	 +hC56oloGoBD6RXMtWdVv78fVDT5FH4HkWqmAmqghBF3JyRv/gPtOZktF4kyAvePuB
	 EjgQ62I7JKRwQx9N+Fs4hGpbVs2Fcu/kD2FDmN4ZFF1VHRnHbqCPQU5KuDX42fs0EW
	 rDXHYXwWFt2dXU2W6PnT01Kexg/k26D5uoL24acpGK05eFGYGKp64Vfy158tdF3ZNd
	 5gQfiEXMRHWjw==
Date: Thu, 12 Dec 2024 16:30:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Maksym Holovach <nergzd@nergzd723.xyz>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
To: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <20241212-speedy-v1-1-544ad7bcfb6a@gmail.com>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-1-544ad7bcfb6a@gmail.com>
Message-Id: <173404262581.3370297.1817961099331187454.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: samsung: exynos-speedy: Document
 SPEEDY host controller bindings


On Thu, 12 Dec 2024 23:09:01 +0200, Markuss Broks wrote:
> Add the schema for the Samsung SPEEDY serial bus host controller.
> The bus has 4 bit wide addresses for addressing devices
> and 8 bit wide register addressing. Each register is also 8
> bit long, so the address can be 0-f (hexadecimal), node name
> for child device follows the format: node_name@[0-f].
> 
> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../bindings/soc/samsung/exynos-speedy.yaml        | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: ignoring, error in schema: properties: clock-names
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: properties:compatible: [{'items': [{'enum': ['samsung,exynos9810-speedy']}, {'const': 'samsung,exynos-speedy'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: properties:clock-names: [{'const': 'pclk'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: properties:compatible: [{'items': [{'enum': ['samsung,exynos9810-speedy']}, {'const': 'samsung,exynos-speedy'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml: properties:clock-names: [{'const': 'pclk'}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/soc/samsung/exynos-speedy.example.dtb: /example-0/speedy@141c0000: failed to match any schema with compatible: ['samsung,exynos9810-speedy', 'samsung-exynos-speedy']
Documentation/devicetree/bindings/soc/samsung/exynos-speedy.example.dtb: /example-0/speedy@141c0000: failed to match any schema with compatible: ['samsung,exynos9810-speedy', 'samsung-exynos-speedy']
Documentation/devicetree/bindings/soc/samsung/exynos-speedy.example.dtb: /example-0/speedy@141c0000/pmic@0: failed to match any schema with compatible: ['samsung,s2mps18-pmic']
Documentation/devicetree/bindings/soc/samsung/exynos-speedy.example.dtb: /example-0/speedy@141c0000/regulator@1: failed to match any schema with compatible: ['samsung,s2mps18-regulator']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212-speedy-v1-1-544ad7bcfb6a@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

