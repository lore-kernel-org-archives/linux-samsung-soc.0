Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF242741C9
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756558872; cv=none; b=tlhIK9CgM5GkRT3bH2EQXiwLT+FSM293fMi7xKVmJ1tpN63QAvv8cR7ubD+QZCaC0R1zHDJLhAtGmRT/BQdN5p4mtQnxMixwwUnQAO4M5xUz/xUOzPX5b5LVzmMdAbNpR6dVb/yP06mMgSU9pCVFCfAMH9oOkD/iThP05Wh15GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756558872; c=relaxed/simple;
	bh=x5aMDALxgOI1H+xD/vQpZoAkDT2ZtplDl945kHfXUoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8FRW/vTFS95Gxp+Sw3Kd2nawphL+FQj93AJzoR/arHAXxcRoUd2ERXa1oOBXN/m8cFh07zBQwe0LIuaiy2aVFm1/200FfSxpKt+keMYfi9UaJJJ+QX/qvwXsoFqlrd+P15mQ4sPwAuS8PmUVy9JPvirPvinj+ueJfr74nRiUJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yx4he7hg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yx4he7hg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c7b4f4be98so204548f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756558869; x=1757163669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lgnqVvxFY08GIwRgazphEg7+3QXDYUBxtqlK2TdQQ8=;
        b=yx4he7hg5JKejpDnSiAgd85F59/lrJ4d04WXRgF1oe7wav9JtLaxXlle14jftlN8Tr
         909u1e+WXUBDTfmnz2Rc1v5rxS3clMzp9w8VktTi4/3KTf3/5G7Mze7/1k+G4UIdplE2
         kWvek0Pir1E96W8b+mq9Yul5AU5+NiN9gmZrqU4/EiPNBvm5gHAUV9YOYcPwqawCsfLU
         nTS6+ffJ217CC534AfjS+c1+JJS89FY3HMpUpESnjk79t7YbB3CdKvVxijRe2U6P56bs
         A4CfVAZQS1A/2Fsczy5XCKW/pXmmdpV6GRqWhutipncfME+jbGaAX6DLUtoveNERwxoj
         jOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756558869; x=1757163669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lgnqVvxFY08GIwRgazphEg7+3QXDYUBxtqlK2TdQQ8=;
        b=UxvvfafM22s8T5+EUej27Bn51Xu2Ug4kHwXP9hAIEoRHQXVgf0JzYS0i/dJuoayj72
         xln8h0XYMnNaddWOYgqx62vaxmVJ/5xNOIzeV/eu6z1CZW7Hmb3JpOYXEMHtBpH7+w/D
         eLQa7bonad6/iEpN12iwDdjyQAgXFlZYiak3q+UVrAEHUuLTJ3DGtxxXjYuEj+JsZA/z
         b2ZD9ob6NfFdW8poOA977OHF4WWEzVpl6SYu2KH5eXmaj1eezHOQ+iWywOvMnN0FhKv/
         kwS3co8HTiNbwtPds85HgbXeMefTThjXKpbMBvc3vRoWEaqbloy3vhd3MwQ88Eb6iuJd
         z2vw==
X-Forwarded-Encrypted: i=1; AJvYcCXBcCqWgl2TK7inyyWPsQXtKf2xybk9ouN6t87O+I8xD0I7UIa03mVDCQ5HNhfhqZUC0FbPPEOgf5vZa94jpiAdRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAu8fLctaP1MnEsh8QwfyXyfSgisEntGGzvi0ImQd9GQ8nMwfY
	F3v9DlGs6LxACV+ExooBLC2ikj+7iuxdqtmkpxG6CopDfXQbyDv2ToGIPtizcV23GrE=
