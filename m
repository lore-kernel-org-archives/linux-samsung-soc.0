Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD3C23C51D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028643; cv=none; b=gsF9PmpYcjBA1tzK4kCDWNAdvc7XqqwsfFBJCN5MOURgwv+Qcl07QayDbH6wMYmQCVHVV4Xcw6znOaebXt/ij6gMwg2BjVimLzd+IeMNzq8o/V/10XswKCzE1cefTdsyNK6rMsYTkyAV3HqxxGaliziLSifANtGGSMg2CBPUgWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028643; c=relaxed/simple;
	bh=c/0o32UHHPR53Ko/1QO7CYkQ8/mLPJcwy6nuModIVJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAD8MoVE9T98fzGAzIB9nhiorPN9rCZwG4GBXgvuBw75+T0Ko5H6sQxplWsHO7sgPKDWTARX4jyqUCuDSmalWQuicErWg89tTTcfB6Lc1KnjMoV7oCyWDpe4zn1skrUe/Z1Vmu5RkeE7qk/kKF4ta3JI03gQ0mi15S+TH21F6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VeJqmnQA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DR5uL4cj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VeJqmnQA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DR5uL4cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/24W4AwvWyRwYbo6ULJEPyQOBfb+Ll9imS0OxoxU8g=;
	b=VeJqmnQAos35D+mjQtRk0YvaskA0YFaKmyA/JJohVWd58VitSHl5R0f1stwEHG30bW2XLO
	2XOTtY8tTpgBMGNfUEVM3L/PK71uXZLT7H09YMHxYbcEJuJcIAH6NpxSpXzdkyGXRGEWqk
	xI/Bq0pS3w44jVEvfwkeFfSgdyFqruM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-IOcw6j1SO_2fCuM8tkqWxQ-1; Tue, 05 May 2026 20:50:35 -0400
X-MC-Unique: IOcw6j1SO_2fCuM8tkqWxQ-1
X-Mimecast-MFC-AGG-ID: IOcw6j1SO_2fCuM8tkqWxQ_1778028635
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ebe2c596c6so1140968985a.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 May 2026 17:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028635; x=1778633435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/24W4AwvWyRwYbo6ULJEPyQOBfb+Ll9imS0OxoxU8g=;
        b=DR5uL4cjYOCVerDPHhP477QZi7BX5WDX3E+YOZfyeR/hf8h4x+xlYv5b5qwWKX6jiS
         FbzMr3bvQbpWdGKUeUem5gDOxu7ICOFyTVyoJlmSyeSPIpgcgD9+RUkfLghQ3rIXRJRp
         1D1NgmiGrsOfsU8inl60Wh1htR5apS2JkstLS4V5PnGnO1N0pGj0AU4+VxmqJoY68hkj
         +DkYTdzhCGXGYSnAhIWzQNN96uPg3jKlgHecMe22MbryvEBTnq9dG4jhr34c/waLQEIc
         3Av01T3pQu9bDFM6/gWIpQuYGx6tg6alkyklma6b0XgBwiotzHdUhHQUeea93qJkMv2L
         HdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028635; x=1778633435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/24W4AwvWyRwYbo6ULJEPyQOBfb+Ll9imS0OxoxU8g=;
        b=DwYBKnG45APsmLkz7OkpwyJr5R2h3AHCyUZRuRuHQoOjoFd3Yfs3YeaGCqqNHLjRNK
         wWM5DJ2KlALRBRyja0hLBSTo9KDontpAAOvc3stPk84D3t7AG3UYu1IX8C1sqlZnu7oq
         zBbN8jxksHfOejsaZ/L15Mpyw+cpcUDRcrw5bxt5oPLPGT90c8ilU25rgzuaBrynBoKg
         3mqutQz3SY11yBC209mzNkOc85oW6zZE7uDxu/zXFqMOC25YD3/jWRfNiL0u4h27AaFH
         HxdRJA9QLhFHXvjvwvLRLfSc8KZ48yC5tDd5FhTcD1fWBF1N0mVZmNukU6WkGStLAxum
         yzAA==
