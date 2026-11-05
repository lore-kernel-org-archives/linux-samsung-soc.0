Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892280;
	b=bTpMItQ3kHm4CrZ4k42ZUiX9a2lqDf3o7nkN0cpilNuuPybVp/tX56yst8Vr9Z4cP274
	 AISeP7P/3SMTzkfMQ9fIJCioYdnt3qPlGBDbjAOi/KjJ6DaIqj47aj+EtWALwKd/SMY/k
	 qcHxnqXu9TwxxhUW9sgMKsHD0EiiN4RROP6aAnokUFCdlI9uh5Z2n9VnyMbfkEU0ndpc1
	 3oiJ7pvj1UYdG3CGN2AIU0xc04v9aKPvHedwmjGz9umKlQvM99VpJazuT1R9UFVGrN4sY
	 zWz0gRdPTtOe/5jQauyO3X+nopdq8odu0AISkScO8m0bxSJvS9mdHBOzZ8QNJvO8QNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892280;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=NLTVzjwW/Q8HtLH8gl2VVrDwo7+tJCjngM5BFqgJeRw=;
	b=oMPfCybT8RxMfmpXM7TUgKtIRGHCzbJRU1Spshomk510gZFNX8fWTEUoyS0F+8BKp80I
	 gYq4QHNVrmO+8+zxXkAEvcATf9bvCO/NI24OnCg1qsUD8I90k/L+zw1/PtzSvf3cPscSS
	 dIfe991Fj3FKqgj0Ga4Nbv6AA7LvVffq1sIQ7by5fkrClYMBXEa9UynIhHjsx633Y0oNm
	 E+36l05hdilAMZq75e01rTmEsTMaCJloM1HogPVmSo0c5UVyipVFbzKJMlIuyttR+uY6M
	 tqiBVRuDqMiVsAbvV4rSjdSamvBWi76hYo4ROI5u3KYqcz0ZL3Vjkak0glJNUlHyPgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaJX4OVc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE4606A32E;
	Thu,  5 Nov 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaJX4OVc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B422F1F000C1;
	Thu,  5 Nov 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892279;
	bh=NLTVzjwW/Q8HtLH8gl2VVrDwo7+tJCjngM5BFqgJeRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QaJX4OVcR4eoG7cyCHhaOrMz4sMVB7jv8h2TgNzAZVvI6jNX9MA5ebeGtKYcA2/1a
	 bCTL/BwG7zfUz/CnX2BpF7vEoX81H9Dx+rbyBSJyztlPDeodCg10GG/rcnQBtbJZ/q
	 lYbF0esaQaWSyiniY9m2TlZozQ2JLX6sLQY2HdTR2kOUvtmtIdz5aBYmbB7rjFBTA5
	 Vn0vZ0YWlnQQ05I3I4tY+C3iyUOEIJBl9h5+thPSPDZRrd79UjJU95b9gzM/3pve1a
	 fRG01wV99xrWT/XHDEOjejY0fMJndIOcSco2DJ3Q7sLrL7UrEgXvTeN1ox4DrfvhVi
	 0N1qB3KdsXoqA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
Subject: Re: [PATCH v3 0/2] ARM: dts: samsung: Add support for Hardkernel
 ODROID-U2
Message-Id: <179389227745.696540.5942397677891715381.b4-ty@b4>
Date: Thu, 05 Nov 2026 16:24:37 +0100
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


On Mon, 26 Oct 2026 21:41:52 +0100, Josef Schlehofer wrote:
> This series adds the Hardkernel ODROID-U2, the predecessor of the
> ODROID-U3, based on the Samsung Exynos4412 Prime SoC.
> 
> As with other closely related boards, such as the ODROID-X2 and the
> ODROID-X, the ODROID-U2 device tree includes the ODROID-U3 one and
> describes only the differences: the micro-USB port is peripheral only,
> as there is no VBUS supply switch, there is no expansion header with
> SPI, and the 3.5 mm jack is headphone only, with an on-board digital
> microphone instead.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
      https://git.kernel.org/krzk/linux/c/c3386407c5c0c6b02601f9c232f21a4e64cc268c
[2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
      https://git.kernel.org/krzk/linux/c/a312b2f6ce258fce3d8e89b939227932380b6017

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

