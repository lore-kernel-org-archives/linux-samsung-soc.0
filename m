Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F5250BF1;
	Wed, 12 Feb 2025 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376007; cv=none; b=auA2OxyFsDoJWGZA1A2MuDQghnfHBBHTAb2S522UXnRUuTKMDNmYEfGbNNJUwu6Ug/gKbKzlJONUfnzp5Q3zknUfCj7uEzFf+zYgcyhLZZ1Vx0lEbNK4nOMduKSLrH7sPIgM6VtrlhL3FZqPIDn+KzkXoJeeQQojSlC2waTMapw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376007; c=relaxed/simple;
	bh=YVN0bSDpktbU6iMj8+ynC1jzK6p3jFXx/L4DWfsrgig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JrP5Ee3WGi7E3JXBT/8fl2QXHqD1EGSlWyi2sJWaofEfwfpArprCNmUPpxnHXLW24cwLLpaXs3VciMoVJoiOPfUuQYmVeMPkzpWAAR0CcclmLEN31InzS4SCGGMPBKnTLjPA4BN+EFJDnMpS8Rtd813RFsy+nYFF5iBfr+4n458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auF1pqAC; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auF1pqAC"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86712bc0508so1447581241.2;
        Wed, 12 Feb 2025 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739376005; x=1739980805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUTQ/y+vc12sFk3R0yRBFfSrcmurNaqNh41K8Y1JKsk=;
        b=auF1pqACwo4wr07jsU46HHKXsFDrv1dGVe1Tlj8Kcqn7wm61+bvqRETDjFP29RrZha
         uky9eyfAkCyN0k23oIZQ5TRUwH7YHpjTHluoUSqTKUCbhARNlD+dvKWljGzrURsypp50
         3NRpbSUB+Y4rf7VYjCuzSm2witEdEzJH5lejKFn1RimMuyvDj3yPXB9k+SYutnA3G1gh
         rN8jMEURjDmbHWLDCTKp3Y5opvYX4TqoMsvaorc4SYCdKaO+flkzctUcGyKmpzY1LU3R
         7G4MEsAscCNcQRUPQXIf2B04wyb2JtebuAt31KK4ERBOw9lL+FxLDSk0FlmTvF0DNEXU
         Vqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376005; x=1739980805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUTQ/y+vc12sFk3R0yRBFfSrcmurNaqNh41K8Y1JKsk=;
        b=vDQLhV8LgzAkys9t8JD5iC6uHM7yvfqrOCZd2AlIZpU82645GHJSDOj1vtLy36195D
         hRO3dW7tYKLM7iae7Ql80u0yuWFeJGe7QCaFClEzTwidKwvG20pISeUgv09kzzkCLNY7
         b2CP69XdgVmmINSfnR4MIsCbSoikuyxRW6uTdI+Li0jyxI9CxCulxbbEp7JrvLKLcmS9
         ToGIspdqqZmyjV5A1ojv3tevcqRFJgJBxrrGlvS9KaEKWmijRBVVMDeK3MFWuHGehqAp
         DRwyHNnkH2xMzaSDOO7Rulx2niUsevD3nB4aWCEaCVi7L5IxlblCp8T/gXQe2IeTPuB7
         Fjig==
X-Forwarded-Encrypted: i=1; AJvYcCVuUnC01SND0XDgnMH/YAnxZteh6pr1ZkBYMb6eLXa+EbGbJLPZhSJG4tvYkj1brgI6oNsD3+MMFfVYEm+6@vger.kernel.org, AJvYcCWUrL0xgQFz5gsB9Y0XNiwLKTlJQdPFppQA0Sa4EUJGxOCj7MjIx7mLsyMIvfOPRoxBbE4JZfCx47n/@vger.kernel.org, AJvYcCWt72hwtP96B9uS7kWzh/b6GovKyOgN40XPeZWtoCnvVeLpxlLflKPzWCkokM7l1sZ005ydp0qah88UlkgPAh38atE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn2itUpu5PF8iGTDLJXL36UdUCaEl0QlgmL4O2YGbU6PvPhlap
	BT72WZ7iIv95YehLPX9Q3yQOJCBIksgmiSQs5at0WLQESQLSJ01x
X-Gm-Gg: ASbGncv3KJRHYR9zS+E+3YEb/rwZMw1/PxSUFX7V4Hyf/QIT54EGVvko26RtNcrYyl5
	BqzVBRSlTXAHdFnAO+056lVke2MYib26K7wvmPmJ4ICyYlvDPJHmO6oXF9uq7aGMtqpzdop8k39
	xvOOxtxiSQ4yAxa2jd3U8C/b8WQfsVTc8yqdSmKtEgrKYcQNtvMLVFMlrsinXSwwtUBN6y0YxF7
	foofdPcyEov68mPOZ3GRBF4kKqYrWg8pBrpiaB2LNsYJmun/32vQPGaVbsb/obTe4i98LjCT/ID
	knDpPtsI0nS/0W3rHtncuxdySu2bgBei3HSMluJ2Wsbx71UTNCIMWz28zH56U5LBJg5qlTj25e2
	dUg==
X-Google-Smtp-Source: AGHT+IEgr0hm73Trz7viRT6b5fEU+HyboLMwNQtkSJQWi6mRSEmY4HU10MDnQcwDYPy7Yx2+iJNaXQ==
X-Received: by 2002:a05:6122:468c:b0:520:6773:e5bf with SMTP id 71dfb90a1353d-52067c31106mr3019717e0c.1.1739376004523;
        Wed, 12 Feb 2025 08:00:04 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9636904sm2335213241.3.2025.02.12.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:00:04 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: exynos990: Add the peric0/1 sysreg node
Date: Wed, 12 Feb 2025 15:59:43 +0000
Message-Id: <20250212155943.269-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212155943.269-1-wachiturroxd150@gmail.com>
References: <20250212155943.269-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sysreg nodes for the PERIC0 and PERIC1 domains.
These system registers are used for peripheral configuration
and control in Exynos990.

Each sysreg node includes its base address, register size, and clock
dependencies.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 843587b17..aa056fdae 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -242,6 +242,12 @@ cmu_peric0: clock-controller@10400000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric0: syscon@10420000 {
+			compatible = "samsung,exynos990-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;
@@ -259,6 +265,12 @@ cmu_peric1: clock-controller@10700000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric1: syscon@10720000 {
+			compatible = "samsung,exynos990-peric1-sysreg", "syscon";
+			reg = <0x10720000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PCLK>;
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;
-- 
2.48.1

