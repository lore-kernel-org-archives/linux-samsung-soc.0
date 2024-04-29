Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C919A1411D6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 20:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421086; cv=none; b=bIFwPTijvTPVtEesKuXMXc+RXJvBTsJiAMyYsTGJPwvTREiwYoF1Mwvqvnx8NZKat2o/5+IIh4zpCN6Lkg1JbBq7xEV+Q5xGYU/KiXYFC/rlIY4jhNjuiWIwiNzoUc3tcus2mMcxsYUc8yRFcSGEJ7n9rHmIqMX4qU2i0it0j7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421086; c=relaxed/simple;
	bh=6EPfWTqm/lFaZs1kyJ73zKT+bkJLAEfvahvw8Cv8KkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKUydqPIJVIKSWygbYx6+j6GiiNaZ5LzC8EgdfpKetkDapzz+V638O6CiJFAiVCMwbiAAeaTWEosu8aIh17RPpglOXxGgTqVBT/eRrSueh+tSmtMsS9NAHITcTuYg2tptHBzk0U5AuFbVCGdHnz2VoffxTfV6uq/65GjX1+2i1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CpdCVPYE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpdCVPYE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so8166338e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 13:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714421083; x=1715025883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8gW4wGr4HSLlzWyo25Ekg/cBo+LkQV9cqhppDRnOws=;
        b=CpdCVPYE/frxUrSfNZ3TZH94Snlxm9d500/Tw9mo7gLI4Oi3nCIPy32F1A0Mb7rdmO
         zLAhGIzjkKHXJ2bWMHe0z/WFIcf6xGuSoPOSMcLJ9uQvHBdXlXMT6CwBiBpIHsFhyB0c
         Pj6N0QMIwhbsx4Rg1pHJml34k6pZ7lEtbyxqR73D21qoNs05JUENpWB7W4ZPAoji1KHH
         R2DPCQdzwg+61Fsgqq2nC7Xp7w4ADgctAiNYEq8azZQUYIpJEg7D4uvhzDfZBF9t5Hwc
         6eFzZs8u1wcaNcWqbnyIpK2Yh14z+N7aNC5db+2EJRw0qW518WA5NE2B6bLzQVA2BM8D
         w25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421083; x=1715025883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8gW4wGr4HSLlzWyo25Ekg/cBo+LkQV9cqhppDRnOws=;
        b=qtMMQrDvLyV5MEcINJDPRgSZxKvulmvRboLrRpKfwoOb+wBZVz5hC9xaE6tgwE8eZH
         Xppp3fhmjecQd6jy+7JZNwIwNODZHPq697J9MiyVNcNJ+aFJYc6H8gdNdHVRkUd42ftP
         +kZ50qmUmAD8+MxixQSuMM8YQrrmvogRv/UJYVV2sjVz4/Ok20VYnPJRiiYtLavn8Mw8
         PFbLHj3Sc2PO9Yg+k1QzmPYQlmUiriUtQdfNQhGE3ha8p7aQvzcLTtqP4XrUKyT4GBwR
         LSpUD+nweeGWN8+n1HrnOmFTtzZBeomyOGaShja0mnYjeR1ORA9IOoLzZGgHKP8w6TIT
         JN4w==
X-Forwarded-Encrypted: i=1; AJvYcCXGs2VEklAKIrWiGu5bHbOnqNdJ2QjuEYQGECmeFZ7tZANm5PjCkYVbzqJX95irUBtCNK7U9fEeEkVk/Ce/cWtXOzHD2SnBlYD7ofzpxQPax6E=
X-Gm-Message-State: AOJu0YwflW90XWow/iXxuG88P9x66qky9ff7yxezvn/dYR8LC9JkqUvu
	3GlctP4xxIBCHYxygdMQeKUXkU+BN6aD3JpDvSKa4ZkZu67TzDFJmHgfTbBzpmQ=
X-Google-Smtp-Source: AGHT+IHGis5wF8t1ESX8RAjQs/EY1YGbXFP/Qh8xO6fNNNxeWUWMjywlketexpvy9RfUj+AypoUtcQ==
X-Received: by 2002:a05:6512:20ce:b0:51c:71cf:efc9 with SMTP id u14-20020a05651220ce00b0051c71cfefc9mr8666331lfr.49.1714421082734;
        Mon, 29 Apr 2024 13:04:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id ld4-20020a170906f94400b00a5906d14c31sm1140887ejb.64.2024.04.29.13.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:04:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 29 Apr 2024 21:04:40 +0100
Subject: [PATCH 3/4] arm64: dts: exynos: gs101: specify bus clock for
 pinctrl_hsi2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-samsung-pinctrl-busclock-dts-v1-3-5e935179f3ca@linaro.org>
References: <20240429-samsung-pinctrl-busclock-dts-v1-0-5e935179f3ca@linaro.org>
In-Reply-To: <20240429-samsung-pinctrl-busclock-dts-v1-0-5e935179f3ca@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This bus clock is needed for pinctrl register access to work. Add it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 8d4216cbab2e..f8fcbbb06e7b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1327,6 +1327,8 @@ cmu_hsi2: clock-controller@14400000 {
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_GPIO_HSI2_PCLK>;
+			clock-names = "pclk";
 			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 

-- 
2.44.0.769.g3c40516874-goog

