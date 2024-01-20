Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F83D7F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 20 Jan 2024 01:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705714196; cv=none; b=YY4voMhycV/7O69KQ+h1aR9u18fPnisFuWZ1I57gd3ENpXcGxYQiVKeJtwDPPJLTvrnETRKp+yh6pzulvoTdwLs2BYwwCbOxW1FRxfuHolHz36N9MuLdRTnq6GUuzIwUKdnVGGDQSg+njk2fluQaJ3cfnfsBa1JdrGs281kX9Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705714196; c=relaxed/simple;
	bh=US4/f7DtHifTyJjMsaA2zuMdo1/hmfd1fXIE8CYBx8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZhnZUpbvHQW22oYPxMezZ7uw0Jqa4RqaxHDXJIJzh/6rukx0ZnjTQqYzdzMKW5A8Wtov0tzV4M34mzc49P9cTvlq/osYOzzEmQNJzsaSqPBelEkAGDQlGi0QG9KrYFolEwhmdBYKfzmbAc6OsJG5xPkoU/OzO3DaKTw4AIBXCC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdn8f/Os; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdn8f/Os"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-206689895bfso777194fac.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 17:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705714194; x=1706318994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcj1RqWVb7ASEjA2e/fTkkwzyy8aS20A5sYtXAZlaEA=;
        b=sdn8f/Os/3yG7W73uYVbLPC9EEJ1F+pxJiZG5XLfyGhcrpCeWe0ysEQSRHeE3y/vDD
         d1bKRmJiiBhbzDJIg0Z6yCrLjz67g4pAug/abSyvTT7UmuUuzbKypejsZzGAtyToqtP9
         F0mXmP32gBUAQXnc6RohOqnTNI6Oyn8gtn/G0iG0kW5Ytl+8f/WrnkMn8uQIvVQiIkwZ
         muXDkaJzpNqS4Akz4fmG5Zzj/pqOUZqmY2ziWvNVuVD0EuWs3TYCGcoAIQ39cjNQdNna
         9B8LDY3z7fp2s2ifOxS2V8XPriMlhQSXU8pwKrzPyRrNQOzRNcsTVHlnvySXszTUcG8l
         i98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705714194; x=1706318994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcj1RqWVb7ASEjA2e/fTkkwzyy8aS20A5sYtXAZlaEA=;
        b=VwfnGK7gHJNXCJvOXnC7bMiG9AhAvqSDdHSVNUAkGHxx0o2zUloeWo2IOSRP68Qgu8
         IwzvUVqn8lEvsyOjpDQwVUY9BxlHic8bIrgz+GZMOhXWteyJuu1eb3NYb1ud85NOI2gm
         IgqhbAVyKR+ufoLzW4oIP/Y8QEiRyLDdH4hy5r5ptymjxmHenSlRjIlaZURwMJjXBD/j
         IQtiIsxMQOdgEKV7FBEX4+LQNLBQMo9SDuiDJrdT0aORwpD5G3IvsAS5EofXVPLZCk6u
         8nrQGCl25VaFs2XkUGH0HktxsFVaHz+QDFwEZ8VyidZ1PaUi055hXmwJzBuUmvzhA9xb
         x+cA==
X-Gm-Message-State: AOJu0YwyUmWf2oYeKoOVJFt95/rSqj9TMSJtDn+vTxM2kqJF8uwROx99
	lB+e9YVxLj+WlkgGIkwWQ4waD0qjB9WIXWkyMNhJNpbYp0HshtriJ5ZEknJ/SzQ=
X-Google-Smtp-Source: AGHT+IGhn8+HLMRqtKYZRNUVoodVl3V6xRiyc4pi0HMTeakTvQLfqysqG/v+QFQJgj+hdVgkkUnx6w==
X-Received: by 2002:a05:6870:b52a:b0:210:b1a5:9c9f with SMTP id v42-20020a056870b52a00b00210b1a59c9fmr499811oap.49.1705714193963;
        Fri, 19 Jan 2024 17:29:53 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id n15-20020a0568301e8f00b006dc6fbde692sm763928otr.23.2024.01.19.17.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 17:29:53 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: exynos: Add PDMA node for Exynos850
Date: Fri, 19 Jan 2024 19:29:47 -0600
Message-Id: <20240120012948.8836-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240120012948.8836-1-semen.protsenko@linaro.org>
References: <20240120012948.8836-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PDMA node. It's needed for multiple peripheral modules, like SPI.
Use "arm,pl330-broken-no-flushp" quirk, as otherwise SPI transfers in
DMA mode often fail with error like this:

    I/O Error: rx-1 tx-1 rx-f tx-f len-786 dma-1 res-(-5)

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index da3f4a791e68..cd0a452cd6b4 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -197,6 +197,16 @@ gic: interrupt-controller@12a01000 {
 						 IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		pdma0: dma-controller@120c0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x120c0000 0x1000>;
+			interrupts = <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_core CLK_GOUT_PDMA_CORE_ACLK>;
+			clock-names = "apb_pclk";
+			arm,pl330-broken-no-flushp;
+			#dma-cells = <1>;
+		};
+
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
-- 
2.39.2

