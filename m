Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C996291C1B;
	Wed, 30 Jul 2025 07:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753861384; cv=none; b=EDBqsrv1/8bNX6b3jdBX8EbouCeCApqfW7gx7k+Lk1kZ/ZsdVIv4RnkhlT0k25G3bFORehLvH2fuWnd4usGkP7Q8EpHWU17a2XWX1bwanWjlkyBv653gN5bGF1xEn7MxyawYYvFg5Q0Un2UdZlezJ8pyHjpOUlbprIl0ThqTIew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753861384; c=relaxed/simple;
	bh=DUwWpISP5tBRo7RFexnAc/YGPVA7/ZNzRLjMD2d9JsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfborKhMkm4GUEpS2wk4V7pm2kGxq3r33Dl5IcYgHnaJJ5BB5VVCNUo3+ISN0zjtAdkabTqyJwHIo+jmSbysiJvrfN6R7LTxtx0ApJseXH9/S8vXfuuLrdCCjWw5ZeMQ69rbjTCInfHTwIhQ2K9DyX/sQslDYpqwD6wrcj3qkPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCCTNt2v; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCCTNt2v"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-455b00339c8so40669735e9.3;
        Wed, 30 Jul 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861381; x=1754466181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/qSyBpSR7xbk4I0b4os+La3xbFzhrl6JfnTFwclbKM=;
        b=PCCTNt2vtvrrzJ9V/HEvnD3GIHBo2l0r2S+P2SBu83jkcsAyRZycz/rscEdFjotneg
         rfROFalQMff6DEToEQQepYRWHEveE4qv0tYLxsiYYVshwFYFXMORPof83r2Ar0mmiCsx
         F5HFpmlHL5rUZ+mkDNI9dv+afx/0U5Mz0tmz929x0cXkG3IF/+BR+ksaLJeB8qz/V3nn
         V/FgerNIJ9UqItTpDQchilU9bJmXRYJCzt0pw6IZFs2EEb84qNjifC3hZs58amShjdNA
         AJv8X0hUSimzkgHOqHSc7G6w6/dFem3szVr/ZLApNWA8K1XHyqPE8BRIbtX9S/32BHX+
         JNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861381; x=1754466181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/qSyBpSR7xbk4I0b4os+La3xbFzhrl6JfnTFwclbKM=;
        b=Q47fXE1HiUEgIb+y8KUX6BPHutSXUcJwl/iTVcpHBdi1p9MuzFbpF0xRlZEZsD3qHL
         NR4k9yyJfZqTlGAIQEFgzDgbT1QyiqCy1nM5jIlqZnd9HTE3UTm/fkRGJBW43vd5FBE1
         3gBKXM4/87Ko/8noO1A4pBoMyern4N7VVcW/8sYkXXC615QdFCRUIvXZ9Bt7SPZp110n
         SkpiNiH6OVv8k8sipLrzOzrEp1sau0YdUcDd31o461NIRqX1Kf2al3MuZXC8UCZQVVQU
         K+HpqUObDNsMvT9swJ+sDjaHwlS9OGqjsVa4fvjLoheQp1iJ2VqFh6C5Xj607icTjqxF
         dAgA==
X-Forwarded-Encrypted: i=1; AJvYcCWqAipCEPcPnS6he47o7JxH8Stx/xa+RrLe5nnhI8HTBylRH6hsbCRWLnBKbz/8+VioUVNlw0vaNaZZ@vger.kernel.org, AJvYcCXEH8a/XPEFlfMv80p7dO2Nk6LxkCWf8ZVcjH3JiGiBOHkYglFNl1Uc9YAi3gdrzCWMDdOdsQ9//TjOk86t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq55JGeOjejVK/F936LsgDdB6puZKRKfD3aqTY1UN9rftgPoYo
	sEMViNuQEGzssJPgMpCWuvzfFtuLruUGGrJT87/ZsrJ5tseHQItHgx0h
X-Gm-Gg: ASbGncsMZFQiXZxjYW9WLtgrwPfjxXI20zNEbOo/mOm1l9ZyC6KH3PRKZtF5j9A6sAb
	RPkIkn3RDFip4Qj8JRO78KBS8mKEAp5K7jn1EfIK5QLCMc3pLbMY3P9il0kFjIwT0cuUP3jpRvT
	85m7ZOP6miN4NgfyJzCk7xauu1QRhf/711Y/qzQtTNIn2hbx5ntudBmUsTixdJBLWDuy9TOYKHx
	GPJySyRwOyHK9WS0OaOo5TVhUqFxy8BnOB+cVLMhVnfxklD6dyc23ZnePs4Hk4qwJlPhGnwirl2
	W7RXzsQEWBD6f0uZWhD6u2SO7ocOQ/y3CATQUhbs/nGAfhl24qJqI1doKHKUCVaxGZMw4eONR5H
	XUBuE8aQBk+Yog4JnjHP8ICAgHwmETSY32l7rVqHE+wNhQsHrpQn9fUREyDMcNMBiwN0Yl881CA
	==
X-Google-Smtp-Source: AGHT+IGbqoAzQ7GqzooDCTeNLJ9pbPDmJ9+TVcnibPLxdgTc+go/TOvHvFgZIhiwVjiP7DXbQSnwgQ==
X-Received: by 2002:a05:600c:c168:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45892bbf6b9mr16728635e9.22.1753861381414;
        Wed, 30 Jul 2025 00:43:01 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:43:01 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos2200: add serial_0/1 nodes
Date: Wed, 30 Jul 2025 10:42:52 +0300
Message-ID: <20250730074253.1884111-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index bab77b442..22c6da907 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -336,6 +336,19 @@ pinctrl_peric1: pinctrl@10730000 {
 			reg = <0x10730000 0x1000>;
 		};
 
+		serial_1: serial@10840000 {
+			compatible = "samsung,exynos2200-uart", "google,gs101-uart";
+			reg = <0x10840000 0x100>;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_UART_BT>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos2200-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;
@@ -458,6 +471,19 @@ pinctrl_peric2: pinctrl@11c30000 {
 			reg = <0x11c30000 0x1000>;
 		};
 
+		serial_0: serial@11c40000 {
+			compatible = "samsung,exynos2200-uart", "google,gs101-uart";
+			reg = <0x11c40000 0x100>;
+			clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
+				 <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-0 = <&uart0_bus_single>;
+			pinctrl-names = "default";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		cmu_cmgp: clock-controller@14e00000 {
 			compatible = "samsung,exynos2200-cmu-cmgp";
 			reg = <0x14e00000 0x8000>;
-- 
2.43.0

