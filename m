Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7CC304964
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299597; cv=none; b=uaNLCe0FTCu1IO7SRVGMRht+LSE1Zh+Cy+kDU48Y+KesHTgcRKgtE+cqC6LYSI+03MARPKG+6JExmsquAKX/O6EtaOmUyzFUHK/K+zi7RFyuSLAPZ1Y5jNBn3u0IxQNPEVmWoQ1/TCpRFhcalaD0NqAFd+i3NUM0uDXXeQRI69k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299597; c=relaxed/simple;
	bh=lXqAHsVVGobAqxHDBDj2hfAW5L/ixpf0F+OYYJ4nT/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSNBXz+XiCZMj4BTGxiTrIkn6Uy14wtzoEkKlBb5FRB13Nz2ncVc+v4E1fRHLYu/6xi2d5Vm1tjgqRqua1vZ1RPLKQg5cqghwk2/romC3aXsY3AZOsniWCPpZy1pkY2Qfr0zxm9d/Fv3JvsyD4XLgDq5/4db7LYGjD4iOzm8eNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vGh/t5bn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGh/t5bn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso35938015e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299590; x=1756904390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St11QoIkuwt6LD0qyFy2W7TckyvP5Gq6gOAm3aWS/Ik=;
        b=vGh/t5bnupJIjbNNLkWrelgN1x+vnYeZB80lDlbAu2sR7vqO4QpBjNCeZhBvKYHGuY
         700Id3X+DHpfup/KUwUtT1mLDV9WTJbiNy+zCz6JN1wioY4fTYv4zhfpoSxbovg/DeWk
         1fVd810pBH6hmyOrQLhKC28sfvjG4EjV+LHw1bl3EIZoJpgQsccdcFE9gBqdPCdcDnjS
         vKRGpKQoCAg9tSIceDvEO1kFyuU1gSDoPyezboXq//GGkmz1SH4qbOHmLXd+MeKztWe+
         2Pgr8JdJxdzB1V4ycx8jjIXhOYvBFmd3SZ3joe5I29uXApisnkKtSEGchfgQbJtLijOI
         ytIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299590; x=1756904390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=St11QoIkuwt6LD0qyFy2W7TckyvP5Gq6gOAm3aWS/Ik=;
        b=sIifxwCkK5M4mXZiJSgKV+zx5EZ+52XQSItYKbEtv+Bl2iXrDxaca5XWZZ5cymIGlP
         aePVvfwEj2bDB63CMgc18xTqA9LKeXl8ZjycyBIZbNepx3crehs2ZJfcpDl1M5KPjlQN
         DsxhHcFaUFZpUyWXhbGlX9XC5mvA9WDJAJQp9FONusWNKxerE3MrlB00alqbTxtfL5uh
         TZwCoc6BsvyZEQ8rYChLJKqCPS0BW1yLoXgmUgZ0PwVHjuySzugi6MYFICdBq6yOD+1B
         g+9dkU0sVgZLz3X44P0G+rfiCjHe+X9Z3oLO+R/1AbNkrzN39ZilfyqvA+3g/X1cdxa8
         9Wew==
X-Forwarded-Encrypted: i=1; AJvYcCU7/gNUZRYoVawL/ZF3tlbYPOfTwg53Bo9WTNbyijUlZXGMY+ESzGFLUW0SlTequ4L6ifkOv47DIwE4OXp6QMU3mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5jysbUgkHrgyqQZpPfzyVqkpuQkPyi0hnUwiB6LLOZr7IvZLz
	fQYNCfG7skHkJebsidtPhbj9xJtLjFGV1UnJrnLSE2r7I9xjkwM00s55QTE3+Oz/4aE=
X-Gm-Gg: ASbGnctsPxJeMVSXrbSqMgdxmDh6IcOIxOQHRwF1ice/qK6+CFha1nyR322r20jkhwF
	hBRy1gjWBqeV28/wXwNN5bkPcB+el5isk8ocHzv3WMcZsEIy/aOctVN3LhR6qJq0CuYa3fg+Pvh
	PoSR2RwjzbYwG03KnH02lKb3aOiIwAtMaR1rPIOE0AVA/+brC6HCQIFrCw4VOfDcUsEruiqSVKx
	nEEcNOi11h2ElS9gtG44OhATCMybaYwFx0WW2+/KT7Fw9CUlxHwi26jS0QKnB02JlDwRP+tEOcR
	PD8QaXGrtwODhgPjbbJnNTUOe3Wnyh6JfisZp178H2fY28kwF7rDRIGfSKUEKwkkq4LEULDj0e3
	HgxO2ytktPcFaMliTGC9HJM0wpkYLFC4xOeR0UuifKFtXia8XP6Q9dZmHeK+QWW6KO7z9Z87NFw
	BqJw==
X-Google-Smtp-Source: AGHT+IGrO5in4kxeXFs8Ggk7J9FQe0NLAJGrBqkvOKY0AV+1WCmJgGAiQ8Lyh7hq52k9MPnYiLZGlg==
X-Received: by 2002:a05:600c:4f47:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-45b698efbc2mr40559705e9.7.1756299590136;
        Wed, 27 Aug 2025 05:59:50 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc890b178bsm3272069f8f.52.2025.08.27.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:59:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:59:46 +0000
Subject: [PATCH v2 1/3] arm64: dts: exynos: gs101: add #clock-cells to the
 ACPM protocol node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-dvfs-dt-v2-1-e1d2890d12b4@linaro.org>
References: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
In-Reply-To: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756299588; l=858;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=lXqAHsVVGobAqxHDBDj2hfAW5L/ixpf0F+OYYJ4nT/w=;
 b=1hf3mcPjyceW9nVsY3YJaxdSK+F2L7MXoZnBJFli89bCPqeG8RhhWI+dgSmVFITri3grRwv4z
 cDeXEVit+3jDX/fnKLE9QVz2WyAluN7lZ9fP3bWF51Nsyhbi7g8lZJ0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference
its clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c0f8c25861a9ddb5bbd256b62c66a645922ca74e..f00754692bbac39fd828ebd4ef7c269f746f2522 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -202,6 +202,7 @@ ext_200m: clock-2 {
 	firmware {
 		acpm_ipc: power-management {
 			compatible = "google,gs101-acpm-ipc";
+			#clock-cells = <1>;
 			mboxes = <&ap2apm_mailbox>;
 			shmem = <&apm_sram>;
 		};

-- 
2.51.0.261.g7ce5a0a67e-goog

