Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1401BC2A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735875; cv=none; b=SmiajwPth2urOaDCOpNCwDoXRj5ZEPmWxiV2oZMx7w29GsHCNZXXQtY6AoERMra0/pTME0sIe2Roi7Sv8V2cUm8AvVo+xXoeqsNu1u6xsGMhvLUjpwrSoJur15gPu6iyW62WPwUld5GfWtA5uhD8F9LTCFOdnP/tbZt46OPogsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735875; c=relaxed/simple;
	bh=fmLKNgtKcJwjP5FDnh9DbIUvWbuQxYQ2VpHaBRIju80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSYmmSxy7Vgt7VmovqdCBnJPQmd3y5Ux9sP5FictfykAmCTPo1CgGk7vbk2Bou4FN1A1dSOsY3INqvpJPo/9DipBlQ0fxHGncg1XGTtX697Ja0NTygagsoOwiCgs36H/7cor38K/5hJiIdBgyoqAiQ2YIu180kKGT8emfuaeOR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eXXiabof; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eXXiabof"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ddb35583so1448045e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735871; x=1750340671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=;
        b=eXXiabofD51o+LER7CAup3y0CTPMzQZvEfJOfKSfntayrrx9ogu2RqBxpV8pjniYUd
         fB8sPPdpX2FCwG5JIskkbTBtMYiIah+tzFDQOKEHbQADK0tRCyqv+iDL6jxMLj4A4o4S
         7zaX213+uFJJvxe9XGWDFp8GjYnmCehKZpDU9VPuSuskRulVLh/Br1mf06QE/bJqyYOl
         tldOL/TPqia6/4ZaWzgjPEn3S8aoS57eYU1buClPSCMQOrIKLQ2VtDoUXkms+52ml8JB
         JtbWkx8F5ASsX85p3x1x2sW1F11aMW7T4/rKInmsEQoxXvYs38nfRavnY3HW4Mtc5rc3
         v70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735871; x=1750340671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=;
        b=rBgiusHhoMFkzup7f1Xix3sttC63xriP0d8isJ17xqTN6O9v4IjLmApXoolLyJMUdW
         wQIBZIgSgeEWhCLsTPOiUPrxp35H9ZYlWSYbycfQCV0JMYYrGodtEXLt4TNQX7OeJ81q
         3TcBZusvBrJwsi0CvKRPGsa83tD+WLUspOv/x4PgdNS4cNCeuiIMUiuRuUYuOTCgoFkA
         b6PFu6NVn+3ohwp9IeKjrAw8xlPKWSqNcWWR2b8efLYFbpHT7FGUeEPEw1sT1nJk+Gwa
         RwpC07+5tKuIXTApl6F+YIQSSPgDuZwE9BHLx6/ZW+GV/q0xfMepPZ9YZL5jGe6n+VLC
         pr6A==
X-Forwarded-Encrypted: i=1; AJvYcCWKeao/jzrpbyKTwoN6BHTrVKaGrTgUHl64qUZ6u+J2BiuMQqjqCXjxAouJZ8JGK8AF4El8O20WNxVtEiZxAVFObA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8T9QZP+SsnGmXkNRtVDay8E85SycVr47NG/V5dYhjrBZLQgof
	9TPKVi/8oEzNa2kFTKJzXFJTUsvUyIk43EMyNWCmeTLdrlzhMQo7zMx0f6snPcUi6rI=
X-Gm-Gg: ASbGnct0uF6R4RVESAJ+U+x0hrOz5VboU9RiWL25RECO4Q9+NFIXtcX4lV3OQr8FiS3
	MbmXQ2zMB4dmxZbWXagaMvS1Nko3JqqSdXFi+naI0yvCS79REPB2vWe5K+cq/hbqIM/L/Za2DCW
	p19vJnBfPUyEYXSbt+eoLJIO1/xoOSeJoFYTxSSb32VZQrA3dGrUOP6kn1SP/b56QCW1E5P3YTa
	Pte3AOCKQJd28av60n8n3lKtndO5wcj/rmV/Gnhm47mEIiVqYWwdVv+6kgcsTDLTqAdfg8AxT0f
	yOH6GUHkvO4W/pTOou06/xyRcxCHCrNqibeUlrrpu3hVzSOQ++SwyM/i2q14Yq3byY4qbRUCiXn
	lkRMjlTID
