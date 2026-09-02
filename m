Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566483563FB
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Sep 2026 04:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321967; cv=none; b=VaYR0JnIbgCq4NZmUw7YeT8xjXVpETdYLldkzPU9Q1XcK6g9pQTnokgM5FMw/4gVbU8fFdfJnpli7BaN2C3luZGIx9kWxRkmNmBnXeXlK7X1gR+18DJbacHwURBoOQvcnQSPWOiMCJGcu7xidcZYgcevJ+YJKUvLHV5skg2UjvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321967; c=relaxed/simple;
	bh=XWk08yPlEEYsRaLrZ2NbI+7ePMXfSSERTc515p/viLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0T4mh8/SFFFh4d7Rz0hA78ayYMxuf0p5OmiHpYMJ1fGo42HxEH9b92mLrTA2vtEUe9NL14bBBww8f335jQClBObzSaW70AF8p7d92rqhizfj5rmDUbo8727iEfK1GG1H1y/vP7I7eAaLdCWX93glJrvcjE21L+fDaMk/hXHPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eeKbaE4o; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eeKbaE4o"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so3808955e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Sep 2026 21:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321955; x=1788926755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRKgobMcbQKYFXJECRgYm6MoWXyaDD5+5fNolQe68Bk=;
        b=eeKbaE4oqUVpT00Ihd2g6OUO1WGh5Og6F9yNzdTmTqsOZWNlhcu4moKNTIZ3XAIF4M
         m/C32lNPc05qMt8i9HoZIKG3Qvp7S29+5+LbwN3aVSpksVZD6JbQyWpOhJ+9JFBzXR7l
         aF+ndw9OIKCzgtJgFr/USD70BHMHTNeuIDOEOwQnZC1PNXvT1bnYzvOGcfzzwDyd902u
         vbRqotJW9QF3d56b132U6DakGS9o6URQXhPRxsEuWHWhoEd+oiWpKtyuHlz9GB9Zddrl
         bvf5Lk+OpiOVRAMOAHrXo6kHxY1O5c19yjL5eAwNwZiJakzdRagUiLF+a5jyBrANOgu1
         +C9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321955; x=1788926755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRKgobMcbQKYFXJECRgYm6MoWXyaDD5+5fNolQe68Bk=;
        b=F602ItGeq5A5OkGs8PLpy8E92M/9w3zZm2+whAvspAwj5U+aC8ZLOUQJ8j6FI7cSMW
         00mlx25HEB83OSl8gl7yaji8hhhKvcdQqfQSMdP56VGMwhoD0AE06lDpGQVYAeIWSp6E
         d6fjDW/EtDfyUVLZtli1wrg1FJDplTh2si9FQq6G7cI5k/M1SdxEPHntevseCnEgOb08
         87AP342wp46h3gSqeXwf/eQU8OlUFUyaG0IdgUDtyiwQ0ZgA6T0/8JSaCPxUmxARU9QP
         aO/iRqLJmqeYmp5tpPF3QRKQhBDtGjRUn1SU/Bz6wdID63HGu5zhXmJYScDLaqpm4PVV
         m6FQ==
X-Gm-Message-State: AFuF++l3nxyASuRfbFxpEZm+f9MYGpFL8iXg86v+11LeFJ2P7G+3iFNx
	Z/CLoXFiyOPXXgaxZ3vtltTELjp2Q9W0R/ug4blywF6VOLvcC+fLdEEk18w4pbqsbgQ=
X-Gm-Gg: AR+sD10nempnPMj8OABOvUvI6EzqW1oRshWJIWRXwX8OG1BqGW5a2O+dlHdIJnNHAoR
	lpfA3ere5Xbz2WOxyI2KWEuswRJ2SydvAtIa9RufKfZ8e1gFyWMpS5ZQLPgoHtbMlIPimk4160V
	LwtQZWs/4rmDPc0yX9CVUI3XOwbSbtNjd1vOVcddUToUjzUyJXG/OE/PFqJulilijAQzcwS1Xpy
	OCC9+LWHi1zG3tmPaOTCNh90jwQAUhr9IgfhimJdDFVQHiBnDDDPBD/JKsjoPGn87jhkJAQZEZ3
	95TAm5enVNIq3tFpWoMNmN2lSvlkNmDAuPjRaYsHcwIoZJhssZrY/F7x9KINe4oDFbrigB8sPy8
	9Wwz+79IkVjj3sZYN7skfRQ4tGaMxzYuM3ys9APaQ274MCXgqHdm3C/8hCiVbMbVOrQ9mD4tn+A
	ryLL85DnB8Wh7Vg+Pluff2e/n8YC0aRk8XmBNVoO3dgZwMv6Qc4OxlHl4qIQvgXA5lf8i+r7GWn
	MbIl1vlIYauwmy8e6DwYwPLE7LBcs40GNctwFkh3mGhhWk5QRui
X-Received: by 2002:a05:600c:3587:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ce583bc25mr29047875e9.16.1788321954704;
        Tue, 01 Sep 2026 21:05:54 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:43 +0100
Subject: [PATCH v6 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-6-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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
index 911643008b9f..62dcfb18f7f9 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -226,6 +226,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -243,6 +244,11 @@ reboot: syscon-reboot {
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

