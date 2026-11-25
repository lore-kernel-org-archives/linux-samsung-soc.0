Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618570;
	b=H/XmB50jeZxKAlem6xmlar/qiFzf5ZgtitYIpl8jIavxmuglfcP031nWMjhn+YvjBDpo
	 9tVa3mxDblWFlwAYNE1hrrGkMRJZZHkLZtHlB0xQx4U6o1/3QMp3Ob2sYApffDPke4HQu
	 WcJKAI56OTQ3aCqmhnmu1054Permt0aY6+t06WB0gRWxRi03Jg0OIHySd55mZELyFxTlQ
	 eXnkoGAp6VBgcs13bgMajwyPIDvfCi0CNhMdMgBy0SMa31Xh/4yY5tEm2wIZqF6g6MGXk
	 WGhTU/Yt+WHFYwIqu4F770pDaxZq73VtoZMv0uPKfYieJuPuIQExQrHfgZEg0iSiEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
	b=aQJfdgyJINpSxa+Er7lm9Bn0vC+2b+KFynSeQiNluz5se7uXUR1UFvO0a21GmuzUlkuM
	 19mRZ+jN4JhbanhxGjGNH4ktXGHgYnVUCrtOjfCY69XwOXvnLyTlNISh2FrTadGQelhJI
	 y29PXFxBnpc7Vn1VmgjsphekVKDtL2xB9SZOzNPV7JsjJwQqeejdr1ptDxp/QKvMpOE6W
	 1z23lRm1ZIlAWsWUqQHd/yfWKUiPCAAhw/jzVkvF61CZ+5vj8GbGf5LEeF6NnWNP2mCa6
	 mJN4NmSy2kti1fRsqFeOIG8p4h74P468iAt7ZAwsuuMy8vnS4Y1ASTN/cd1/CLlvnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyBp6Zzy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A5606A333
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8A5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyBp6Zzy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso43317775e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618569; x=1796223369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
        b=NyBp6ZzybTgL5anA7PEentaRAANmzFTfxfpbAfB09gjk5clY6CenD3BlfincLQEiOf
         3+7Udtjkd1LcHafzRTG0PPSuUmZqH92mByg2bepvLe/4Qhsz+DMX83b2Y9NVGOG0g7ts
         t1qCFom9nM2irCvkukudEu9KaU8s7Jd8uuBwQwLpIh9bY8DN/dFXqxNF6XzA3ja7Usb3
         6hFg3N9Tog1NWZAb+iQ8ZpOY1qe/Y7BB8tFgc0jmswKSAefPw8gOFTl8cqVmIY853W3X
         rtt4ArDelubu9wxmlmA8q5jyBeP2wI/FFUgKM0aZ77nnifctX9fU/K0ZLZQ4YmoBmehm
         0xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618569; x=1796223369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9CHeC/4bOqmyR3r1N2caZAZe+JipBH+Y+dP5eqPLe8=;
        b=PlABHkArWXfjkmxiPC0YdB/czyI0fLSsNUy4KwTIREvr9B7oXbZaP5l2LCLibjieIR
         p4hwqPhTqpQWBwTlAREBS0vo3KtuxXtK2ULqm27h3hg6RBSHCNYhf5K68oMxDY7umF2E
         K2VZ3TEHNm9N0A6kxUVd30medJpizhSjC+816rt0tQbONK0DcG4cADtEACejW4eG5JEG
         b/sLWhuu5Y+KIcd2XF/OyWaK9PQIjq2f1Eezzfdg79luHyPyB0vbRwdqG5PGtx7jbhS4
         VeFxRXcZdtG7f7bJG3kvjx3e/tT453CJm97i5BN//3cWbnHoeJpGJMiJwZDzZQ/aGOYJ
         Haiw==
X-Forwarded-Encrypted: i=1; AL+hErFdsY+nLH9/sIqm+6VBBMC3omybz64cPYeGwTDvJXf5Rn/mEgGceiGvRsE7pW/FV20KUi8+4lKIjQTJ6HGe4xxeLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z80v0daJ96aG7AZIObYYxloJaaaDUbdtX3Vls0Kv02NkcB3K1AB
	ZMQlkybIBG4nVjB79SM8CbxePzfD4tH1z1yJnccRsweNvuPIOPjSQHa+DWjHzIXprFaLRQ==
X-Gm-Gg: AZFdTZc5o9WndkCPL3OvkbQqGlPEgDvqtZyEA1LfCluZtHyRQ8opJmO6Q2Dqg9NMhXG
	BmgPJLX64cVlf18e+c+L56uDhXJIPnpQ7z5XzojolAkaaQjYRzxEwhzRogpPOESiBVNGHq4bZoP
	Ezz9907+nbs48TaGJjPpX7q8Ezk3F1CXZl/nm7Y61msjkzeADe2C9BbTefWV/CIzt2BQrDdArpJ
	2Gqu4+QFKmM79vEn+aaJgmR1XZ8hW2LfPiLz5GWTRuZsZ98usgsd5fOH66hfqhwq0/ERQZgS7D6
	QpzkhL5psRORKgzaK2y2NrGfsyWvf49dpsPPjUh5sVwlb3lrta8LjBRtPT+e4QuwbU1VT3E0VF2
	v04qTxtnjocI7fwjF2pmN99jrfhKhCSvhfpIhodyLoYQXkR9g+r5WImHPRc4Y1+GFQL1EdUTRAV
	y1acf6Rl53LFfm81IJKIkHEkutHZn2p2oeET3/yIrciW9eT71dGv0qoiLftEggoRZWMoWQ1/isK
	k9nyr285fG5tB3wOIdR9I8NQIvl3gdL163ZS7ZvGheYlXc9xNcAAeMTnzzg1PdZgNvVUr9hRwzp
	ZXhMowkvN+BiCRHRgclDIJfnOyecbjauz/VldAee2OG3Kre2wMYPHeysnhkOvyqnvtALl2o+xE6
	I3ZhPjvZRNBk6ukxq9aUOzMHU/keUoFME40A=
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr362757815e9.26.1795618568725;
        Wed, 25 Nov 2026 06:56:08 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:08 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/5] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Wed, 25 Nov 2026 15:54:56 +0100
Message-ID: <20261125145458.2594179-6-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

Changes in v3:
 - Move status = "okay"; to the bottom of the usbdrd node to statisfy
   dt-check-style checks.
 - Move maximum-speed property to device dts.

 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 4b1961ca365b..f93996e7321c 100644
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
@@ -112,3 +118,25 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	/*
+	 * SoC in theory supports SS but no known device (including this one)
+	 * has it wired up.
+	 */
+	maximum-speed = "high-speed";
+
+	/* Force to peripheral until we have Type-C working */
+	dr_mode = "peripheral";
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.56.1

