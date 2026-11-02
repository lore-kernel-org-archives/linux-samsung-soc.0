Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622889;
	b=RBlNMcM+4gjZ3B9PjHwAuGgw5c33iOkE3MfQpag5rdGkD9nPDYOml1VlMFDB7FVkOETD
	 FKJbkrWYyjxqS9+tW3j3fPOHuubvXctKzAbjUtP4NRXstqHp0rWiDAZmsUsvTU/uB3m8R
	 jigz/q+4Yqh0WRmhaGryGwV8NLxS14UhDCbBMkYgWgS9/syPELtStb9khYHNEyVduXtdv
	 KLwD6MSddjK+8Gx28HuAPK2iaYy93VSuLkJYwvwkFM9J2AZD9xS5l6thMqVOA6QDTnY+P
	 W1BN/GBXso++vhgtaiNYEo4obpftTEuLa8wAvmsDh9iBhF4OU4HX0Qx9aIsd0f/aW+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622889;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=6q+eFjvqbBvXFHcS7dxJTRr6kdAEN9WI+0gOxHxbKNg=;
	b=omFUDLCHdJarn87XotdVG1CWhBGX6IfBOizG8J8cJPNSPZzrxQ/2lRUiujXO0kkKLEZ0
	 MgoDTdvDW+A1dSgQdow6PH/Vy3/TW7fgzlYJvtKU9hb467F9uBH3QuMsi4HrmRUFcWCdp
	 nBBpXqOiBdS+L+zbTqzsSXbV9FCDzNeVJhC0N/1F6+AgLpTBbH9WPdkefM8GPWs8QRlHk
	 baH9DnBJjdHS4AIihwLGmv29u1/TfLX8wo2W83qD1D7L3r0GC99NOENvk9USub5JulGys
	 J/IgkiK5GAkCdUWMwfKVI7B8dP/3yMKo0RCgnBmM5454jDg24hKojsPPgzXOxzPKEvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrBLDhp2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86260A380A;
	Mon,  2 Nov 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrBLDhp2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405D01F00A17;
	Mon,  2 Nov 2026 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622888;
	bh=6q+eFjvqbBvXFHcS7dxJTRr6kdAEN9WI+0gOxHxbKNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VrBLDhp2Kn6Bc/qqyJoSWlRGetCXyH9Jo034bt7Yu+3IuBPby46//Yw5EvIx13m3F
	 NQbJhhu2h1JYjX+3Ip2JEACJDRAXhNON3SaXy/VxlTIPKfTKIBau6+0kMtjh1m1Iuu
	 YhbTu3dDeInOnqKjGljY7wj/g8cnGwKg7wossdaV30nKyvIl3p2cKuGHA8JdbmgjuS
	 SIFoivJZin8RjzplBtTMrS4uTi4VJb9P3VABaadGv2rE9B0CAlc1iPo5uaV5QhXLqh
	 DO1qO1FDu6oFIY5nrbzibMtYFB9oY7c09Xk9G3P7zy/erTafeV7hp2UPUF7jv0lfAD
	 cEOvIh7d/hAtA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Henrik Grimler <henrik@grimler.se>
Subject: Re: [PATCH v3 0/3] clk: samsung: fix probe-ordering races in exynos5-subcmu
Date: Mon,  2 Nov 2026 13:34:10 +0100
Message-ID: <179362278564.150793.3026517244814507054.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030075325.517182-1-m.szyprowski@samsung.com>
References: <20261030075325.517182-1-m.szyprowski@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=krzk@kernel.org; h=from:subject:message-id; bh=C1XqwyDRUMOQuSCJdpHNmrSdOZICGoEXkbLJb+jN4XY=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6INCRb/7CZK6zewrZhCK0uD1zTqICzByGR0DY pNfQ8iUSY2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiDQgAKCRDBN2bmhouD 17dgD/9lsUdAAUc0nc5J8QiPb4qkKY4Ntn6Z+lg4NQTxC6FfUIgAklv6GFaEGWsyqQhyzJPj0OY ZAcOVGsI0tgDgVNbWtjw/CXUtw0KPjxGeD/HTwgvreCTM6yUwHgu2TlsyKnpKHzAuHf3/C1Nrdl P89HRhGGs3ayRCQ2yfZeaydHAvcvy/MdP6PYP7ZOg3bN1ffi4z4YTptakubtxRT3//0cO9AQSat jpOfwAWoUanDX+BUeoPiYE3VcAW/NpTByZYuVHv32TMNGhNq7PnXyBDmpy80Ywo95kclkCE6bQm ngRHcAS9DBGbM/pGXI/G7qEMf3U6Wn75h6AdwdIrQ7J32wvtOzFQ+PwED9+3VHwgVJkgmOpQyKC 0PpquT7gSymABIlLacpp+8PgcNNLW/9TXUYowAnCjwTZuMLjDRDypWUej2IofU97194mZ0uCnou XYyZEYa9X3W5cpDsG5hjIMWZAWXJ4XM9h8gu7izHhDqiKV1UQ2oDlU4hKXFKKBU34geKBjCkPsF Ak0UOoilkBvj0Gi0rbraJm8bn1rroFr+ofXJ6rlkUhTSpAILvizEHHnZjXqZWEkzcINVRSiYsFU rcr2h0Ku6mBqg7gJe/7OKtnFcnM0JcvB5f+GFfu5B76e/VH/BQ4RHxWbEBj7ihvAGQbjEP2ZQu7 0SrQ2+mAVWed4
 +g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Fri, 30 Oct 2026 08:53:13 +0100, Marek Szyprowski wrote:
> This series fixes a group of related issues around power-domain
> availability and probe ordering on Exynos5 platforms (observed on
> Exynos5800, e.g. Odroid XU3/XU4), which can leave clock muxes stuck on
> the oscillator instead of their intended PLL parent.
> 
> The issue was analyzed and patches were prepared with LLM assistance.
> The whole patchset was tested on the real Odroid XU3, XU4 and Chromebook
> Peach-Pit and Peach-Pi boards.
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: exynos-audss: Propagate -EPROBE_DEFER from input clocks
      https://git.kernel.org/krzk/linux/c/e7fbde7216d28b3638120457ab830d22f7b83156
[2/3] clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync() during probe
      https://git.kernel.org/krzk/linux/c/73cb3b59548acce1d9fcf6d5a8c3468391dc4580
[3/3] clk: samsung: exynos5-subcmu: Defer probe until power domains are available
      https://git.kernel.org/krzk/linux/c/5fbe2d229bd3738ed63c7c9177466ad6bc130f18

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
