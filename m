Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425833;
	b=4ZddOcACHvXdzy9R4yvTjiS7zBRMKRgC9Do1lffIEGxw4FlSuIrBOLmOFpImsZSgLyHJ
	 q6QRvRsYsk3iQVrgl3vh5PBH+II+If/w4IbbrT6qqTnxPen83UOHIE6wGiMfBRG4M4oDm
	 VNzpKNPzWkB8tTDMtJBjRXOgb8kVwnFSO4zESJWg44tKV7ci/MIIbeOwstO6wCjemOIp2
	 yzFckGAKF2soElHxGqlWNR708CpwWOesiO5i3uCnyL1u8ghwXrVOmNm0jPg0oNuiSxDaf
	 V6cD0F4YiX7xkmniq1bOnDacFV5OrMYdT7oSqBqWf9iHaS1rpMNclSosPRCto1fU+bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
	b=taRfNzhLBYeVEppT+NTJoYHYyBTLQxumoTs+NDn6Vb2TOb8sAgLsy5QK1tUTHgIoBHFV
	 Rqhxay2PqsqpSUvN9hXPn2QMBW+O4U6dqBgV3T05FqMNP0ICoaMmDBQPJ8FpYh2KMAlq5
	 iqW9YuLRbN4tgZ+C7BMSk6FnxZBB2nAQOFs6LC+FZdYJAavOKH8m2G+yMf9OkM/O4QzPk
	 vx/0j4dRRaalqkUt2+RsKl7kZWH1grCd+9Ib14uDuv/5ojVboSV65l38RzxxtBEVu/6ys
	 //aIdoCJfubAcH1PHAoxZN1o7KoqjdeDOuuAWfG0gCXjJssYgVSbbSh1V55LUCA3UXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQtHTTve;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CC0606A69F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0CC0606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQtHTTve
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso16557775e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425831; x=1796030631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
        b=eQtHTTve4Z4uO0VZAtHlaMiIMXczJdOAy4HbaVdlYYWPvJSM/QLmy77k1bybeIhLDg
         7vp8/Amt70kttKGpzcb4OlAXd3W4509mL3m9WSXnuocukElT5X3Qv20D8ueCPJpSMkmk
         XEwlt1AIdCc1QwRi+JamZfTnYH2nRYP932nArkis14HhM/ien5Dt0sEgjlrL7dBiaiK9
         9qN+THVqxl1Aj6cKAeV+vjl9owYMdEPUUm0QOujTJnwtdNOUF0etsUlbW2GVax9839Kt
         S99uEhGtNZVd48dfgQDuOh+3puZ39tE6ZcrMF0BPgFgXHCjMCjPX3cPY2wuf9TQZISV5
         aUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425831; x=1796030631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7VvbILs3Zv2pV7V8AkAMmQVIReBp3cvjUTRip46v1c=;
        b=xCyVLGwwY0Jn81K4Y3yinkiYPwT/pz34TRI6+loKzdvi8V/1kfw/X4bKyhgrkPiv6p
         X72yVIkai1q4kOufWv2I/EYZCm7ajncWDg9gBg2IYA/HhNlpAjFJ3tqwHA7wXaI7p+wP
         I125gYXz9IMGBXOcL0QNMk4pnA5W49GNmkkJa6Amf4N14lbMm/TsYaQH2nIFJ4wE8/kz
         mF0zEQrhF2nZcwZYx+69WYVWw6Yf5PFYL/h0K+iewwu91uwZV9vxbQCilfyoTCtWsDX8
         E6ZOQ2hEykJ0TUnNA0D9JsV6vWZypMXb/eD75CVT6voT3bameoAU28UHMNHbuxFmEKvE
         XWmA==
X-Forwarded-Encrypted: i=1; AL+hErFkhDUWGyjCWRXUZB7wX6YCWRsot3rwI0+DImPqMykUqeM3zNZRezCkOVj4IrdWh4ZJn7niv5uhpBI2aShRmiJUMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/GkhtsMsYocBrepatFHwcnmkrErcvyRxSsJtj0wuyXQSzntS3
	FFpXByF+BSs9+QocCTycOTc86wMrwdH9x6qIxRQvPxACDZldCM+Tqc2S
X-Gm-Gg: AZFdTZfnfRsyNGabWYjUShNR7+QETYQ6nxDoW0UoaW6wh3wiOJh/CWcHsZIsA9fZwh6
	YM/PrxXMilKWgHLbuHPv4FKkloF8rakQtby+acZu9ld23YQWVRzEfcOjdT4TBDOzyP+5iD/Za/X
	WOrORJNDhf22xXpATT82y5pUZCdBezhcAljRA75dgby6xwX8jA5ahm1FeXyGcWNFEpKlcdW5kY5
	P31EpcXFEN/r9OkY/OiSqCff5f8JzEz+HR+mpkUwTDHFP/rWdQiNBYMw27mhIUzXB7HxCaoqO0f
	evpFtwYZYAJ0MwijfErtBRzH2oxKOD///o9h4oVsXTmx1pMNczQOKcUFGA+Gd7JIX6DcQwRH9rF
	uIfcxFf8+OGcsubkyLHgZoIt6n7TVN86tECYidUBpK8ntShZB7FITEe1wOY4+xvZZz/VROLr9/y
	NQA3AVR9IlbhVvd0iYpMapl4NNVVwvGYQcyE0wJQayMuttz4W8+JiP3IllbN5jCOOaknsJOIUW4
	MMC2jxlnm27bZBcjNVyys4dYQVuC1bex5qlvXsG97x8QzLcFpZwYUK/Z/aeYs29i1KdWYIzzT+/
	MTmz0f6rI9if5n4k1P0Y89B5o6qT97SVTWybmc/9Ax9orBTQ6W334ATk/0ftSjKVOkeAcGZJIca
	aQd4HDe7u1pfkABJ/Pu6DmwoQ9Gch1nxpZQ==
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr217705195e9.27.1795425831349;
        Mon, 23 Nov 2026 01:23:51 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:51 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Mon, 23 Nov 2026 10:22:42 +0100
Message-ID: <20261123092244.1792040-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
phone.

The physical port is directly connected to an S2MU004 IC, but until we
have support for it, we can still use the USB device funtionality.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - None

 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 4b1961ca365b..5550b21e4113 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -59,6 +59,12 @@ power-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
 };
 
 &mmc_0 {
@@ -112,3 +118,17 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "peripheral"; /* Force to peripheral until we have Type-C working */
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.56.1

