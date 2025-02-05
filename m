Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00BE20E004;
	Wed,  5 Feb 2025 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744339; cv=none; b=ha86TkaeazTimjQN+Akous7wvZ/fwusRqQObrjWWfBltziq4x1sUYj3OSw4bT3KNIhXv5qZJUOakDO4vojFETGoF1Y7WQJ2oPxn+dOOgvk/JUY+gyOqUxStEram1dvpnutXHttEGWvusiiDz1u4f1PTe2xmx6+2AP7LObJ4CQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744339; c=relaxed/simple;
	bh=360XsXFC8a0bmc8nVSRguqSpVLsU19VNluBf1b07lFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDX1BXlTtAnrsMtyhada2dmvOtoo5hnvBO5znZmvI0X/uIoH+Q9GUBdhbRJ7EHRAEoAdA+HvukObdbB/AlvAn1p97dDz7N4EsQYQVIsHt6RSbkrpowimGN2+j4RL8GG84umq2FBWo2MZ86GGuroNo/FSmiiZt3eYqk9asTOefT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpwqb7rL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpwqb7rL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2E8C4CED1;
	Wed,  5 Feb 2025 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744338;
	bh=360XsXFC8a0bmc8nVSRguqSpVLsU19VNluBf1b07lFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpwqb7rL9eL13McmUWvB4orYyQDFqyl/MnWpCnsTT/Qy/czo1muPAYkVGzszRorVa
	 KfyW+NXwC94hhwKELBkKxNeubeN0eMaxsvqkB1jVZb79AJFV0hlKuKBUooxTgskNC+
	 WwYyb8Ca4FKyiYsGJZy5RuyvWAaDWeFG9D5K21NDwf+2lGRFC7iu5CoYN+Ljt46/lI
	 K65qkceL5MApjDX8nuUXEiTopERdbnEUKI06Nhiqt+LIaOG/7Am0u+SZwn5YPEdJEh
	 Ce0rVfaNmODv9Ic+DAUbh2eI0LsIcHH37cg2DXPpj0vlHBnDJBOHGXvCCj6kRBPg/x
	 Nd+qJBfrqHSLg==
Date: Wed, 5 Feb 2025 09:32:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] regulator: dt-bindings: add documentation for
 s2mpu05-pmic regulators
Message-ID: <20250205-keen-taupe-loon-35e0de@krzk-bin>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
 <20250204-exynos7870-pmic-regulators-v1-1-05adad38102c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-1-05adad38102c@disroot.org>

On Tue, Feb 04, 2025 at 02:06:26AM +0530, Kaustabh Chakraborty wrote:
> S2MPU05 is a PMIC found in Exynos7870 devices, which controls voltage
> regulators (21 LDOs and 5 BUCKs). Provide documentation for devicetree
> definitions, regulator naming patterns, etc.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/regulator/samsung,s2mpu05.yaml        | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a968fe79d44dbcb6720a7d1da698f9460e25521
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/samsung,s2mpu05.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S2MPU05 Power Management IC regulators
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>

Not me, I don't have this device nor its datasheet.

> +
> +description: |
> +  This is a part of device tree bindings for S2M and S5M family of Power
> +  Management IC (PMIC).
> +
> +  The S2MPU05 provides buck and LDO regulators.
> +
> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
> +  additional information and example.
> +
> +patternProperties:
> +  # 21 LDOs
> +  "^LDO([1-9]|10|2[0-9]|3[0-5])$":

Why is there a gap in LDOs?

Best regards,
Krzysztof

