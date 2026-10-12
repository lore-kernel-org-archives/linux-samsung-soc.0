Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639C9372ED3;
	Mon, 12 Oct 2026 06:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786121; cv=none; b=R8FO+gZf5m9Z8aMMcchfqfd+4KU4ErqIkf1rcrurF3yV11k6hp0w/+MjGoD8EEMwCCwf1Ks/rCfej/pSI/wT0G/frXtQHcjBkvmxWxj8vm8yA+olU3Mf0RwjHam0fkfPVVI0hQh0pjK4yqSGbYYeetQKdIHMu1oTm0F3hgE2y94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786121; c=relaxed/simple;
	bh=1zn9Ft8ejofk9Cf4MPQ38uX1EFuXSaeGwCiroL6Sl/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuWFXL6HsWjrQZ5lY0A02xFgv7os+gZxY4quNv60MTrm7Bdb7Quq0+UwtQ4t9bUQ8VAtPbysbqFlbhMHMiGj/Hwmwtr2tfY0NM3rUydcxfe6Gr0vF1LaJOSHvN1NJl4BxHINyB3aKcz7JXWxznOxmCojTWx5eeXc0Tg3P3BD6to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2y/TdHE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2y/TdHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B061F0089B;
	Mon, 12 Oct 2026 06:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786120;
	bh=hBwh44fL/gjgfNRTCrTc1OzzJYt8b8Lxx/wkIXrk3BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M2y/TdHEddwpZzLkvsfs1kvuqz7H4h+T3zY9qSkl2oiaZM/MO0GaO+z/Tk+l0BV3o
	 qG043hAD5UX37fkmNSuhyJIp79Np9K6mMJlsy8FhsInWIQLFX6W3hOrp4LzHgmbiQd
	 X47tjdOHmt6tByLBIcwcUwaEsfGIRahQucFFNJYNA0dKwsv4WXSvBdCpTzFgBlOOaN
	 DC2YqnuawFVDFueQdCF0mZqzJXkmS2eiflj28NCoBMpkeHzoXDQPT2SiAl8hHrcDFM
	 Rjd1jFzHVhdYHuuHKhsUbSFlt7JAbl8qXvjSvE2k+YzfV2vAFwMTNh3xHOT7tIhNfl
	 UsTXs/tPLqPtA==
Date: Mon, 12 Oct 2026 08:21:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH v2 03/14] dt-bindings: clock: exynos8855: add peris clock
 definitions
Message-ID: <20261012-inescapable-tactful-sawfish-0fd72b@quoll>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114339epcas5p46cb1f966de38c2156edb15955f0c7fc2@epcas5p4.samsung.com>
 <20261009120137.2801911-4-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009120137.2801911-4-raghav.s@samsung.com>

On Fri, Oct 09, 2026 at 05:31:26PM +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_PERIS
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    | 11 ++++++++++
>  2 files changed, 32 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

