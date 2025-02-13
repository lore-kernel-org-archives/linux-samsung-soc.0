Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F90D1C32;
	Thu, 13 Feb 2025 00:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739404996; cv=none; b=gtWj8wacI4cUzZmA3xwiK1d+r1StmVxPoXWlUZAqrBpwzOFDbpH89VMiN0sze8s0mg3VzRWwCkdQZ5OBt/a3Ej+SLMatKAEnsWGE8UvKotGL685DopY8bueBsxO/X5qfc/lE2wyrGLjNwZD918NNq7PXtaRCvXlSST/KyLyNeNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739404996; c=relaxed/simple;
	bh=nzfWYzJlyuRlm5J2Rlgp13zIeb+QFhxyooqdwa5e8k4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cGsH0+lLVCfx1pOYAZztzIyg43RRqX1NnqI5lz4ZGOUJOn9ixsFU7+ueHIT+oRBABJ5lg1Ed/gLHQ8/lje4SvSGrrIwusm0XVIyicqCevN8wtdEN0gyykzURbfEuB+Ejr/ANTkjEY/3xHP4wIqCMIA321BHkbt2/KTJ3mdVi8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRVhe6Xw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRVhe6Xw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f818a980cso3308565ad.3;
        Wed, 12 Feb 2025 16:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739404994; x=1740009794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgGYLAXMTiBSQm8B4s04dx6tu5EKRE0LsYmfPrbRJeM=;
        b=iRVhe6XwiO1nHnLTqiAFFeR74o3Mlna4xvRr04kwhbW9SdXU+p50eMtxIXR6KYybP9
         hvCNtRtbDcOyzy0e2z7DYBISqLkEpzaL8s9UKwiK7jZsFhnY5ee4ICwMKVT1OkqmJtD6
         WdE5L83TvvkJQ+Q4aq+lXmjQ0pPXcleCUQGFJRtBpbyX8Dw53a9xtBa1yWxR/eBsdLPJ
         Hby1384ylxsZx8QaF8lC3cd21skA027VOZCZrNcZ2lUqR4gYn2lravC5RoVApNPUTbW5
         WwyvMPrRCeO4AhidKGcX/GBIX1DyN48nBX1E/ElqnopKU/oMIy1xCNl1WYdc5xZ98L/J
         GwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739404994; x=1740009794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgGYLAXMTiBSQm8B4s04dx6tu5EKRE0LsYmfPrbRJeM=;
        b=oK+35KqtQBE4bCNy8+ewmQ/wxpAjvWrw/YeSGVBlzsseeCb+etI11IEtNF2vvBAzyc
         3g0sC0kQrD39xofIA/fB2QztHM7Zgu1oOKWLSArWwAzyP+qOjfCwP3Few3AbLDPqpzgq
         FjbzTNwB8RuWO/AwZB5izepPHnSYJU6qjrphR/nSVSUBGbOx/PHSKhRC7wCRqFhUyKIy
         uMVBrx6jG+9VN7rPRRfY0U3Nj1tncof1VKMsVKalVkYU4B7PzVIwfkO0MpZKI9izYyrA
         VvMdlDnW4QKrQDFdvZoZrrUJgLnPrjrNcuAuUcsZnVdhTQ7HsmJ2YlpGvunTS5f/zESO
         yGLA==
X-Forwarded-Encrypted: i=1; AJvYcCVJYeEcWCdiEHer+WW4pQt5ugxHUG6RPz4vkwI44etNYe5Qjl3e+rFFNVlknRa9U+Uw9TskXNHu5z2e@vger.kernel.org, AJvYcCWdfUzF28FQiE37Q9rtFNN/2xcMRrPYtwRnWw/2G/f8Z0E+a0G/gpUo3sLp9/AoNE9AN3lk1gyIyCYtJPKoSFGmgak=@vger.kernel.org, AJvYcCWhcHuW43BkWCOhe23R4mD4SIaJym6lVfLG8Y9MVPZ54T1WvTL+oEWBtuC/AWbWGKhT4FnKNntFpcTuzwou@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/ltfBNATwcE7l1gvJCybqVGQzyhpW5RGqGmJiDOViTgSck2C
	yH2qE/c1UqMDZZcbm+xgNap8FGNJdSTQ3JW0S3pjxuzBCwZXFwbD
X-Gm-Gg: ASbGncsYu3Hc59xiS+rlxOWpAR4hwBw7kpxgEvJJ//M86S6Qr8x8/ZvPCKudfLjkpYQ
	RXXvOtV/EhKy2YOTDjarhPq486v+Yv1yr/SgleIwk9ranEgPMZwhP0+cgBvm5qr6jSHeonZxI2Z
	1wzXteYrDLuz5zAaf9LaJjMh3xKxLfHycH+DBX/6o9NInwm5NVqMgpwsEUionddky0iAyO9yp2G
	xJTRdNDkK8puverMxdcHl8KDIGzpUIPavCgey6YRtUlbTEXoMVlx5L91khKio9XRkjYKZbFvG4f
	C17oKhI8KUQP/kZCUBxjV/wMZC/2GcmcoIfOxeGZP88Wtcg/15IVYKNaLn0bJcEMvxtEKUeblVe
	uwg==
X-Google-Smtp-Source: AGHT+IF+D2Xb6/P+MeaJ+t2rpv7ibEkX8ds1s2CaO1BKsO9476v6xLKYDYjvadIojErLW8nWiv0E0w==
X-Received: by 2002:a05:6a21:3382:b0:1db:915b:ab11 with SMTP id adf61e73a8af0-1ee5c796586mr9410564637.24.1739404964623;
        Wed, 12 Feb 2025 16:02:44 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e4a0sm28014b3a.120.2025.02.12.16.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:02:44 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1] arm64: dts: exynos: r8s: enable UART interfaces and aliases
Date: Thu, 13 Feb 2025 00:02:26 +0000
Message-Id: <20250213000226.277-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - usi_uart: Main UART interface, required for debugging or
   communication.
 - usi_bt_uart: UART interface for Bluetooth connectivity.
 - Added serial0 and serial1 aliases for standard UART access.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
index 6bae3c0ec..049b40af2 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
@@ -18,6 +18,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		serial0 = &serial_0;
+		serial1 = &serial_1;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -113,3 +118,21 @@ key_volup: key-volup-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
+
+&usi_uart {
+	samsung,clkreq-on; /* needed for UART mode */
+	status = "okay";
+};
+
+&serial_0 {
+	status = "okay";
+};
+
+&usi_bt_uart {
+	samsung,clkreq-on; /* needed for UART mode */
+	status = "okay";
+};
+
+&serial_1 {
+	status = "okay";
+};
-- 
2.48.1