X-Google-Smtp-Source: AGHT+IE+fhgoMi57FWpyHSYtxYdJ8jLOUeAusqX+ark2CzDRRR4iGxpFzDQ3xzR11gn00SA1jvJm8A==
X-Received: by 2002:a05:6000:26c1:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a5586b8858mr2485885f8f.1.1749735871092;
        Thu, 12 Jun 2025 06:44:31 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2053661f8f.4.2025.06.12.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:44:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Date: Thu, 12 Jun 2025 15:44:22 +0200
Message-ID: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2107; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=fmLKNgtKcJwjP5FDnh9DbIUvWbuQxYQ2VpHaBRIju80=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoStm1fWX3mgWeCfVDeyKr/swV92niRZ1QIQm2L
 x0clvJz/4OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaErZtQAKCRDBN2bmhouD
 16UJD/4gbBqdnKUQ84IoVn0fZjjNqBAcba0ix34ZycfQc2PNtNzj0qZHfGCJGVpQOxzcgkoXOEq
 jhWhHkYFtIo6Lsg0VwNqL/L3ekD4JJHQGo960GpnogiLCrnrbpxbshD0lwLcbDRQXIQjLWt0tQj
 fKUm5PbsBezIb+pefiu1vvOmYAVgD32POwCeudbqt8eq6Zm2Vx2tJ6uWY+oSu5O+7pzdMNNFePK
 7dGjAVGZ5KCVNJozzdJhZlY1YGvqXQM5oC8q1P43A6oo4Ie9b5V0JsNahMzjraH5cludNg96ZLC
 v/4snCT7kkqVoiOHeiPRPOSHOQ89QRyEz70ytN9gU7ZtO9wEKVq6t1uF6EIhjG+BIvELqdO/Uah
 HFLOq6ud/MkyU+F3euRxLvrUvNotkQHr2yQyQY6BGRsJKxQi0jodb8ePJA8KOajiIE4KEUry0dy
 Fyyasl030WAwpGABh4Hf+bd7QZYRerUBaFPYpplwas95E50QgGjNnDDMm7QbPoXiIWFmGA+Yw3K
 xIA4t5W9xTZFf84FQgC8P4MaDrkN8qDh1d6qXTtDDkYqklXdv9bwKe2seNkDmzbY0vziJiDXXDS
 hqBYYohbVXBdyN1IWxk1IP1NQvbo9nwur4ejDfTY9tbEJVoyaTO6gsebVFDwtW/m+FAC5Wu1SJD wDzMrRZ67JlN7Ew==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Sound drivers are not essential to boot boards or mount rootfs,
therefore in effort to reduce the size of kernel image (and boot images)
switch the ASoC drivers to modules to decrease the size:

  vmlinux: 152864 kB -> 154528 kB
  Image: 39391 kB -> 39067 kB

No difference in resulting include/generated/autoconf.h, except making
modules: SND_SOC_SAMSUNG, SND_SOC_SDCA_OPTIONAL, SND_SOC_APPLE_MCA,
SND_TIMER, SND_COMPRESS_OFFLOAD, SND_PCM, SND_SOC_SOF_OF and
SND_DMAENGINE_PCM.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If patches are fine, I will take them via Samsung SoC.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm64/configs/defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..14fcd0a85f5b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -979,12 +979,12 @@ CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
+CONFIG_SOUND=m
+CONFIG_SND=m
 CONFIG_SND_ALOOP=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_HDMI=m
-CONFIG_SND_SOC=y
+CONFIG_SND_SOC=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_FSL_ASRC=m
 CONFIG_SND_SOC_FSL_MICFIL=m
@@ -1021,12 +1021,12 @@ CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
-CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_MSIOF=m
 CONFIG_SND_SOC_RZ=m
+CONFIG_SND_SOC_SAMSUNG=m
 CONFIG_SND_SOC_SOF_TOPLEVEL=y
-CONFIG_SND_SOC_SOF_OF=y
+CONFIG_SND_SOC_SOF_OF=m
 CONFIG_SND_SOC_SOF_MTK_TOPLEVEL=y
 CONFIG_SND_SOC_SOF_MT8186=m
 CONFIG_SND_SOC_SOF_MT8195=m
-- 
2.45.2

