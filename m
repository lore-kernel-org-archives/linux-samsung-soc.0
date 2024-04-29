Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1391481BE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 11:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389350; cv=none; b=VP+qBfG8xXC6j64Zi5nlooouQzuVsb/qWO7YOOyKEAH9QILZZMrSd3evwbjd/q5AW0dVWF3iSogY7DqM+WhjNhQkKqpL1DuY+TCKuvx/16sizblHsy1PCn8a/pL6PT9qz5UVH4DGrPFfZTHfyKclvB8LfyMwHjTSxqUTH0OHVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389350; c=relaxed/simple;
	bh=ZmIYYUt0QcbC0Veeq4Fmo5dE3JV8iq7sEVsLahwG0es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II2jYT5zD6RrOmNQVZdc8Wq5xiYzqkW0KD07N6mZq5QxvTyEEFKLWqamjpL6JibAvwOOpk0jReEAMdXu8aI/dQwlwxLAeYMVog6IYoDyvC1mdycVk2XIAQkgOdATsdsxcrpYOl0ZfO7N7yeOtxCmwKPSLnbAj6FWxUn4hLisEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzhQRKr0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzhQRKr0"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d8b2389e73so51684581fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 04:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714389346; x=1714994146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX1t+YE1cBl5MQLmH5bPrWGcz0Ebchp9QnAASzx5oG4=;
        b=jzhQRKr0W3vkcBEUXKhzxmksxq1ruYNJ4hMDbmhLyGm2ayYJg/Zrc63MTyi9KMfckz
         pHUAlOZpflsguaLZ+Zsjii8y7QMyTVv6NKToZ6y/xqb+ikf5eK47+i7vCjwN6y5/e7sc
         V80kQeKP5G0umKJciItEwishSNL+Q/KIdlVP7DdY4gHGvHMZUvjEonr9e2NF34bIvDlQ
         97AnLqjMXQFdLz8nxcHMr4BQVXrxun13wyFASeoYVCuBG2yqNy/XOWH0c4R4Gt5sookK
         NKHHkd7rCKUP/EvD6iJlFopQCh3g4Q33t2PC879531DHRt7LoeyxVYjTmxAj+vL3kLSG
         cJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714389346; x=1714994146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX1t+YE1cBl5MQLmH5bPrWGcz0Ebchp9QnAASzx5oG4=;
        b=bBmT7H4KpbMv8N3CyjRCxTzW7R1ndQK4iNKdq4aHG8/AM07Vfwa/BJmIH4u/UL/4XV
         FnuKjxzgbeHD/NbclobpWiOou80GPli3cKorJvWwtuI4S0nFzr15EPAIQSuZs9lAOmom
         C6pUsAfLEWEq3PeJy3Nt+bcTEih9+XmK+yd53LfP/nd6lMbCMmX3rlQ4vkizU71iuPtq
         fJWCN0QS4lRbOXfJIB3O6nn8/5ApP1jmvd7t0Kxn17aI0k0XLtFMOsxPnatwNjiwbPpt
         OzxfgV6+Xaf92OrWBid+JfPtKHMy0h7e5vT2HL63G9111sDA7ep3ekFnJhKA4JvU9i4t
         iEkA==
X-Forwarded-Encrypted: i=1; AJvYcCXZE0k1/NcpCbYga740sMGueIhlF6xQ6dur81CKQ63Q2qPbMygK+cMIXPcK0iJwTUR49D3E8mX0tsOCx77VkgAjJkKMHdSnNJjfJ3z+9d/UDAQ=
X-Gm-Message-State: AOJu0YymzMM92P+yYiYXRklwa9yAlGor3qRREzOk41dsOBSD/WlcltiD
	YbCyfjUA0bQlJnaqwBJ2LlYVSQtgiI2PqGQFixFveIFIpyS1ImAQv043AIO6TR8=
X-Google-Smtp-Source: AGHT+IESPtal/xgnWl8g9+lgMXOg/jVrb4GYZr0Fcd9/7y5Pf83tPpq4h5xqaYXN+/jqF10t6hdVbA==
X-Received: by 2002:a2e:960f:0:b0:2df:a8e1:c24 with SMTP id v15-20020a2e960f000000b002dfa8e10c24mr3999779ljh.34.1714389346058;
        Mon, 29 Apr 2024 04:15:46 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:550a:b373:6b8:63ab])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b0041b434e5869sm16005337wmq.43.2024.04.29.04.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:15:45 -0700 (PDT)
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
Subject: [PATCH v4 4/4] arm64: dts: exynos: gs101: enable ufs, phy on oriole & define ufs regulator
Date: Mon, 29 Apr 2024 12:15:37 +0100
Message-ID: <20240429111537.2369227-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240429111537.2369227-1-peter.griffin@linaro.org>
References: <20240429111537.2369227-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable ufs & ufs phy nodes for Oriole. Also define the ufs regulator node.

ufs regulator is a stub until full s2mpg11 slave pmic support is added.
The gpio defined is for the BOOTLD0 (gs101) signal connected to
UFS_EN(s2mpg11) gpio enabled voltage rail for UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../boot/dts/exynos/google/gs101-oriole.dts    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 6be15e990b65..fb32f6ce2a4d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -53,6 +53,15 @@ button-power {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once S2MPG11 slave PMIC is implemented  */
+	ufs_0_fixed_vcc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ufs-vcc";
+		gpio = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 };
 
 &ext_24_5m {
@@ -106,6 +115,15 @@ &serial_0 {
 	status = "okay";
 };
 
+&ufs_0 {
+	status = "okay";
+	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+};
+
+&ufs_0_phy {
+	status = "okay";
+};
+
 &usi_uart {
 	samsung,clkreq-on; /* needed for UART mode */
 	status = "okay";
-- 
2.44.0.769.g3c40516874-goog

