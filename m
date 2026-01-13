Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00332ED30;
	Tue, 13 Jan 2026 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340245; cv=none; b=qvexZQ/TZ3WJUiM+FsdYwLO/zKMjupMvAM05wG9U1VHAkyWMnLQxz6s5ahPctAbVKeNhhBJ0ouDj1EOoYTXlv8h0VHDhV5dWH0282yPA8NJkCENbYBbRobGO0csIaCLlu6I+pCLZvU80I8BVimlAwRoGod6ToWCF7YHUBl4G7Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340245; c=relaxed/simple;
	bh=Y2hYgdYCfpd4HevIoVBQHoDJza+2OK8F8rfVvn2YQ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmN9yAUa+/URXRIlepABlMIIPslJkvPlxwftf0TYxwJWSI81uH1UKoSe7vcUMeyOl7GBJBZA4jZ8Vgue5Hw0ow0PGMW4RBko8sK4XOcdyFrzcK2wCSPMv7XhkiStcFDaV4zYfAebk0SYjRgBaf39XmfGZv46+hFA+dC4y9VvUUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0KTd5fu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0KTd5fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BC9C16AAE;
	Tue, 13 Jan 2026 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340245;
	bh=Y2hYgdYCfpd4HevIoVBQHoDJza+2OK8F8rfVvn2YQ1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0KTd5funtU5PUyBEmLRTIsZVdd1Y46Or64t8ttCkGaeTNW52ZLs4Ag0diRXyhSLz
	 Wu60RvCq/md7U7oYL3QSinKx851ZwFcvA6qRN07jCF8KDnBHGvQ0PtXR+gSvaz/beP
	 DloOsKJa0673INaC+qpqIWPLL+y5O6SM3oYQNHaK6c9s3xt+VhkNctgNviDloz+6Lx
	 wx05kUVyilJ91qvUuevaoFxYO8/4y0mlpYjpMt8wDAtPciGLnpFbEVJAFgj+a5nm+J
	 xI0B/hlPhIErdRUh0hyY1tOqnwWO4q7hyUPnke/Zw9jJt2AuP9xyTXDB4/jKnud+fl
	 guBvHQf68kL9w==
Date: Tue, 13 Jan 2026 15:37:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Doug Anderson <dianders@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org,
	Juan Yescas <jyescas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: samsung: exynos-sysreg: add gs101
 dpu compatible
Message-ID: <176834024248.198749.4225951933665450751.robh@kernel.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
 <20260113-dpu-clocks-v3-3-cb85424f2c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113-dpu-clocks-v3-3-cb85424f2c72@linaro.org>


On Tue, 13 Jan 2026 10:59:00 +0000, Peter Griffin wrote:
> Add dedicated compatibles for gs101 dpu sysreg controllers to the
> documentation.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

