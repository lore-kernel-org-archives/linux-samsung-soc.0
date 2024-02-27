Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C256762
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Feb 2024 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709021292; cv=none; b=fxgbPFUBBs0k7/0TYPn2wtyyVdbP0+NjMOG/A79WS3LF43DIJQ3ofTVKe0lzFF2V3FG4PWdWt3kVk3Qd98hQeLFBQHPZ5wTlZSTyHhMIh7w3k06wLlK+TlPXsprSlrweSHJPkyHJ7F1orP1PtbtWMzbljwYeZsZrmhH31kpSfn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709021292; c=relaxed/simple;
	bh=whJn6oRUulaQwJ9k8svjSJYyaK1DlOk/EVrP8cPTcEs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oy4CsYncv9VyETHZdy+I38ADAlVv49zQzLvGCxSQNj/Nl1nVvHRrKKczyyhleMSzYkukT+PSI3gdw3ASgyTFY1M6N21lxPOMivZuZt9nD/ZHnK1ImVDVfB6ZyINH6HOpMstTBm0TXjwuy1NeIv0vFGVDsNkP0uxbvRzLid52ojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4Pt4hfE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4Pt4hfE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso5113663a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Feb 2024 00:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709021289; x=1709626089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiVrva5DwInjSui+Br+HHATpx+xvm6PVi1TQNYfveV8=;
        b=j4Pt4hfEmEZyvRdEZWV4F2+aTOi9CrKhoSmM3KJ6+z7bkljwfLsIq9/ELeKJ67A9Kj
         LzMsZcUtNKs2pRrWOkYa81ww4DD4a81AfkOj5lg9LaGijvDj+elKr9ydFT2q2ClpUZ08
         xtUeqOY4fFXWhC7u/8upPw4AzRzpod6cUpKRmYfeyAsJzyYBpGqZFgTUthAm0LZnzLIj
         5pTlq3VDRUU/ygncc4PTuaTcR4nYjtB1jt+hnfZUZCGZKXQzJYS9kMSW9KaxcBFHwxJw
         IZxdM87sL9M5gPCV+kVUaFpGG9zOzWf0LyfJrTATP+L4SBgQUXffSIAFBrz6g/N9lOAZ
         nCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709021289; x=1709626089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiVrva5DwInjSui+Br+HHATpx+xvm6PVi1TQNYfveV8=;
        b=I0JuV3NO0wGhZ2YEoPEUr7ygvKnyng8EQ72tahsbE51tmm8JTjAHA9AcmIGg1grEuf
         2kzZpjw9raYMPKEF4C3jNRt5246UQ8lb5KfRbFTjHtr+bsimiMl4wUL0wFHdSFLfcuVP
         MhGWXdN2Ij7dh1ZN8vxyaOnKZHoglv6rrv86yCcVWg0FqMo/4r9yCbT0f18snq8MLE5I
         ecGftHKh/wTLApiRIqTQitPDYY9XpP4Z1rOLerkt/BvJpPTuKg+kDSEGvNpz9f0RigzI
         geHNorD2nzCFhJK5AbWyT14S31gZQ2mvO4IM73hF3RA5j/BsiPkQBI8nn7FbyTPSiqyf
         HPVg==
X-Forwarded-Encrypted: i=1; AJvYcCWliPBSv6T+iFHC8k1oX75mBG5AH8BvwE3/XLvdPVoCurSeYT2vK3IpBtrtvdS0/jST/01KcOdnxb/E4dhStEogPvHw+Vj1r8BQJRTQY6J+tvo=
X-Gm-Message-State: AOJu0Ywmw4yg8Mj7IsiaBXSMivWwXV+5aImECxPEmEjf8FYl4CB10TDZ
	c4Y9Ho5ZTS5IlrK2VW4mgsQNZRtfLkBOr+K4ChQRQMLAoyMcLU5BQgqKM3C6OOA=
X-Google-Smtp-Source: AGHT+IEWM6Nm8SPJY4tlU/DHnXZcjC6HFHDjix8q780UPHj1OCYUYpjhUE82VyM26QICREgDnkRfTQ==
X-Received: by 2002:aa7:d349:0:b0:565:c34f:df4e with SMTP id m9-20020aa7d349000000b00565c34fdf4emr4938085edr.29.1709021289206;
        Tue, 27 Feb 2024 00:08:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7dc16000000b00564d7d23919sm509662edu.67.2024.02.27.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 00:08:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Artur Weber <aweber.kernel@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH PULL v6.9 3/3] ARM: dts: samsung: exynos4412: decrease memory to account for unusable region
Date: Tue, 27 Feb 2024 09:07:55 +0100
Message-Id: <20240227080755.34170-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
References: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Artur Weber <aweber.kernel@gmail.com>

The last 4 MiB of RAM on those devices is likely used by trustzone
firmware, and is unusable under Linux. Change the device tree memory
node accordingly.

The proprietary bootloader (S-BOOT) passes these memory ranges through
ATAG_MEM; this change allows us to have the correct memory ranges
without relying on ATAG_MEM.

Tested-by: Henrik Grimler <henrik@grimler.se> # i9300, i9305
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
Link: https://lore.kernel.org/r/20240217-exynos4-memsize-fix-v1-1-7858e9c5f844@gmail.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos4412-i9300.dts   | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-i9305.dts   | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-n710x.dts   | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-i9300.dts b/arch/arm/boot/dts/samsung/exynos4412-i9300.dts
index 61aca5798f38..b79d456e976d 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-i9300.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-i9300.dts
@@ -18,7 +18,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x40000000>;
+		reg = <0x40000000 0x3fc00000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-i9305.dts b/arch/arm/boot/dts/samsung/exynos4412-i9305.dts
index 77083f1a8273..1048ef5d9bc3 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-i9305.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-i9305.dts
@@ -11,7 +11,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
+		reg = <0x40000000 0x7fc00000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-n710x.dts b/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
index 0a151437fc73..eee1000dea92 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
@@ -9,7 +9,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
+		reg = <0x40000000 0x7fc00000>;
 	};
 
 	/* bootargs are passed in by bootloader */
diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 39a3d1cbe4c3..28a605802733 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -23,7 +23,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
+		reg = <0x40000000 0x7fc00000>;
 	};
 
 	aliases {
-- 
2.34.1

