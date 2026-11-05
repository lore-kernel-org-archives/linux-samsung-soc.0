Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892259;
	b=zBtr3oASSfErxq6ef0LUxDa/Q6INNrjfq7A2Afo84uK4NOgQUAyquXXqX8QUh5AlJGTV
	 5GdvfkLGfJcxIHf0E6UVH5S2GUIPY/1PhgyoFwtBCfSZGBJ3e25oyTgf3liXHP9hE3pRt
	 wxs5wy3rO2E3ipt8weflWnV7H2pxAhuZQ7VYNbkMpVQavyQNY4v+MEJ7UjvJROn6FdZS1
	 niPrSGRB87lLcSa0UI2zI22wSuzh8blWTFBaAiYvRJTvaZC5+l0hWDhnuZqX7u7Wj1tRJ
	 ESoUf4wjmn1JrEHHynBHYBn+TIWc7+p3JirGeMz5t9IzA5406Oj3xJ40MM5ajLeOGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892259;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=J6+TRHT0fPj4a1Bf7OUNcK1tDs18NfRgn9ubKZdBdOU=;
	b=haATiCiArCFYUriVyX2R6F39ze1uz8CfXUO37l5ODHBePWIdPDwKe96CS/TEwQ73QHth
	 rDeNkE24vFE9kk3sLmiyKrRGFhEaxxlwrgPhzyjA4yIllFLWZ+Z6+B4EkJCUkfWYZD5LJ
	 3fElT02ztEAQT5PMzOVa6eihl6TglqO65JwI0cdfbxkhzbV92j8qWJK6wlmViHvo4MnR4
	 Mn6hmhkbWr25Irs6ltdfP19t/XDUNizJsrAhcXJTA2dLfkPnl4RBBTx+irn6iOv2vslBS
	 UW+GKWQMSivZf0X/v+P6MJkvBxqBhx4TItovgfJaXqunxV70XmLSOQ0Ob4vjelfdtXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Rn0+o/u3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F1D606A32D;
	Thu,  5 Nov 2026 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rn0+o/u3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82531F000C1;
	Thu,  5 Nov 2026 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892258;
	bh=J6+TRHT0fPj4a1Bf7OUNcK1tDs18NfRgn9ubKZdBdOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rn0+o/u3wb7vjgps6rsQku1SIVGcwBW77XRmVlD/Pg3Zz9P7GJgl8tbCq57ueWInN
	 qunl6YTKOzW+nqxJhs3XkYtHUDLqm5z46C/b69OE6Mu/c6vU9rBsB0VRhdbS9UyxnP
	 opXTrGzP7L8ictun1rVh1AZw9HZHctnuxSzJGqHheg8FtByiuGxa9TFK8aMFvzb8QQ
	 C58DV5hBa+AAGFQzzNjiKEvxLl7v714/vxNfvEtD/ZaCVxzdVZjD5q4U1vX+ogH9d+
	 0d3IWyY6ShVBz68eNVQNa1XfGehE+jhX2pcF1KVDxggRLK3nyPQweixS6rvT8NysOr
	 44RXew2NIxNJA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Aiden Isik <aidenisik@member.fsf.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
References: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
Subject: Re: [PATCH v2 0/3] Introduce Exynos5515 pinctrl support
Message-Id: <179389225540.696044.4640598390040264702.b4-ty@b4>
Date: Thu, 05 Nov 2026 16:24:15 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 20 Oct 2026 01:02:33 +0100, Aiden Isik wrote:
> This patchset introduces pinctrl support for the Exynos5515 SoC.
> 
> It is very similar to the other Exynos SoCs, therefore we reuse the driver
> and for the most part the pinctrl bank macros. A couple
> Exynos5515-specific macros are also added.
> 
> Kind regards,
> - Aiden Isik
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: Add compatible for Exynos5515
      https://git.kernel.org/pinctrl/samsung/c/e0a07b3e54f762774a604c39275afe3575bf8352
[2/3] dt-bindings: pinctrl: samsung: add exynos5515-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/c5ec9b1c5f95b4af91811fbbd86c83d0f5f240ad
[3/3] pinctrl: samsung: Add Exynos5515 pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/6bb1aa75bc2c85a89ee7856b9557b519fb7428cf

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

