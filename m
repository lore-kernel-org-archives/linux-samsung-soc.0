Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616626;
	b=UERSF+tL3QCcIOWXcSbsCK6Hnny1HY9TbBHbCQobrCodHBHaIIN2BUU+6cC+K3Pc7i2G
	 NPQmNsRENau/W4Hvbm7MFlAMTh+ldt7nfwPPDYnQMai2SXsyHUPNM1x0f7FFHoJaCBc3I
	 wMyY6aJzBmPfz0x0IBxXe9IVxl5/yNgoea0TH59EwVBjRcjFsUQ0lI6c4dKErHenm6QyR
	 dm48ogUlFlvxEQkPKU/b0w1Y8l2Pa/VDcGOOTbTAyPXu8KN9ZzEX/aMrX1GJGhj2YDS1f
	 /0W9jeuiVBDpuQVzzds88RDs5uzQ1U1r5iRINiplGiGwYer1kYUqJ4spkJsMom/stDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=;
	b=jKJJL0Zrl7NkTpQvzEyWcWO3TJtWg0kO+C9bxYjNMxrqBsiFwvYcGOiBgKT6RK+VA8Oq
	 AHAOxYbcjSQOt/KTiKrew9YGukz5qdtjFfvQ9PC88EW/ETWq9LbOatyORF+rBNRSI21b5
	 Oc2ZUvZUUIXuYnnOv6KOSXnkRohPSfNlckDzTZMc/91ceV+mHAXcV54aXuPYY6wFOxZIo
	 vzRH9McA47lHjL1bHSIO536rA27Z0XeEgehqLdnZNtJGjaFBERdzzw92VnMpvRPccsUqd
	 nYD+rhUc5x9Z0dNcK8SIIaaaSzSAC4XJ61L761TXMI7rzC6yWEvgM3lipn6dDBEiE5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A0sRnbpd;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE71606A33E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE71606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A0sRnbpd
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4517847f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616624; x=1796221424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=;
        b=A0sRnbpdEp9bRwWm7n1SKo07iYgVbG4yS+gCF3Kw3P53kdbbL10p7APEcPps4zUEkL
         AegJrjCRe+13LmBOZt1u2XpQFfogVQkHH6rnhfADXugUhZf3577Ny72g8tjqqOHMhBV1
         KymRC2cRCY6oHj/MrUXx/Oc3/+mKr0bindxjTz0TRFl9QBYJGjzJMTnaYBAAUVnuuKrq
         oHeYZKe0DG7bfX/5wfnFRLDpiyQQITqXoHWixZ1Dwj4K0LxUekBinW6xBWpa55kbVOux
         kkYhQ55BvBU9Q7nT8GzjvxhFPE5FsBsRBSJTmHrIwelPvNjWjsOo0pTE4LNDxKegTbY4
         q1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616624; x=1796221424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/tWqCt9Fy+4s0v2ubcz5FyoYjRxKRthZCQi1c9cxS4=;
        b=OOpgvzFeX+RU+l+DYmXH3iQdqljeF/GU1oO3G280x1qzsYGI6XkMIS7LQdRSrnVZuF
         BvtoVUGAY+aeh3xIrOTh995kDQ0tLMJC7nZrTwVbz8W4qjw3viZq/NOCOZdYC8lEqN6W
         rXu00GL38xEcvVIZd7D9ITFIjA++g1KM87ukr2ri7HQp5gmfQDNRcqJ6eV8+tWlSSDfK
         /qbwafZCE6AkNFWmOaoZc6eYBZuKvpwA8SpieSfh/4bTMCxyQZkjBmWonamhWnS1R1lm
         X1c2lJ9gvTt94GCjrkmroLeW7GfTy33ntagyHI1oD9cDkIpR5dqJu+6JvzMSu5YnqV01
         PrcQ==
X-Forwarded-Encrypted: i=1; AL+hErFxY5sFew3grJ+MZ2PbxRStlQSiet3ZhZnxncM6Zg+PJhtE8/m2zctP79TXCs3jMrQWBniNv7FgC2+Svj1ilgsGhA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dz9hWu+IQiU1tjcsTdF7W/IsyDvqxWgP621qUNBVQX9B9ff7w
	uLGy2plVcJL1kbBQkrpkYoHc6zPhpUAv1D0Ok3sfptQNehXmbonhBFWTeNvlxPAUTmI=
X-Gm-Gg: AZFdTZf1BwQKckOgd69tFBqKFQJD9qbUbnuwmgFoSK+XxQCm2jfIg82n1hn+QPI27H5
	Fcl3sVQLle4X6ljwzrC7mYm0V6EQGS/TlQJwc3gYG3ypK9/iRlqlQU8u+aIvd27ozmTwA5r2xj9
	0pw7dW2PkUDcg3AqB2T2NnUs03dcUzU1Jr+r9dbof/a5p3W2TxS2NUwsB4BEkDfMFGr6rhq8eZc
	ir0axtq2CK70vfTaLlQV5fcqvoCluYY2QC4z+1fRBndG1yUV7Cgre3Aq9LTe7APxlQK013SD+uO
	2EBROWEKZHqARhtfWckQInm1JuTFR2uyLp+zT4eCq8Io+Sj01GHMxd/AF3vDH0cjc21fQlFB/0X
	uQKjNt5m6jkSXF/bRpvkR6BpLx0AkLcoMmcdCjaKHKHTtAiS8Lms+zqlnQLdQbnLiCeAvWqeeSt
	A8fSZ7nZJNhGxN/YWXDoue3ECbMpyF0kucOSJa/GIo6JvW5PTSbF6vjJvKr9JMvgNVCh72woyWy
	Vjlq2VA6bY7q35ToyCprO7zF+mhwQZcCWC71uWqRyxO4HsMZ4SKgx4a/vaqXSjqVUeQrVk95+vy
	LXJGGIpoPMcolE+vzh1IuCb6k5IAuc4q6ser68+hT7Kvb0i2kP5zEctd2dDrJzruVAIT2v0xYnS
	Sfx5cwyXLhyz4HF/QAWyqFnz4KJgqkt+alBReu+oPKXs=
X-Received: by 2002:a05:6000:2401:b0:4b4:2ce4:6dc4 with SMTP id ffacd0b85a97d-4b42ce46e8amr17140435f8f.48.1795616624336;
        Wed, 25 Nov 2026 06:23:44 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:43 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:36 +0000
Subject: [PATCH v2 4/5] arm64: dts: exynos850: add ADC node
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
Message-Id: <20261125-exynos850_adc-v2-4-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3

Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
Add DT node that describes it.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index ace747fa80c4..feac3ebc4de9 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -354,6 +354,17 @@ cmu_cmgp: clock-controller@11c00000 {
 			clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
 		};
 
+		exynos_adc: adc@11c40000 {
+			compatible = "samsung,exynos850-adc";
+			reg = <0x11c40000 0x100>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
+			clock-names = "adc";
+
+			status = "disabled";
+		};
+
 		cmu_core: clock-controller@12000000 {
 			compatible = "samsung,exynos850-cmu-core";
 			reg = <0x12000000 0x8000>;

-- 
2.53.0

