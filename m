Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A620E033
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741343369; cv=none; b=SZUTpTkxIBszAnD6mfN8sHYGFFNCYCxxhaTLY//VZcXAbCL2CP7k/pUuC5kHzUVZsCfxPQhAwBnvnO5DiWWqzZn2W8kPWgFBg01/f4EuNDoHs7xk/n9gUmlaXTin+7gg0OWs2HKd+W71nYP4MyschZElJsU0tSukt2esyWIaw50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741343369; c=relaxed/simple;
	bh=gHaTPoGguUaCyPpPK7WmS93V+YbLGip8t6Q7NjDiqkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u34Y/Cw7Uq5nPfb+eUtPv4OuOBPVBejE/q0OgSdsiDJzW2nPt5/iJfJ7rvCj3LQk+ijRg7BdHFZUO/dIM37lZuepcSyMRXDlzKEqwCCdCJrsUnbhv5OWOpNlOFh3sflfXgkNFJF2n5qxgX82q8PkFHeG3+6VwC7G90B42XEDaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LpsIVTEg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LpsIVTEg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so12981395e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Mar 2025 02:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741343366; x=1741948166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xHzjbhxUt+ejXXNAyk2MsyAEfsOT4D31xY0flLavyE=;
        b=LpsIVTEg+JYTO9YUpaz30MMgjk/vEzehmUubiLHX9pe4xKYd3/HaKO6+kSpH9tpax3
         g7JCbYaivUmF/NQqKhKMPBKTahFuvperWqyvvCw2S8nSnow7ViSHYwtULthTD/zwBX61
         TXjJhgJcpGhpSId9PdbesGlzPH2Znj8nOA8gN8hI4uxMoZc4fJMnbyKg9irAM6wGOFxP
         PfuGQxJUlAJDMjuD9UIPkPli26B5XvSTwFWp3F3VprNlHQxFQuhN0d6yBEuw/PqCS4wP
         Dwx8dnNODJosoghRRnxNROhZcbbxq/l0YHfpV9Goj6RAz1IV3uZMsF/U9hiuFlDwgP4A
         H7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741343366; x=1741948166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xHzjbhxUt+ejXXNAyk2MsyAEfsOT4D31xY0flLavyE=;
        b=kYW3+KYuZJpQD4bhU1GcbWfQozozqIFDR2To2dCVfMcHpzN0eqbxhwE1+gWonHLykW
         OBjWfreFbezemmySihCSxqXMLxYWuuF22rIMRGTW0v+Tez7DF4b/I1CYIGgXbP9IkSVS
         gb8xJZDzfIMV4kahNqqkfM01d6gtgV/kxahJCKkYlVQBR63aWZ+Q7C6CR1v2193Dg9iX
         eJgbtjj148fFICIYhQxb7RyKvRoRJf9XxCmRuKa2F26RPqrQIjSlrGhQ78ewAAzceX+d
         V1XU99TMAOjWBC0EU1BpW8qN4TQ8hg896gxW95lZ/jTbWnr8EQfCO//+AeD9S+GCXiZW
         TGIg==
X-Forwarded-Encrypted: i=1; AJvYcCUcJHHyIp2P6KaiylzftlPUkGN+cInvhKc12x/PWWTXX5eYPMZMi5CMkTfGHHxq/S+lr5cFHGIwnKbWsclLjsdPNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY2EqcFxKmjgfHn1pezRhmuy5iU5BgBPiJM1d+qGbcbwkmRONM
	4uXzYLE/fY3Wrr8JQm1LriI0QTCDJvGrY+JTBDoqVefhmwnagi+xzPxgwxMt/0I=
