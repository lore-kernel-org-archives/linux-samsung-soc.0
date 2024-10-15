Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDA11F8183;
	Tue, 15 Oct 2024 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729024680; cv=none; b=KFzWGX+u52nHCYEaF9d4h7ofS4QiztD6ktl3bsTsxfu0M/gmIlymKc3pIV1p/x+FDGLZPsZiEs+OiYjurKL7/3mKSaXjv5UkeCcsw8cS+VExNEU1Ec9P0tY6RV87lvupYeMHyE9VAkFUJphLs9Xfp0WKMCEy6KIVGVd58yfzE8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729024680; c=relaxed/simple;
	bh=bpAQwajbarVL+eDndZH9QhXSZF1JRneheM5bwvm0BVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdNnYviloOhnRfOVeQlUf+xLferVDfEZ9BDNlcP8xBVc50Y7Zwc1ykcyOiTR0guUnPoGzuQ/sgBy6PQ6TREWGVDUOm8dy0yyhQpPWirxhqYMW2vpmaG5awpJmZrlQvjYHkh9KcUzaAmU1roX4jqCJ8kfuaw0t/QV3qpBm0u0Y7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAmg8LKF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAmg8LKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAC7C4CEC6;
	Tue, 15 Oct 2024 20:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729024680;
	bh=bpAQwajbarVL+eDndZH9QhXSZF1JRneheM5bwvm0BVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAmg8LKFmJoV5FKmDRReK0jF0mr90pHAjUxl+P42xpk66rHCTM60W7ItQlm046hFb
	 JdHqhH5kIZ4O539tpOToVzZVzw4SPNDBbsq3rLMEuZ20xBti8MCqlTSNWO2gw19g7V
	 DlYo1cEb5ikgEH6NMV77Ka1UveXatTieiUomeuin5G5N6nGYUWzTdcHQ8SZYJ0DoFj
	 u7raiKpqU2AEhH1b15O2FDl4snLkxqjrZJcGWi3Z0DilmM8u+5+IzumZojGYNLJPsO
	 f6opCWcWm6gdV6+3uAAebQ0kbIkmVSgz258O9MGwShawSKcOaLhpiE2jFl2Rk3hQfm
	 bUr93JqVxfLgg==
Date: Tue, 15 Oct 2024 15:37:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, david@mainlining.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: cpus: Add Samsung Mongoose M5
Message-ID: <172902467738.1921050.15982334526237120937.robh@kernel.org>
References: <20241015062746.713245-1-igor.belwon@mentallysanemainliners.org>
 <20241015062746.713245-2-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015062746.713245-2-igor.belwon@mentallysanemainliners.org>


On Tue, 15 Oct 2024 08:27:40 +0200, Igor Belwon wrote:
> Add a compatible for the Samsung Mongoose M5 cores, found in
> the Exynos 990.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

