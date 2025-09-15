Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F48311C2D;
	Mon, 15 Sep 2025 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942523; cv=none; b=SmRcJ4fSMCiw0R/79jKJKDoF42DsKOhH1sPTXm8PKzbRiWo1yt73G0MevoWXWz7Z/IvphMUEaW/kWTLmqs7xVPEImh7c7TSDBzVcoftUQ3YrQi1Y/qRx3EZPZuhHDOYwgQ7fVmsHKrVSEdtmFlURB/URlYqGQUpJTojhXpahosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942523; c=relaxed/simple;
	bh=omVHC2lwXuWYfBEc6TmKSITT2zhlG65jkMcTKudJYvA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Dk1Gf1OR969rF6wlbaUaGdwC5IMS0+2CxkOLd5UuLAssw+dtsAL5mFlzACg5LSKQPBMAjLTeHgOF0cKq8qxHA9XhWy1h26qFJOnICjTWSWna1ntqARw0ZRZJbpGTkN9bBAOIItNNk5K31705ufoSjBP2Z/uK/0dcEvq3t+VpJrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElBQQ9Kc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElBQQ9Kc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0F2C4CEFB;
	Mon, 15 Sep 2025 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757942522;
	bh=omVHC2lwXuWYfBEc6TmKSITT2zhlG65jkMcTKudJYvA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ElBQQ9KcNgtwr4NhGGUvtU3fqMuyETn+BzUs1uBvHuhGbf91zVGX1KOdeiYC21l2u
	 737981xXKNHJIsCD5pBgdyC4MTZ/YUTmLJYIqSu8hI9FJHNTQxO/D4cZreo+pDxQTC
	 0byr7EXAa+rYpJltKcE0f8ESi0hpZin/CoapjFC0c6MPY9JsDr+E4dVn5SzNzn4eI+
	 SJC1LIIGN6JpQhlmOaLXWV4Tx1LmFEyozXaO1oRe88rlMSggIPq3Jr55kjJBMf0786
	 FlLSd7gyRM3Aq14AHMFBLLfuV3/KS/D1J0gKbl7jvX4Ql4OpL2bKAnk381TswC26Rh
	 HHJ7oVKE1knLw==
Date: Mon, 15 Sep 2025 08:22:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandru Chimac <alexchimac@protonmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>
To: Alexandru Chimac <alex@chimac.ro>
In-Reply-To: <20250915-exynos9610-clocks-v1-1-3f615022b178@chimac.ro>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
 <20250915-exynos9610-clocks-v1-1-3f615022b178@chimac.ro>
Message-Id: <175794237115.2496914.9134109163312001999.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: clock: samsung: Add Exynos9610 CMU
 bindings


On Sun, 14 Sep 2025 21:19:19 +0000, Alexandru Chimac wrote:
> This clock management unit has a topmost block (CMU_TOP)
> that generates top clocks for other blocks, alongside 20
> other blocks, out of which 11 are currently implemented.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../bindings/clock/samsung,exynos9610-clock.yaml   | 344 ++++++++++
>  include/dt-bindings/clock/samsung,exynos9610.h     | 720 +++++++++++++++++++++
>  2 files changed, 1064 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml:250:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/samsung,exynos9610-clock.yaml: $id: 'http://devicetree.org/schemas/clock/samsung,exynos9610-clock.yaml' does not match 'http://devicetree.org/schemas(/[^/ ]+)+\\.yaml#'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Error: Documentation/devicetree/bindings/clock/samsung,exynos9610-clock.example.dts:25.13-14 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/samsung,exynos9610-clock.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1527: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250915-exynos9610-clocks-v1-1-3f615022b178@chimac.ro

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

