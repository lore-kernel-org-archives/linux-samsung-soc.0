Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9D143889;
	Sun,  4 Aug 2024 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808541; cv=none; b=loLDgHF1ZXB7paM/ehibz9yQsZjrEQE7MURArmtTHmFXl4h6ffUDX+ruXGJxDf5SfVUSBr34dSrZxw+dmmaQLb+kNSVgMTufSzBBr4bRC7UOKGONBS7iWjwQkuCQsd0103X+pY7dF2+jnLOpAhNZqMBTUnNVuIGshHhuYroUAZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808541; c=relaxed/simple;
	bh=R/zw8++6HAxfElOjT2EQc7bEpx1XnGqUafF3RUDJMjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBNIOmw/VdKktbC3poo8DoC0xX4RYnI3cdJtIr43XR4JxXXj3QKTGcnB0/z7qbtv3Rr/x6lyjVLa9XEAT2eIftLdUo1G5lxuSa4DT2O7Nz/1dTaJHXToX6uRoBwj320eyamEp1j0WtVonbOagG5MpaZOh9JGLhVMZuPvZn73bXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXfPiDoI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXfPiDoI"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a3b866ebc9so13799833a12.3;
        Sun, 04 Aug 2024 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808539; x=1723413339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PylIu4FUXlrxZkJ16yikQYZXRyjRIiQcGN1Zbu3DKVI=;
        b=UXfPiDoIi8WhQKQ91Tik9ov3gCoNzhBMtBvhlfhzIfYnpHie0gykjpJwy1aq+x7GDM
         glgTE95F5CFgkok39Ik0OGnaurQp53+fQEDdFS2UPsPdIrM4HC8uq218Dh2xryIrklZq
         rvUZQ1BBy0SKBuGExVDJ8m5LKV9qytFl8FPzdPiqYqVDHK/XicLCOLULo7MS/vHi+pUG
         W0sq66sW8PeHAL7o8erIXYYrtUZovt8lwlPfs3hCK35iq0G3Ntgv7gdVOLrXbNqGI0fP
         MWTHlZla9BvOZADbDd/PWDzP7YfUKA/U4FFcLkwQr/xZrbLT3w+VY+Lk8ayxrmDUaps9
         WHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808539; x=1723413339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PylIu4FUXlrxZkJ16yikQYZXRyjRIiQcGN1Zbu3DKVI=;
        b=FRBI+xMB36yLCNr/v+8fRIiDGxTV2VDn6WUCnqq8w/GSssMquGmN7jPfiN4YRlj+jt
         CJVOalzsdDtNrBVk+yCRwpHZZz0rDyXSN3B4VcRik7YEQ4Lly7RIqcn1LkMuYLZO4S2B
         rIdCfKg7uFBojzIS5OQRmS4dO7VFeCrMFV73KahO5C8iK6yIv5cKL7D4fIX1PMsBuOuF
         kYZqpf5YqacYZZfq1PA6fV9h0u4YuMuuo3nVfts8Ux/OmpQeBvuNZ5Noi8uJycRXedUm
         sYznzUKu8C/tXJSE7V3paS5mPe3JfDH2KfES6w/EX+fHPG3RxnzGJZlGzJ3UziPK3jJ9
         710g==
X-Forwarded-Encrypted: i=1; AJvYcCXHU/O/kGWaSvpKkU5RTXPpZaOIpnUHGR12X3qVC3CDFHouWH5BwIDCYtKAsZblOCp7ieZ0MrrYwAvQX0amm2CLs5q1kCgcKUZUelBd/wvruYb3KxHZCMai69YamxPyBKVcyOPE6gz0vD7B2MJbXYm05OVQJZCVjWsACYvwPe2PfpJ6q1QKnE7fpoe70/VWbFKCB84bV6or9FT+ltCDhcoKu59jHkgkSWvqLgYaJggRpCUE3KpAgwBR8wJZRCrbSDgy
X-Gm-Message-State: AOJu0YwTTC5IyEkrSjNQGPBHNa2S7K0anpnOZUStqDoHQj2TBi8rgwU3
	ESR4yJjDH7zRPRZkMc9D/TwjqHA/PetKsYZfqQCv0zb6p/jLUiob
