Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3943E1F94D;
	Fri, 23 Aug 2024 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724397329; cv=none; b=mG9Ko7wk8hMs7P6PLpeMAhP9deF3WWkYXX9qpyKfKaCLBblD/g6dmTUy9WwD2tmaCrNdaaBpZRv8oP3W2PkL3pM6UqmZfvDyu96Tv1EXXH16ySlV3l8VvCVM4wbEM7n7RVBg9bs10AZrvFOTJXI7E+R+UcgzwFgmPBTyP8FSYgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724397329; c=relaxed/simple;
	bh=QyCcTe4msHaqfiC+96ztmrrkM0zY+X6wSGRlFtH4bMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLggVc43/16bPdGmYysfZ+DxlVoVWTmECsN5ClHlRfvp2CsHnxuIKZVMX3CVWamanlGUOvYPKOSZ0itw+ThjaUG4nk4s8IU7C2HtWwyipo+/MogtouaIE2v9i57WjXiOL89bSdkfKi4aYx39gu8LCdYZXBTuk3ifDi/h5gsK8EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dC+ig9bo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dC+ig9bo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAF3C32786;
	Fri, 23 Aug 2024 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724397328;
	bh=QyCcTe4msHaqfiC+96ztmrrkM0zY+X6wSGRlFtH4bMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dC+ig9bokeCIZz28A0VmS4yeNf9cfatW193Y0Y6P+XjjwWqYnUP7uxfgrYQreE0ND
	 tAAuhIQlXAsN3FodGpST0dAaCW8DrXSS2fHC71e5u2q/nFLpnWySM3gBd04s0b/bLt
	 obNkVD9H2j1o2HRB8PLz7/S9Hy87OqunqWzEJAfj/+nfMTbrDW4hQNBlvGK3/HRO5q
	 BM9cnqQhYBMiY0B3T4R6FRJ3matftWnbE4N6P+bb3e+Ddqemmx755xTWiF2s4Ynhxu
	 +BqC2Nf02HzPBSxtitUsKfYeiyXBUD5R5jVqqBWTaby/Aw+Df5uAn3GJbUjLowKy0I
	 fVVwLeOq9FA7A==
Date: Fri, 23 Aug 2024 09:15:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/4] arm64: dts: exynos: add initial CMU clock nodes
 in ExynosAuto v920
Message-ID: <bailwkwaxw27rtzgvjkapmmhjwearm7pjlstzc52qr4dgbaxsk@unpiayefy4py>
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
 <CGME20240821232656epcas2p2fa72bd9565570c26616aaa640d75eef3@epcas2p2.samsung.com>
 <20240821232652.1077701-3-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240821232652.1077701-3-sunyeal.hong@samsung.com>

On Thu, Aug 22, 2024 at 08:26:50AM +0900, Sunyeal Hong wrote:
> Add cmu_top, cmu_peric0 clock nodes and
> switch USI clocks instead of dummy fixed-rate-clock.
> 
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 40 +++++++++++++------
>  1 file changed, 27 insertions(+), 13 deletions(-)

In the future, please remember about correct order of patches. Nothing
can depend on the DTS, thus DTS is always the last. No need to resend
for that.

Best regards,
Krzysztof

