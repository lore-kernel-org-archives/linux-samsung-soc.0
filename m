Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287701C84A6;
	Sat, 15 Feb 2025 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622902; cv=none; b=i9hlkT3VRzV/kftaG/evZPwUC8a9XYS+iNKCfQQoUSwV/wWGbQhdSckVM/edTt6R7Yd/dG66CcY5ONWCLtSJZmUOY0f/xwIB/B5o77Rch3dglRgKd7BqaiDNFTxSvLomS79AllY7fX9VINV9zJp9se1A39Cme/uQRU2Nx3ovTKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622902; c=relaxed/simple;
	bh=fsIAln6LasRy6hqxIzQCYZsCWKlZPe10E7mC0/2mdgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPMrPwNJEeByHgwmPwvxILT3yV6wUorQ3X/BHV/lQ3mOw3z3ra6srqaKYmQiYcHVDEmk2myxoG25LFtEDfxr/XBoyghl42K3XqsQx8IAGeyeUMiZ3fWQK4nj9GqNUxYoR6kn7THMHDFj4vKVwjgBmlR+J3NafygojAoBdA3ki4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp8p62lC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp8p62lC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso32401205e9.1;
        Sat, 15 Feb 2025 04:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739622899; x=1740227699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phIRsO6XqHmxqB6De8SrY40EqRx+FKKQPhr8nHe0VsA=;
        b=Lp8p62lC9K7723akznKiW+oOHgJvQdiyFxQucKOXvybfGhY1Nde5QEzWLoq3qVuZV1
         7gyxLPKxLqV7JbroOaBIEzrOAM/uRQFyESx1ZmudRMjm8iV77UtjeIum9u/de5uE19qR
         LJKPwFeYZVyhyUcRaZolQYV3aBvnTtbATTiVXG9kXL9395SLf9kcQ5uwMa3c7mdEhTfG
         m2rBQtGSSysY3WFvTsBCR8jTI3g8PXwLV+IlZnjPCXdYg1mGzVW8xQG50Gq+koSoA/A2
         BB1Q7GIOocNu0LoA04CYuhW051ZmxIjVSNDkUsMhCDvqSLXUMRmr2GXTMKxqy/9l8mbR
         9wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739622899; x=1740227699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phIRsO6XqHmxqB6De8SrY40EqRx+FKKQPhr8nHe0VsA=;
        b=U6RIdE3NaGmCuG6Qpim3DEJ79vWiXHA8r/HbhPyd5p1oNfryzM1O91PvIcXvT4z0+F
         YL33bIgfbudZ8SGSc2EUK0TPYxmiomYxk3axUv8Cs/Wr7CBETP1s0KBRANMI2tCRIPTT
         7QZ6G8VJIuZwZRm8nby6nvT2z0y3lITlDZX1piDHnF4hrDLyv09GrbPWZcnwUFvNkfXd
         MvRnAxoQ0U0iuk9cScEEwxhxpYJ65w3as3fb9xXLcbbAdRLdwiZoKbNefxl2E8cxMwtX
         Nj3h++g2Xu+lyASmph0ghl1+GRQ2pS3CPBUC1x0b47x94TKn1lICfZn/Z6tBzEGNPOrC
         rwVw==
X-Forwarded-Encrypted: i=1; AJvYcCW3ef+Y9Lf8PIuRCntKdeEmAQ+11WRiUZdIGvJhVoRWHbLyAFA2LMLOwMVUbjLItb22KaK60qpctKgiByMglvvYTjg=@vger.kernel.org, AJvYcCWg/stKzSA4/R7kybifpEuTBKlX2VMnmJKoabOe56j1SIUGB5SRyNVIYXFmP9FLSpp1iEOf98N10HFe@vger.kernel.org, AJvYcCX8u9Sgr7koJq7FjM477A/frMB4N9nebRZHnhRiGw1s2S/wynntOPjbEZOXg5OYJsz53IOMjC9TusdUUH3/@vger.kernel.org
X-Gm-Message-State: AOJu0YxghzhCfSmaczNC8Ncwq+ctKi+hxSFkcoy/8m+3tHlrHSlx5jhE
	Jcshz0kBF+LWJqWBgaV6c2J3RVOcKikoKjJxZiqXy6yLGqqpyt8b
X-Gm-Gg: ASbGnctCH1AYVhstIOJQMJqDskpwWpCjUBdd9zCIW5R3cT8UNNq8EfNnfxbxbhglgjN
	SjnYITc0PYrndNA7e0SoKmIavMjs8+v6hKeI7s0FkifprjjqxDKBpmkaUAx9Pm6vmPP/GXquRk1
	lw916hsCFlz+RswoqY8sEDx9JUhdf8MF8QgXIxcNMWnGtH4kv8N6KSZHUdt2WUMhGKUL6W0uXW1
	Gqojg5oqXO7LtMIhOAbsTz+t0Fs7DhLoG9e+NHLHwNt4XVfMck1BduR7IaL8Jj5rJJKKVfo7T8A
	1nbwYY5BwfjgM0Q+fCr8xoVR79IAz5++w00p/D3Nzx+9B8AvGgR4OSFYJdEWAPt+QZA=
X-Google-Smtp-Source: AGHT+IGSb0XPuCNo95g3E2dUCou2RLzKhqML/59MR9mGZKeN7VlnjsSXdwvSBFqgChgUtO9nZ6LgGA==
X-Received: by 2002:a05:600c:510e:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-4396e6c4f57mr36871275e9.13.1739622899390;
        Sat, 15 Feb 2025 04:34:59 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439615e543asm70846685e9.0.2025.02.15.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 04:34:58 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Sat, 15 Feb 2025 14:34:53 +0200
Message-ID: <20250215123453.163434-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Exynos2200 compatible string and associated driver data. This SoC
requires a Link interface AXI clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae..aa22265c7 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -145,6 +145,12 @@ static void dwc3_exynos_remove(struct platform_device *pdev)
 	regulator_disable(exynos->vdd10);
 }
 
+static const struct dwc3_exynos_driverdata exynos2200_drvdata = {
+	.clk_names = { "link_aclk" },
+	.num_clks = 1,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
 	.clk_names = { "usbdrd30" },
 	.num_clks = 1,
@@ -177,6 +183,9 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
+		.compatible = "samsung,exynos2200-dwusb3",
+		.data = &exynos2200_drvdata,
+	}, {
 		.compatible = "samsung,exynos5250-dwusb3",
 		.data = &exynos5250_drvdata,
 	}, {
-- 
2.43.0

