Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145BB13A87C;
	Sun,  4 Aug 2024 21:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808520; cv=none; b=AEpl0OkCM/1/bu8WwIQXz+D/uF3ki2GDjbuyxG/iP0Zbwhsk/TH9+qYevDYx0hCzSW5j0vFwZeNozNJ0O0L87Mrt6vKEBsaGlUd8PiiPc01/oO7rLXNJvQZ1Db9Mdk9eUoQXDYLtrvtF1bZz4VFwSjN/vNhMedHQEALtFCqthYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808520; c=relaxed/simple;
	bh=N3zVM9WjxApsrr59Be3h9gRQpWe/tK+ERo+/QuIitcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnDS+VF5D9jZD5wQYMaMVnlhFD08uZlZg+DIgOmqACYpDqIuUZk27CSFVdGr/nWpmM6COWbNNwF83ZtnafL6kY00fSfOEehvHJpfYvK37MSbK0QcOMzG0HXN7sTlI/Y0uN8rKuOF7/4f3GwZ4lxS9TipP8QY96M57n/GQ/Im7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLBqrNX+; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLBqrNX+"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so6985354a12.0;
        Sun, 04 Aug 2024 14:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808517; x=1723413317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnqKBVLkVbPU4IXqUitU7Vb8AZX6hoKEj/nS2/Cpby8=;
        b=mLBqrNX+vIuwsqDcFvc3u5Op4qxo0WsU80YRrtE/oZGKVOhpQ7yUzvcJlGbdysKWnL
         Qpk0fRgohOPWktN/6HrPJ3Y/cODi4xXvqPPULbK1PYujx7LVT2FnhtZnhMp8kL3VuciW
         AAQQfPLuDPzqW3VruvL9BsPPOIthavizuXZhgU9Dzlap/GjfdMPM6CbPJPB3kJxjEHKw
         a2Y4npwbJ3z0RXeCGZgINg8PAs0F3cwUu+NZ8J+zPdPrxos6xRFvRV1amnJFWnVr9VvN
         dyM0crUrZqQSqtagNKH8M5iqWEw3hy220OtZEENHzbdynqodJf3RFeMZjEAjQYyMIMe7
         MPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808517; x=1723413317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnqKBVLkVbPU4IXqUitU7Vb8AZX6hoKEj/nS2/Cpby8=;
        b=sQIxB8SJdL3r32NO2wqOr4N5PIBAtSNGJNybMYH8xvmvrSvPB2bRlsciN4eOc507AY
         CtqjjvBJfoemTVn/Y8FzWIWfrYbWi1lkBy6PAUoQAH3m4h1t3uRAWZIXEf3lUaVFgSbl
         0I2WXH66PhlKZQBUcU4CyOhPLyTAu2sRPsAeXvv/UPHBV4u9klvSLK+2YsQiNiop12Ta
         8O/3UEY/nLbuWfeSgRqYVzMD1lqmpMwQbIq/7uFMjcofrRIcHA039phEiSrYnRMhiJiB
         n/nMP+fa9lVoz2YFmqqLOqyA5JrC+OolKFAhizg5rcQilkEfQeEFb8vJDi70a2ggKC2b
         AAjg==
X-Forwarded-Encrypted: i=1; AJvYcCXBJK7kDTZh7ez8arcJpdk9dfa8X1ZBCF+5rU4hZFiL0TpRHlV6T/jdKytcxlgW8KCXp5BosS1k+zFdrXipaE+AumiS1gKgjJ9wQxxU/oCjVdmJQ/HQENT5Y6gudDpKnhS7JH4zXgqv14O5r9L1fGby5mupreeF82gswcXwXkBTdznukThQ2nWgOSMCKytmtPeqA17mRr99QnUDL7SrfpyuRere41W2RksB0iqzdipBlrwD5clQTh7dXajWq6sBksAi
X-Gm-Message-State: AOJu0Yx+VNbX3UwGsjfHMjObJs7pI5xXuAVQS3RveM12IcS9UTFLUNVm
	V2/f/K0vur0Tuwxo2aPIxiZZ7hjjm1pwqJLDyiLFarr4R78VfCS+
