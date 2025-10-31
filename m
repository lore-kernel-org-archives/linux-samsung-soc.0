Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF355183088
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914723; cv=none; b=L/GNHP26Xwmt//hwulX2C4LjKYLHwe9tuAgvQ8wzGSJjLNyczP6oYeggLwx2Snka8qyzi4f0O8vzKxbfltTDqmlewVxErJ+QAqcjAACkAahGU6InwDwULA63N+v7DwTAragwxi0TEBCnT0F5AWrgAl0hZUKWRzbhBh/PaK8mefA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914723; c=relaxed/simple;
	bh=I1G4HrvyfbVAsbzmJD99V+Jtc43Xn5CLNWorLqJlsfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KwVGLkwJ4qlBavjA/qOFq48f5J03pA1Oq0Spxl8goizAMOZ6jUOtpL8TMI1h5ue5OjN87CksjafqAFuHLChImXNxJ3tQ4br+Eq9U4/8ZPeA24q0URMhcyq/VMhEmjyD5Z6H1OL9LkLfj1e8E4odsQ6y8qcWQKE1JvaXTSY7aHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ap30yFQH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ap30yFQH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475dae5d473so17776475e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914720; x=1762519520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1zdAt8alxKXu7+wwqOHFCprCPLCy2H4M8hpdej4l3c=;
        b=Ap30yFQH9xg23O8FH+RVs33bUtYP8s+BSNNZ0SzIZOfGB/0+SeJWLUGmHm8H8O9ByA
         vupbycdwJAJ1UXPbW9B9jLgzdUeIyWgI7qqbCiqCaBRiCCREdEV7+92pnPtGsjAeR9Nt
         bV5iASsienyGyP3MX58THmaNmgUJwWiylzXEIZlcesytmX/zmxCORpteshJU2bRVAg9l
         s3l7j8mhQeldt0GWh309GIuT7M9TErb+B5GSRtTyeZMUlDuTIVsygrbUkOd+Y3XvrfZJ
         NG4+OJX7CLVhe47eYBY2MIb9pY9y7PGxIEPQKRIuKBPHTAer8S0lg0rH6rJWU4KQt5x7
         GGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914720; x=1762519520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1zdAt8alxKXu7+wwqOHFCprCPLCy2H4M8hpdej4l3c=;
        b=Lobnbx52Yw9Tcp4fgXEXidD4O02hCF0G4pX9SS4nUc8Y03glNZq2QUx3QqcL3AqFS+
         RfxqesCb4bbs+0Ytm7L9gHVx30ZwQ0uknsLK1c6IJeq2xL0ERVRjmV0Vo6F8ZpvaavRh
         1P/J92oZrF+RUyoVD1K45NjuJAZtTcW5xzzvIC16r6wnAF505LtL7ky6aZosf3oobxax
         +BE80VLHKQx/wTqxKweOaUA2rO+1JI+g2Mfp8LEUKgwW5UaUAM+x1VOT/zEYuvy/K6LJ
         QNvurLNBpMdK/EEBHoUwabZaiPLm1QS4AiPSMghuNkVlkl6AtuT2AvUhTL+saYjFN8DI
         pSiw==
X-Forwarded-Encrypted: i=1; AJvYcCUKIFlv00bimYuGsOf9JmeHBHrLDw1zjzHmxh4d9FfQf7QmZFt9RK0okSxUCF6oWCsEq+3d/LcvSZVhoP2eGtXOFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd6ClKTqxdausbSkIgQtcCFbL44m1/6ARDJvNjph/q9YoNKghY
	ES+xNKp2e6eKfTKPNIg8OJeF+xpA52vF460UaY6hiX9zQi6KcN9y5IyiY0/3ay7LJLQ=
X-Gm-Gg: ASbGncs42Zc0dHp1TWaJva20mqWue4pGDS1o+s//UY0IvBqvXOrcesEkx2LydMmjwSE
	0vzjIcm5/bDV0T6KmHpZuMd3jxEWy3p+b+KDahyGYm7CC+ALj+fEf/gwnOA6/3wC1u9zJCUmv0M
	p7wmriLXKftWcy4bCyZY7EKbjxB3bOk4eiJpsllvCJjYkgg0acxTsPJ5T29rI1LPo1M1cs/thg3
	W9pUZDfBYgQTa+E/cNhL8rjCjP++nYELSTzyYM1ivf0pCbjI+z5365gLX9FDZ740D/h9O2RJf6j
	21X5JoJQH9wCn+tKuZckYQ47iU/Jqi50pvPXdBzURGXPpqTeePqar/pM0t+45ubyhgD6n1NCZ9x
	mUY1cF4sC9DONso+EPYarE3pArZh/3yYiIVx7MXoOd7AF6g8mnK1HPbiHFuY+G54zRcIPrfOpNJ
	u4NpmJfODhUTKrR1cmz/4ea+eL8S64kp88jzfO2uRNJdol05zkp+LxleXRoRNSPxA=
X-Google-Smtp-Source: AGHT+IEK/W4yVhoAW7D+P9TnpwW9uaMPeYy0pNTapbce+kkipDxqWnUCZ98HqD9CqA55/PAeTmV/UA==
X-Received: by 2002:a05:600c:19d4:b0:475:dd59:d8da with SMTP id 5b1f17b1804b1-477308c8e97mr30921705e9.40.1761914720095;
        Fri, 31 Oct 2025 05:45:20 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:45:11 +0000
Subject: [PATCH 3/5] arm64: dts: exynos: gs101: add OTP node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-otp-v1-3-2a54f6c4e7b6@linaro.org>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
In-Reply-To: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914716; l=1131;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=I1G4HrvyfbVAsbzmJD99V+Jtc43Xn5CLNWorLqJlsfM=;
 b=yAkO8ftyoCV/NHjE/cZ5n3J89+y1CpBH9oKdPf2i/Iw3cYgeO5ytN16n4FzJPlPsQthtA6RjQ
 br/xIVSj+kID7nVyxZXCRkDQ5qz5DOZQdITvF1tNxmulCKbE7QhYorD
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the OTP controller node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..3cd5675c094c0774b0efba1b5f76f8916cff3fc4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -571,6 +571,23 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		otp: efuse@10000000 {
+			compatible = "google,gs101-otp";
+			reg = <0x10000000 0xf084>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			clock-names = "pclk";
+
+			product_id: product-id@0 {
+				reg = <0x0 0x4>;
+			};
+
+			chip_id: chip-id@4 {
+				reg = <0x4 0x10>;
+			};
+		};
+
 		cmu_misc: clock-controller@10010000 {
 			compatible = "google,gs101-cmu-misc";
 			reg = <0x10010000 0x10000>;

-- 
2.51.1.930.gacf6e81ea2-goog

