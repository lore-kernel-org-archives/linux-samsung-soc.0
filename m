Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B9332ED30;
	Tue, 13 Jan 2026 21:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340182; cv=none; b=BnjTm47cYiQshwhgiIuRxdnF0kA9ug+kD09LX5qYs6iHYN6mV3XH5jLhDb22A75SsNL+0Kk/vhProzaBiHZtegbgVrNEXtQea3fFFrijkH93WJzhhzWb2Jfh18WDsDdvaz1+7ZYydUn1zOo0T+WdxORgy98l9b+clLEcmrQzr94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340182; c=relaxed/simple;
	bh=FEkMizbDSsQypYg+svblccChMUIqdyLjDJVlgTL1oeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/mTC91Kq1uXK0tM4seaxrI0YUTp4WwbSqg8yt+CBcwcXnwDQfB2lCj/skESQe1xtxZUMrMt7mBoSIBbWf4DguFYFgafOoUuU5gyyjiNh8tSuU+EPO9LAJjd9TZgqZbX1YqXEzRZlalkNSJ2GYl3J4MpZiQLEBSkgCanAO7mAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKYTYVTY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKYTYVTY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36014C16AAE;
	Tue, 13 Jan 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340182;
	bh=FEkMizbDSsQypYg+svblccChMUIqdyLjDJVlgTL1oeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKYTYVTY2nqg+BQH/i5PvS6FoyoODvwBzij8SP8vPrb4+MurhvFUSXQbPuG1U1rzW
	 LVyclwmUIVHDVYlUrAwI5//tA8K58bumt/c/yr+D0c/wwaUyWfljPr2fqfb1wdQk3P
	 fJNqdTFqU391Ncj5t1QNEuz8fZzeunfYG0cxN9FBc0GCzA9GVftZtzXEqS9HcL4RyN
	 YY7rVG4kp6QHVyjD9702xOXOIGSqkyV5mTM8yTz2xhyiQ8xvHTwzTxB4I7MWAAlMBs
	 jZc9xZ+zkJ6E/K933mOi6U+wH1/s/xbGPOO38WCWQq6PKQ+Lv27SN3eLsLkJsMyL+k
	 pU9FmDJkUpgdQ==
Date: Tue, 13 Jan 2026 15:36:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Doug Anderson <dianders@google.com>, kernel-team@android.com
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
Message-ID: <176834017914.197388.17009547252471169772.robh@kernel.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
 <20260113-dpu-clocks-v3-1-cb85424f2c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113-dpu-clocks-v3-1-cb85424f2c72@linaro.org>


On Tue, 13 Jan 2026 10:58:58 +0000, Peter Griffin wrote:
> Ensure children of cmu_top have alphanumeric ordering. Top is special as it
> feeds all the other children CMUs. This ordering then matches the
> clk-gs101.c file.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3:
>  - keep 'top' first and alphanumeric for cmu_top children (André)
> ---
>  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

