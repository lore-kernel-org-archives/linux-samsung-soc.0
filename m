Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622892;
	b=5BScvFeDQ7bw9IZcRRYJwlfiqkmawOaPld5wruTd3w0ffrm0+poGX25NvuzX5L25WYI/
	 TVlnqOh4XUznUNNRQrGvSeX4wvjTegFx0NtNfrbgBdEU2qZfGCa6RVI3g67K8AWvdfctc
	 YVPCfuHjChuvhS0IOiI94w0KD+ZCPzovMI5r0Oz4uepsTHZnPR0C4bIy7zwnTxsjj8n70
	 tej4qpaBSWFiqg3WmhOVgk8N0ucal4+c0eFG3xzDKLpcFz3yjb93NKvZJ/bA+wT9+BwGs
	 BeUXR25xIjzvwI+LrmsGMFSIPEqiQ7iNbJgSz4PMsCcup+5nqQ2dRxzukKFboggGQ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622892;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=yToQM0paQR7zmvZ2SmvD3OBSFxK8Vhr65+b1WzhUJtw=;
	b=xDzyDfXCUnUbync3KwDDCPXfXgypSD7q/Kw1UIyLBIGlEcFeJCOcI92xkr5gO4U0q70R
	 4x/zxqFGsO71VMYB0JRelMGp/7fqwXPxlX/kPIci2jv31qzY/oeL7csfRxo9UQdu5uUDV
	 zobIAgDGknJ0fVcpWX2/0DSfcUcBqqNF/2ncpfirj26USjIUCqIoOigLv1TyJ3oS9am6F
	 HMTC5UNclJZf7DMbYkTXZajtGWuF4lA+VIjXgYMBwZk0bYYGIQ/1fW4Uw8TvRfOjiWqax
	 ZkwO/hzEjPJlMgqDAf+vZu3TF/6KCzBesucJjDBHdUjhL6NrgeobHSy9/MPO4Y2ktBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SRg/U4sM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EEA60A2601;
	Mon,  2 Nov 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRg/U4sM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEA51F00A1B;
	Mon,  2 Nov 2026 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622892;
	bh=yToQM0paQR7zmvZ2SmvD3OBSFxK8Vhr65+b1WzhUJtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SRg/U4sM6DHhpVNA26dkVLbZO/F+ksV8GzkceT7d65ygsIDmh2c1ZKpzKf3jTQSo4
	 INcd54EykhjhEg2GZtjXkwo/x32QX/p5QJ0WNd2vPbjZFu74xJJWaZaN+WdgKQ5pio
	 uxD/F15JS/dcqcldR0QlyBOwQA4F1FgUAPZ5/Km3dIYKZexvpd/+3HofXh9f3TOgAA
	 8FFt/kDVA7zWjIZslYgqiRWcqBtcbX91dtD87Xk/gdphjY91NeTsKMpiSpvPsvy6DE
	 ONo/HqKOUHQgCfOBoSB4iNKK6rw7FvqOnh7LwDuANSQRH1RTykhZkWOcbd/JScaXvN
	 wtS5gD/HigRKg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynos: Drop deprecated regmap from reboot node
Date: Mon,  2 Nov 2026 13:34:11 +0100
Message-ID: <179362278571.150793.14951710959877368862.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015040601.30049-1-semen.protsenko@linaro.org>
References: <20261015040601.30049-1-semen.protsenko@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=422; i=krzk@kernel.org; h=from:subject:message-id; bh=wM+eEA1rbKLNIo4wh2GGoOCxTleRi5qz+wg8J2hNRS4=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6IND0svnDInJLBouViSzAvaEWjmrP1qBCzfLZ hdYc6YxMRSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiDQwAKCRDBN2bmhouD 1w0CD/4+lshG6uIfgawJKkPJYVKoML+zPhqIb9vVgt1G5XIfjBDvgaIOJLTtuDbkGIIAvcMv05o gj5Yd3NW43n+kID+7J3bq+JULQjYat9PBxfpW8O5nuvxzt0bM7eKOjGpktROQRZwbakMU9b6EIh 6EU0a5uD9E9IeYl6S/gjJkMrlWYWcS4eX3RjUcpqwLCAKzxb4nZnsDOmnpdHPvfP9r0GYaWPuN5 bM69JlQhpDbaocdZvCdjCK/KiYTaVleqmO3vynXBmvF5vAWE19RRoLowL2OHFa8ioOo9obf58Mr RDPMAa+mnPR2p7xWKEcDw4i5sSfwEXDZ39X9gsLkuB4MZlaZji2thvRUalmq4KZ6b6GLJfl3h5L SG45y5FnBjol6UO3ZzMWHTh7hcsNnk5DvyCe/1agdtMjCXVylBW62IoFczbKYDCkxySbhlPs8cz xi7muUZMFWLwefGqveYb1CzJJvo5e7bLyrkEEpL2wAt51sb4NgOjQZAUkfW4bwi9FQpjZ1yK00R ysVp4d4m6dp+8hTcARYfpu+bL3O2VQ0cuUrhZqDiOpTUvILUmkroaHaLNjZ9r6H8j8wjEGShCDI ZlOijncY6sKE+Ybx3ibrOfchNoQiqmcfYu5sE5dVtm9gY+JevX2qEbW4kYhJxyZc5Xc8FrElSiC iWwXvUqK90iWp3
 g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Wed, 14 Oct 2026 23:06:01 -0500, Sam Protsenko wrote:
> The 'regmap' property was deprecated in "syscon-reboot" compatible and
> not needed. Remove it to keep the device tree clean.

Applied, thanks!

[1/1] arm64: dts: exynos: Drop deprecated regmap from reboot node
      https://git.kernel.org/krzk/linux/c/e6893608cf46691588406c0538d6a0c6c84f15f4

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
