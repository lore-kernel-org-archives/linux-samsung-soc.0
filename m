Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F1918C933
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727200; cv=none; b=qTTc2lt3QVMIWcLW13YJhOcEofBBuYv1udPVsjLZFMsK6/GEpcJCHLFFbsjtcoYidyFdvln+EBy277Mq3Qf3jj+1FQiSXS0F8VmEHhlJCltcfG9nolzle1tA8NRGxoZSC23DrLktnohNQbxKjTAP54kj8R1A5e4RtoMERAQDL2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727200; c=relaxed/simple;
	bh=03oIVo7Mwx5/dyCToWlLUM6KJ0gWVtj9L4EMotVyIgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZlz37RJav+aPpSyJyyBHxAZX6hnDoZEHLNov7swz9KwtLU4mW39UfY6cjLVpXOWnsjN9a1Xb9lLou3ZJVRfcz/u0RsLWFH7mtAFYrsqD1WkKjLh4ThMs2Ku5AY05BLUI7czTs9TXoAYhz7XqFVG4xmTWbVtAq/KAwff9snBD98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEhg/oFx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEhg/oFx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso21625185e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727197; x=1791331997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=;
        b=pEhg/oFxkX+a0WR3vjlI3rea4s8gT30QGTwYAgwTPbc0/48MMlIrTmMjpp2YoJrXJY
         /h57zAgqkaH+Nt4fssR+1BrItXJ3gsIA447lVseKujY/oUrR4ItXw7qgZDd5bLXX39sH
         C3hxlPUeAJ6fG/R31GZWm9h3CEcbJUN+sbACfoxz3c1vI3SAIcxpvX9g8NAYH3NYTEOq
         aGKZjNa2HHdzyXyk9P6yK117z4/qLqSg7W8QujHOgQvOG4A/lJ0YFK8dOJWDKR6bxo/q
         mRHNWoSQpvNLw5oUd1n9mqPiWwmmBpzVBCw2Lh6jbuAD2vd6HzKT52mU5eFTO7/eLzYH
         agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727197; x=1791331997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxnJMxigiIcSjCIhGGC3UJY5HM/ObSeIMc3ufp0EpQs=;
        b=L7ndPBClua2755mSmeJgxaMRD63xQtZ5b8og38OSmsx6fgQ/cEBrw5ATioOsT5uY0m
         nu+pwDhJ1YzenB4HsShLnpnOuqW5qSO4J8TFQ0bIlE7BA9665+f7wHCI6EZDHTvftcu4
         ztpkN1OrE+0NDIdfySDYwhbu/RvnaaRFBFu0cZ8anE+u8dby3Z5VoeeQ54iFvZX4T/rA
         zgU1xdMGEBZK5gMW9pm600SsUy3cy05sUbSL00Muvo36JPvrBzJwy99xwd0BibAF8+RR
         51Dfocpds3FIcYgVNp9okNOppC5NPGyaVvdPyy1urJDE4jNEFvLwJ/zVR89QIN5JBoQy
         NiHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS8xJ82391KOFb2qyUhV551SLCQ0x/8dXBbTfd0P9VTLw8Jg2UONteiqcQBA/DqP9wFPdZVfQVHYuhlVH+z1V6Jw==@vger.kernel.org
X-Gm-Message-State: AFuF++kpbDNNlsuRy6br0i09u5OgnmVgkj3BwvbzKbucy4Q+fHm1SfmM
	yM57FB9HTCcLGAV/1rUlaHKuUA8ylUHWlKNuAu5hZYZ4TFRyWV1XJ//HVOWJ0J9LojY=
X-Gm-Gg: AYBFou3V/HiZ1OlPiCk4v/wRJdk2iyQOvr/IBAoslRRNcYKmGFYuECtsxkX+55Zfbro
	K7hktnYxiBBABEZeFrdbM+aCd1uJi1zElKb1hJU7tBwo+Id2jL0eaOWWCS6As7xBh6X7qfBThli
	qwwls8j8SsaNf45GZUAmdXjw8ls2cM0X9/7oy5rZ7UxqDc5ZpEF2qLyt5wU8YrByV5/WaC+URuU
	Eryq31B+lYnxQKOSD6fkBxK32XE20AdKZdOMznRJcv/5LBotwpNVl5eua5xUTMbp+OYmuRzFccd
	c/uvWiXkdznqzhKpNmalhAeMzq6I0s01dLSpj9u67fhWzFEWCqKJ0kJUDeWPHos2ZC0jw7yTgT3
	4cn+cEvX/0s3YOLrve1sfSdZTROneW1M6BzbW5QwEIjwiFKOHg+kkHBr3gLztziytq/jn/ygDG8
	OISRJqMLfJZCHqiF5P+YsKbgCve6aIvY/oOJ/ryUsYuTYI8A2CBdLj5Uwhmxkp7D581lesIoiqk
	gS1APENHSvUHFmVoaBQApo2n2baHkPHkFeO08aJC7rPqB+qiRtBtEaPdTR2Nw==
X-Received: by 2002:a05:600c:8b4c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a01502b7b2mr11612155e9.19.1790727196898;
        Tue, 29 Sep 2026 17:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:13:01 +0100
Subject: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8a4771899a8e..803fc127d895 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -248,6 +249,11 @@ reboot: syscon-reboot {
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

