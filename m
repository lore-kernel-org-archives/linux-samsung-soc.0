Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB5038E5DF;
	Tue, 13 Jan 2026 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303485; cv=none; b=jSs3WNMwqvP5lBU5OUDRtN+YsRfYTY9IDkYxLSaWQ+RfxhaElpgGDAIUgt2JPkEkhX1RclVTXnYFoUYuZM+q3VjFrMKeq7ZDauzApUhc41l25QMFH5L0qDU2CHWFvZhCd0ED8Tsv7gZhbUpCWSvbdNHKKqGAXKOQWcJpToelH7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303485; c=relaxed/simple;
	bh=yt0nMAEBFNMStaYsWbuUjF/K+REwJvS+ftWe8IJEQ6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hI5rfGxAa2MYpd4ZSxnap2ygn8r3RrHdsUoVdaVKC/+73NiQmZ5r9+8q66MP6RuoA2/d5uWUlVAmr0xhLv/6wZrNuHCuFcBgHlkp21dWKDzL0+5RX4MzIyfDdi/3jgNVulUSV9iu6HB3q7I0GzlCRCpcQGtJHr1VsLW4WDPy7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2b739xs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2b739xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89D7C116C6;
	Tue, 13 Jan 2026 11:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768303485;
	bh=yt0nMAEBFNMStaYsWbuUjF/K+REwJvS+ftWe8IJEQ6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H2b739xsqUzuk/WhV2VUC8rWo14m6HD7Vr9w+rK47bLCFEZ//IG0ZSc2kksgsjJ+z
	 hGyUKsmc02LMAm6lCkvYUZ/rKH4nAegtnA7EMcmX68667/d9odMDOvqVMPpdxARh0q
	 16DhP/5qn23r/YmPnulvE6A2hAE75FUTu9pzd257EE1QrC+lEQWavnEjvo2lV7mQNE
	 ufK4WDNxtRS/a+g2jtlGQHlpxwt1sUV3kOOArprS/QQVJJIPHBQ1CuYnLmEnsQ3chw
	 vVFhcFV6bc3Tte9IYpAspeLKG/VEvgxYrkIl7s1gCGX8p+E+0sHXk+CtlWI1aiXUm5
	 H36v8feVTOOHA==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20260105-s2mpg10-chained-irq-domain-suffix-v1-1-01ab16204b97@linaro.org>
References: <20260105-s2mpg10-chained-irq-domain-suffix-v1-1-01ab16204b97@linaro.org>
Subject: Re: (subset) [PATCH] mfd: sec: Fix IRQ domain names duplication
Message-Id: <176830348268.2794400.10822931051208055686.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 11:24:42 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 05 Jan 2026 16:25:46 +0000, André Draszik wrote:
> For the S2MPG10 IRQ and chained IRQ, regmap IRQ will try to create a
> folder with the same name which is impossible and fails with:
> 
>   debugfs: ':firmware:power-management:pmic' already exists in 'domains'
> 
> Add domain_suffix to the chained IRQ chip driver to fix it.
> 
> [...]

Applied, thanks!

[1/1] mfd: sec: Fix IRQ domain names duplication
      commit: 3d97893e4a54f4d71a6ee848933ef44d89415cd9

--
Lee Jones [李琼斯]

