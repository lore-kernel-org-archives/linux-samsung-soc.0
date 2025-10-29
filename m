Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE52B31A05E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 21:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761773444; cv=none; b=mnxZpJcg88s/FUwtcmzp46sHjHtzsl+DgLnLWZF9add2iph65ZLf8kRKLN9uGjiQl2Ja95nfcLXTn5EjsagCfQGhukZ2L31p5MnOs9xz3xdSZ4Cx6gMJ7T2pc89Ahau/dczJQbLYa9DlLoO6H6R67EEWJSIzi/LsWcAzZh11Vcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761773444; c=relaxed/simple;
	bh=gQBv8QyJ2P1jjtV6AA0m325q9CwWFLoeKdBX4iFHs3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hd8vJNUAEFi4uHgly8gb89R3GL2X30Z6LG37Y2kZBGP4ORkvgkFxtb+VR4mFtZuA7YLXbgq/1d0hQqlcnModIpMsC6YFE2VRs/oZDzbYEG22h2hmIlmMpuk331yMpqrbM3odG8gT5z2gGxb/iC/yyyA44NTNDtTJMKINN72z6cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSnAiSc9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSnAiSc9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso2593875e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761773440; x=1762378240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgOXG7TGyvNy5LNqojYEnuxpJ1Y18mLxSMAS8yysg9I=;
        b=VSnAiSc95SWSdNfLFuepNMpCd08W84DclzuwcaPxvSuaCdbKoQP2usO7ZKL1hkFGjT
         BtvVhr3uqpVYIeYoet9RI4jSgtrKrZPkdhQh/t/NdeCTItZApD+2bI4uKAhTI7MpvCCO
         aDmXAy7I9ov79PIACj9P4teDv2F1I7LYdj1dj0FL84fz7oyax3rvJjA/JSCh3LsHaGg4
         dKEK7+I+PiZNi0nFrYFzircPQiKYRU8bZ829+VHI5cSHLTMwx49eRZMVrs6WblE6M8qh
         gJdecWwaXC9Je6CazHTwsH9P2p2A3ceETw48LmZdcorw70F/5Hjn7I/PtbTCxStiDe1c
         aPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773440; x=1762378240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgOXG7TGyvNy5LNqojYEnuxpJ1Y18mLxSMAS8yysg9I=;
        b=EQ3Uouatl3Ziv9OpTY2rpmmXNBz4Axu0yXiTv7inhtkwhuEmVKvuN2AcYsOfALEa0u
         CKVONBNZgNCccCuAvmBAA1Gl2xqD27dfVlFRhhPiCw7OhvpnPMu8wUw9bjn2bWPPTWWE
         KuP27LwlKQ8WSjOpckTIWuNNRdsZsL6I3jYuszkoO8AjyElKzxH8m8t0/hcOBpOXYSX/
         3SxN3EZQW2cYjWje5QwkOD+GKaA5jWR/gzJFwM+CWugC1yHGszUnkkimaXHSmQd2YQ0D
         GzM3Y/xlcTwY8ZkqvJDMgeRZ5+gOCAKy+GJRxMifMLKRQ9RmpLlcGZE/VPiZd21ObAsr
         DWSg==
X-Forwarded-Encrypted: i=1; AJvYcCURtIcGNEYYa+sLwfpBNQasdxZBdE2zI2UoZ6Z1VVhd8/hAQc4oaBQvG9mxZGE4Zd8lFYKu7PvdAhgX8BW8kZIX4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6iQxqZJCqA7BGMcqHhNrKw0WnjwzIg4izx40+6MzyXX/+KZv
	I0h88a7jPtlJKW9bv9OXj5i8MCJX7xZc8P3bVPAkN3q+GweQv7kNfSAKxGnzqm09gHU=
