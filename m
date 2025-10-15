Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F72325480;
	Wed, 15 Oct 2025 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553116; cv=none; b=ZKhUSNIet3zVykZ6HXFACq3o4BSonho6KQPdM/PAAEAnav68hqCTwEg5T00a3wThA1Vj3g1FdEhMA1fZ+LW59R8ZpJvwVrhv01IFhRZCFoVt4biI5qYIG050x9UaACX+BD6DH8SZTNWv/Af/OeD4JR36t7o7fek0dJF5toUo9Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553116; c=relaxed/simple;
	bh=745IEqjMLPClb39Tf9d1zUU3SvdsnRvc6cJCVLlU9Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWh+BwbVO48y44glexu2to/8k6EcZ52FtwomkWyimJfUUVvRzqm77567JKHdEge3md7GvRx+dT6EXZPwGzUHsuKuWfDA8e1JTH1XWPIjapAIiIzwPM6fXbBuaoaVH/F4iMgfKxKfIqdybyy5fES9scK6x4ZatDJgIaCyrrt13lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=by9wpcsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="by9wpcsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEA9C4CEF8;
	Wed, 15 Oct 2025 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760553116;
	bh=745IEqjMLPClb39Tf9d1zUU3SvdsnRvc6cJCVLlU9Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=by9wpcsvmDWWfdyRKF3SXdvPNP6Bhdym/3/NdTCz+DyPQGXuqijjPP9dxLllX8bW4
	 L6CPRD8ggleEOHq4Bm1DIN+EJfxqTo3CY1TXfPDTjBYM+D7a14ucyyXIRfF+Ri4L7z
	 KDGwJtLMaMl5lI60NlVw95oztEumktHRXN1ZS+AJxJWcCVW26sLGqhc5eFE09kOd/V
	 k7SlQIvAJpwv2ivP13t54yOsh15++RJB04QN+uaiBf8dIpWcRf5fv9ooVVBjqzG5HM
	 lYVNpswqVeXzoCN007ZfAC5OCPwusPDBFPLGpSIe66whJRI3/qb79NLzcHVjEcnUmR
	 CYh6y/3MrFWOg==
Date: Wed, 15 Oct 2025 13:31:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101
 hsi0 and misc compatibles
Message-ID: <176055311249.179333.13160204351428508138.robh@kernel.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>


On Mon, 13 Oct 2025 21:51:30 +0100, Peter Griffin wrote:
> Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to the
> documentation.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

