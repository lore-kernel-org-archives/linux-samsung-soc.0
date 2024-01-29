Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685A23F9F9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550434; cv=none; b=QvYixPNUO3MgpuWVVr2khN6R+qCTrvBzC5Z8hOOsSeP4TS2SjOgbyAA8lTmFuiE345A0/nySh+0zrEjCQOajEwLQCkHBU4tok11CQt6jslwpLHOQ2rzjfdLt6zZWzYfmtv7c73YJJ4oKW+GoKysczC4Vtb9uXgIg0XtM0uFFHPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550434; c=relaxed/simple;
	bh=EYbrVsBx4CczVTo2it9ewxYkNd2HjzVb5k8/lZR7m9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWujSEKQ8XfSWQiFm6Y2DYpdVzShfqmxxSpuZo2IZ/WPB4L916zfVUGEKgTfipMl/jECEXSS/CTTELg7j9van82jRfg2+yKWpBu0Qya+ydkF1P4FubxJX3+o03jW8eqR9SihKdZ8DBayXEFW43+DkM5MSj8Dm8QX5lugqG28efg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxVIC+S6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxVIC+S6"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cf59087e03so19981581fa.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550430; x=1707155230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN7Q9lvRKaAglbSzz4YTb/Gj6CnT1pQKtP0U/KtQa4g=;
        b=rxVIC+S68AT1fvl5V1ayIIMhvjMfa6mng+JRE/W0XYA5mgI08ayOxwa/KcieAEedIW
         dCUN5gHEe1NqZehVJS0o3sTrbqL0tMbm3iyIrE+9jWIDZppb2md7tMI4JT24VL1HPsSE
         cnnXsouipiE3DAO8dxsaxF7LqN+I2KXBS7DnZ3t5e7h7KIEnV8kKVmVY6gRynW31eCTu
         y00IKgeS2lkyX1BAUAJ3JdLy2mq99FzSVn2DY/nW6KmRib7dlc2whIS9mBMbC81vTROm
         aVTHnVfL055blSYpTt0n+o2VC0ZJfHysxY6ExtD2gTWyYewUcSAo4AlgdzwmIO8RNepw
         GFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550430; x=1707155230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN7Q9lvRKaAglbSzz4YTb/Gj6CnT1pQKtP0U/KtQa4g=;
        b=fn5BaiE67R7EnJ9XnDqsYmmx8ZmvYSJLeqbVLO0342oteMD0/VY7K9HgA2XTWsuKQX
         TXTmOb9x69xzCQwXROKkfw23u8h7Jp6Xubb/B32u/GHPOcUD1NAxAgujCl9siaaNHPdS
         T3aa6TUB6UuqVQ3yRVYp0M7tFGFdr4mU7wUgdmdMGFeiK3m2BH9XlWV82taBMWrWNssi
         ToUCJz0BJS5hYfOmvmnD1VkF2s+azYXdWhpQyS9bGWrNLsCURdgpSfu9res3i0DSO2oE
         ih9B+fPKFD43X+gSxf+qLzSpC/XksyhVEuAbtSgK4UDcoVkIqUBqTeYEfiSeOcZ6o3Ll
         bx9A==
X-Gm-Message-State: AOJu0Yy0gMQUgSADkdtkxLVD0j9EfoXhdOTwYRApT2ecTHtYJn930wl+
	+Z56aVxExdcXMJtXWJrkd0Sgb6WSjtQfNwFRtLP9U0x8ocYNn875bPw/ZyXyE+U=
X-Google-Smtp-Source: AGHT+IGGX12jefZ3ORpqP3WpoKoqBC3NixlOwRo4Dex+hqaEW+6BruXCJDU6lnoik6V45yxURorkPw==
X-Received: by 2002:a05:651c:1a1e:b0:2d0:5283:84a8 with SMTP id by30-20020a05651c1a1e00b002d0528384a8mr1574080ljb.36.1706550430239;
        Mon, 29 Jan 2024 09:47:10 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id u10-20020a05640207ca00b0055f08fa9286sm1000999edy.23.2024.01.29.09.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:47:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 7/7] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
Date: Mon, 29 Jan 2024 17:46:06 +0000
Message-ID: <20240129174703.1175426-8-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129174703.1175426-1-andre.draszik@linaro.org>
References: <20240129174703.1175426-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This bus has three USB-related devices attached to it:
    0x25: Maxim 77759 Type-C port controller
    0x35: Maxim 20339EWB Surge protection IC
    0x36: Maxim 77759 Fuel gauge
    0x57: NXP PCA9468 Battery charger
    0x66: Maxim 77759 PMIC
    0x69: Maxim 77759 Charger
where the Maxim 77759 has multiple i2c slave addresses.

These don't have (upstream) Linux drivers yet, but nevertheless we can
enable the bus so as to allow working on them (and to make i2cdetect /
i2cdump / etc. work).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

---
v2:
* add short summary of devices attached to this bus & add TODO
* collect Reviewed-by: tags
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index cb4d17339b6b..6ccade2c8cb4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -72,6 +72,11 @@ eeprom: eeprom@50 {
 	};
 };
 
+&hsi2c_12 {
+	status = "okay";
+	/* TODO: add the devices once drivers exist */
+};
+
 &pinctrl_far_alive {
 	key_voldown: key-voldown-pins {
 		samsung,pins = "gpa7-3";
@@ -113,6 +118,11 @@ &usi8 {
 	status = "okay";
 };
 
+&usi12 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
 &watchdog_cl0 {
 	timeout-sec = <30>;
 	status = "okay";
-- 
2.43.0.429.g432eaa2c6b-goog

