Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EDF1BF6E7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714486497; cv=none; b=UwtSQWH2aR/3sBAAMy6HyHwrgbsOF/Mr7/4GQQbzfdRqm97q/Z/b07jwWfeznNrw38Xl51+GOXpqzLq3tcVqyZAy5tVe52q2W5eeLVagunEecSm9WIgex5ZEKEhlFYnkGhP4khoedFlxwmCRWa5YOkF432zMIk830GA7YefWw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714486497; c=relaxed/simple;
	bh=V93d3WSQViDZ9tXG7HhzJyV15JnJh1dilCD+DNoBZfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nutzGxfvsbmT6pgW9E+jETz+4GaB9TUK9xIJ3gSZSPtsUlkCYdW+satMDZj9adghfgHj3LwQ1LirG2byx2U/Zc340djRLkX1LNDnrkL0KhsQRpWxvTLVyvZMgrMdOEyCFTtqRr24H/We8E3bVcXwW6b2Bj55m6SNWEWjMQrKoIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=smgkMnUZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="smgkMnUZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41bab13ca4eso28451555e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714486493; x=1715091293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okmxHGGdUMGilynu2+6miKMjxCF2jE9qtaG3v5cgljw=;
        b=smgkMnUZsGRTahifki2ADIDqCmgLFU1xf0gRvXPJUjUlQAm3HgW4yvMQRdZ6Gtj7IU
         dONwdT8ec+RtAad4JUXCO5mwPe1pZJopgIyyV/ZOZZRtEUQZITQpa9HN9j5rNtORooVA
         eeccx0F5h836sagm3euq6Wpbb1t6qww8vESo+PdvHQCYdTokjHD2JPPVTKRds3+e48pQ
         lynSrzXzNJEwZZ2WY9/2kBUMbacEfhKGq6UxTKmQTmmVlq5a6BGX2PPpJk1U2wp1w3Xe
         OS9qeeHnxUPKx2Ub9YKgcW67Z0vdCKdnBMFx+ssUjNi2cHcMdjzRnZ6biuqreYRikcSd
         NDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486493; x=1715091293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okmxHGGdUMGilynu2+6miKMjxCF2jE9qtaG3v5cgljw=;
        b=fsjpb7QdE/7+34ZrNe18HaJrqp2pF3t5Pjli5v8vGUuug/IJ4ABU0gP+oFn9aDUGTl
         6napwch++a2QmrTJSaddhvUL9vyq2o/uvivT07BJze1ilPgUKAXoyalv8mJ2bPUg/8sV
         sb+V2CQildjBKVA79bONP6Gnizk7BZ8Ggh7mDtFJc0k/IszhGjdPt5X6uCObq9r0LLzo
         60l1iqwfULEg7utUm0XndeVxlHYXAEL5U4KiyYANHChZt8T9ZuRcvSbaBRRApmheNlpc
         cD6HMY7l+xTMsbmHM7v4B+tP8kxm5vwKmDEVCfIItIfYyxRb7ED6MbuNvHr+srp5DAiN
         lGZg==
X-Forwarded-Encrypted: i=1; AJvYcCWgIpS3tSUAyus0AS1zKut3YDGZQi2aN/vo9MjqMXfiH7OSV9vV2zBsdsErsLUQpDmWOCSZGWsSUjLvrrS4vDmqKqNltQBvS7+5YxnMzaCvVsU=
X-Gm-Message-State: AOJu0Yx/i/6W/r5+RjLk1GtqdZ03lcCVhI/H2SlBjISlBTTSd8OyZIIB
	VHvG5KoMouJyZvN2y9z7uMnOW+30rUoVfok1Dh6IJq+P8wlfXAwifuEoqA9uvIQ=
X-Google-Smtp-Source: AGHT+IFOV6Boiua6vxtgJwU/ckgGydalUeT2SdoUtWSqR0XQEJrQaX1crPbKpSVki5bjWuWmiiGApQ==
X-Received: by 2002:a05:600c:1988:b0:418:f826:58c3 with SMTP id t8-20020a05600c198800b00418f82658c3mr11554553wmq.15.1714486492681;
        Tue, 30 Apr 2024 07:14:52 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:f162:7aca:a805:2c2f])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c458a00b0041bf3a716b9sm11593517wmo.34.2024.04.30.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:14:52 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 1/3] arm64: dts: exynos: gs101: Add the hsi2 sysreg node
Date: Tue, 30 Apr 2024 15:14:43 +0100
Message-ID: <20240430141445.2688499-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
In-Reply-To: <20240430141445.2688499-1-peter.griffin@linaro.org>
References: <20240430141445.2688499-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This has some configuration bits such as sharability that
are required by UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e3b068c1a2c1..9f7635a7928e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1320,6 +1320,12 @@ cmu_hsi2: clock-controller@14400000 {
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
 		};
 
+		sysreg_hsi2: syscon@14420000 {
+			compatible = "google,gs101-hsi2-sysreg", "syscon";
+			reg = <0x14420000 0x10000>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
+		};
+
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;
-- 
2.45.0.rc0.197.gbae5840b3b-goog

