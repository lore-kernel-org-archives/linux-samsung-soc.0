Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE163557F3;
	Fri, 18 Sep 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728173; cv=none; b=Vcnip1LZZj/5KlfNmgXH4jY9aGtzoNP+lyc3wNxbH4znxi+MrRwuvGBDIxEAcGvtFR8liwbr11TDUoKrdt5FEQ3maj5O5lrif1StK5uPrzvCjCuFWlddR9grA5pdVjjzgD6k4iw5BLuvBBNDds0eoS0csamyG50v0nS50Ai8tEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728173; c=relaxed/simple;
	bh=1Oi6PI7qQr27MjC4MRMOGWV3JnvQgWUbT70QSjcQZ9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P19aFGzBQLllMZg8iTTiONhkrf+Glk3D54ZY5+yunRRyr4jnE6DQdx0ANoC4Wi4PXarSN+eZ9Cdkvp3eS69sh9Ez5O9vc78FuwjTULnV8xHlAXwZM7kdkpvJt2sOXqEenyZIBWN9lM2Wmc+c2a640ySlb/Co7gKUqmcO6f+BBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TS9kWaMi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TS9kWaMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0569C1F000FF;
	Fri, 18 Sep 2026 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728170;
	bh=uSgU08nb+q4FuolsETVIvRO98eu8IGESlxKBYfU1D0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TS9kWaMiulIJFAq14xfelAoe2jz6mmbD414V1LzF6K9SqF8Y7g/etuj6I1Fi3O7TQ
	 am9qel0/cIRPvUt1RUGXGO1hNq1wJHfBza2a7rZfvpfHyF5Td6yXDnWHPGSGDGWXPm
	 TjPtA/eETvdlweDtBeq0GGXWjWouJifAu0lYSbvtYsTdSFT88RyOzTG7OhyFn6z1/X
	 RtTB/86vpQAJIhVxiGo+Ue5eJKrseq2d7nTwxyNB+s0lbtj/UI7f0kQQkaeGwhyTo1
	 V3U7E/syM+VcHjyMPyWc7PMa13d29iGCNmTmqbwHFmwx/o9+r+b77+WvwZzVBgdxZg
	 mRMSQ3EQp0i0A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
 semen.protsenko@linaro.org, alexey.klimov@linaro.org, 
 Thomas Turner <tturner@lineageos.org>
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916205522.159393-1-tturner@lineageos.org>
References: <20260916205522.159393-1-tturner@lineageos.org>
Subject: Re: [PATCH v3 0/2] Add Samsung Galaxy A21s support
Message-Id: <178972816670.83665.1520186497443894150.b4-ty@b4>
Date: Fri, 18 Sep 2026 12:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 16 Sep 2026 21:55:20 +0100, Thomas Turner wrote:
> This is a small patch series which adds support to the Samsung Galaxy
> A21s. This device is part of the Exynos850 SoC and its device tree is
> very loosely based on the e850-95 one.
> 
> Thomas Turner (2):
>   dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s
>     (SM-A217F)
>   arm64: dts: exynos: Add initial support for Samsung Galaxy A21s
>     (SM-A217F)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
      https://git.kernel.org/krzk/linux/c/1a672a79f917c9d5322b42f30efe27e1679c1612
[2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy A21s (SM-A217F)
      https://git.kernel.org/krzk/linux/c/3836879a69ffe2b06ddbbb1cd0a98928a1ef6dd1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