X-Gm-Gg: ASbGncvqBu9RDwTK7MPOXSTCZr6nBuoS2i8tvxNkXyeyo+N/bqVEg/5XIeLkRQCrxN6
	IOrk0g5IMd3pGDoX1m5PB5ZdTMiNx2lNt5l3eoIBNNSIwYs8AioThJEC2zJs4qhGNtYDOaO/LEb
	L06bJAPoQvJLKzh1SqQkkGbqcMAQR1VgqTO8dqsnT8uxgYEcTkkJL6w6h0VSjU3lraNLD68TQPK
	dn689TZBvHEgUQmYQXF4+wnsavBgQUWJJgwpdyyL667njXGsFk5ZIe9912iYZlrNh3IIwi97QVJ
	SRQrcOsPUdyhPS6j6HNAAb6jPBe7P2mmMvoIrDkTKKRduqoDF1CpuS8Tllh0mCHYoJ2x/0qPF5M
	=
X-Google-Smtp-Source: AGHT+IEdrRaT3XD+1oklvg/JlOcr86S5WA2vZM0/xp0SCkAFq70x8DSaNOHjhsJq85Fq8JQoP9uxVA==
X-Received: by 2002:a05:600c:1907:b0:439:8e3d:fb58 with SMTP id 5b1f17b1804b1-43c5a5fe368mr24280095e9.11.1741343365786;
        Fri, 07 Mar 2025 02:29:25 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0461sm49192955e9.4.2025.03.07.02.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:29:25 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 07 Mar 2025 10:29:05 +0000
Subject: [PATCH v4 1/4] pinctrl: samsung: add support for
 eint_fltcon_offset
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250307-pinctrl-fltcon-suspend-v4-1-2d775e486036@linaro.org>
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
In-Reply-To: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11226;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=gHaTPoGguUaCyPpPK7WmS93V+YbLGip8t6Q7NjDiqkU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnysp+YlwWO4ZMpW4A5rUnQ2AEy5Y9jX1xwUS4r
 IhypW+oH5KJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8rKfgAKCRDO6LjWAjRy
 upNxEAChnq5HV1vg0whcQZUwuU/i/TRKn/G6rSFVAFC0b8TcEZhrFDEKOkJKDDZc5zCgK/47tJq
 jzpeqbsdDtOMKA38aoYFzoikCMZu26Ez0N4G6Bk3nT+SEbz/b+Is+c+AxJ81MEHPnc2XcAMDNZm
 t3Xtx2B1C63SnEyfxk8Rt0+l8lrK7cWHUJe4bbWRsCTsZOBmisCeH8LfrOFFOzqVbEFVdaz1xFJ
 IoefGrXdqahOOGcx2DYg7nyCRbPUeKd7+xwWNpB85sJ87jqmLZnaGrUbu8Ir0yrqhLHgiPGHv38
 eAjJzoMf60Oez+YigsB3+i6TAlJbMtFkrE+uTC3xqIuVMyaK44poyPO0If/+Rqo4WhV7q6gMt3+
 ySGCng3Nx+85lm2RO7CUbOpworrPvNSLP1Q96yDVqpY5u3AHDD/WHagJRUNkYTqK2G6bm4PIrLJ
 bD5mBRW+7agf1n60rnXHvg6cnpXX4UN9m+7mdKHrqVHTFSSwZD+j9rUSfhSvKXyANYRLgD/vnyH
 uzyV3bgUOMx2BXxqQQ7nj9Lyebr0CuXQlpl50xLM1gxm39VcaStMYhBIVMkTa7Oi1qI/6At8Kml
 XvqRhIiNz4YsYZctCNkhj8k/WjUVSrypIGpWA3UF7rY2+a1j1CAMgMCP4ix4Uuu7cKZg86pEFO8
 jiwZosi/7/5ZKPg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

On gs101 SoC the fltcon0 (filter configuration 0) offset
isn't at a fixed offset like previous SoCs as the fltcon1
register only exists when there are more than 4 pins in the
bank.

Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
macros that take an additional fltcon_offs variable.

