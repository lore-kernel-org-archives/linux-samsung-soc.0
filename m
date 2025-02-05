Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD3229B37;
	Wed,  5 Feb 2025 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744495; cv=none; b=QQkKMPPuQHBO/YlytdlwhdfV2TuKW4dVj/TN1k7hPkfu9o9OA1HrPZWMTdGuRMAemFHW8cNyJNzROLX8zNTHPPrctgZVA1XI1CvCEVOwVpnMUhUUSOhFjgn5kT422T45J0xgaZ2FO7M/boE3NdIRwsM0UoKxgWJZ3JrV5qqS+N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744495; c=relaxed/simple;
	bh=dSY6Qcl0WQoIjNSl3T+OnK38MZPpz5jA8KiUe2XOpyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gytnmeBI1aEfJa/rL9MrC0UEOJfUsttli1OdJaUWNF9vQcVVTLu5+GR446rxMRw37Rb4oXDhcCQ8CCcPZJ26f0vmqes8q8tPvZ2JXXW2nvryTrrFIgVhxe8kgI3zFdj9NsC6dgEm1j5ST15rTqyxbRB9NAX+6XRA3nTHoO9Q2SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/PY6DGx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/PY6DGx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6311C4CED1;
	Wed,  5 Feb 2025 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744495;
	bh=dSY6Qcl0WQoIjNSl3T+OnK38MZPpz5jA8KiUe2XOpyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/PY6DGxXeOr4DMOvxW3KRaC6K6JR1pJCrVjHDA9Mrse8Fqxl3P9vcZXbcGBd7dYO
	 +FRkKcVAcDCf2g/AKZdg3x86Bdvuo/0xFmjm43oPja+hVok6rRWbEY5yv2F7lIdF4R
	 JdIhQBINjhEczLMAt7igXEgiHRC+eGDxNwVUmJ84BzMjhr2kzNPRHin91KU/cF1Mst
	 qQt3mGc5hzjAtzOaixJ79vBbMj2O8qbKHvmF2b//zRdTyZ+oB0aBAaxu2ReiQ5SAy7
	 cJHIccbvvOJap1hc821hgqvs9HkAsoJafWvx6W4i3rLagQ/Yql/FxUmmYo8iQIgQJK
	 43xxcOiMbGjWw==
Date: Wed, 5 Feb 2025 09:34:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] regulator: s2mps11: Add support for S2MPU05
 regulators
Message-ID: <20250205-magnificent-purple-doberman-aaf1ac@krzk-bin>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
 <20250204-exynos7870-pmic-regulators-v1-4-05adad38102c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-4-05adad38102c@disroot.org>

On Tue, Feb 04, 2025 at 02:06:29AM +0530, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> S2MPU05 is a PMIC by manufactured by Samsung, particularly used in
> Exynos7870 based devices. Add driver support for controlling its 21 LDO
> and 5 BUCK regulators.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/regulator/Kconfig   |  4 +-
>  drivers/regulator/s2mps11.c | 92 ++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 93 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

