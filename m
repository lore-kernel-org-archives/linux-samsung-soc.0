Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDDA1F03C0;
	Mon,  3 Mar 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740993064; cv=none; b=YZdRej47KArbBNxEux4G8ZGMRe+02JWBY9kTzCWkyGC8VlQtJBBf8I52Vxw22nUGr/JtjE70oKqgMH5PAD5CSx0VKw3Y9PL7V0vqSI1XLXLZmhLivbK5tLDnUzBirckVh5cEELJp//fEbE8Mkistc0Bf9PKH/Njwe4jIVJ8ewT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740993064; c=relaxed/simple;
	bh=YVX+7eFEIapS76piqJxmNjdQLCvSNzn6y1ecUo9S5a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bk0ve7i6Ud2zfJtljDcMNr0pd6vQKGA9aIilAwamr7yzlH72KOo7lp8eve1HJIcPXPScarH+HSm70Ez1JZ2MkxAja5IvGLXD1UQwLwmdvp9h8Nd3xXlOvcm9lkKm+VfImRjctclndAGxOskDiEcjGbKuLDAeyEPriXKdRaqrni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLEqJ/cm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLEqJ/cm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB96CC4CED6;
	Mon,  3 Mar 2025 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740993063;
	bh=YVX+7eFEIapS76piqJxmNjdQLCvSNzn6y1ecUo9S5a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLEqJ/cmdFHt+Yfiiz3rj2gNWL01FWiSacc2H7LThdBVFrNA9xguzFTeRy9GpnXD+
	 rk2IsHJE4A4HLhEtZ3vzgNJDYfrWcP6b37M+VeaVpyhr2SHGOS28wOXPyO3WetOgyG
	 wQR8SwGUq9hT3Tm/bLJZI8945vYLuFcuHATry1eJraQ82+5lHq9kJgRz9+3jyYcY3E
	 g6AAMqFb2zRmo9cJvzOnpI52kkxNB6oQqgVDbZcnnVh0y40jxF8inImyocU74/O5OJ
	 xsQdMORtgHPZpTjF4mFRZqDzyaUKXJM/FBLI/Tpr3FA3xVeTIIe9B+XaDjV2Ntc/H0
	 shXOiY9vQ+Sag==
Date: Mon, 3 Mar 2025 10:11:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] regulator: s2mps11: Add support for S2MPU05
 regulators
Message-ID: <20250303-talented-tall-lemur-350ed3@krzk-bin>
References: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
 <20250301-exynos7870-pmic-regulators-v3-3-808d0b47a564@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250301-exynos7870-pmic-regulators-v3-3-808d0b47a564@disroot.org>

On Sat, Mar 01, 2025 at 01:07:14AM +0530, Kaustabh Chakraborty wrote:
> S2MPU05 is a PMIC by manufactured by Samsung, particularly used in
> Exynos7870 based devices. Add driver support for controlling its 21 LDO
> and 5 BUCK regulators.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/regulator/Kconfig   |  4 +-
>  drivers/regulator/s2mps11.c | 92 ++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 93 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

