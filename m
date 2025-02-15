Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DF1D5AD3;
	Sat, 15 Feb 2025 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739626182; cv=none; b=MZvZkcgs0PEA5nbDrLMuZcnR7ZqiEMse+WoB0yBtVDHjGBxEQWeY2oO3pN740KTIgX2URU7YUSc+0ub9SH9XuBkE0Fv33U6Y/75dtzIazZpeBiyQ5jaeXPc1DGXwkeZaZXxeVOaNxiD8BBVwQXuCvXbs+8vw7UJ52k+N1E05uOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739626182; c=relaxed/simple;
	bh=v07NLwnORgC/H0e++oVg4DTMt03GjGLqNa/Cm3BNWRA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Dk0ac56FhqkZD+Lad8oFmRuDYoQila2yp1Ga9NXc6ePuuXgtW42BngOlOvaIsB9j9MT0fOLxgI4VXsidpB0FgXtm9P93gc22q0Z+F13EUsT255f9JNC4WainZTtOp4QGubytPJvA4yuO9Yn8ETQfTwpCNVTvAbgDk0fXzFKPQeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb0Pa/AE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb0Pa/AE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6B3C4CEE6;
	Sat, 15 Feb 2025 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739626180;
	bh=v07NLwnORgC/H0e++oVg4DTMt03GjGLqNa/Cm3BNWRA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Hb0Pa/AE/uEFOEjiqZQqXCQIC6iezuOQhOzemPZ8XUsa5o4VY+JOmYPsL3Sm8DIh0
	 13vDy57PVgWJ6X+DD+cWu8y518LiatTqdJOWgr/KZKNRM5jCcITxRFGzU2ch5+agCO
	 SAlNCYI6yJjmpRCS5hE43b3jfFSDbyeYmH0mp5Ps0wmioKjbnhMpBYatTjYXN9vm6F
	 Sk8hoQ2ZJw9xRD3Gff1tY95k19SjFLW9syR2qKbIfv7bAiCHkhQrXtnqW9wP5yyfAr
	 ACPenKhj8hhU/XVkkA1RX0UYniYSkGvjfIBMW8WVmj+szM57d3EEVQyLiVzDh7wMIq
	 9ZAlGsSAoV18A==
Date: Sat, 15 Feb 2025 07:29:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215122409.162810-3-ivo.ivanov.ivanov1@gmail.com>
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-3-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173962617803.765517.17948286888997426214.robh@kernel.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file


On Sat, 15 Feb 2025 14:24:07 +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC has a USB phy controller block that controls the
> usage of USB phys. Add a dt-binding schema for the new driver.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250215122409.162810-3-ivo.ivanov.ivanov1@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

