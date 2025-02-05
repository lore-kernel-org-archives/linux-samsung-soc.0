Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441FF22A1C5;
	Wed,  5 Feb 2025 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744888; cv=none; b=HSyo8k9td+7wCf63X2+HkCevMCFMN/o+jG4fwJiRYENd3srAdM1XLI8yeKapNlAwDQkWOAQDevScJutZDDaVHtR8bgTAFrywUrGMDk0fb1MnVwl7wu9mL5taP53ObzICFzYqNp4zE+r0DGb20d/0xKv69FMU6omXlOlftCfILQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744888; c=relaxed/simple;
	bh=hEeKHTjnlMZWXMwMt9EQP1+J4OMBT7FliY5FeZRh9Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIOcIb5FJ14lF/QIUh4Z55H0Shy2s4E7c60yNW6U3tCOWSVc8Z0uL/m1uKJuOzBTfACBObsusiGwwoL0a+Cy1ocWKVzy1zRgTrcdjMi4/QTLudU7xXqtoYUFrAeTCOKf4MWTiZjG+ARiGa/DDm9hY+I1JsRMz+1yvvIzsNxgAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=er8r/Kib; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="er8r/Kib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401A6C4CED1;
	Wed,  5 Feb 2025 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744887;
	bh=hEeKHTjnlMZWXMwMt9EQP1+J4OMBT7FliY5FeZRh9Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=er8r/Kibm4oMw0VV+RMr2jtjhN1UJ8gdiwxe8WGrkTUmhep03DO2CCP+VJlV1dopf
	 CT5LBZSBeqAksqYU5ypA1+UtKiMSBMSFM7afUCxx02HCJ60yHtRpVcif2YOtemPF/T
	 cEzlwnSnqsrcAreV5saCSDlkmPr5t2vGZVdA58b1RBgObPyB4t1/wmOFwDdeI+CBcQ
	 GN+M2kXM3CWI0DCFKrbTUE3W3s1dSC7iaafZUC4ea9FfiGWpyQOO7VNt16Yn4Z1ael
	 zOM61FsrbjdAplNaIPG6eREYncwwyk86Ojeaa1NR18/vABWOn49l+P4+8XdstUdiI/
	 EOEYP8OAUGluQ==
Date: Wed, 5 Feb 2025 09:41:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
Message-ID: <20250205-important-vagabond-penguin-a69c93@krzk-bin>
References: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
 <20250204-exynos7870-pmu-clocks-v1-3-a3030ae5bb53@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-pmu-clocks-v1-3-a3030ae5bb53@disroot.org>

On Tue, Feb 04, 2025 at 02:07:31AM +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for the Exynos7870 PMU. It's compatible
> with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode, as
> well as other system control registers (i.e registers for the USB PHY).
>

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Best regards,
Krzysztof

