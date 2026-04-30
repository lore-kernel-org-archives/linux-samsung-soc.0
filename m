Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539842D949B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 01:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514228; cv=none; b=fHkrWxAyepzQFEinqP+Lq8QITusbzbj8nuNdzVGHQO+QXp/OudUBTtcvBsvQoLkRrGoTwgI8IFArrazxErEtyFJcfmAAtHw+aBazftHfhL3sS8nF5uUzJ8pJjPIx0H7uFZ20nTn4Ra78gGTTlDDV6g3yxEb2a2t0Z4bFmjGTQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514228; c=relaxed/simple;
	bh=zpefvb4+CzckyglM0e1evuxQAiU+BTEuiEUChrJ0Hg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duyG+twpnZw5gkQVsvzigdCtdw4YwSfqfvWb6mfz2wc/KtjyOnwjoh19ZfUJkLWSyCFSNDuoe7ZDj3tU91/4UWcGzQxD0OzciASv5SF3joKjVvZmrbQZZY+jir7evML/+R0y8Tp6zveSt2WaW40cErvnyuJEpNdyhxU267wPlcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yMs8ACwy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yMs8ACwy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf7683a28so234532f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 18:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514225; x=1778119025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kr2cTDfHGDksP3jgY+WcfLwMoeO5l4D3sr8mkWZf5zI=;
        b=yMs8ACwyp2LLHMBbzJg0FaMiK/rwhfZxjfs4SmvfWa1FKfRbWIzE7ZUjCJ8dkj53Wr
         tRJ0eW7RBDi+D8UPN/59+kaWFYyGOXQpwc7yztC07ck83VxRbtxCfWu3JgYD6lMdDukR
         /E/5SdPtGFUh9KmgcjWsvwCBHMZvDYT+wf4z1aqE2eA/cZMY0veqHDp9MsBBKmxGbPTj
         SuPBUJBvxZKDgQDlDYrKfFjGgQ/+fpQt88A4q9onDSK0G8FXgsjD/AWYtAizAPtLOVLJ
         nswH1VR/K8p18eYws2LP+QS/aJPMzG9tCKRKnfIz7AUsHjcnI+PZgY0N/WfaZA0hAszg
         zveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514225; x=1778119025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kr2cTDfHGDksP3jgY+WcfLwMoeO5l4D3sr8mkWZf5zI=;
        b=EapCBOGAhEYoTHq2BCCSfNlzocAI9uANeYfRu7R/W4SYTo4innSvSFJsWlcUsVsVGy
         TcBxTn//AXWJzMAjbyMFLtIU2lLyiAf6ao/Ajmkg+05gUq3d1pOhsd6A5kew+OYqTzQs
         3n7EP9jeFERYc9i+X+hAt8yPzzGu3ESLk5qDt0F0UKZlHGsUr3h9bRJfWm4cOzUeXjHo
         0KIwKJqfqRyTJCytnVrh5VijcU3gwaFj1u1omWnZ6ECBLvl+aHOKcboOYNflst8QpETa
         ex844Ghh0khNHtEkJS4CCqWIgo0YIgDBKLu+DlCon4mZmGaD1vQcWhiZvIDXoRPQingA
         wH0w==
X-Forwarded-Encrypted: i=1; AFNElJ/rAsCHQDhuD8cUaH0l9bAxSWLGH5ugXZA3cgdEmTiOsLq100q+e8Wt3QXeKVVH7w0ub29cxnXXW0bSd4K5pLUr2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2icySIBruj9I/MeJxKR5t7hTTm5acDE9V50BA+4npDeiRh2o
	/7vEnwQ/NR/R7JpqqZh0xopcd4yJysseNObXDlj04+M5lB2XaN/49fPkHeeIf2kZ5Po=
X-Gm-Gg: AeBDietfG+TE+9P73D3bjbevOaVE/uIW9IQAVbTwUVEHrp0Kh9kzgPahLhWuZTmN1Gv
	IkFDuulUo95TTJHP6ERWuXsFIwDER3yfXm1aXaRuX84AR+uwwYzbrv9FlImc0LfvF9SG8VKkGkz
	Pqc1HFJLcC3DBIATpHZApJ3I+XpgM9/CAMQ31U/ZleIdNZFJVwn4rHhInjh/Vv64kjW8KVBVSGt
	GQTjZ0e27n9Cf0vuwGyMpPcXIdoQpnqq4edbYSyCgYp+3sAI6M1pjro0FQvqRdafcCUgQ+0mUPY
	Ou+pGTacPPVkk0HwPOVZkTLSvT+RJsPXbdwwnO+6lfOKv5iMYB6NASWjZdF2fXMWcsVX/PtcCA1
	2kKA4l9GmlZI9uHVC0gAT2xyihOpyL6moJbp36s+/G8d638EG1wOswXO6UjVM3fy/RPeGtHQeIM
	pql7ZMSgPT53IYbxy1VuHfansKKtxi0n6+Rz6K8PnWptV5zqC2yW6LVMlaIMnnZfbhB+M8u7qrw
	89vV/sY6egFHM4W69Gbs3gUWFc=
X-Received: by 2002:a05:6000:1867:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-4493f1307b6mr1254377f8f.34.1777514224614;
        Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:56 +0100
Subject: [PATCH v3 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..04662b1c5458 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -231,6 +232,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0

