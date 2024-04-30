Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473051272AB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714470932; cv=none; b=bnwPkl+M9Nz7kg38UO/xhxkweoYZJ+L84NKJD+IwVRGCxS5p2yzDsnxAiwdpFLQ9L27bvDlccaumchS9+lvI6QYUE8NQYgq8UUHreAZKC1pe3Revo64VRgHNdioeTRINkEDWxg5LNlxbjBVlpz/zl1Ov1RiQfCHe7CXV9JFvx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714470932; c=relaxed/simple;
	bh=9lx880lfiI6yD9a/xUAVu/CVpco3Im6UqhcEbDnVlws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MVjYLb0mWAnCtwDHjy0EZH3WGyM8WMqXpQnCkncefSSlRaxst6Y90mpO63fDnK8LDWWzGLtnXUjeW+tbuh/PFnIxYjCCOjUNpDL0Bb+mmldmP/k4SPX1lVtnKJslRuIQnamEPRxEKfFH7e+NCgO4MBZKKZIE3NMth7axISJaaEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tcWq37AR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tcWq37AR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51a80b190bso352348266b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714470928; x=1715075728; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LIvR9hyWtdM+/jljJrdEtSyYzizLCNd2LjUpy5o2Iys=;
        b=tcWq37AR5sEPtXyHr5JvSUWy/b6Hb4/AaSTbbtPXkbxfSYBIcZMuWMmqm9gHr0g8rT
         m5LeXpCTm2g0Zm2LiwFCLuLhNTkBIMI0Xtsyqm33kH/srXa6FDnGkzKUyIabzZyT+r2T
         m2qlsYQRLiwW6xz0z11zn98F2VbVsL6c7EOiNbOW6kxwnf7oxtmril8BT2oEkwiOQpIU
         ZCw/9j5FC9IBTINk2Hr1NtDuDiOGFf5D1mXly4nVZ+OUtbK2H4wrGuY450oQphJ/3OD5
         yVm23NXmXg1yrlrm0b98yh7a927OsYzwkrDU7mfvBLwY8yB2x530tYbzKAKymBZ7B5HU
         uHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714470928; x=1715075728;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIvR9hyWtdM+/jljJrdEtSyYzizLCNd2LjUpy5o2Iys=;
        b=On0XDCDb1n5UTs8FK+YlPzViipDe08/jxtWi066qiRPvXa/+9X+rEqUclA7SihRBnw
         AYusy/CBDy9MVXX7/4/kmU//j2+AuA/PGg8yeHBnpAlkDqm9Psx4Bdc5v/9ccZ6Ixaah
         NPmf7r0lMdxpUoSBzy05CWODg6U02hpmLfqFpuwkOvqMDfJzM5NTd0wg82EGzxpY7yW1
         FN+Xgi1XPC/H02jy36MNLFMs0++TLPmRrYornrLCIP8QdGQXrAObHdm9aFZNvI2+7vDR
         NPeaAyrpjaOw/qyzHVUNUI2mYovjPtp13ZEGIYLYTtm3dEf7f20nduqtA86YDRtCEior
         ncgg==
X-Forwarded-Encrypted: i=1; AJvYcCX5Dj0lksDtWWhe0Ns31Dy6dWHsquR44yom0lXDD6627y5bvRTNlrUFkMsiWMZWtC2107LJUBwMNx0PPZ2p5I3tvsXw4UbrEh233INXNwrg43s=
X-Gm-Message-State: AOJu0YwIjjOyip0SLZqluvqXsF0orDh6r09thnyQPvfIQrBeBi+tohIM
	tKw3Gs+5bxHssBXiG9ooe2F0tYkL6JgC6FBVUpQ70to7Khc4+dujIoIW0kj8xhg=
X-Google-Smtp-Source: AGHT+IE6fV0iB/xgSECdLEU1cMbMP4tHIStnA0sSkf5GyCXZmTRa+hHGM14tL6YsA5PHe09Defti1A==
X-Received: by 2002:a50:cdd2:0:b0:568:abe3:52b2 with SMTP id h18-20020a50cdd2000000b00568abe352b2mr12260940edj.23.1714470927657;
        Tue, 30 Apr 2024 02:55:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id dq16-20020a170907735000b00a524318c380sm14886833ejc.80.2024.04.30.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:55:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 30 Apr 2024 10:54:59 +0100
Subject: [PATCH] clk: samsung: gs101: mark some apm UASC and XIU clocks
 critical
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240430-gs101-apm-clocks-v1-1-b2e2335e84f5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPK/MGYC/x3MPQqAMAxA4atIZgOpOqhXEYc2Rg3+0oAI4t0tj
 t/w3gMmUcWgzR6IcqnpsSe4PAOe/T4J6pAMBRUVVSXhZI4c+nNDXg9eDMdAjatZvHCAlJ1RRr3
 /Zde/7weAuo/yYgAAAA==
To: Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

The system hangs when any of these clocks are turned off.

With the introduction of pinctrl clock support [1], the approach taken
in this clock driver for the APM clocks to rely solely on the
clk_ignore_unused kernel command line option does not work anymore and
the system hangs during boot.

gout_apm_func is a parent clock to the clocks that are going to be
handled by the pinctrl driver [2], namely
gout_apm_apbif_gpio_alive_pclk and gout_apm_apbif_gpio_far_alive_pclk.
It also is the parent to the clocks marked as critical in this commit
here (and some others that aren't relevant for this commit)). This
means that once the pinctrl driver decides to turn off clocks, the
clock framework will subsequently turn off parent clocks of those
pinctrl clocks if they have no (apparent) user. Since gout_apm_func is
the parent, and since no drivers are hooked up to it or any of its
other children, gout_apm_func will be turned off. This will cause the
system to hang, as the clocks marked as critical in this commit stop
having an input.

We might have to add a driver for these clocks, but in the meantime
let's just ensure they stay on even if siblings are turned off.

For the avoidance of doubt: This commit doesn't mean that we can boot
with clk_ignore_unused.

Link: https://lore.kernel.org/r/20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org [1]
Link: https://lore.kernel.org/r/20240429-samsung-pinctrl-busclock-dts-v1-0-5e935179f3ca@linaro.org [2]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 05129c3b2f68..e2a6a1992505 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -1896,16 +1896,16 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_G_SWD_IPCLKPORT_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_APM_UASC_P_APM_ACLK,
 	     "gout_apm_uasc_p_apm_aclk", "gout_apm_func",
-	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_APM_UASC_P_APM_PCLK,
 	     "gout_apm_uasc_p_apm_pclk", "gout_apm_func",
-	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_UASC_P_APM_IPCLKPORT_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_APM_WDT_APM_PCLK,
 	     "gout_apm_wdt_apm_pclk", "gout_apm_func",
 	     CLK_CON_GAT_GOUT_BLK_APM_UID_WDT_APM_IPCLKPORT_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_APM_XIU_DP_APM_ACLK,
 	     "gout_apm_xiu_dp_apm_aclk", "gout_apm_func",
-	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_BLK_APM_UID_XIU_DP_APM_IPCLKPORT_ACLK, 21, CLK_IS_CRITICAL, 0),
 };
 
 static const struct samsung_cmu_info apm_cmu_info __initconst = {

---
base-commit: d04466706db5e241ee026f17b5f920e50dee26b5
change-id: 20240430-gs101-apm-clocks-fb0918ceaecb

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

