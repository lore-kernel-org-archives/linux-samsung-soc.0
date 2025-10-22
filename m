Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F62FE06E;
	Wed, 22 Oct 2025 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119789; cv=none; b=ogZrjkOWCZpfl5GASz68k4c2eEaNhIOTkrs+2y0UWWW05KIvzLAsB+SQPzMlybqCbr6n7c3iKpXpWIUBF57x7guGxTAlRd0jLmRtuWuyt+9n6h3XSgSztkdv4dju1SSKJnBcMW+NMLSzsz5W5s7vhZSTNsnZV/k0gGi4P6g5j4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119789; c=relaxed/simple;
	bh=xwEauBPEHJrofe1MoLxXmJ4AZ4uBT0GSA7wT/TN6xso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsbXoZrVwvGbcKmwHuX1yV5lN+gxDfTPNq1iU1DmE1IUFFT/gbmVKjZRzhWmnnuJPgL1fG6yzc1qpjXuz9yfDpOhT5A9wT3WRG6UW9p9I4f9nd5aMYmu3RNcQNIG8X8P1C1BFZSo0oFxljY8GjrS6W/370CGs4E0eHxbMFSoQNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ycu3NBZl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ycu3NBZl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7802C4CEF5;
	Wed, 22 Oct 2025 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761119789;
	bh=xwEauBPEHJrofe1MoLxXmJ4AZ4uBT0GSA7wT/TN6xso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ycu3NBZljVs6uSEdPzZQx01UnpxSg8des4ZxUjbESf/JCfjShD5hjY1BnO7bQPcxr
	 FXcrDkKWfEBH3ldYc0V792BrueZ+zXQUKvhdKQoI3iHnLBLcoV9V7qm8dnz6XENWjq
	 7LJzMb3SvLSo7W5vjh4p5U2pj87CvbDNUTaWg7L+fER8Nek94/XvBNxaGUrlDVWadA
	 VP2FRMB9piQYUgP95kJQuh3/hMjI5kpgbhE1lLqkAmbP1YtzCdcWuRCn4ykTqf3cNl
	 QSZeFsp+moMgkWCQCeuvg82BPwCg4wlHm6Agf0SR9qcffnQABmEABOeNr8AeOq+BuA
	 K/pyDbcemR8Ww==
Date: Wed, 22 Oct 2025 09:56:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: samsung: introduce exynos8890 clock driver
Message-ID: <20251022-savvy-sly-auk-a60073@kuoka>
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com>

On Fri, Oct 17, 2025 at 07:13:33PM +0300, Ivaylo Ivanov wrote:
> Introduce a clocks management driver for exynos8890, providing clocks
> for the peripherals of that SoC.
> 
> As exynos8890 is the first exynos SoC to feature Hardware Auto Clock
> Gating (HWACG), it differs from newer SoCs. Q-channel and Q-state bits
> are separate registers, unlike the CLK_CON_GAT_* ones that feature HWACG
> bits in the same register that controls manual gating. Hence, don't use
> the clk-exynos-arm64 helper, but implement logic that enforces manual
> gating.

Please CC @Peter Griffin in future versions.

How much of this can be shared between this and GS101?
https://lore.kernel.org/all/20251013-automatic-clocks-v1-0-72851ee00300@linaro.org/


Best regards,
Krzysztof

