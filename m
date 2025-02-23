Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC048202C42;
	Sun, 23 Feb 2025 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740307099; cv=none; b=lmrSWqM0DlNc7YLxZfWSO5XeKcjg7qlQ29JagMpjcMbLVoO3Yesj0PHA6sFKOakxnT/IaYhHNz11XkuQrrr+Sr4S5hJ3OFTMkDmKawxqoSgutUSLnQRAWFyptD8wNS2p1c0mckdQfmEBUsw7JhdR3foG09tbF6mkR4nceLMAhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740307099; c=relaxed/simple;
	bh=07Dn81j06J77TY1dn92m8Y0hsNLe/4IuS4Hznl621gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueIe0eLdHHyfHkwhH2hQgEJXwXBp5Sj4EsrokamzueZM+CBWJvnRV2Y2wjKhWzVhvHU1UKB97W2okhX8Bn+XhJzXJtDlp4xCSSffpkoE0zRTGdBc3S19PRyw/KEVX/aJxS9uAEsjkVT5UO1rqVwHCbCz5taED2xXmRp1xVY/Hdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fw2icCAT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fw2icCAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D067CC4CEDD;
	Sun, 23 Feb 2025 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740307096;
	bh=07Dn81j06J77TY1dn92m8Y0hsNLe/4IuS4Hznl621gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fw2icCATmdrCAmXPKXrIn+QHTgePRi9yhSLXMwCNGeUkb9m/gHohY34SNn8wiSocX
	 5jSug4jytjUNFCUo5UpDbwsJWM+zq2vMNP750zpMOTk4k5fhZNqvnMSNkd6K7wWq+0
	 3LqswCuTu3d8zW70a/f7ObAqyAb3cYyY8pnvHoGdL26u/QD1UQUc37ov2t+oeY7DQy
	 LHft+X0zR8HDSubBowWcrMVaC7XnJ4wNR28zflS2/KiO/uZ1y7kAsPWM5IXADn+K8g
	 OWud7VZ3D7DmxXmMxNWpOxacSjsFOtuqU/yvT5ohDO/+AB+ar6lCDkjrgPMcHqDAzx
	 0WvPBt7E6GzOA==
Date: Sun, 23 Feb 2025 11:38:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] regulator: dt-bindings: add documentation for
 s2mpu05-pmic regulators
Message-ID: <20250223-mysterious-infrared-civet-e5bcbf@krzk-bin>
References: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
 <20250219-exynos7870-pmic-regulators-v2-1-1ea86fb332f7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmic-regulators-v2-1-1ea86fb332f7@disroot.org>

On Wed, Feb 19, 2025 at 12:19:49AM +0530, Kaustabh Chakraborty wrote:
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
> +  "^LDO([1-9]|10|2[5-9]|3[0-5])$":

I forgot last time, my bad, this should be lowercase.

> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Properties for single LDO regulator.
> +
> +      LDOs 11-24 are used for CP, and they're left unimplemented due to lack
> +      of documentation on these regulators.
> +
> +    required:
> +      - regulator-name
> +
> +  # 5 bucks
> +  "^BUCK[1-5]$":

same here

Best regards,
Krzysztof

