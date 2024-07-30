Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BBA194128;
	Tue, 30 Jul 2024 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722330832; cv=none; b=tLNATE7/goEDmKkkT/gQQ0S7hEbo4AANw2GGZjfKtKLPxgUH18/jm0Y9M8YV9Fy36sht1odYZV4pK35t2rDgWVeIrvnK7zSy9T6GiILrGK3Lo2q+mJb7XVDGB+0LKQYFTWpwZ1yZ/9UJMT7aKq6c4Lv2rv1MNvMZBszs1fGG/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722330832; c=relaxed/simple;
	bh=htKe20TSWKdJB9QebCXsVMQDG06681QGIc9x40lR1f8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFV+g6uyfgRA4+YGo125HJAH71MneaswPJ+eIVOnzkNKIWiM63pgJy0d1/2FpzWe8HsuviW4PGDlrQs362cCg5jZM3F/ElFsBVFJAGoPvchSNcp+Pytrq5cWZ9YPTWIakUtrjhwgA4o1dBoqLjip/+7eGulGUYqx21T2cqEV2P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bifEDcN/; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bifEDcN/"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7a2123e9ad5so2568984a12.1;
        Tue, 30 Jul 2024 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722330830; x=1722935630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkS47RCfrEJvvAZyZ9jDL/uElV8WeOywhndpY10cj3U=;
        b=bifEDcN/njmLwXyETgnWFNPUm/Xf66g2qawZQZ3ie3IwLOXt8M4CeM5X2jfyYQcE/4
         Q5RL1EZO8oBhRsjTqtqa5ESbqMfnubgsVp+Y4dYag1F1X/GP7eayRG2A5G2PV1CsGGtf
         MG1QIb9EAkG19XSVBpcwKRxtxeo+Ndj333Q8S8afoFg7NJ/PPhzwpmYqEAZ+PpJIRvbA
         LE+GWpJaf+hIJEo9280vrAc0/CBGk+JKzZVHlsHodawHZPknDBQCWLvVNJ2kEj+fJ9dC
         E/buQpW/Mcj4tEwLasFwvVtKdJ2POhnB0CrvogLp1qKMqqB9xNmRrFDwOS5dQ6gK3yE/
         d/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722330830; x=1722935630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkS47RCfrEJvvAZyZ9jDL/uElV8WeOywhndpY10cj3U=;
        b=uL2sZRO0gQ6dQFnYbTyqJS0PiDL4NRzGeBVPyQ6r7piCefJynUXJ7InWOsvSoYEcOo
         nKLTf1CXP8YSsMloxw8lvNzr4NBHSzE0sMeUlahWn43T6wKu4tw+m8DKsBWoT7mIMVAz
         jB2ncwpBsJu0iMj+rLTO5jUdK1UuU7BOGlsypspbU27TkVurMFHxJBTu6nvp8B4t+oeo
         OVd8mFifY0v5k9Kbc8s6+7pZhFMI/+jkp8PhQL8tJ8jgikrFuu16B1RgaFsYwlKdqnkk
         plqsRrYwP6WtxfzSLzP9fhZPPb3Gd9SHJmmd1SXUA5+TXQqAsoeGxJO7dHK95dBlj8P4
         RUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG2Aqru31ZnFWsnGyWRy3+d245A2EnQda7eH9BmOXV85TIRBHfXwq0fMTzr5CzS5E0wpaVWsr9ccOhPbzWicn82k0O4NxV2STqQkEhGtu7RSz1VDUYpwVTCBOrgsMDFdIcKl4ibNPa3d/C5HPpTf/+wz1QsH1j7J8vC5gCTsH9+RR/EoBjiKnwm45X
X-Gm-Message-State: AOJu0YxDBK4F6kqO5IdJW2A0EBef2m/jj6sSDJJ5nGGym6XvWU3nsowZ
	b5/FND5vHcMuZlKEnHXue4MLHyTH54vauaDxxT7X7atkE3BiNevG1/6U1Q==
X-Google-Smtp-Source: AGHT+IGVyj9pJWIOX4Vx31p9HO2PHhOuvTQg2ltGOlkVo/9UeMUxUrJzNT4EnXGBXRa/aXRN1N8uRQ==
X-Received: by 2002:a17:90a:a785:b0:2c9:5a71:1500 with SMTP id 98e67ed59e1d1-2cfca981a8amr2464063a91.0.1722330830242;
        Tue, 30 Jul 2024 02:13:50 -0700 (PDT)
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c565c9sm10023970a91.3.2024.07.30.02.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 02:13:49 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ARM: dts: samsung: Add cache information to the Exynos4412 SoCS
Date: Tue, 30 Jul 2024 14:43:18 +0530
Message-ID: <20240730091322.5741-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the Exynos 4412 user manaual add missing cache information to
the Exynos 4412 SoC.

- Each Cortex-A9 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 1M unified L2 cache.

Features of ARM Cortex-A9
- Optimized L1 caches for system performance and power.
- Integrated 1 MB L2 Cache using standard compiled RAMs.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412.dtsi | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412.dtsi b/arch/arm/boot/dts/samsung/exynos4412.dtsi
index dcbe0ce6180f..d133c8a8e8d4 100644
--- a/arch/arm/boot/dts/samsung/exynos4412.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412.dtsi
@@ -48,6 +48,13 @@ cpu0: cpu@a00 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2>;
 		};
 
 		cpu1: cpu@a01 {
@@ -58,6 +65,13 @@ cpu1: cpu@a01 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2>;
 		};
 
 		cpu2: cpu@a02 {
@@ -68,6 +82,13 @@ cpu2: cpu@a02 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2>;
 		};
 
 		cpu3: cpu@a03 {
@@ -78,6 +99,22 @@ cpu3: cpu@a03 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&L2>;
+		};
+
+		L2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>; /* L2, 1M */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 

base-commit: dc1c8034e31b14a2e5e212104ec508aec44ce1b9
-- 
2.44.0

