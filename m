Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823312;
	b=H5wO4nloywVVGqKVlTn6eLuyBxSnau5sW4inK9OpxSbIynj6O2N1Ys2xLb9PiksGvhMf
	 Cbd/Is3vEKFnsDOua408WqPFCwdznyUkR17/UtPH3/gtpMUreY5ntQDIgwBn3G6xB7LVe
	 P13GPBxfIXsWdZacShq9yQYHNAjxXPPi1ENwWr6N3eli5f26GeE8b2vLg6wM5lPU6CC9j
	 jmWeLxmO+eTSg1f1FESiEtmHVOalU6OJVWIYBkFBiyTh1MiYHXzmYsYuLWrZ0ZC5xJ8TO
	 DAeNbUj+33hZdRXwjGanVzaOsgn1VT9xmD5JDTxc/smlgL2LBFqS7LVuSwwjxyPZWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823312;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=KWrIH6Ghtq3+JL+RWvfyphsNLu+Dv8di3CE3m4jvDoE=;
	b=f01ZvGqH/5gllevroOGWvxmVWn13tDvi6uCO2lId19jnEFjrMQQuxGev+N0NTsozkrTN
	 EPyVamW2fvzd20dz7hn2eOECVwc7rEwnJ07grqlB7maMDWHh8gmnjrmUrNZax4KMxRTJ1
	 Xeo+weTyKqjrkOy61XvlfH9zRIoAUEO+lhKDmAsdsk5iNtwye4QbnK+2SSy4yW/G7rOGk
	 E3rdZlWQAd0980F+hUZJrPY1bR3N6W+N+NVetbDPyGZKzl+q52yOgNa6OiZ9z8EhZA3iL
	 fwyNxt/tLg0dIxoIfZI27i8X6IgWdSFez0tk+JwxJj3Di4YjoRknTdCSmGI2znqKdpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Az8RloN0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D3606A31C;
	Mon, 16 Nov 2026 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Az8RloN0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABA61F000C4;
	Mon, 16 Nov 2026 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823311;
	bh=KWrIH6Ghtq3+JL+RWvfyphsNLu+Dv8di3CE3m4jvDoE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Az8RloN0EyVusDn0tcUCCxPCZ5CQgMycNlLs+pMFYC6nGf0jt5NKUr9prLtC1tOY8
	 QmJV8yy/IvfRO20rx0UJCJlzCSQLB4orbSV43nbdKAg84a0Bl75kDMV7yuAGoNtQjE
	 4xiJKQAdnDFzoCIdfYLJKw5iLiIqy9J4cLYdmNbbjHZUSoYRGPupIRm1/Anjr/tyTT
	 FZ9i/QC6ApekL1wL3FYGhboDMrns1+STdmQ52o/beejpqs93k+gV5ga99XMF5aO1Np
	 LRTcsKntz6MmRCxI1vyqKTKSArJBtL+iifCFgoi55Ci9f1f8Czk9ScvJBzYn+lNnn7
	 pyr8ZF4LCw/7Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, peter.griffin@linaro.org, 
 alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
 pokala.reddy@samsung.com
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
References: <20261113110612.3265841-1-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v3 00/14 RESEND] Add clock support for
 Exynos8855 SoC
Message-Id: <179482330541.39377.15409353994638408556.b4-ty@b4>
Date: Mon, 16 Nov 2026 11:01:45 +0100
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


On Fri, 13 Nov 2026 16:35:58 +0530, Raghav Sharma wrote:
> This patch series adds clock support for below blocks
> found in Exynos8855 SoC
> TOP & PERIC
> PERIS
> HSI
> USB
> There are many other blocks, for which the support will be
> added in a forthcoming patch series.
> 
> [...]

Applied, thanks!

[11/14] arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
        https://git.kernel.org/krzk/linux/c/14a87bfb0614d87b04134156e090d7b00590d2b2
[12/14] arm64: dts: exynos8855: add cmu_peris clock DT nodes
        https://git.kernel.org/krzk/linux/c/99eb8abc95341047451f5c53d70d044fa4481af0
[13/14] arm64: dts: exynos8855: add cmu_hsi clock DT nodes
        https://git.kernel.org/krzk/linux/c/1d0231f292d437328ab97c24e052ab6a30d82bf1
[14/14] arm64: dts: exynos8855: add cmu_usb clock DT nodes
        https://git.kernel.org/krzk/linux/c/65ffdae53a6d522519fbd66d3cabbb4622e3e5bc

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