X-Google-Smtp-Source: AGHT+IFCXWpLgSy0HdFQC/k8f0PkI2xtHfzFl1y3lC9hTOOBbO3phvAsUzemOzvmYEc2XBt/IzotOA==
X-Received: by 2002:a17:906:d25f:b0:a7d:391f:17af with SMTP id a640c23a62f3a-a7dc50a47c2mr719346366b.51.1722808538364;
        Sun, 04 Aug 2024 14:55:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:38 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 07/13] clk: samsung: exynos7885: Add missing MUX clocks from PLLs in CMU_TOP
Date: Sun,  4 Aug 2024 23:53:52 +0200
Message-ID: <20240804215458.404085-8-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In Exynos7885 (and seemingly all modern Exynos SoCs) all PLLs have a MUX
attached to them controlled by bit 4 in the PLL's CON0 register.

These MUXes can select between OSCCLK or the PLL's output, essentially
making the PLL bypassable.

These weren't modeled in the driver because the vendor provided drivers
didn't model it properly, instead setting them when updating the PMS
values.

Not having them modeled didn't cause any problems in this case, since
these MUXes were set to the PLL's output by default, but this is not the
case everywhere in this SoC.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 drivers/clk/samsung/clk-exynos7885.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index 87387d4cbf48..a0c9b7cc6942 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -17,7 +17,7 @@
 #include "clk-exynos-arm64.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP			(CLK_GOUT_FSYS_USB30DRD + 1)
+#define CLKS_NR_TOP			(CLK_MOUT_SHARED1_PLL + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_TREX_P_CORE_PCLK_P_CORE + 1)
 #define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
 #define CLKS_NR_FSYS			(CLK_MOUT_FSYS_USB30DRD_USER + 1)
@@ -162,6 +162,10 @@ static const struct samsung_pll_clock top_pll_clks[] __initconst = {
 	    NULL),
 };
 
+/* List of parent clocks for Muxes in CMU_TOP */
+PNAME(mout_shared0_pll_p)	= { "oscclk", "fout_shared0_pll" };
+PNAME(mout_shared1_pll_p)	= { "oscclk", "fout_shared1_pll" };
+
 /* List of parent clocks for Muxes in CMU_TOP: for CMU_CORE */
 PNAME(mout_core_bus_p)		= { "dout_shared0_div2", "dout_shared1_div2",
 				    "dout_shared0_div3", "dout_shared0_div3" };
@@ -189,6 +193,12 @@ PNAME(mout_fsys_mmc_sdio_p)	= { "dout_shared0_div2", "dout_shared1_div2" };
 PNAME(mout_fsys_usb30drd_p)	= { "dout_shared0_div4", "dout_shared1_div4" };
 
 static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+	/* TOP */
+	MUX(CLK_MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
+	    PLL_CON0_PLL_SHARED0, 4, 1),
+	MUX(CLK_MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
+	    PLL_CON0_PLL_SHARED1, 4, 1),
+
 	/* CORE */
 	MUX(CLK_MOUT_CORE_BUS, "mout_core_bus", mout_core_bus_p,
 	    CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
@@ -232,17 +242,17 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 
 static const struct samsung_div_clock top_div_clks[] __initconst = {
 	/* TOP */
-	DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "fout_shared0_pll",
+	DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_pll",
 	    CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
-	DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "fout_shared0_pll",
+	DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_pll",
 	    CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
 	DIV(CLK_DOUT_SHARED0_DIV4, "dout_shared0_div4", "dout_shared0_div2",
 	    CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
-	DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "fout_shared0_pll",
+	DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "mout_shared0_pll",
 	    CLK_CON_DIV_PLL_SHARED0_DIV5, 0, 3),
-	DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "fout_shared1_pll",
+	DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_pll",
 	    CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
-	DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "fout_shared1_pll",
+	DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_pll",
 	    CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
 	DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "dout_shared1_div2",
 	    CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
-- 
2.46.0