This can then be used in suspend/resume callbacks to
save and restore the fltcon0 and fltcon1 registers.

Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
Cc: stable@vger.kernel.org
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 98 +++++++++++++-------------
 drivers/pinctrl/samsung/pinctrl-exynos.h       | 22 ++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  1 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  4 ++
 4 files changed, 76 insertions(+), 49 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 3ea7106ce5eae3c21f11790b5a40037042c1d407..e28fe81776466b693417c66bb15752d609b79eb1 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1370,83 +1370,83 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 
 /* pin banks of gs101 pin-controller (ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_alive[] = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10),
-	EXYNOS850_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14),
-	EXYNOS850_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18),
-	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c),
+	GS101_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
+	GS101_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
+	GS101_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
+	GS101_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
+	GS101_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
+	GS101_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
 };
 
 /* pin banks of gs101 pin-controller (FAR_ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c),
+	GS101_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
+	GS101_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
 };
 
 /* pin banks of gs101 pin-controller (GSACORE) */
 static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
-	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
+	GS101_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
 };
 
 /* pin banks of gs101 pin-controller (GSACTRL) */
 static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
-	EXYNOS850_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00),
+	GS101_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
 };
 
 /* pin banks of gs101 pin-controller (PERIC0) */
 static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
-	EXYNOS850_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c),
+	GS101_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
+	GS101_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
+	GS101_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
+	GS101_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
+	GS101_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
+	GS101_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
+	GS101_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
+	GS101_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
+	GS101_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
+	GS101_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
+	GS101_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
+	GS101_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
+	GS101_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
+	GS101_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
+	GS101_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
 };
 
 /* pin banks of gs101 pin-controller (PERIC1) */
 static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c),
+	GS101_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
+	GS101_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
+	GS101_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
 };
 
 /* pin banks of gs101 pin-controller (HSI1) */
 static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04),
+	GS101_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
 };
 
 /* pin banks of gs101 pin-controller (HSI2) */
 static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
 };
 
 static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 7b7ff7ffeb56bdde2504ec90c8df13bdd1ace70e..33df21d5c9d61e852834031570d4a0ac0e51f6a4 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -175,6 +175,28 @@
 		.name			= id				\
 	}
 
+#define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
+	{							\
+		.type			= &exynos850_bank_type_off,	\
+		.pctl_offset		= reg,			\
+		.nr_pins		= pins,			\
+		.eint_type		= EINT_TYPE_GPIO,	\
+		.eint_offset		= offs,			\
+		.eint_fltcon_offset	= fltcon_offs,		\
+		.name			= id			\
+	}
+
+#define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
+	{								\
+		.type			= &exynos850_bank_type_alive,	\
+		.pctl_offset		= reg,				\
+		.nr_pins		= pins,				\
+		.eint_type		= EINT_TYPE_WKUP,		\
+		.eint_offset		= offs,				\
+		.eint_fltcon_offset	= fltcon_offs,			\
+		.name			= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index cfced7afd4ca6e99c7e72a588d780f0542990ed9..963060920301ec90affb2ee6d758d3d602ffb4a9 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1230,6 +1230,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_con_offset = bdata->eint_con_offset;
 		bank->eint_mask_offset = bdata->eint_mask_offset;
 		bank->eint_pend_offset = bdata->eint_pend_offset;
+		bank->eint_fltcon_offset = bdata->eint_fltcon_offset;
 		bank->name = bdata->name;
 
 		raw_spin_lock_init(&bank->slock);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index bb0689d52ea0b4392714fa9bcdcbae8d253c73a1..371e4f02bbfb375964b7833beb9bbc098a51f4a3 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -144,6 +144,7 @@ struct samsung_pin_bank_type {
  * @eint_con_offset: ExynosAuto SoC-specific EINT control register offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
+ * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  */
 struct samsung_pin_bank_data {
@@ -158,6 +159,7 @@ struct samsung_pin_bank_data {
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
+	u32		eint_fltcon_offset;
 	const char	*name;
 };
 
@@ -175,6 +177,7 @@ struct samsung_pin_bank_data {
  * @eint_con_offset: ExynosAuto SoC-specific EINT register or interrupt offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
+ * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  * @id: id of the bank, propagated to the pin range.
  * @pin_base: starting pin number of the bank.
@@ -201,6 +204,7 @@ struct samsung_pin_bank {
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
+	u32		eint_fltcon_offset;
 	const char	*name;
 	u32		id;
 

-- 
2.49.0.rc0.332.g42c0ae87b1-goog

