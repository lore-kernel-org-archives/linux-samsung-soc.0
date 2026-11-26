Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677375;
	b=x3pzZr6bD1Rsc4F9n56TOOCXw9emJOhkpgAqjvgM8GBjQs8ZqeVmuvzo8RK9NczFwPgD
	 5bNdftPQIv5wN6nOKUyfxq+nfeZHA/JUUlWN2lEls90y8QVGf4c+ta7GJaP4Gpf2OordA
	 DYQhMrWh5K9d/qJyWs1Y/JaO1Fu5g8NytXc23zwE4hPN7pvMgJjyBoKPj5h2g4keMk7Y2
	 tJQzrMGx5sO1p0E8NCo0889nLSy/Myy2mX6SRiQk2Kj6EBw+a9C2csdLjHkC7MV1X7uU/
	 C3nv+bqC2u4I7xtqxgGk45OHc9ZhP66d4orQSRkE+tLQ+etfY9zwMOk/wwoNpGDQ2bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677375;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=/+I1CdDAFFWwmZTTTUmXZi25o4tm83qt9JKICgqcmpo=;
	b=28M/qORZ5unsrgwapu9+TZpTKeS9otwAwplcgSyFiDzGionBaR+P99edqys/bn7nEC+y
	 kRoHpyVpvlUJ6+jXsJ1X085X4EEu/sRI1kXXpqOqSqxLBfyLDmV90RmoNfiBLaG8WfHe2
	 fIck8fNyUDwJbk0EOgZezFAau0uZmJpOqb+vmzvAudIPs2iwLxROFhsMG01SHU0FyTDDD
	 NCiX1Csp6lWhLi+ntz1v/5hZBtrkPDwsh0mnu2soPi/HsvIpacxZjNjMmWQKqh24na5YQ
	 RHcfzIIBbIacnj9aTb1mqUIpYKX0RbrxEMMkj5u8kTxhegGenHrSb6i9dCOlCKUZW/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UHrO/PY6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AF606A31E;
	Thu, 26 Nov 2026 07:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHrO/PY6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F141F000CF;
	Thu, 26 Nov 2026 07:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677374;
	bh=/+I1CdDAFFWwmZTTTUmXZi25o4tm83qt9JKICgqcmpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UHrO/PY6Qs/OEQnhvYy3edeYx/msRyQI7APRTD9u1EqBD5JIDO3xWk9D3GOliat/a
	 xRlUVwuWALjLCrCTl2hzjJSk9kVvTXrXVxG7Aq6dfAbrACxsxs5JsYJjWLou8UXgsb
	 P9dxi4RDtuTc0g/ita2yD+cb8u4bmOCevVsu2Y5xB+RbZiV9kNb5TW6UHUvMQhYVKP
	 Vkk4niBRzaUjyyFXVfbfSpinz4WP2zOtdRC0YB7tOEa2QY0BdxOzuL8t+AsNuxPGWA
	 xnI4S+0wZAND3+N8Hxl1NExQCEboUN66oZdeVbHoMN1INF9Z8UBXdI+B/2z3XnuoWI
	 3btietZCChZqA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
In-Reply-To: <20261119103033.1161693-1-m.szyprowski@samsung.com>
References: <20261119103033.1161693-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: samsung: exynos4412-trats2: exclude memory
 used by secure firmware
Message-Id: <179567736935.9086.11650952551229586575.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:16:09 +0100
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
X-Mailer: b4 0.17-dev


On Thu, 19 Nov 2026 11:30:31 +0100, Marek Szyprowski wrote:
> ARM: dts: samsung: exynos4412-trats2: exclude memory used by secure firmware

Applied, thanks!

[1/1] ARM: dts: samsung: exynos4412-trats2: exclude memory used by secure firmware
      https://git.kernel.org/krzk/linux/c/601999d004ea467bac8f29196df8af296b08564a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

