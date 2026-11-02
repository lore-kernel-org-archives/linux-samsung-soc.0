Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622885;
	b=oAQR00dhULmRoKpX1YcPPWf5TRCArS9j0+6TOgFAv5MO63/1wivHrY5t7fX5HdTfyTDR
	 sjUEy3mgKJP4v9flIs2zPxpl0qO7wPJX1B7XEkZH7s60ia6P/KemRD9IJxbsvgZwVDXub
	 znS5vZhTZKoETDMAAuub0Ahzh/6pmAbtFHBCP3KLU2YqHs4SrS2gw/1S35VIpgSvSqSff
	 Z770XmLwsvFPm4FH+vhPUf3D6RFC7TWT0vuO6YFRD8v5yQy+e755yiybhXHU2411Mg6qN
	 nk7RunlLgYpxJaZZj2fqGxF/a7QwZIJCn10Nud8rkOLpnOEW/kjRZMS2dyF4vAkpsyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622885;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=vB/QfodcKWiZWUJOTh9SsW8eg+qgLoZWPWDPnMUHYHs=;
	b=qV5UtZ9tIe9Un926tI5+yXDf1sJS4TKfuZu7CRH37wpL7OCaB8gx+HVLYxlS6fjCWkDn
	 0U5FdG5HuOWC30Mnh+e317k/YiqwORehwvbng2S90oNneEiey30raGaRjR4gbvvhstvn2
	 DlXm4OZRrOk7wOyrfCg1D5191NcmX/F6wfywL/72KJjOovatfk/xcxoW2ZgtGIm7v8ZgA
	 ko7CfCX6cqRCg1GagVju66w9IDuohldkeFJ3WII0z4qwWZWNwyxrg3OVI2KIgGGuSXEgs
	 4K/cTqCj92ObJFlmCBxYi8Y1cDoYkBat9kJAySt8MEwOKPzmt5+YzdeVAwlWFpvvhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSaw2yB6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC6260A2602;
	Mon,  2 Nov 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSaw2yB6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7A41F00A16;
	Mon,  2 Nov 2026 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622884;
	bh=vB/QfodcKWiZWUJOTh9SsW8eg+qgLoZWPWDPnMUHYHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hSaw2yB63HiIM91JmTKFauvZ61mdtkUay0G3YtroYDvFQixwj9cSHftQ9SSbxS28e
	 848H+G594Uzj7aclFaLMNfMPNVch+f/tCwvibaA9IYfTUUWKnvFdJD0ndigtmYvqNd
	 6pDl7skSytydSBIRUV1PyjFthUKg8jIpbY8JjFeV3tAJbFWo7Lr+GP9sMJ94AdItzg
	 bC8aoUGU08aaBogmlVlxCG7MRa47xZyEEtnbSIBaID/gK1lh7aIFNZbUPpag9jjc9W
	 GecHv3VR5hsC6FzAOF7uXV/aK4C7me/pGWdjfcOoFHUGGtvx/5CPcL+qiuCEf7RDpw
	 kxkckTcYmmEkA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties
Date: Mon,  2 Nov 2026 13:34:09 +0100
Message-ID: <179362278569.150793.16322788098732007689.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026102658.968138-1-m.szyprowski@samsung.com>
References: <20261026102658.968138-1-m.szyprowski@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=krzk@kernel.org; h=from:subject:message-id; bh=7MJQLcyHtq/EpC/gFedY/OKjAo7rPuw6Bx/m9IEaDmA=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6INBWZuOMYJPozoJSETRBpmbe4jpEKKwOKgxc tWFVkK7te2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiDQQAKCRDBN2bmhouD 10KsD/9jl/DlheA7G7fjEVkDonjVIiRDyhKu9ugW1syMqv6EjJRbCAzhqR7NYvReYPUJmMB4Ynu Jfs62Pzfyl3tE0yE4Evbb+hcwI3Ocr7HT1Wq9B16OPJ6Pb+qCEACnfpGHlgb4FjXKy/I9zFFoGU n5AgDWR/9zYfD18DzvNceUWO1wmb9JRzJJrIa77pHsavUiEUElnPWhPp8MU8NcVtcDVdaDV2yFJ fEpynEjoQKvR0709pqrKck2lysvn48R/3BYIEwWg0LwnalRwonsXxeBMfjSdxEwUon5408601vT Ahoja0NQoN14eSHY/UFbKrtw6urZ2DpBh2BjiQ3wfSRhXPqTMLLpoZPr3e04qXzs7rcZrKAG1Fx 1kKbusWidERUvqLGi5AODhb8tSP8M/ZyGNwXL8uHwuJ8iEDEpeUi6TpMH/PXzLFXoHeyqiT4Q/l pfCxuX6q/+l6/LgdBfcprFaqgkpN5gTl/gjaBGKUsaybjfHIzNa+F44d6IIQBnylINdA9kCECQa igqaPb3YB//OTp60mPxTRElgSlybuQlD8ESllqLfUSkAiU2kYkQdRSMCmhbzDPtg+yu/7IClyei OdZ02WLKqeKF1FPe84Xj3njSHtl0s6Leus3IKu65l5oK+A5Xkd0n0LItf+YKgaSnwOSrxwVwN5x fhcL43WOnFuEoF
 Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Mon, 26 Oct 2026 11:26:56 +0100, Marek Szyprowski wrote:
> The wm5110 audio-codec node uses the legacy "wlf,reset" and
> "wlf,ldoena" property names without the standard "-gpios" suffix.
> gpiolib-of.c only recognizes these bare names as aliases for the
> correct "wlf,reset-gpios"/"wlf,ldoena-gpios" properties, and that
> alias support is compiled in only when CONFIG_MFD_ARIZONA and
> CONFIG_REGULATOR_ARIZONA_LDO1 are enabled. When those options are
> disabled, devm_gpiod_get() fails to find the GPIOs, leaving the
> codec without a working reset/LDO enable line.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties
      https://git.kernel.org/krzk/linux/c/76ef3ed714ac178cda84ef39733d4f712e682081

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
