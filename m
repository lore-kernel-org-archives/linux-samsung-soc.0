Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB01D749F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Mar 2024 02:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710900355; cv=none; b=gzcxY0CL8/xh4UG/xnMiai5oqRWk2Ngtms/FeBrhtmJKVioKQrI6sT0vHlZ8V0SoWasiZBSpiqynho+WPdIhnUxQIQ0jz48IfvrFNvbSlRQBdSQ5kC3IOZx7ogUgCqlTSsOBpSLz7ZFLY1bbDLjPTDHgmfaPz/rHJ7wpgoS3bt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710900355; c=relaxed/simple;
	bh=lPoNO8Djhl6VxJOMdubS7uCdMzqsv5KWwLk5re8YgxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Liun8rsn05uAXfz9DX30WsEZjxjqWsxo43rwGn20KcMrtmiu/CR+tr0HOCbCqCmB8rrnX7jmXZjrlZbcTx/4vhUh3brSSJ8vnQZZkeSoYLMksqB66geVO1+cn+Fptu9/zhq4hs2dJc1FI4llPzIDeg7RyT6ASVwFifvAP3lq8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EdfFqXPd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdfFqXPd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33e17342ea7so3166539f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Mar 2024 19:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710900352; x=1711505152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyasacTOWOP4VjRKrlicHpzCDd6GgK1tri/KhQEKWGg=;
        b=EdfFqXPdgDJn/VvVyrxKcqn6uYht+JIpzUYIRwJOgxfsBOJiFVlfaUPaKMUO+FmTl4
         XIq3LVNN5TA8F2QHV3Y2BZ/Qi89Mh+lPqfYLQu65ZzF144/m0utiEnCUdYqGPG/wHBU1
         xJhYGf+S7E2lkj4A2fMFdOEP0LVBK4zQOpdIHtAfMJHmn7OX9pd/JmcragUDKzU5vG+O
         3bRpybYm1bNz63orJbQH+0mH0jL/PStg+EQQzshNkMmjlieDGN6K4jN5LC2bexOiiNhR
         gxdSjuLMNb8voZP34tONuOmJOkPvgzFlpK/RUGWP+pKW3wqQCZmIkl0L5lo1+SINaHJw
         09ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710900352; x=1711505152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyasacTOWOP4VjRKrlicHpzCDd6GgK1tri/KhQEKWGg=;
        b=BspTtbKWjkycs5xypiT0KwE1+N809wag1ygt5aobvuwk5OaRgKTH7r73iMHbyrDhJ/
         8SS5D0eNM3L+crGVi9LamGCHtjWVrZkkkWvrdOgOj+1iD+5cwhVUq38DJy94Uaho8Ski
         rCfsX9CC54NZnnFgcLIPpU47Yrnmq6PfmiPTH/7XhZ0bDbgGIif4DPInOG8dd/Z+VPyM
         VMfLIoxP4bjsqi/I3CjP7VuuWSrRnVmkAP2qByo7QFXsuXXp+S71n+BFyVa0rz/Z9sVA
         a2gqwzS1v//H5pSXPl0W/9qq9w5hPcJN9sdwk9PUl9DOESNiyocEiG+n/InL9AnuDqfj
         kNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfDM4qlNNRdYYX6RkCK+wlUWnFY3AYoW1GD/syMbmC58HqL5NUvdBfZIB0t3vMReuMzERdeZdO/QBHVoJ+figR3ZmEdfTIOA9Ulwwwdn0GoiI=
X-Gm-Message-State: AOJu0YywjxHugTykf+BkkejMJT/3jsAZiyB+tvfTe88KLOOPV0Ak/kyj
	DzxbtZbZFPFUMbOtszDfiMNAIkadpFKRLSSkUl0bB0CthuwIOC/u7s0vWswzeiw=
X-Google-Smtp-Source: AGHT+IE8+12GBzXTqWjxuTZRshAv01JpKd7Einxq0QOMnNA/rTAdlf6+uMRJwWulrGPL+WIBl6UI1w==
X-Received: by 2002:a5d:5492:0:b0:33e:cf33:bb1a with SMTP id h18-20020a5d5492000000b0033ecf33bb1amr10138419wrv.12.1710900352322;
        Tue, 19 Mar 2024 19:05:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id u14-20020a056000038e00b0033e34c53354sm9209295wrf.56.2024.03.19.19.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 19:05:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: sre@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	peter.griffin@linaro.org,
	robh+dt@kernel.org
Cc: conor+dt@kernel.org,
	linux-samsung-soc@vger.kernel.org,
	semen.protsenko@linaro.org,
	linux-kernel@vger.kernel.org,
	klimov.linux@gmail.com,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	alexey.klimov@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	elder@linaro.org
Subject: [PATCH 2/3] arm64: dts: exynos: gs101: add poweroff node
Date: Wed, 20 Mar 2024 02:05:48 +0000
Message-ID: <20240320020549.71810-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240320020549.71810-1-alexey.klimov@linaro.org>
References: <20240320020549.71810-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 55e6bcb3689e..9def28393274 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -509,6 +509,13 @@ sysreg_apm: syscon@174204e0 {
 		pmu_system_controller: system-controller@17460000 {
 			compatible = "google,gs101-pmu", "syscon";
 			reg = <0x17460000 0x10000>;
+
+			poweroff {
+				compatible = "google,gs101-poweroff";
+				samsung,syscon-phandle = <&pmu_system_controller>;
+				offset = <0x3e9c>;
+				mask = <0x100>;
+			};
 		};
 
 		pinctrl_gpio_alive: pinctrl@174d0000 {
-- 
2.43.0

