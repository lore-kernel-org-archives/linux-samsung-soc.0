Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4D013B2B2;
	Sun,  4 Aug 2024 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808510; cv=none; b=IMsnCc8gwhaq2WSwPuBdJ1N9OPU6NA4rsBw+jSqRuWlnDGIy81OvdmLkgVnHnDnQ282krGp2vKuixHceqvBYKWChRXx8yuFYdSo4vcNa0EY6Be5ym+QJgnnLD6Jbp/4xdIMOlxqNBDHcGal02ugcTfz7ri7Dm/60R8E5RNa4iqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808510; c=relaxed/simple;
	bh=/Pm/+UuC9ZIN0qqlsizbigOOW873Ki0IrVvlPzPeJ2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nH6XZIiJZb2qEKRylUOA6/DyKM0Hqw449Lc2Vw0EQUfbX0XDIgEpOAq3VRCI7lpSQh4QhENLfFOm8aAaB02VUhY6duWb4ecoGURX+vsI499OXpim8Q14IUtVyMt+A5+Qrlzbuyv0BZd76uGvRjE2q2aXUwCzD+yHTKD/Q2xTKLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRFPcER2; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRFPcER2"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a156557026so12355735a12.2;
        Sun, 04 Aug 2024 14:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808507; x=1723413307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvYubfbVq4kUCAQhjBGxwtur3JW8+5d4oGvhKNwcNRM=;
        b=LRFPcER2j5Wlg5IBIyV+Ruh2IiruCkYD1MeqMZK+WNKoM0NZ27WLQ6wh8GEakXuG9y
         8A6ApgvZVQfXDrMwWHVWpo+YliF6oit6fmJepP7CIfSXx5WX9LDIrkolqvtJLuCfT0MF
         3kfDn5b8M+aflYds3Y5A3oGtGVpmSHfB4rXPIE+lT9Ywjz6C9DemwahV8XgcJlrKm7T5
         nIb47w/AUrH3PYkDCw8Itve25HuZ39667qhPT2qQQFVbpxvX7dwck//zem+HAGN2BS5Y
         YeiOXfkckYOG9wp7FK7lsjyeV9mKgjkuPMX1T1u7DXmpg4Wu5a1zx1OBpzkcG9os9D1v
         e4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808507; x=1723413307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvYubfbVq4kUCAQhjBGxwtur3JW8+5d4oGvhKNwcNRM=;
        b=OD42DIN59lI2qCLndd+wWG3+3RnX1K9rro0dtrMyobO6LVVz7+24Kz3OiWpWDpxJPy
         odw2lap2SwynSlMy3O8YVGzSkrVf0MO1TlSc32+ESlWwcQePG/P4BFlYd9Jde8d641fQ
         EFMPy9WD6ft7ADFZPhI0AROKMZ9FwX9RcsCpcPLn+8cZegJAheXRPeSPz7jUw1Dl0zv6
         xPjNbtmywh8OYq3C/7A7oJVPKkt++x/hsJaFjavUXVOASX+SwlDCXtxjTtwvHXvtHSPV
         NVkLgrGwZkZsnt88t85jvirkF0JBK5+VJRJOculd9ClViNrMOs3Nt0SRMMSMJi1cWnbL
         h8ag==
X-Forwarded-Encrypted: i=1; AJvYcCU1IhBJH1AVgxQr1Oe9aZB7SvkX+njyUOtICLjimCrdYwcR0zRN5STTYVQ6BvsxYR2us3DsreNIwfNtnkECnWJJzl+R5HVDFuXE9TGAKWxBTPgEygMPr9GE0n3/K1iJEcuHenWV/qkMqKcKW1OdFoez92l7/MpIfOyP+aQUAb+d2cH8G2FfHMxWxfZkF+RjYF9U4ZAOfxbK0NdA7JMyR/uYwR4ldMf/LkyNyzvW6BRjHCyN3UYROvH8dEUw7uy2g0yA
X-Gm-Message-State: AOJu0YxHLminHBzXOiYO0TRxQFjEitTLJYNSEeGmq/8fODCQIdeT19RH
	zmVt+Z+CJ3lOy0qDKIuw0kvWxGVd6XCBeG3NCMApBwf3MbydHgUO
X-Google-Smtp-Source: AGHT+IHZGBuLPIhPXt+S5usbtLF+u2ZCoSWc/lVqgIzNNaYZXnDghzPe7QjeKjQ2UYnp26qAEAvaAw==
X-Received: by 2002:a17:906:d54a:b0:a77:c330:ad9d with SMTP id a640c23a62f3a-a7dc51be76emr753902166b.61.1722808506919;
        Sun, 04 Aug 2024 14:55:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:06 -0700 (PDT)
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
Subject: [PATCH 01/13] dt-bindings: clock: exynos7885: Fix duplicated binding
Date: Sun,  4 Aug 2024 23:53:46 +0200
Message-ID: <20240804215458.404085-2-virag.david003@gmail.com>
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

The numbering in Exynos7885's FSYS CMU bindings has 4 duplicated by
accident, with the rest of the bindings continuing with 5.

Fix this by moving CLK_MOUT_FSYS_USB30DRD_USER to the end as 11.

Since CLK_MOUT_FSYS_USB30DRD_USER is not used in any device tree as of
now, and there are no other clocks affected (maybe apart from
CLK_MOUT_FSYS_MMC_SDIO_USER which the number was shared with, also not
used in a device tree), this is the least impactful way to solve this
problem.

Fixes: cd268e309c29 ("dt-bindings: clock: Add bindings for Exynos7885 CMU_FSYS")
Signed-off-by: David Virag <virag.david003@gmail.com>
---
 include/dt-bindings/clock/exynos7885.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/exynos7885.h b/include/dt-bindings/clock/exynos7885.h
index 255e3aa94323..54cfccff8508 100644
--- a/include/dt-bindings/clock/exynos7885.h
+++ b/include/dt-bindings/clock/exynos7885.h
@@ -136,12 +136,12 @@
 #define CLK_MOUT_FSYS_MMC_CARD_USER	2
 #define CLK_MOUT_FSYS_MMC_EMBD_USER	3
 #define CLK_MOUT_FSYS_MMC_SDIO_USER	4
-#define CLK_MOUT_FSYS_USB30DRD_USER	4
 #define CLK_GOUT_MMC_CARD_ACLK		5
 #define CLK_GOUT_MMC_CARD_SDCLKIN	6
 #define CLK_GOUT_MMC_EMBD_ACLK		7
 #define CLK_GOUT_MMC_EMBD_SDCLKIN	8
 #define CLK_GOUT_MMC_SDIO_ACLK		9
 #define CLK_GOUT_MMC_SDIO_SDCLKIN	10
+#define CLK_MOUT_FSYS_USB30DRD_USER	11
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_7885_H */
-- 
2.46.0

