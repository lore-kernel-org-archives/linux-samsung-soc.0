Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BF23F26C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Feb 2025 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942198; cv=none; b=tWrFJ3sao/Tx/XWkkCtsynqSCXZ3JX5aM0GiOIE3oIpGiW+APOhw+KNIpXMq1H6eGcBz65wWFPOlzFM0NKap++YA+Do5iFE+2kqFSVeWf1lSCEDhOgtEeO29bcVoaGehZIzgrBMzOea+Rw7/kFAm2u7dbryHU1FGm7vBB/qPZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942198; c=relaxed/simple;
	bh=mxio+qKZ0oCarMDdKVLWSkQ5r9o/ZU/FWiQSXWeFPIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMtAvEHXOG8Cnaghh0nMy6r/XxQhr1cVpt3OCI+soBVosBTV1iBsmCwMx7QlRR/egYE35fCRs45VAf1+YVfzPVn8bpx/WtcX2siFM9ePSR/9mJR5SZGUspPHgP84AEPfT1jD/gawFpuSi3oIIqT/Qy36H1g9FGrGD4/e9goQWOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJ+I/sKo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJ+I/sKo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so24304115e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2025 07:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738942195; x=1739546995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=SJ+I/sKoiIsWzwTc3ZvUg9Nn3IenVkb5v18LWznoI6zUBoXJHE+QiD4yjbFXvR2UgI
         Pfu918kqD0ktNP51SbPqdq5dsbfIR/t+D7gohNJ+4T+wZlEjci+C+bDnYCUNrZs03GNe
         ngTeDxny8rIbS1x45SV53knNosxKmtn3eZMq8+ovanBdRDBO455RfDYH8LAJTQCU/xWQ
         x4NapEAe/fAd3MwQXOfXrvsp1VU4BNRfMDNclkna7iYam3jnvCc0mBPsqs0rOOyLbCYr
         IF5dpfrgpdFuohNIUApT5Cmlw7W9a4D603xiFRhHjYuVY2dMmuqVtRpmf3Gbio/qjbVe
         Gblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942195; x=1739546995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHOUQzUPyOdT3w4jRKuGIg3i9ApsudVpLcIIKx7XFPI=;
        b=HbnCH8g1+34izsOIoo4anc9VPySNuqNrRtgfHj1UCIr7Y7iVjGaDSqJVGBBSg/2Rjp
         gJEOR5MI9kG1QHE8Ij8AKHfwyT9r//3s8v860iG4yMBqKQL4sjHGpG03FEk4T5SOFiwy
         EnrTPuxmVjgkehw/qnYiLR9Ce7FWXW6bSwskGMtvMc5c6ZwWaEW6iVd2P/hS517gr24L
         YngYncD9NzdRukK/1OSi1IxEUwb6ay7hHxrVilqbpvNl58xGC8bCJ6U5JksIet9TxPuG
         t+ATooubHqz+sT5QrOuGWjI+Xrs4QvhFF/4OnxL7GQ+nPLmk3/apWSLB4PWp3eQbS7ar
         4OkA==
X-Forwarded-Encrypted: i=1; AJvYcCUAbsAYXSsSv0HIoR8Ro7n13voTj6SHS6LcOZT1Zgp0+jbKYNxR7QDwh64U4Am5n92lwImXQKcnHm+596ywU6Wphw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKaz+fXcBPUt95nCRBEztKGfWVSul0ecrOs75xCxkMH6mssnAD
	gHyeJoe8vzUIcltXbsem5JJ/FqSbyAPhNwCd/6rdCO2o63GMGI4brSLxYaUiA07ZQ73Gcdofl5F
	IAv4=
X-Gm-Gg: ASbGncsMyINx4GgN9n9YtMQHyBjvldIwBKOKRQy47u8KLHmTBDz+VZOIOi0d4auP5Qy
	tYmzqSXRpgHzwHG3coAKFrmtKBi1tGQTUdIHZYy0cniy+fQcz69lCngoUx937sv6C9yAEK9XRsP
	Saju6PQLqcXMaMHIf999SB1Ey+dq9FOtjTtUaTJEPQi9orIcOKJXlNvOhIAuIld4L9O4aN37Ue/
	dGoUQQL2Nw1cu1IjXM/mS2pLzpBkxCuLGhobc0JQjsNaaU/bSjxrKl5nn5ly+6tKnv5llo9s8Ri
	5sw9FQlw2m9hu4lp80CI01uQGYMi1wU93MGqe9GLL5cwdDSRW1/xnSMJQqnr2ndIGyFj7hE=
X-Google-Smtp-Source: AGHT+IGdqv97xrtBJoIofBrfUc3ARxL23naqLKi1paW3wb8UdJyaLrah7QQ6vKWacVX29yRHYn+oNA==
X-Received: by 2002:a5d:47cf:0:b0:38d:ca55:76c3 with SMTP id ffacd0b85a97d-38dca5578ebmr2259844f8f.11.1738942195412;
        Fri, 07 Feb 2025 07:29:55 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm57141905e9.10.2025.02.07.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:29:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:29:49 +0000
Subject: [PATCH v7 3/3] MAINTAINERS: add entry for the Samsung Exynos ACPM
 mailbox protocol
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-v7-3-ffd7b2fb15ae@linaro.org>
References: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
In-Reply-To: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738942192; l=1230;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=mxio+qKZ0oCarMDdKVLWSkQ5r9o/ZU/FWiQSXWeFPIk=;
 b=KhnOBxDzV74j8z58omKzA0IJmx9xWAFG5ot7hR2igY0rGVzQ/3XIaB3fQc+nNSealUF4hNWoB
 728XiqFZjDwBC7pvrW3YbBlrgsB5vVJjn4dEGIal63aDr6+7hODczPP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add entry for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..79ac2f3abff0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3070,6 +3070,7 @@ F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
 F:	drivers/*/*s5pv210*
 F:	drivers/clocksource/samsung_pwm_timer.c
+F:	drivers/firmware/samsung/
 F:	drivers/mailbox/exynos-mailbox.c
 F:	drivers/memory/samsung/
 F:	drivers/pwm/pwm-samsung.c
@@ -20899,6 +20900,15 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/firmware/samsung/exynos-acpm*
+F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.48.1.502.g6dc24dfdaf-goog