X-Gm-Gg: ASbGncsPPmFTLIDoUbZ5yKMJMy50JEqb+Hc4wHgieLJyZrjPWtnlWGIgtX2Le0p5gBa
	b7ePBM92PZjoEvVvtgCteK+ExuJfKnRSwb1qoBDmSnpbTyniKgIiACGFLCXCW5mZrI8ssB6RNvS
	szKazDwX3yKX/tZDiQ3zu8groaHLjhYLXlgMGI03cdWbbtqwsRPAnA6xlEzgaWyV+d9OJDg7fDl
	7+dhC8GfVAuCs6oSovLYx+KRAMg76SUfIgadNlg0nLYiGGcG2nkrq0hp3Ywu5+Qz2dyjxAgmzjy
	xfcS6LXOxGrFJbGcr7TP1Ypghd76D8fYEz/EFiD0BNHXJx/MAZjQqD8Zo1Nzi2OT5ejqjl7QUuc
	LrDMdaacrS1Zyq3RPnHJA+6Tua91P/HgFYtKINpLF+V50
X-Google-Smtp-Source: AGHT+IHQ4DW0XyUDaB3fbWwROqp7gBrugB5J2s56UPJs5B0GsbXF2q2Or8Czb0QcdVqITphsFKBwug==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr20236775e9.0.1756558868189;
        Sat, 30 Aug 2025 06:01:08 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e74b72esm80211125e9.0.2025.08.30.06.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:01:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: usb: s3c2410-usb: Drop entirely S3C2410
Date: Sat, 30 Aug 2025 15:01:03 +0200
Message-ID: <20250830130101.142934-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
References: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=x5aMDALxgOI1H+xD/vQpZoAkDT2ZtplDl945kHfXUoA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosvYOCRo3slczvzWNNs3J9n9kGWOjXZfTcdttO
 hFhXAnXOzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLL2DgAKCRDBN2bmhouD
 19gOD/99eTNOuqRJwZe9iS6GIhCcEqgdSGbZS3U64+s0yQv5H2LUP2ITmr75wgmS7TNSn9C2Yul
 OzJyYDvmx7TJlABGo2Xtt5zFPvji0hNI6uY+E8EEpjiSuRzI6XpYkggkPMAF9ROCu2tpwFI5jeJ
 4bCG6RFu0wz18mYfYEQsGs4W4bulmhXNxcXT6YDqTL21AJcGsdAYZEyRu7TrX06bOeoros78mN4
 TsRc0FcJUlfvCVJO9IhPd0VxKyBP02Q/H3fC0ttURdcTo62IPTuoR+tnYNqUN8HzuvNeYbRCjuL
 bcbKCpGjDSRE5Bji4rSE/HqdR3CaE98Yr8h7d6o5lQ9GrVicM3u/7J7UbColzvKVYfuC5zdZtE5
 eajbzgJXg7dcW2WazI85qy77ajmeY/lzZHHbo73LqcvyRW0DRSfrgpdztEB0+OTyv3NiG4sx6zk
 DdkRridi38Nwv8Nl5LVkXTvRvND7COC5cyEDsSKfaGMAapS+zUjVzbYNDbuQjNkBfVeFkDddoGV
 vG9nvK+fPFWHLNhI0DVtvrm97bSCMHw4gUZ9+xVAF2/4ZGOzXVD9cMMvrGbLX9A8To3Fd6YyRRV
 nnLkgr2mgS2ouRXSSH9dBfUpfUrZ35RIrSjCYNWU0Nb3lY1t6cEN1fN8w2NeLo6tyOtQpcGeWq1 ZZt+hW4MoUpIPVQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/s3c2410-usb.txt   | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
deleted file mode 100644
index 26c85afd0b53..000000000000
--- a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Samsung S3C2410 and compatible SoC USB controller
-
-OHCI
-
-Required properties:
- - compatible: should be "samsung,s3c2410-ohci" for USB host controller
- - reg: address and length of the controller memory mapped region
- - interrupts: interrupt number for the USB OHCI controller
- - clocks: Should reference the bus and host clocks
- - clock-names: Should contain two strings
-		"usb-bus-host" for the USB bus clock
-		"usb-host" for the USB host clock
-
-Example:
-
-usb0: ohci@49000000 {
-	compatible = "samsung,s3c2410-ohci";
-	reg = <0x49000000 0x100>;
-	interrupts = <0 0 26 3>;
-	clocks = <&clocks UCLK>, <&clocks HCLK_USBH>;
-	clock-names = "usb-bus-host", "usb-host";
-};
-- 
2.48.1