X-Forwarded-Encrypted: i=1; AFNElJ9wrP9ixE+v6d5ub3MSVPODa1eWcllqcymbgELiAfJlKt1uEPQN/J73E/FzUzvHlBw6WC0I2u8LNB5Jd2xHE6yx+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjthMahdlP0m4PwprQDgC2eAo0Rrh82D8Cf0B4UUm+hxViUgDG
	bHSXduhWliIavgJ+3SzEtO7WLI6w0/YC/cDCX4wEK7YOephqFjD6xkqDdTqoqzkHcYA7spF5HGp
	opw3K1it7Hn3Ig73fjY1/rxMImYyqCsHCjPJNkMOr4WIoltyNTb2p0K6YYpEpL7d8nMsGk04l
X-Gm-Gg: AeBDieua45xXSxcuYGS4+XRDRI1sG5EUmlW7R4SM5P/DFEAYU6Em3Y/i+Y7nm7fjfzK
	c7Vb1tBHOi3XHf6zGDBmxwBeXpXz/fmen5oh7L8457rvJVWhC6HYnEd/oOt9NFRugJZ4JtqECNt
	1ZGVaB/YDAZTsRKlcV+or8kL8R+u7gQ/Ln83/ZvNIpu+3Fa5W3VYxSYP5ok19FqBfw3s+EV0mUX
	Grz5EAw4wftd1cUljgqGzKGxXiY047zt1pdsng/CYhB0BeP4E4mME2UnSe3/ljecxgfGs2FUHAr
	p89Rn/ZwCmE5SsoBmlzwVm6WHO8WLrPjVN+IIQzm/x2KGAglGFJfc0H6/IUJk01oS45Sq09iIPO
	MI0kzkpj2cQAGtzClS7E4EBEzvYxWQFtbN5GNV3UnsNrOBjQxiHkJIEFKgFNv1PyWaPXy9k63
X-Received: by 2002:a05:620a:2697:b0:8ee:7878:af33 with SMTP id af79cd13be357-904d3fa461fmr222468985a.4.1778028635215;
        Tue, 05 May 2026 17:50:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2697:b0:8ee:7878:af33 with SMTP id af79cd13be357-904d3fa461fmr222464185a.4.1778028634644;
        Tue, 05 May 2026 17:50:34 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:48:58 -0400
Subject: [PATCH v3 02/15] clk: add clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-2-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulfh@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 arm-scmi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4050; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=c/0o32UHHPR53Ko/1QO7CYkQ8/mLPJcwy6nuModIVJM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TXD3X1X5dNIk97U9eepfJ2/Ueey2OvvzxVCDB6e+7
 NjO5lu4rKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJPItnZLi38Kv1kt/xKhcE
 lrD8PFhVqHlf+UzKp+/rPlyZ9Cvi0mxdRoa/X14/do/lFA8NtajlrzbRUt7fFtq1Z1vWXy0d6bZ
 H2pwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a new helper clk_determine_rate_noop() that's for clocks where the
rate rounding is handled by the firmware/hardware, or the clock is
capable of any rate. The requested rate is passed through unchanged,
and the actual rate will be learned via recalc_rate() after the rate
is set.

This shared helper will be used to get rid of the driver-specific empty
determine rate implementations that are present in the tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Anson Huang <anson.huang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrea della Porta <andrea.porta@suse.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Orson Zhai <orsonzhai@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: arm-scmi@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-phy@lists.infradead.org
Cc: linux-pm@vger.kernel.org
---
 drivers/clk/clk.c            | 18 ++++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..956e147f4d4e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -882,6 +882,24 @@ int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
 }
 EXPORT_SYMBOL_GPL(clk_hw_determine_rate_no_reparent);
 
+/**
+ * clk_determine_rate_noop - clk_ops::determine_rate noop implementation
+ * @hw: clk to determine rate on
+ * @req: rate request
+ *
+ * Noop determine rate for clocks where the rate rounding is handled by the
+ * firmware/hardware, or the clock is capable of any rate. The requested rate is
+ * passed through unchanged, and the actual rate will be learned via
+ * recalc_rate() after the rate is set.
+ *
+ * Returns: 0 always
+ */
+int clk_determine_rate_noop(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_determine_rate_noop);
+
 /***        clk api        ***/
 
 static void clk_core_rate_unprotect(struct clk_core *core)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b01a38fef8cf..334b9211a157 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1431,6 +1431,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 unsigned long flags);
 int clk_hw_determine_rate_no_reparent(struct clk_hw *hw,
 				      struct clk_rate_request *req);
+int clk_determine_rate_noop(struct clk_hw *hw, struct clk_rate_request *req);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
 void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);

-- 
2.54.0

