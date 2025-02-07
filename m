Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334B623C8B8
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Feb 2025 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943809; cv=none; b=p6DoZPSAaSbLBvMmQhRhO3btg5VUCqErbKRqljvQWQ8uUkqms3iX/QRZy/veknCfgRsnmRqntL/w8mO6t2fBY4vEwMxlrnQ25e2oF8oEiU+uKDME7RQ3WuO6GEupu/NHJeWYH6thTOXlhah+NW3+FeMl4leRff+1UW8t6Gqnb1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943809; c=relaxed/simple;
	bh=gLGpUaEfuGzvyJ3L21mz+M8nf5rblyz9ev0wDFYPZyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmG0rar+k39Gx/A5/7ew5JY1TC+kNjBML2O/jD+X910GzRJVjeGjbbG4vs1uF58tBuV4Pr2yIe1XgN2PZ1W0wLVhRbQuUprQ7eQvEV7rGWPnrLaSfboNM1sogudlzVSGteC9nQ6OMuUV/Iby3V1PRzPsE9vDSVCEj7cGUqqH1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ihy3DfOL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ihy3DfOL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dcb7d6b69so373407f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2025 07:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943806; x=1739548606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDJPIIRI6GLKY+Zyqq8NOfeinTkGodpwbMUhAI5OLLM=;
        b=Ihy3DfOLCh1y9Xl1mXequJLBtSBEU4kY3c9UIelBcyl7ZGlJ5V+2ZOrcQYxFXKpxj0
         08OOmGOoGAxEz5G2Xtk0DgkpnQ6KJHJ5qwkXupL/rugcxtn6NxaGEL00kFmVNgO9lD6N
         PNDTMX4sbF/zz5IorFx0QA66PglPLbM3F+btWa6AN0K0E2vJg+8l47OsMLY7q0A/erbt
         +fdk17zZqtMcZA/0larGtsjiSQGv4nsFrpQEAGnWyW7RcDVj/Ad7Ohac5CHK+/rYw0tV
         GaHzSf4G7qdE4JbrY/QVFKq7svO9V0Z/WNonHZhwCfRuNUM1PHWxSu+dUhFhNY03uhqw
         QY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943806; x=1739548606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDJPIIRI6GLKY+Zyqq8NOfeinTkGodpwbMUhAI5OLLM=;
        b=H1DHAmLk3FvlhdIWSakbp+kf2C+YBiDDs6MsyJZaMKTotYIE+TqWjLSzO1iOH2mror
         EnXMAiRNOLcbyqxZ+1gEegAuS26h9bbUcwm5zdmMjPzziCXPdsbV5R62L/sjwPk5G0+M
         eoCZHap2a9qu+5h8IedN4YDXnBP4yxLr2nZBoFE1SKOzFzekWnSZb/9vmNon/8N4T5EX
         Nkr8YGgW57A7ZnSzObNdDJ4KEemjzspoVYDQvTe5hWv3UFY6S+FehOL852nQDJ0rtbv2
         KYHiTsZ+BJQTaGu/VtJoEJlM/YlCSZJSflymmKpSp2nEunNjc6IhR2ceKLNxJTrhbaXJ
         qxig==
X-Forwarded-Encrypted: i=1; AJvYcCWWp6SkLeM40TnIAPvsNt+2h7cUfi8b2wG1nQ32Zv6d3m7msEPBOY6wEUslgqXSXjo+806Yf6/R0mwN/bvNU/it0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBqQ17/bnF6OgEDWDaBTs9Zc4aHtGUOSe727bpF/n+uunlo+s
	U2/W4PLmS8eFpyFFA9gvwMprkuJzd0B/gRPWMpKKH5EtIAV87mOoJj3w4knlHHU=
X-Gm-Gg: ASbGncvnllktPhGFNbeq2YixnlxDoMU4URaBMyHh/gUSZSOnTu56SD6E3e12kD7/tvV
	DCftbqtaWp/brXOiTKgkqOV97a+4WGDx6FTTAJeav6/11tuND+ENkQpZD0WzsIUb44TnnOlSHke
	aAGVseRyzyb6FRgDxIQVa38jBG2IzF73q4PMV7+eFl2Bv6E0s9EhS/mKsaAB3gwhdncuOpcfsjA
	NG87aSq4g+AxmxAi+YK02bi2tISUSZPjPAbxS2Lown9bYH2SPSJiYwbYS1l2U5cIxmFnsuizMTr
	cO2NQAvtirhIVyu+1ytHIK0g/+GRGouffE/doazWUA7ZunTmaSgphkpUjW0J/Ni2KKPX5ac=
X-Google-Smtp-Source: AGHT+IHnKFv0qsVS5sklaHz1Yd7IBiDcXh/yMTaA/ZuLIr7eWFDaCoBMx4syf1mCNT3/xbSNPX0bQw==
X-Received: by 2002:a5d:6dab:0:b0:38d:c600:ad30 with SMTP id ffacd0b85a97d-38dc937461dmr3251623f8f.40.1738943806441;
        Fri, 07 Feb 2025 07:56:46 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:43 +0000
Subject: [PATCH v4 1/4] arm64: dts: exynos: gs101: add SRAM node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gLGpUaEfuGzvyJ3L21mz+M8nf5rblyz9ev0wDFYPZyI=;
 b=W+YHCJGY2GIXCUKGut3Wfq+1GKcVPMtY2lKeBH1krh5h4o/lXoE38WAw1arV4/Dsph/OOfBF0
 hjqR38r5uj9A+fc2ySsi4yNFJXljZTKwquPyuW0/YhFHH+hN/sGvmuM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information, which includes the TX/RX rings among other channel
configuration data. Add the SRAM node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c5335dd59dfe..798ed7b4c4c6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -269,6 +269,14 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 		};
 	};
 
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.48.1.502.g6dc24dfdaf-goog

