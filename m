Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21424E4A4;
	Fri, 25 Apr 2025 13:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587683; cv=none; b=U+dtyd87TteYSGHYIAamMERGZ3kivpl3cBXVAx89VcEoZ9SIn4+Cx6HWuZKmMDgIIYP3ehGSNkEjMqlNceFMJ/MpzpjoPLJz02Uk8GASJsKuiVKoP+IREENjQiuT2aDOgoY+PB7Fwz/cAKeXD44GaSAKH/4E9WIm4WFP5vkZAkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587683; c=relaxed/simple;
	bh=1JKSmkNd9he2fxTMpjh+A2iImarLxUdnEFyEBZgWsoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgNZyPgkck63dOEUq/ZjAHq/UgmDs1geM2og2P+IlFMe3xyqRy4QiUwGuQnsG2bJi+OACQVKFg6BUqWU5noQ5FXAHyM8QA8yy/I1HURU6zpOwGJdN1z3z2/78zI097fVfgukMNHxCCTY59ShX+ZpnvYJHhyk+YO6Qb13Yxy69ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/z+HfDA; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/z+HfDA"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so2431087a91.1;
        Fri, 25 Apr 2025 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587681; x=1746192481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/rwz0LBVxX8dQciGKZqxZOjxzzbTePOJod0t/Mvhpo=;
        b=e/z+HfDAWcNYzWdjti5DbUjhw/9rpTGkxyIKbCICeO5yxDukrb9s04vvj8jThKtoSV
         qLDGHft0X97V0Wlw83vptdpjpSXm9hv7jAHDiaaP/kgblpRerJAhieUCxcflIwhMASEj
         5MwQb/w2GVoPW4gyxh3q+s1AyYjxS483DhLbaabrS85Lm0WsgllO/UqZEegQSrXAZkqt
         3QKLb+bVZhriFkV4sohm7OitggL5EpowSKnOj44MN4vZ3F7GqOgS2coSl/WJxXa/zsYU
         1ldNJzkLzbtiFIxlr43TxFvk469N2Q6Em1EjWQ3KsGy10N/KdHQOLPDrkttBwNCx+QXj
         yURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587681; x=1746192481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/rwz0LBVxX8dQciGKZqxZOjxzzbTePOJod0t/Mvhpo=;
        b=Bsuc/n6O+TjMp0dZJQSwGE2DAAXX4U7jSE5BTI8w64bkLEvcBZdFo2l6vggdpcDgqX
         iJPfm3qwFZN4CHvIP0pgTZMxRrvL0kfvmh23Jal/4kmcAT8nOnyOJJgc3fPYFkvVCbmT
         N2lvWyZY/DK5CTHcu9ME7KKjo0KIiZNiyJEfMlEnltbXNulOyR6Omzl2H2bfKopFZI5w
         Gviq6G0JDa1KrvHYmElIBNzX8UnTNG4pFq5DDqUG+XeBj2lOLEJSyPE5ae2v1bnTObIN
         mLyyX2yKSUoDID3oxaZX22exqXcdqw0w94xJbj/VxdtgEHK+y0aYMDeL4oShbe2410sd
         sB8g==
X-Forwarded-Encrypted: i=1; AJvYcCV+IGlcZ70jS+CidBd2nS5UB77smzSE7b82H9PYVGhAxg20SmmW4g6wqO/Vacts4lr1uPEyWY7e3feoNGUDCqxYKPA=@vger.kernel.org, AJvYcCVd5tzuc4k+ocUfy7WiOH+ShhD2VnxmkjFozOBGm1OYbwT5EmpOdluKd+fjVA2N2+6Ifa5XqEwEYle+@vger.kernel.org, AJvYcCWY/zDDvJYm7NM42ebKLZ6Ue3DPM1hwpl5oJKZwbxWLKiIMTVTrCbWDB0ljq2GmBjnmIT9cVT2Fk/Ku@vger.kernel.org, AJvYcCWnLwQe8pdbvdhdXw3reCg3Gg5dPaxnng6hChc+s7bWReL00GIkjbiKuRvtH3uMEwhkZk6BicE+S/A0uxQr@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQxvc6+/iUUpnJGYPlXGjR27W/8WPMcT2L1shjOlpMWiKeGug
	jfmn3tSRR5K/XfQbBkvgb0juPc5O+rmyaoMTWRLAJwyFennBk0yG
X-Gm-Gg: ASbGncs8ZPcDmelWE5HT0pM7DN+HA2Pl+LdImvfnyq6Ke0T9+cpVM98KiNB9QiTMaKb
	pjvjU6iS5ituRoGpHVbLfQW+KTqDQSUZk17Hu61Qj4xERhEkJz9y3m5vZWAEjUnEu0ohPfHqI76
	YAUW4CH45i2o/UmRnWRYTBlugSDxcN/SgSBi9vwbFmQcYTRr/G3YEvYtI0HktDWm/K3vnvv4l0e
	SNKj/Wnj7IoKlZEWCWm6LGyuKNTdBf5zs7x0e75SGBGkd4VWzjJApEGmde/oXhKoFltwDfINANR
	CIJUQ3+pkpt76KKsNuE7zXSq1nFM0oa38Tlwpmgm32LwuR7n+jZpDQ==
X-Google-Smtp-Source: AGHT+IGykUnFwi9vJFShvrAmDEHYOLtn/JAzsUWpn67Vgk7sIGoof9b7Af7D2CTZMEiJNgM6UmdfxA==
X-Received: by 2002:a17:90b:2b86:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-309f7ddfe5fmr3852489a91.11.1745587680841;
        Fri, 25 Apr 2025 06:28:00 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:00 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 02/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 Odroid
Date: Fri, 25 Apr 2025 18:56:22 +0530
Message-ID: <20250425132727.5160-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX77686A includes a crystal driver with an external load capacitance.
When enabled, the crystal driver starts in low power mode. The
LowJitterMode bit controls the crystal driver, allowing it to switch
between low power mode and low jitter mode (high power mode).
Setting the LowJitterMode bit to 1 activates low jitter mode on
three channels simultaneously. These three 32khz buffer outputs
(32KHAP, 32KHCP, P32KH) are independently enabled/disabled over I2C.

The 32khz_ap output is typically routed to the AP Processor, while the
32khz_cp and 32khz_pmic outputs are intended for BT, WLAN, BB,
or peripheral chipsets.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 93ddbd4b0a18..03943c666d11 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -289,6 +289,13 @@ max77686: pmic@9 {
 		reg = <0x09>;
 		#clock-cells = <1>;
 
+		max77686_osc: clocks {
+			compatible = "max77686-rtc";
+			#clock-cells = <1>;
+			clock-output-names = "32khz_ap",
+				"32khz_cp", "32khz_pmic";
+		};
+
 		voltage-regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "VDD_ALIVE_1.0V";
-- 
2.49.0

