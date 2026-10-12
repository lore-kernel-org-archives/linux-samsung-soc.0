Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E0272803;
	Mon, 12 Oct 2026 06:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786162; cv=none; b=Oex04c0okKFEoj/nDw+UU8uwkLZgRkY7OhzXFPDQw65oSYqLSY7nxxz5hrbStUuzu0pi5ihwSGOBHCqw+FDIzKJJQUIJXDy0WVOfBP1o0ck+dTxcGLjTAvtkBfOvCKHS5XC87D9q3g6XqEElchIPYIRPsDB+MO4MQepYZ9VSp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786162; c=relaxed/simple;
	bh=VJMAYPgKtNhI6TjQe1DgQ6hyQmAJ/DF0fmINV/lprTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOdV5pr/rc7NwfIL2Np0zzPWTz9QV/5eAuSWdYwTeHuwBurlB8eYFfWWG3HvJF3M/62C8KaALzPO9UtxO4fpokXU0V31COFoD3x30n8J74NS+60v2+hD2BteEsiii5i95FOezuwZroQK/PU5pIRnMI7qlXZkoQz03yb+8/p2Pmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoDnlBIE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoDnlBIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0D71F0089B;
	Mon, 12 Oct 2026 06:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786160;
	bh=0M0lA+uNsymHadLr1LbW2/k9sV2Z0Pr3hO/Nohepajo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KoDnlBIEr8O41hMTpjpwGw+nkQh96FT/F6WyhI1ZcvmUrgBrcTOLokFRslZwSemJb
	 bakVoXcmtRAOJGQZSPp5mAy2PwfSsRb+JVSvJIzZmgx1ZTxaTHHCGaocRrCeZcjbkh
	 ndsOuMj09B+spZ068F0gjRkqfQFBiCIryPI5p00TOZaTpUrdhwxZSZZ2xSX0txZZ40
	 mQVuG5+m6yLM7CciQOpkjwzJpUAeNc7/xIgjX0rLnXfAd6k7NqcKbHvexFIm48/7jv
	 +bB4I8VoRFop6vfR3o5iUj9tvChy4hyc4XP07x4Q8zZcVnSjpCSReUKbfqi6UorlAa
	 Gl8vH7hgV+g6Q==
Date: Mon, 12 Oct 2026 08:22:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH v2 05/14] dt-bindings: clock: exynos8855: add usb clock
 definitions
Message-ID: <20261012-antique-stoic-herring-7cd2db@quoll>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114345epcas5p4e16ed504e6238438f7f66b1e0557136d@epcas5p4.samsung.com>
 <20261009120137.2801911-6-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009120137.2801911-6-raghav.s@samsung.com>

On Fri, Oct 09, 2026 at 05:31:28PM +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_USB
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

