Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46885103F;
	Wed,  9 Oct 2024 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728505132; cv=none; b=R8yUXcUEWeS7NJjItiFAV5kz6qxJtI6V2LT+OT/VBbykuKs57WLdR8Y3xsjVR8iR3ktPhEvj/wMRw/xSf0uk/Q4yoZhTAbVqHxaZUcHIHAsnh3gcI1NBuFZzFNJyg53sIQimMQPbyR9xLn8IXSGn+1h+u3U9DbiT4uY23CttKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728505132; c=relaxed/simple;
	bh=OcFTPbM9NeHy3fvnysa1czyxHpaPIC9tRyzN4gQrf+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSe1Z1Cw7IsanIO8D/y8lIMLel64gpaYUOyg/6OcLwF4RmtBn818Sh8RtbyevnBq/P0Puqq8anNBDsR7aqZpyGAAp+WqwSDkrtRl9w8ghVmegX479elAr6p2gpifIxRanOStz//Dx31xaYxjdVOC99Yla+HNjFRyJrgR1dvT62Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbSeBiBC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbSeBiBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2087AC4CEC3;
	Wed,  9 Oct 2024 20:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728505132;
	bh=OcFTPbM9NeHy3fvnysa1czyxHpaPIC9tRyzN4gQrf+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GbSeBiBCg0UfdT/wvFASl6Amf3g9GyhoUJyvLfK6WYKuGRwX/KCJV6GOkaJwsSeFk
	 D09BlJpfSx4rU2TweKHwkmW8xsU43YcedZUc/FyWd9zDqWb+IKx78G0e83gmbl1EnC
	 nxCnw20Cyot94xy4HDziLNKSDukw3i9x4nvIkzlGj1luVOpxvOS/W4uBl1GW26jlJi
	 WdN+9iLrvcyRatDioFGk+j6wZOiYGfRRHrbVbofcuX8xGRqXjmeSKNWagSzJOP/Qsk
	 0UcYcYhhmZBdtBqT6utFalNVJD1jMUOSCTiqQ+rDDZfBBAmu5AuxNDzO+hkbgdafxq
	 uY4zxiuQHv05Q==
Date: Wed, 9 Oct 2024 15:18:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: exynosautov920: add peric1,
 misc and hsi0/1 clock definitions
Message-ID: <172850513002.606825.17060605580264918193.robh@kernel.org>
References: <20241009042110.2379903-1-sunyeal.hong@samsung.com>
 <CGME20241009042117epcas2p3fb2eea9d2618d36f6f9d6e0bb67a09f5@epcas2p3.samsung.com>
 <20241009042110.2379903-2-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009042110.2379903-2-sunyeal.hong@samsung.com>


On Wed, 09 Oct 2024 13:21:08 +0900, Sunyeal Hong wrote:
> Add peric1, misc and hsi0/1 clock definitions.
> 
> - CMU_PERIC1 for USI, IC2 and I3C
> - CMU_MISC for MISC, GIC and OTP
> - HSI0 for PCIE
> - HSI1 for USB and MMC
> 
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>  .../clock/samsung,exynosautov920.h            | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

