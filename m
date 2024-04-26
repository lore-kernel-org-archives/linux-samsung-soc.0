Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFEC1487D9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138718; cv=none; b=Jv7rsu11lhkkWyMuQYtunTfAfzvqsLdclRts8uam2qnl3OsPJ3r/h+bhWjfdVjKQrV5SbULGkNoG7njDjiN6R4pYjqw2aMJfQ5LjGDCSc5LyIVebaxYj5J4ouy9DO3UiunOF0TRxPxzmH+cEdE28YpgBZNBbfPy0o8Gfk/d5Fjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138718; c=relaxed/simple;
	bh=ZmIYYUt0QcbC0Veeq4Fmo5dE3JV8iq7sEVsLahwG0es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGvh3e2PiToav5Tg3sqqvyfCFzUwaq9BiTf/PrZpZaPS2akk5SpO0E1uLWBpYxO63Rtcb7omf5mY0b4uvJNUyfF8uMge4Ll9xHevMEaYOmLqeeUods6bsDU8XAqW76DMiIEGe34Ggnp/ul3fw16RRpcIekaLfGYstvZ+OIHlyx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D6K88qWU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D6K88qWU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41b5e74fa83so11573915e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 06:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714138715; x=1714743515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX1t+YE1cBl5MQLmH5bPrWGcz0Ebchp9QnAASzx5oG4=;
        b=D6K88qWUQqxBT2SQHLvY7BaEfoHioMxCa4hmYyR56N+mKgP0idkJZR72KjxG3YpymT
         3rO5cr3GOyJTdtbyD8b9A//Wg+646WPKM/de4/c0ggLPHpfYnIA5I5P/fDaSnanwTwwz
         0sxVZBcJnNTzYP48NAGXwfPHUsAkQmSiDGnQboqPzQ3bI/LUf843eyekZebmbxmQIFcy
         yMceTfxB/bxk9ftkVyeZiUoKei58uSWsekZVJhWBWknDS+bNgdWLx+pczrnGXmoGJY6R
         qunCMF+mNRDoHe+i1fChVZYKhY3c7FXfgCVay8Pr2NO6cYqbJfFQ2i3yu6Tv1/CJBxXA
         WpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138715; x=1714743515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX1t+YE1cBl5MQLmH5bPrWGcz0Ebchp9QnAASzx5oG4=;
        b=NZcG+9yAg8OSXcD+SV+7SqVhCjbAKDPJR1AoqMb7b9J99eJbU8lPD+eMCLAVHj6Da1
         MH3MbqQnAKifbe0UzWOFww6rBLuUhKCUlfr3pAU2ZLaFHwYZ55Own+z0T1p1ytGV5+wd
         nNZu9EQ1oCLItf++ITQvR6SW0p/rMgdJHG1go3u97vlyUm/JdW92UWbBobLSCvzZ+rf3
         toMEeWq/ICDTdD/zJuWpIPauDkLSnzd+ujB1iEVWuGcndha+ugksuTnKVmfc/zjV+nkp
         YEXSOAtu++gKRyguRaNn38Cb5Ex+6ufQgPps66qw8xDZXgvEk9W4+Lj3fIaPHZ+eO9TM
         r0ag==
X-Forwarded-Encrypted: i=1; AJvYcCV7WMfIOuIfME5EmC1h5MINH/W9XC5IBr57cyCJIUeOLKhNq4fXTnPlVvl8m80tsKlx2C1PRcyltTkzZ1sHHsTVvApnsLrCKFduZLwYuhPQ380=
X-Gm-Message-State: AOJu0Yx9WsBC6DCIORuZmnPLlHHxWLn5BF2vjifCTkxrv6CocvEJRWAl
	WkjmVa8btqNdJUqRjUJotxpG/KeRUjLg7XuJNf6R3Emu3Z3tyGV24HS0R2SpVOI=
X-Google-Smtp-Source: AGHT+IFTTh4iakkkfqbFYU7oLhsNchB50w3aO7hEduSjteZTlE4Y7Y4KaHOlWbEsAZDxFgk08i6IsQ==
X-Received: by 2002:adf:fcd2:0:b0:343:7fa6:4393 with SMTP id f18-20020adffcd2000000b003437fa64393mr1870301wrs.38.1714138715070;
        Fri, 26 Apr 2024 06:38:35 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:63cc:9bae:f542:50e4])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm22327689wru.36.2024.04.26.06.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:38:34 -0700 (PDT)
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
Subject: [PATCH v3 4/4] arm64: dts: exynos: gs101: enable ufs, phy on oriole & define ufs regulator
Date: Fri, 26 Apr 2024 14:38:24 +0100
Message-ID: <20240426133824.2283144-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240426133824.2283144-1-peter.griffin@linaro.org>
References: <20240426133824.2283144-1-peter.griffin@linaro.org>
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

