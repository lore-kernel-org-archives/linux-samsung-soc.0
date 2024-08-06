Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088FC1C7B65;
	Tue,  6 Aug 2024 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722946296; cv=none; b=Yy6HkII3LmgZenYK0bHEUbg2sCMGih93WY8hs0tjERFUeYy4A/ch77Y78KuAtLatSPGl8k+mAnwRydKul4FuK/MVl8UwMEbTKGZGqZaIU6doQpzo1U9jExipAaTSJ/s+fMgl+1lgb++oQk6FjeL6Ne7uVrfltyxzTTa6C5jbNHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722946296; c=relaxed/simple;
	bh=N3zVM9WjxApsrr59Be3h9gRQpWe/tK+ERo+/QuIitcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Helcfzn9Ji2Xba4WtRVdubOmwAhyzRq9ehmSXZbrjYuXc6VFfy2AtSy62KZNT0FpS3FIcsPmaHRPukSxvC7N5sh7MDtn583EcZk4d5WWDFdLIMAYEANOvTJAwPXqVaLENsNOCL/WjlcmpaOmKl+VdTSNLlTWFuSqHQ9pApzfAhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBS1vHJY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBS1vHJY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso670717a12.2;
        Tue, 06 Aug 2024 05:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946293; x=1723551093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnqKBVLkVbPU4IXqUitU7Vb8AZX6hoKEj/nS2/Cpby8=;
        b=RBS1vHJYCKuhJNhRC06DYHSbLz48s2D+ws86nS38IePW8B+4WoVjT39NkEd32yxMXW
         tiuthv5kfZp2CaHzU4A9trvyC9MesmseteIcbtRLtaqu+I5EeR2sF3x1br7Eaw2is9AM
         vmBTeZ0HCRGnpz0xE3JkJxaUTWo0uo1jqzxeXkCOGVHy6knpzRd6KoP1e/bzJuTTqP26
         6ADwXiwYCkuEjZkqJe1w9YgpqDDTZlz1yJ/mZ3qqMudqEIBI2U7N+E3AFulVDNiVTtH/
         tMA/Fccyi23w8T+Pm34kHWSTd2DE6GbLlnEysFCdbFyFGNeCTNXOECEuBC16Bn5wTUWt
         TivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946293; x=1723551093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnqKBVLkVbPU4IXqUitU7Vb8AZX6hoKEj/nS2/Cpby8=;
        b=djeAfLzdPxy0cDps2ODVmLrcGXef81GH3m8J1qow+xud5LNJXPAuB7AASh8CKQo7oZ
         Nt6GbCcknFlb01qNCyk75B3gntXG49juvxHprVFrN4TpgwNkDv3yrUDqAYC2WYhrO52D
         JYwmUb4KdcVbxXwyHd/UGgW/ayRRtTGb3w6SQrBSEJc8/nBMQymDabym/fLI1zUY7AzB
         RtjfIAvB7+bvIHX/AnMpreS+yJWJz7M9f59ovQb/lj+9y4Evy9UDfz61kcAf91alWZBr
         MNkgXquzbmxt4Y2HapD7e3NnCS+Qy+T93OaMsRqjd0IuxH4XIK5THmCu/I+baedfYKN6
         XcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWqVLafDbeZLmB9AJjf2oJhYS8zQxMMePXheJTK/IeaeQ8LMJXerPm68VonjEMKkM14GqHoBiaTps0p2Ok70CHp0TURnYP7WLwaE+FxSRkTUEyJ3uVO8540QSbVa9FiPGst88oAu2+CR3MLjiG5891FIxEjdsGb4/i2/YiQpyBW1fi8g==
X-Gm-Message-State: AOJu0YzWiTJzReYJ5xr/HLlC1FjCSyB81I7/vOogVGkEm7eLhAy9iDzu
	BJDdAuEmws1pbmJkKS6eMFT7WAKql4s68S0EGpO+aBgAiJ92WfI/5miTVVnm
X-Google-Smtp-Source: AGHT+IER7UQAupfaALkh21KXTUHksXS5mAGOEgSKzg1JMEgFGXs1o1YHpIeUETH6wcVoq+6kQFDQIQ==
X-Received: by 2002:a17:907:2d89:b0:a7d:c9fa:e3b3 with SMTP id a640c23a62f3a-a7dc9faeb5fmr1086181066b.54.1722946293025;
        Tue, 06 Aug 2024 05:11:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9ecb546sm542080366b.224.2024.08.06.05.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:11:32 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Virag <virag.david003@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: clock: exynos7885: Add indices for USB clocks
Date: Tue,  6 Aug 2024 14:11:46 +0200
Message-ID: <20240806121157.479212-4-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806121157.479212-1-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com>
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

