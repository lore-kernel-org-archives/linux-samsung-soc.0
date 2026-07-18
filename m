Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368BE3DE42A;
	Sat, 18 Jul 2026 16:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784391798; cv=none; b=rGwSRjFt9i6p3/ZrtGjM7ZP3M0H9EfM8EeSyGQeHyHG7Ue1SEi/ghmkIV6ySiIfTTGeKS7jbj+2IsJusnd8HotoJ+6rEt80Fv7z3cjaTQSvMir8uDocOCJ9Jgc60mW57m2xiIjqzq6qd8Zg+vQSqdB8KcaUnItSJ0w+HSetCCAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784391798; c=relaxed/simple;
	bh=8CXE8dnHUd6cA6BVVcsx2XQ5mloEU+tRYFpnNL3pEtQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gChNBIArjcUi0Mpb3qEQWEP6hnI7I9e/0QVX3x0ZG+qr8bwIKFwO4XFs7ceqeFi6/usLX+bmSespRivq0D4/TC1eAZbNJ3+0K+apZfczRy6NEC06h44ijTb1PtqUWaWMR6kyrThyPs6MkocM1EThvyQudOu9RDLct5R8m1DgQzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZKO031O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZKO031O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8241F000E9;
	Sat, 18 Jul 2026 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784391795;
	bh=4ik/QrSKPwfSN+RYBZpadgi0brYUJlQiUYzJEWmwqDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lZKO031OJYWiuDO11/NKzknq6ad5HVR3E4rkFWBsKVK501KGaZT+W5/MVOQ/fEq7q
	 nAw1A7o5Sv9dGgoH1tzCKTdBfucSaGaOrp9mFjKgMNWzIri0Ms48GZqHxcEiqMav+7
	 kMU2ZLMnzgIfiK61PkXsYFgLpcsEAZsm9y4z0whcpRJfHqx67bH8zHKR095TyV/9g6
	 +1R9LsvalgiCYuHwqacIKbtaqpLtePIV0C1UvquRyW/0WH5F7tYXsPbPgl6jD8kdi9
	 TrT0XvP0pF8oiYcTJFIIT53O4ftSd43tkc0+QiRq8R8YBnBGaZo8BNCSAAXFXj6/yq
	 I8fP+4Fuz+7vw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20260629032540.2331559-1-rosenp@gmail.com>
References: <20260629032540.2331559-1-rosenp@gmail.com>
Subject: Re: [PATCHv3 0/3] clk: samsung: use kzalloc_flex
Message-Id: <178439179015.22478.3429488347380802765.b4-ty@b4>
Date: Sat, 18 Jul 2026 18:23:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sun, 28 Jun 2026 20:25:37 -0700, Rosen Penev wrote:
> Switch three structs to flexible array members to combine allocations.
> 
> v3: move rd_num
> v2: fix compilation and reword descriptions
> 
> Rosen Penev (3):
>   clk: samsung: use kzalloc_flex
>   clk: samsung: cpu: use kzalloc_flex
>   clk: samsung: pll: use kzalloc_flex
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: use kzalloc_flex
      https://git.kernel.org/krzk/linux/c/7b2a8eb5c7b5545793e18036c8b66106f2d9fbb8
[2/3] clk: samsung: cpu: use kzalloc_flex
      https://git.kernel.org/krzk/linux/c/421ccea8f872c0e7cf6fd754a4a3bef4f45cf2dc
[3/3] clk: samsung: pll: use kzalloc_flex
      https://git.kernel.org/krzk/linux/c/6d32ae6403694035896cbf0436088fca4c6a35f1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

