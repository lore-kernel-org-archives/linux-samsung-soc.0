Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C50191F77;
	Wed, 19 Feb 2025 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952441; cv=none; b=fptz6fnwlnUEbPv2EeDSsupsD2ERQQdAV5+BNC0qpOzApIWL5V4Hrrn9FQs9gnMctFpSwy8Iv9wzRWmAgE16ugefsazY6qUS8GsdI0uv7752f6UUL4UMP2D6faqBWiQZPjZOa+3gjluIc/bCAfV0FqiqP3FhDPcaFRtGbx5chmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952441; c=relaxed/simple;
	bh=oPdqC27LMeZBOtRe3tu0wOqkmalfCuiPMd3Is+E5hPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4FKMNa5J6812XrAbS+aTc27tZAsnb42azHSPpXHF/yCPpo/T8I08GzABizgc2MA9s8GLo1VJ53/oWDOd1UMjbkIU9SJSyhXppU6P4UyLXHO+TZUtamlAklCJK0+mhW43e/FJGihSbPu/Ua7OwptzVUT8gdwxzo8C1mqDEpz4Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDt63obS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDt63obS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2754C4CED1;
	Wed, 19 Feb 2025 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952440;
	bh=oPdqC27LMeZBOtRe3tu0wOqkmalfCuiPMd3Is+E5hPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDt63obSmoG/1zxBKwdIVxoCHK2hZzwNXC5nnATPG58h9v7zMHt/8OS/xRCp+TcwW
	 uw/3i8a+wbqMj0JXq/HSO8cI3tcsFHiV/qnoJl3+WwK3aG/xP476JiDgnmDOMFDNmP
	 cKxjksRceqV/TCqiU/tqa8ZLJvltccQfEZuXGayYSdsAcoqUk09D8DmN+0kNyFXrqk
	 0C8JM8YbXPKwPIDbysbtp2r6W1dI227ae0s+7s2WiXxgPPxKtfWwyAo/j7PO84gaVx
	 MrYABIWZ7Z4KhEMfUDGtiE6apwYGPgta9mGGTvuRbtVHk0oA42yvMCV0SPoM48NvW8
	 isuBkuFnjDadQ==
Date: Wed, 19 Feb 2025 09:07:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
Message-ID: <20250219-naughty-spaniel-of-refinement-ab6fac@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-1-0d1e415e9e3a@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-1-0d1e415e9e3a@disroot.org>

On Wed, Feb 19, 2025 at 12:20:28AM +0530, Kaustabh Chakraborty wrote:
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++++++++++
>  1 file changed, 324 insertions(+)

Again, you keep repeating some old patterns ignoring what was added
recently. This must match compatible, so missing vendor prefix.

Also squash the patch with the binding itself so you will see the
difference in names.

Best regards,
Krzysztof

