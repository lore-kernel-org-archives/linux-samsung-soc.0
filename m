Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C31C17
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706146744; cv=none; b=H5TBl2DsC+ot5js2lNlZU8UuhRJ4WgPHSsuZRPtd03JBt2LHWngHxBUjNXtSX3++7lzwc0WNcYVFyWuXf0HmRD8GStH7z8QW0GjbLE/Gy5gFtl0Rc+oJKx+V3lXYLcvChTZjRTEOC8H/MAx00D/k2k/zn+2RzsweNiZsw3GO2QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706146744; c=relaxed/simple;
	bh=UecBJlCGnBcs6D2LscfjQO975kiIPSTNfeRKciZdpls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n4Of6ec4lnGa9v37M99C5/t3bPsw2UCpmVMXYpshKHWrwuPAHXZ2hhfo40jwls0+qNjEGeG8QDWNW4IY28ed9t2i4kFfY/2N63c8cPbpzRn+R3mGsP16WQtNVQvFp++sW3iFQ8ndYRU9A6XAYhtczjJf228T/vFMVVl0fzANbP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mAwp39rj; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mAwp39rj"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bd7c5b2439so3553666b6e.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jan 2024 17:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706146741; x=1706751541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd14S9gVt8ajgJuri9OeN7aZLThOvunLIv6HZZP7bpE=;
        b=mAwp39rjUN9tp2brPSdglZr/0FknSKlAnC+PIy6OOhc9V01LDXo9laubS9klcBiAjg
         qq3M+VRcEyz4pOgI3f9PPyD4Ko2jn4vRhJkFZIZB6TGMsXDz86Wt53zAax70nvzx96rP
         mlqFNcZKeCA4LvfUA8hs4UV0P7orEFjrFvYGcIWbJ6g0cCAEWWHt200eazY4RsP51Sx7
         lnlHWPfH7jEFh7k2X/9yWlpP5Z8fScfBBNo3ZTyhUCAgTwU1TVnUeucr8k2uTUiQqCMq
         dKtxSM/pnHdhWcIEex4APIA5SqqjVnqYDWdRF0GEWjpq3OGUOmPbV+ODUSvqxAlQzsvm
         EcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706146741; x=1706751541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cd14S9gVt8ajgJuri9OeN7aZLThOvunLIv6HZZP7bpE=;
        b=cyh1ukq0v0RUPO/n4IUIeWzpIIcRDPm3POel2HsAWBUoPC8hqNW68Kvc0WfyIFTKqs
         Rjc1Gl7LHRv09odA6Fg50ugdOEJRhYoe8brgqkr9b4wafwEellsECmqN/CoIHiey87la
         LldWVemY3EopibOGADa5anhxlRMADm1cG4mrm7h0yaf35wwh9OXms0whsiwgK55om8Cp
         NwGQBR0LekQxTRD4Fh/scpcRYU0ULrvEWoCvTFkkbdl2EJuLdHIeOKHenJlrceOIiIQK
         /2A7QeKtplWnImCfQ17gfQ01K2lJP/GmI1O6CjFuaqtTjyDIEUEhkvvITwa0plRamxrh
         5t+Q==
X-Gm-Message-State: AOJu0YxTQ237Jiv3QTby+UEUmrVlpklrNWZ0ZUhjxPfzzkFHPX0+Qzbo
	cYaYyXajW+gF22e9R1YkWtHBgJ/TVwfa5mYxQThngyFLSNa+SY9KYIclg9QRWlM=
X-Google-Smtp-Source: AGHT+IGNzOOC6dwOU5Fgft4DlrzTKACngiq/T9rJ3NZO/iXhvAACtkl6FDHW66WWR1iaI45JSgHD7A==
X-Received: by 2002:a05:6808:16aa:b0:3bd:8ceb:da6d with SMTP id bb42-20020a05680816aa00b003bd8cebda6dmr157088oib.34.1706146741020;
        Wed, 24 Jan 2024 17:39:01 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id dd1-20020a056808604100b003bb7fd5686asm2827162oib.23.2024.01.24.17.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 17:39:00 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] arm64: dts: exynos: Add PDMA node for Exynos850
Date: Wed, 24 Jan 2024 19:38:57 -0600
Message-Id: <20240125013858.3986-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240125013858.3986-1-semen.protsenko@linaro.org>
References: <20240125013858.3986-1-semen.protsenko@linaro.org>
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
Changes in v2:
  - Ordered PDMA node by unit address

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index da3f4a791e68..618bc674896e 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -184,6 +184,16 @@ timer@10040000 {
 			clock-names = "fin_pll", "mct";
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
 		gic: interrupt-controller@12a01000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.39.2