X-Google-Smtp-Source: AGHT+IFtygrQuiSBintHx5W6ocZLAzQsG+1XvtKEK77LBl6f8+VAzKFjAwdsj0j0dO3Bx/GbHi1UqQ==
X-Received: by 2002:a17:907:2d06:b0:a7d:a080:bb7 with SMTP id a640c23a62f3a-a7dc4fdfe6dmr762216066b.36.1722808517365;
        Sun, 04 Aug 2024 14:55:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:17 -0700 (PDT)
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
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
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
Subject: [PATCH 03/13] dt-bindings: clock: exynos7885: Add indices for USB clocks
Date: Sun,  4 Aug 2024 23:53:48 +0200
Message-ID: <20240804215458.404085-4-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 USB Controller with Exynos USB PHY which in
theory supports USB3 SuperSpeed, but is only used as USB2 in all known
devices.

These, of course, need some clocks.
Add indices for these clocks.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 include/dt-bindings/clock/exynos7885.h | 30 ++++++++++++++++----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/dt-bindings/clock/exynos7885.h b/include/dt-bindings/clock/exynos7885.h
index 4ce86810b10d..cfede84b46b9 100644
--- a/include/dt-bindings/clock/exynos7885.h
+++ b/include/dt-bindings/clock/exynos7885.h
@@ -134,16 +134,24 @@
 #define CLK_GOUT_WDT1_PCLK		43
 
 /* CMU_FSYS */
-#define CLK_MOUT_FSYS_BUS_USER		1
-#define CLK_MOUT_FSYS_MMC_CARD_USER	2
-#define CLK_MOUT_FSYS_MMC_EMBD_USER	3
-#define CLK_MOUT_FSYS_MMC_SDIO_USER	4
-#define CLK_GOUT_MMC_CARD_ACLK		5
-#define CLK_GOUT_MMC_CARD_SDCLKIN	6
-#define CLK_GOUT_MMC_EMBD_ACLK		7
-#define CLK_GOUT_MMC_EMBD_SDCLKIN	8
-#define CLK_GOUT_MMC_SDIO_ACLK		9
-#define CLK_GOUT_MMC_SDIO_SDCLKIN	10
-#define CLK_MOUT_FSYS_USB30DRD_USER	11
+#define CLK_MOUT_FSYS_BUS_USER			1
+#define CLK_MOUT_FSYS_MMC_CARD_USER		2
+#define CLK_MOUT_FSYS_MMC_EMBD_USER		3
+#define CLK_MOUT_FSYS_MMC_SDIO_USER		4
+#define CLK_GOUT_MMC_CARD_ACLK			5
+#define CLK_GOUT_MMC_CARD_SDCLKIN		6
+#define CLK_GOUT_MMC_EMBD_ACLK			7
+#define CLK_GOUT_MMC_EMBD_SDCLKIN		8
+#define CLK_GOUT_MMC_SDIO_ACLK			9
+#define CLK_GOUT_MMC_SDIO_SDCLKIN		10
+#define CLK_MOUT_FSYS_USB30DRD_USER		11
+#define CLK_MOUT_USB_PLL			12
+#define CLK_FOUT_USB_PLL			13
+#define CLK_FSYS_USB20PHY_CLKCORE		14
+#define CLK_FSYS_USB30DRD_ACLK_20PHYCTRL	15
+#define CLK_FSYS_USB30DRD_ACLK_30PHYCTRL_0	16
+#define CLK_FSYS_USB30DRD_ACLK_30PHYCTRL_1	17
+#define CLK_FSYS_USB30DRD_BUS_CLK_EARLY		18
+#define CLK_FSYS_USB30DRD_REF_CLK		19
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_7885_H */
-- 
2.46.0

