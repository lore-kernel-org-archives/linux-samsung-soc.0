Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B42B1C5D4D;
	Wed, 19 Feb 2025 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952719; cv=none; b=lERg8q56s6OCsrTGPfIoW/irFrs18wdxi7KNyIZ0f96RYtmYu1wdeiWMog6nATvYR3lMY1VFLT0EjZfJCSigbTHOE3Y2YiFK915OtXTH5lSDxyeoYKgc/RY5maG7OvNkxA/O5QPSDIGPMyocf+s1bYaBMz7nFt0l0yELeBgkCCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952719; c=relaxed/simple;
	bh=Y5C9D/vFHq4rZfOa6tjHQU7RIYN7P5MhUkxZQyexirU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1u3Ud6sV549U+GrUYm8AdYy7Svwd5Z8doO0l5Cjwj1+zEqJ/aC3zyoHu1zAyJgG4O8lrC3gHWl9yiHAm8CDtSydnn9PgRqVXocg0nTojExrN8FlWokeoVEvEv1UXw5hDedBvXo2X1W4vaNqvvFVDycF57ApKWmGXg8LuJE1Jb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xxib5cAQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xxib5cAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EA2C4CED1;
	Wed, 19 Feb 2025 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952719;
	bh=Y5C9D/vFHq4rZfOa6tjHQU7RIYN7P5MhUkxZQyexirU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xxib5cAQRAHBXgg/XZIb5FeRnQ76iLxR+ijhdedzKV62UHDAff2Uxg+sB7ZfMSm41
	 lieXAdHOB6oaxNk7+MrR5O6UPFaaqvs4qZIYulVMdtAiNnCfNmUK9EGVd6nGEbj3IG
	 38OI3b01ulJ+OLGmFSu+CRgsL5lMGfcspLdLTxzptWXN0ENocKkOa+G88BWM+qyLAB
	 Uh69vR9QRo2K/F7SZOB9uIhqWvWP06LZDRt1nKCmlSQrFn8oBBP9KhFkLvwgZOrvu4
	 xvqs7mBrui87AkpYW71HwO4Qc78agSRRrH/iHCRLQVimTGDCHtTFVvDXyx2ZyoSJmO
	 v61Tf+FY2u2hg==
Date: Wed, 19 Feb 2025 09:11:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
Message-ID: <20250219-discerning-affable-chital-1fdff4@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>

On Wed, Feb 19, 2025 at 12:20:32AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870's CLKOUT registers are the same as Exynos5's. Add the PMU
> compatible to the existing CLKOUT ID list.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..9a31b1c311b45096f1d680b6724571854c08725c 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -75,6 +75,9 @@ static const struct of_device_id exynos_clkout_ids[] = {
>  	}, {
>  		.compatible = "samsung,exynos5433-pmu",
>  		.data = &exynos_clkout_exynos5,
> +	}, {
> +		.compatible = "samsung,exynos7870-pmu",
> +		.data = &exynos_clkout_exynos5,

I wonder why do we need to keep growing this list? All devices are
compatible, aren't they?

Do you use clkout, BTW?

Best regards,
Krzysztof

