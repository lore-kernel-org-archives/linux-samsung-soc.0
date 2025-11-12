Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C92F49F5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936159; cv=none; b=mykaqk1POsbLw47T/BxY24CljNT8mL+TdGeOGp47tg8vOj9kCKFH4Qd/mZ2mwIuQ2Hd5qA094JTeuKwIurVZS+9KF692/e58SPQIUTaZ4qpUQr0B4Xn7n/dvaRI2xioDyawkC6jHDtMKa/YL0v1FtmASU015Zf8JggRmOJ6YjbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936159; c=relaxed/simple;
	bh=/pSl/oshIgGZZ5UojmE7NZi7LX3/HS9nWv/b7bm1yIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GkY6GNubckO2USQLK5oA2X0DmkFQlFnyjoCmqJ86KJ+FZFALNMYr7bpz1OHqlScxgSrUEBCszJxWv8SWGmnEi5Ts2/65sBHh8xMCWX03lC0vQ2/pDZD9dPeOofmd+/I0cdAi21I8hB5x8Z8Jnt31d6ZFnKYGJmaVFrIeS+OxTZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J/e9vXeZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J/e9vXeZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so3737915e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936156; x=1763540956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHjf7jIZnxtsxZp2emdUV+gnCb68DhjnRQYjjOEpq+E=;
        b=J/e9vXeZU694C7QeQSr0T427StWNm174XH9SeeS/noRWZeYwE5kN3r78yfmLfCxvmA
         vFHkZBMl6t+3rTS6OTvkm4TQKGHXCX1nkRfV37QBhsimS/lVgmn2n2zAsROOHq+2keQ8
         XuiqzoCJe63mcDQVeiOpAmqlKlOMCF8oIfuA5Iddm2KbHFjFseHKn1q/sKpPkzeri/3d
         1rlPszF4frNwTsBlkLzn+2KWkyYKvCpUIz0tOJ9ycjWN5Srh2BF3l6GRTNAe8qIYzZnr
         xU/3kyAw5zF+8nd0OfVHR+lNzc8zmdVeJb4xOLyUIjrYOWYntcyLTt9IPUDhwGtfOQ33
         gXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936156; x=1763540956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZHjf7jIZnxtsxZp2emdUV+gnCb68DhjnRQYjjOEpq+E=;
        b=qXWU7KUdibR+3rs7tvb3Rl2JgPzNlhbBpBzeDxD1fy4PDTeFFF0/kJ4vLLZ+j+XMxR
         Jh95C4cmIotMRf4+FRB5Ic3jI5Qq6nxKWzTN4HHVwcZZyD+Jis5k4w93XrWgzb4Re6VF
         31MhbbTaytOIFhMvcsCjZlVjlcZdPWnbheHgOoi7gFARShkHI7OWu/veJrBlagkniE44
         7urEKiN/YvBlco2MtflsTlQNYKTnBidguD/weuHpZtwhDUHiukKirYFNduBRBu7/vYLl
         vJ8Ah6TTLtgDGRMFOklWX9GrZorTsrJH0seO67Sg/zFkLOR4I5j7K7WzdpSIDdMFPqPu
         XFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0UKAYdklpbFmBpbXGshXJVHMUMiH/QlJt7cyDX58qoidHCk9kFL6Ea7Q9EA76oMO905D1E4wfqZDP87BRjhipXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxldGoeFgjY3/8oHHE4FzPL92zGrtH04C0FRuapx9a7caG6Lmgo
	m0WVAL+7Igtpet9CumBLfV3lNQupW/iUdOc1d1GmjstzOrmGCL1hucqFuLx0ZtLuxQs=
X-Gm-Gg: ASbGnctTm7LNnIcQ4aSBxbNHz7cs0FhNW5EANAGpof5EK3M/duP2xPlpYbFgRjMb08A
	vah1zo0OJXFmkMQQELb9/YwRXouvvd+vmG59IohCpY3XDW2nJmZLUh0RdPuEsV90M6sKkTc3x2Q
	wx5Zsi8i6Ji79kSWR0D7Ezoj4CXEaeLiVwFHy/avOwW7fvByodNpMZKz8JBqmvsvHYbTYJ4ZcTc
	b6hjddIsI8eZE4vTkdXwcHHSrJ36NGXw6foCP+/quNpT2MYvwJu+O5af2iV4DWeorzDtrXRHD0P
	mkbPAt7kL0aDB8hJfs/6sZWsHxMfX0dHI2AUId3QcJrqTvSGO++/Zqmqr/MFQYeLCiydSyy0NpU
	I78P/xBuLxFEQLykDHqv0VDdL88iwIZD1YY1cyDYk3FX7nbQn/kf5guq7hsIK/3/JmD0NHwf43M
	IakJ3c7m/gj3SXIAh9dA0/vpZmJBe7uxyPHbaaNseQtGITNeoeI7WrZoKV77ysN1c1xNE=
X-Google-Smtp-Source: AGHT+IHMFuV13oHLomlsN36IUFndxfrhBYzdbMd7xr9GK3XGTbsPAlzk7x/twn8UPGjcB0CfYJpACQ==
X-Received: by 2002:a05:600c:c493:b0:475:dd9a:f786 with SMTP id 5b1f17b1804b1-477870be153mr16131355e9.40.1762936156234;
        Wed, 12 Nov 2025 00:29:16 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:15 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:07 +0000
Subject: [PATCH v2 3/5] arm64: dts: exynos: gs101: add OTP node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-3-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=965;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=/pSl/oshIgGZZ5UojmE7NZi7LX3/HS9nWv/b7bm1yIQ=;
 b=R1Z+JLiXPWLMgVafAqh+YxTkJcvlF+ccSnLeqflAeZ3Ttx/LZtnpqjWgaPkjDW7swQcPDVzoX
 +LgNAN/4E3WDOaOJv39p6v/i5tN2Ua4VMj7GcXteu9NW5JKmTxD3K2f
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the OTP controller node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..4be983d4e291b3afe3530fbea0163f70c1a74671 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -571,6 +571,13 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		efuse@10000000 {
+			compatible = "google,gs101-otp";
+			reg = <0x10000000 0xf084>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		cmu_misc: clock-controller@10010000 {
 			compatible = "google,gs101-cmu-misc";
 			reg = <0x10010000 0x10000>;

-- 
2.51.2.1041.gc1ab5b90ca-goog

