Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571442D2386;
	Fri, 15 Aug 2025 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241522; cv=none; b=C28ZUP0sxmGxutiwpul3V7PTwUWqH1m0W69uPW4JsckV7KpSnGVZjaL78DhkfDhrZpcVkOAG3N0dmg6F/Sb8mYllKqKGuRT+4n/b7k0FjAhBiuLBcYfxdY3WwcbXoYAJf4uIVNDKQpKzyzWZ8B8FOwthtnYx/e0kZgKWkMMnYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241522; c=relaxed/simple;
	bh=kyqxVhw64i1pCe19kinwbZPcaIRw9R3a8L53zXGT/dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WaoVdybCjNalaw7h+exCxtseZlDjKwgMNQNe71TJ6YYKaG+dpZ63yIivjpkcYYYK3tEgFXd+yqsqxawTefeyXJ3uDd/APoIs+Q8oZgwA9b2a1JvXUI89ksI9GY3fof4y4JtmNNYCE+92jPsYLmvd8qzq22FbrsuhWwVzlFzLzCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRLopZaW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRLopZaW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb78f5df4so286557966b.1;
        Fri, 15 Aug 2025 00:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755241518; x=1755846318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lckrxo0Xz4JT/rW13ucWADdXpEaPkr562+yQE86m8n8=;
        b=HRLopZaWUDSl2OVd/e9HJ6VQGTa1iRkfSI88dBtZGmdFnrkdpdtKX2PVTtcldeMG2k
         Gzn0982cu1Z8O0gUpKmVC11cCHJ/QuxzbiGLdjczHG9BwxLKBD2vmKZ3yaAxERHSA0ww
         3wo8923nAgVRk2CyEUUvApi50uYInPltB7LznTRq2voCYiB27PEtSy11nR+fuPcdwkLs
         jVrmltFi2QOQCXORMQZ8bb3UZ3/eq/+Vsylp0gqFmTmUbzrR/iVWkChmfoNBE99u6MHI
         TXtSslGOrJLq21CJOsmdVdnV9FFUOKFMp/3wcKvoM/nv+96Kazx8BqACPaeXte85/K9g
         rdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755241518; x=1755846318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lckrxo0Xz4JT/rW13ucWADdXpEaPkr562+yQE86m8n8=;
        b=r0A7m+I0ocTEzXBDHWwEl+W0r9syBz6FAz3je4h0flRGb9wcqf07ExqwZ+1jiHjScw
         m+MiD6QhGIdGZq99SdH0kUSrpmXJJ/R6NKQTWYHNLTexgZcK+NhUNHSK2znAQxE0bXAO
         Mh0HxMHKAZ1LMN3zg2L8Gyqz4femeJyVJoXUb2zTgTExsPsgajvquxOBFhN4Oa3G6j19
         NbBS7G352cLhZAgBBWqJBFP8IhXszpvZCbxF19OBI7isZXGKQmIvTZs+drr64l30h4Ib
         sbIS6Po0piG7qW+C8Ba3JtaDjLMaKxaG174Nma5Xj8rCEbdPHCbJ6zT/Nek74+0G9j96
         20Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWVx1EGgF2uPYUKoEc/xiovG86MiR7wvzmQGH4ID4lVwfqNzZvG/nYgbLBJrrQhmCa3hky6o96xEFSP8N7K@vger.kernel.org, AJvYcCXp2lueO5eG4hcWynHsBLkwJMfKc/wE7bvs7epSC+1P+MmJY6yZh43JMT4qWyzDXMJVtF746LSxWTjD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd//iSUnqKtDMQ0EvbNIePLgWa+ZUnIVD/nM7QNG21Lg8jA44V
	i+/INSn3wCbTOpp38cJS5g2pBPC4MUeP1YglEMvecH3r2ZdH8mVT2L/M
X-Gm-Gg: ASbGncsUV0n+LYLg03wzs0RB9+zyqxvDx2M53ET9EaPcpDCuk+8zqkW/a0hTG1zfxQZ
	RijWbtCGv4c7fJQNiTT8C9Ffcitd9MrG0dlsy5vpEFvIg9rWhVth/MUqhDvo3OP7IV00sJ1YuMF
	NkLCx5F0+EDbOexC0X3sCVbvCh5K04SzAA/biGmLjLcoyKnvVNvx0s7IecjQYRTq1hWoxZJF1Bp
	SWpri1OLTrcvbG+jyZA7EEGrj3vHDmwcBoOl8vcrFuLH7WvYtEKt7kDq5jwCHcUwnyiDOhkz8Nh
	xteAKoP/5LbR8IFrRVKkzP+4fc2XORLxvEsaILAVXBVBwO4U58qhG4eIo002BjptvrOXjfy4a/z
	6z1p17XkumGJwBueyM11xEseJFCT48cx/PBQMbEVJ4QWBdTQQ7og4tmhpfxxzgbvg8jrdeCioSA
	==
X-Google-Smtp-Source: AGHT+IHdoKgbaywXOlXlmdziAkeTbaLLPsoCtUeca2ggfF4bp1BRhAF6fsBWunc30eaw8fVlaGaVxw==
X-Received: by 2002:a17:907:c10:b0:ae0:b847:435 with SMTP id a640c23a62f3a-afcdc334505mr80275466b.49.1755241518334;
        Fri, 15 Aug 2025 00:05:18 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2ddsm74269266b.74.2025.08.15.00.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:05:17 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: exynos2200: increase the size of all syscons
Date: Fri, 15 Aug 2025 10:04:59 +0300
Message-ID: <20250815070500.3275491-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As IP cores are aligned by 0x10000, increase the size of all system
register instances to the maximum (0x10000) to allow using accessing
registers over the currently set limit.

Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

---
Did not add the r-b from Sam, as the patch is pretty much completely
reworked, including the description. Please send it again :).
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 943e83851..b3a8933a4 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -306,7 +306,7 @@ cmu_peric0: clock-controller@10400000 {
 
 		syscon_peric0: syscon@10420000 {
 			compatible = "samsung,exynos2200-peric0-sysreg", "syscon";
-			reg = <0x10420000 0x2000>;
+			reg = <0x10420000 0x10000>;
 		};
 
 		pinctrl_peric0: pinctrl@10430000 {
@@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
 
 		syscon_peric1: syscon@10720000 {
 			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
-			reg = <0x10720000 0x2000>;
+			reg = <0x10720000 0x10000>;
 		};
 
 		pinctrl_peric1: pinctrl@10730000 {
@@ -418,7 +418,7 @@ cmu_ufs: clock-controller@11000000 {
 
 		syscon_ufs: syscon@11020000 {
 			compatible = "samsung,exynos2200-ufs-sysreg", "syscon";
-			reg = <0x11020000 0x2000>;
+			reg = <0x11020000 0x10000>;
 		};
 
 		pinctrl_ufs: pinctrl@11040000 {
@@ -450,7 +450,7 @@ cmu_peric2: clock-controller@11c00000 {
 
 		syscon_peric2: syscon@11c20000 {
 			compatible = "samsung,exynos2200-peric2-sysreg", "syscon";
-			reg = <0x11c20000 0x4000>;
+			reg = <0x11c20000 0x10000>;
 		};
 
 		pinctrl_peric2: pinctrl@11c30000 {
@@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
 
 		syscon_cmgp: syscon@14e20000 {
 			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
-			reg = <0x14e20000 0x2000>;
+			reg = <0x14e20000 0x10000>;
 		};
 
 		pinctrl_cmgp: pinctrl@14e30000 {
-- 
2.43.0

