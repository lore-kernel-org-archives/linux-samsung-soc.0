Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D2A4EB34
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662720; cv=none; b=d44CUELYKR2nvH0ZaZzWnWZHh83BLyOXxbrcjOwz4rokVl2ff8q5Q3fLAxqec3a5u191d7+H8cZrXdqhITIMQQJyoAgIWr8G/Mt+psru7RfKI6lkZRN5rjbloipo/GLnsVhJKIpj8JMY0Bze+sjGN2p6QGufpSbnE7wNMfEez7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662720; c=relaxed/simple;
	bh=pyiu2b6hZbV+KEAM6+J3xchkHBhQpDx49W1gw5/aMSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfpwWn2YcdryWA+A+6QWbQdQQZ4JqUsCNff4lcrRYgu0sJOJlBNAbR9OlCc+nwMSASN33C0Dc85P9AEeiERmXDMuhuIRSYBLKxKEHLCvv5oOB/uP1U1I4eBG3MXANxv2sWPfUqzS8Dokmiic6Mbgsb6VEMAk1cnmkGgUvwf0XjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xg0bc7Q3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xg0bc7Q3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-337d58942c9so644981f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 03:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662717; x=1706267517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L66JRLF0ZrsoUYfnES6QXLTT243sb9kIBlOTRCXLcRs=;
        b=Xg0bc7Q3tFMWlu4jhkt0iJg6eMrebIhrVvMaTybPrtFVoRqcgr6jUc4UxmSyUaQRGW
         VGHCajKVBDXDYR97Ao/NBme2iHO/W6cAnLKckmjuQvWqJ4r01bIUcWsO9uOK+5sDYRbg
         QFxtCOXquI3M+dSX2+MvkLCfzw7nhkxEqW0Dnuv5u3Fjrpz+BD5Aea8nGb6lURIOWQb1
         n1nhBDdpwui9ilmq5wPAtDm6562h7rxMG/NRTgLHV48RnLaj3JLNZG8uFErUS5ho8m5u
         WtVin7RfvzbtDtY8snYuksZ+XfqfW0vT512/M3bZDSX20zdscrcvHvOUg39geNYruSQa
         KlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662717; x=1706267517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L66JRLF0ZrsoUYfnES6QXLTT243sb9kIBlOTRCXLcRs=;
        b=dpl2TmHI1cMrILvnPmkdE/s0TNy5XhjIk7nRnfKV0+MUsiD/42qbG55DZnOFrp2my3
         E6P/hUzcuu/7KX2dRLAPbjFWz8wluFtMurgr12bvatgeM0BHfqdRobWsC8CyIWxdOa4C
         TUKGOEKDVnff5nft2Xj1CwXZwlkO0BgjDrUP20AQP7WGPMeBzeBGWf9+CiDjHGw10Zi1
         BDW60BeOR1dM8lSqXYYvz9YZUTv621Q3IFcYVkfyIctJ4dXRduHVqkc+PjPGh1sEmTSI
         lhTeS3Gwdb5++zSxbGldnxTOF0HbZRXqbOkwCEL1JOHiUM9bUhV6bor4B05jreCSAJRj
         nHMQ==
X-Gm-Message-State: AOJu0YzBp9PeGkxgoBgVVdbn/GAB7DceFEEYdh3LwXYBMLOkkegAj6nY
	butpZmNXA36YrvxsjMhYupUNYrn/qVn5tzIZ0IDACalsihLq/2OpbulRopMZ+TQ=
X-Google-Smtp-Source: AGHT+IGjQ9rPloGe3yccmeIqbpMxV3/OmhM/oo7XcQ3/J2zR0OKoUoeJlDfZgt0XPaGred5M5PheRw==
X-Received: by 2002:a05:6000:d87:b0:339:219a:4613 with SMTP id dv7-20020a0560000d8700b00339219a4613mr396926wrb.65.1705662717544;
        Fri, 19 Jan 2024 03:11:57 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm3341868wrv.20.2024.01.19.03.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:11:56 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 8/8] arm64: dts: exynos: gs101: enable eeprom on gs101-oriole
Date: Fri, 19 Jan 2024 11:11:32 +0000
Message-ID: <20240119111132.1290455-9-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the eeprom found on the battery connector.

The selection of the USI protocol is done in the board dts file because
the USI CONFIG register comes with a 0x0 reset value, meaning that USI8
does not have a default protocol (I2C, SPI, UART) at reset.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 4a71f752200d..cb4d17339b6b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -63,6 +63,15 @@ &ext_200m {
 	clock-frequency = <200000000>;
 };
 
+&hsi2c_8 {
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+	};
+};
+
 &pinctrl_far_alive {
 	key_voldown: key-voldown-pins {
 		samsung,pins = "gpa7-3";
@@ -99,6 +108,11 @@ &usi_uart {
 	status = "okay";
 };
 
+&usi8 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
 &watchdog_cl0 {
 	timeout-sec = <30>;
 	status = "okay";
-- 
2.43.0.429.g432eaa2c6b-goog

