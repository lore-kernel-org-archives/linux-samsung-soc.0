Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8451D6AA;
	Sun,  5 Jan 2025 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736069039; cv=none; b=mlsgE1A/UcA+lyIPfjlNlXuV6J6tVKwMnmuGs5bZ+OAUaIO6MdlMeq1wN8F/YBDr5gEa+KoL4rBKmGAHeJUmiGUwDZLqFttYfQZOMcLeifoStLehyIrun3iA08IGxwgd6Uw32F4FGaE5wwcNDgG3bgEjNJQaAN7NuQ7ymI1vnF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736069039; c=relaxed/simple;
	bh=zl1oDwmr6TY844DchTMB0/AD846FKLBtUuIWHTPMiLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/OgfQcf3dmWx7vEwmlgZ5YdWasq01tQGl1oeDZ9GBxl84WnqOx15FkgnaqmppOqUAYOBr7zdu8Tng2libFDmViA+8ghPOkFs5nAk2l4Kdq/m3NX6K+9tkBFarEa9JOStW5zVRStWI7AFOiV0XBsp0alRtmIiQYDHOldl8OoO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlDHP/QJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlDHP/QJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC925C4CED0;
	Sun,  5 Jan 2025 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736069038;
	bh=zl1oDwmr6TY844DchTMB0/AD846FKLBtUuIWHTPMiLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlDHP/QJ9tQCN2gjXbwc+xphbuX3rsKBACyYOpwHmntNlKgDDNBSF9ZF5/UiIsxk9
	 bTLbzn21IL9zWfIS9y34C27DhrVVrYIchdfPb6MaAp8ucH6c1SEai5VPjlr+WBq/Gl
	 NXUmCUGKtwcMWHhq64O6JL+FV1+tZuTCGUHVD2TX8KuUyp7Cn9IVoTGAciwVhl9ij6
	 YhV26DxllNmYDTkaYqlp75FIq2NuCvo6+f9bfsm2RqJtFHuEhvSBGavBwfi70QPNcI
	 MkeODEzBcydD/AufZrc/GQXtfAhEpIaf/cZAwilVWVMHDIbCOBr1ZZoUeZ5vwqhaSp
	 YZWg932sSTa0w==
Date: Sun, 5 Jan 2025 10:23:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: exynos990: Add CMU_PERIS block
Message-ID: <bysft2pubdnhp6wohafxocix3zdsvmtbvbj3txenminyatxitu@wb6iqsuekvlj>
References: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
 <20250104-exynos990-cmu-v1-1-9f54d69286d6@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250104-exynos990-cmu-v1-1-9f54d69286d6@mentallysanemainliners.org>

On Sat, Jan 04, 2025 at 09:05:56PM +0100, Igor Belwon wrote:
> Add CMU_PERIS block compatible, and clock definitions.
> 
> CMU_PERIS requires one bus clock dependency, and it's used for i.e the MCT.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  .../bindings/clock/samsung,exynos990-clock.yaml     | 19 +++++++++++++++++++
>  include/dt-bindings/clock/samsung,exynos990.h       | 21 +++++++++++++++++++++
>  2 files changed, 40 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

