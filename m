Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BA83F9D6
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550127; cv=none; b=Y1FEDVrRS9oaUvR6io7fAzTF6F5PDFE/0SlGQQcSSILWHZbJt7pU69vZaXi/PyRIWYT3NVZLj0J3DL4ynzwcWgxDrFscehhVXQRD9glFBznx6X4fzCNOa0TtZYwxPQ/MXadSnyzda1c4/0TSGnhLF4Epba28h0CKrKTER3yvI9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550127; c=relaxed/simple;
	bh=EYbrVsBx4CczVTo2it9ewxYkNd2HjzVb5k8/lZR7m9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtC0w8X4o2CObsn38EwlOXbMJHdmAeKCdkX0H1qVZS0J/kcY9KA9WBjeLpvd7eWbLHE3gvfaoX8yO688neOfLY0z8ufTvxzr+qrGEMcwZ3BEJd1VMXCH8W8gpdPtSU8H7AuZar2Zk0OPyokyXw3NNSYethBrHcVCbf8z8MgI9Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lH1LI9F5; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lH1LI9F5"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso1492302a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550123; x=1707154923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN7Q9lvRKaAglbSzz4YTb/Gj6CnT1pQKtP0U/KtQa4g=;
        b=lH1LI9F5YQBbCCVkqfgYW5LqBSYLlMcwa3apvFkoAK8jEiwKlFb5FSyiX94iHGhM/d
         T7bN24lNNl0hTZ+jh4Rfrn8cAZybPBBxqVFxHoJp5KXJxF88ze+umNo1adf8AFmqUuDc
         aAfp7yllEQq9j+s6K07RZShygEe5n34JI0Opr8AzoRlXJu31fb2P13LfnRPH0siN2i6j
         VQQqe0soh+AMC5p0yMX3OvcmO6iBn4fzpPZCREG/rU1hBhchqihwvTQ2MWA69rr8oI8Q
         pLqxOVxWMJ3osD80P5HXBzSWY08R5U+vnDTgl8Lge+C8+xDHpFMIC8tRYK2fxbFrHvvo
         XLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550123; x=1707154923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN7Q9lvRKaAglbSzz4YTb/Gj6CnT1pQKtP0U/KtQa4g=;
        b=UMw5pYwfLKs9uuRCras4v9UwVBLXQrkGryJo8pcnDspXzIUVEyJjipbw0ZiZMgaCHU
         LFjzRj2NCPs82mMMgKd9GI2GECNGz24cw2PAZFkbtA4Bdl8N+h0OaSWVvqlFvwA6ia/q
         8FkpsZnYvSDZu6WpYZX1NCWa/VwYjYUhQR8QXE3CJf9kDku1JtUf3iGLibaT+vFcILa2
         Y8OWSH6c1VVbylc4tpQuHxapM71mnkRYS9tv5mnbWP8oxo9iGPxTH2mRPkXRTdfNF4+5
         Z2UKWm2ymWp8QBOxqB4x6qXTX5kRpbWXRIibUPbL2FCJ59p4GabGlDo9tohMc6Jd6VHf
         5CXw==
X-Gm-Message-State: AOJu0YyJH6gERAKaHSaTDn0vOmMYZhbqMI1o//Og8zWGSIgXOUHZP9j4
	JvimdxrU7d9EaDTFoaWtjz8Xr9rnfw9F8NS6DTsRhTLy+IAWX5y2GFqC9QcoytRlLz+tG6GQ+Uh
	cZ+R7JQ==
X-Google-Smtp-Source: AGHT+IEdHowJxYSut+KMjg8E8ckZoYrG/WbJ2LXWkd3+D98wvQyonRs+6o1EJqKQE36Ov7Fa6FRUfg==
X-Received: by 2002:a17:906:eb56:b0:a35:e7c2:4a5a with SMTP id mc22-20020a170906eb5600b00a35e7c24a5amr1353510ejb.33.1706550122959;
        Mon, 29 Jan 2024 09:42:02 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170906fcd900b00a311a360433sm4237765ejb.143.2024.01.29.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:42:02 -0800 (PST)
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
	inux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
Date: Mon, 29 Jan 2024 17:40:10 +0000
Message-ID: <20240129174151.1174248-8-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129174151.1174248-1-andre.draszik@linaro.org>
References: <20240129174151.1174248-1-andre.draszik@linaro.org>
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

