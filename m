Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5DB22579E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421729; cv=none; b=iCDj6ShYaubx5x5OS10Kn8DuGA8wlqGlYEj3zL/ahA92a1SvtoafXzpY9Kwp5lYxbRnPLJrrxHlQ4seY14LNyUigIKdN0CH71S03sNIVO83KC55XXlzVR2Boeznaizv708SmrLP/QVDGJ3XPnHnrYIywoaxDIqMS6mYuvf+BNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421729; c=relaxed/simple;
	bh=rl6qwSwPmwstxso3urexxTtZz5A3LKOG2dzER+Weveo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZ+h3T0oV40ovMhWqllT3noHjnzaG3PZBYUofyTH6hBO3XrqmVrkigdVrESWAEckH/IPbsBI0J/4tip1ZveWJtrLazXp09fLPPqZSCL9cuYKRIhQU//VTa+uiY7Ssz482x+ySfWuXVqOJHPiPaPlK6d8J/aHsB2JRlq8IwycCus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSVCz83q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSVCz83q"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385de9f789cso885867f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 10:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421724; x=1734026524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXkOgCi8HIHQGsuWXYvnWFeub+37cwugFPfSGaOkH4k=;
        b=xSVCz83qbeUd4lp+v3/89GpSYD9h9Ts+WttA81OYjlIIpJng5pHxl1L1RuEbWaXgQ2
         QO38uq1xPJSJriN3PKaUmKeYP7Wxpj5A2L9Tnb/OPK8PSYueBzmtoZq8Go6SnuwhbqzI
         sCu8L0+3YJmu2xiI/SpodLKM77MXMYuKlpuv+7Yj6Ix1NA+X+hQuxm5KEKDSQp4Zc1QW
         x4j8KcuRc4yrPaevx/TPjTo6RFoSi01uNzdG5Jb4LJsvCwvVeEHZlSwZmO/utcAkhENx
         y6Jd1nUxiA0JPKRu/deMHjsrNsiuwQxyJHu1iP3IGR+o271QH1TCcZktfV+D1ilKv73A
         eDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421724; x=1734026524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXkOgCi8HIHQGsuWXYvnWFeub+37cwugFPfSGaOkH4k=;
        b=uQ2yhk+XYoIIp4SvTl33UJCLfy7ZtYjFRlWc9P304e93TixaSjgKLxCjjtPV/L35Wa
         Atih8bUlFvijgT+j//0RyiPRmutP4C1cCIy4MRk7+NfVwRC8ODjn4dsPLEaTQ9ET39ME
         2n3+dm5Ib3jNzhdkUVsy3xFdfXZ+8z9TjPZ24ZswEUQZPCZQIcp28igBsng+Tj2u4DXw
         gpijoL3tbdn3J7E1GqH9jQq29/2koDnGG/Uxqh0xCftE7ZHFCBmbTkbYgaizqlAtvuuR
         kSjYy9E+ZL+oUxO7iEQs7dLEX6eYJe+OYnNDjhkzmWr6Ezc9fr30Sn/6bpScCS22Y1oN
         COUw==
X-Forwarded-Encrypted: i=1; AJvYcCVvVE+suDYZU8UhEXtwUPPXalrFqPCHolXm9n3zh+07CTJHJd4St2vvW0U1iIGA0T4lD5llWcB2ms3kDmb+45bRsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn0i+iYlI2ZMUbL16dotb/eJn1JCVAooHlbvtQaBiGgSokIJ8H
	Gar1nf8Grd6VxQ28KuBNCXzo85/+FBDfqiAGYY56+PFrcWcdxfzkCcKZj2KJr04=
X-Gm-Gg: ASbGncsFiDYqJs3BmSbOFUyfx0upaGQy/0pOSfwU+ECUmfNvprr6gy5o/af1VlvknCW
	aEGAZixx6/wMplAK9+9yXp97Qn1X9K3hXArwokuxkRJ8vvJFfpepc64NZ2T/P8395ZLz8sjL9qp
	tyJ+jnd77vJnDhKGaBhhyv+gw2SBZnXCfvSZZsRDPcBX17778buiZ2zdXN/0/vhHihlp+qv/6Yh
	qtHFyTLPSisoxMq0Mp7vF/rIUPCA1I8+YrqAlNtbYzyKMx/UMbOWzdVuVEPxTTFSkGByCQn9Htg
	KtZbUY6u38LAQg4ARvkI5jwiL6FxkRW3
X-Google-Smtp-Source: AGHT+IEPtZMmft62bUPhgYrLR+oDZpiHUMZkgxHhYwyxhO4GONqKTULpT/JUlhKvm0dRtGKR4n2z+A==
X-Received: by 2002:a5d:59a6:0:b0:385:eeb9:a5bb with SMTP id ffacd0b85a97d-3862b34e5f0mr30744f8f.17.1733421724237;
        Thu, 05 Dec 2024 10:02:04 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:03 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/4] arm64: dts: exynos: gs101: add SRAM node
Date: Thu,  5 Dec 2024 18:01:57 +0000
Message-ID: <20241205180200.203146-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205180200.203146-1-tudor.ambarus@linaro.org>
References: <20241205180200.203146-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information, which includes the TX/RX rings among other channel
configuration data. Add the SRAM node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..1441e9a252c2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -269,6 +269,14 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 		};
 	};
 
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.47.0.338.g60cca15819-goog