X-Gm-Gg: ASbGncuC6zh8iUC6cjUrEzLfh9Yd1DKTjsnE8CIRWIwBvq9BjDFAVdEb4BtZNsS6qtc
	L0DneqxukEeMbZkm3Vn4IiSWYN6mvCqstKpptBFHTBeIwMvee6CyAoA698kdWcjMhvt1sqyKGjt
	7PG1WGqG+DIZ6hSDQ2BcffJrl6JBGDE5d326KTVTJBOf3XDfN0uoavQbN8+FYK6etp9w0zsFI5Q
	ktDc0XQYOKDd6Uok7fdYd+FQqvVbt1xT11aK+OloTQmS8pAfM3vpPfVdoOXHSbm2O5GujL/CCZK
	D5sr+UTRcDX1w8lS82cjDtX7Vi7OVyAwz/6Ys+vd17UnIcjxxkKhzFxi54YiJddm3M+0wg50fKv
	KEAExqvLC4xU3pOau//EzEjU7eglM5CeXBgpU607J0jyiQvPGVocItxCbbx4swCLQffqkzRxnOt
	yMBUKE+AzbZ6YTO+Hge1/BCGCMSqZS4g==
X-Google-Smtp-Source: AGHT+IF1NqZoDJUY6TeuGYBLJNKGQkEzwN/DgNFQGT2wXbkV9AklBByYcgAlF2eMqVlmtU0H31lLUg==
X-Received: by 2002:a05:6000:4020:b0:425:6866:6a9e with SMTP id ffacd0b85a97d-429aed3223emr2945906f8f.0.1761773440213;
        Wed, 29 Oct 2025 14:30:40 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm28573457f8f.6.2025.10.29.14.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:30:38 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 29 Oct 2025 21:29:23 +0000
Subject: [PATCH v2 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-automatic-clocks-v2-2-f8edd3a2d82b@linaro.org>
References: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
In-Reply-To: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=gQBv8QyJ2P1jjtV6AA0m325q9CwWFLoeKdBX4iFHs3A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpAod3kd4vJM8za+qKnMN/EagAer8MUvMl1qLx5
 DjNy+dcNgeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQKHdwAKCRDO6LjWAjRy
 upJ2EACgknbxo8pYwwy3izcG3w2u3YzfOxNI7RlPV+Ql41r13R/QNJmqtMXsdkCOMLsNEjUdy1n
 +IdAYRIQarupDaFo5ZjuCWj7ymVajk+hrFUox9z7eSKilmbn3uVnfMB629gD0soxgnurqFBa4hn
 SbOOToZX/TPrFdf5ypy0Gy6PlzwzlY6pZMMgkphERHWmnGDOpUvfun6K3RT3shee0/9Y8LGhEEe
 yX94UFCulK9w6QxDXKJkuI2fvJiP2iezrz2BlSbd0WvdEHI2Jd83l63nj2uinJewjHZolne+lRe
 r9pf64Ob44HQ+eJJKKimB+f2XYmPEqQFPzLQay7SeosYrquIY1Y+XOWBtYn+oIHnIanb73MkNKf
 FLBpk6gHNojbh2hivl/0XPV+Ss7onM5L3Und0HMnr2OqDxZcrVeQQk4rfHWfBgrnDojmxrM+kDp
 XUuQV6Pfi/lHv2Xa2Q8q4fyZJzqM1A3+b8xgHXFm2Y6i20ML6MdIuPRjkBwlTsXOhhtQo/rxGit
 sGgTJiSuZPDLombSTXyMMFViKRZNqM1PyP1UKQAe5QaB0o7GVBYRQpm2hr34t7AH5vrsWwzaxCE
 EKYUq87a84MnO8MnERoMrZ2E2SyWf0MyVY7Cai+ofN9UoJUC99gu2ATKludB2wJwpd3+1Qmu2Ki
 dvzax6MjLXgjlzQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

sysreg bank contains BUSCOMPONENT_DRCG_EN and MEMCLK clock registers that
need to be initialized in the CMU clock driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..c39ca4c4508f046ca16ae86be42468c7245561b8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -578,6 +578,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -662,6 +663,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -1208,6 +1210,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1566,6 +1569,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1637,6 +1641,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1697,6 +1702,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.51.1.851.g4ebd6896fd-goog

