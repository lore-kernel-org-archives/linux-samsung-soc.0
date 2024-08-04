Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB813B787;
	Sun,  4 Aug 2024 21:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808536; cv=none; b=tA9o9d/XsJ4F13cRAa7Ql5qKNSTuU+g0beGsy/raFBHFBrxfdqMVJy3i97muBES8vFBAN6OCypz7vj5GI8rvc6Mk7PkyhncfcJ25G3Ga/2anxx9xmlMHM/bScYpGifae4m0JsB6yP64gEydRstUqx+untRiuMbiZDyEOUp9zcVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808536; c=relaxed/simple;
	bh=4/DkRLV7xByXRQcbc5nqh5AJ8ipCaycYCKoYIJaOIuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QER93BOZldJ07S1I4gkZ3NiU3sDw8uJkZinLCwoJ+p9IPeOJt9Dww/ND43/lB0VzQHTgVtjdQB5UzdHefbKtAWPszxWPB5h/C4FqC0J0I3Ek6oS3wHdd+z8pt9jP/494J/lr4vXgp2QA7YHdxzvtbyZbRs1N/SZrZwby6Ynav0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6n189cX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6n189cX"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd855adbso13547786e87.2;
        Sun, 04 Aug 2024 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808533; x=1723413333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohIik8tuxkZdOhXKBGYVU1TaY9NMG4VqeNOE6YapqQ4=;
        b=d6n189cXUXMOj1dxxzZ2xv4EyG5EyDtxBbUH7MD4Jjfa93VrN9p2ypV728i7Rs81FO
         XEozKunj0i4T+Sd4wbGzC/+Ioe+RK/xzhWUd6wo28VuaVnbNQAAKQhtkM0BMUfeo9UuL
         Lu+T4jThiHXMACotctVW1x4lmqlX/S11yzfIPxUKdPloQ1AYAcmrVYsNcy67FuZHaSBT
         DxLkAPLnUIhwgYZVmEmjavhN1M7nDjmeTMPh7eax5Ak5x/NLRP24WehSnyDkj6PpMj0w
         zZS36TXwMLuEKj7lqF6FFXh0vih0XwodfssUxFNNtS9ZAE3R2qhmtwywio/n5fFj3u/S
         4wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808533; x=1723413333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohIik8tuxkZdOhXKBGYVU1TaY9NMG4VqeNOE6YapqQ4=;
        b=cRNqaEfFt2+j5gWnBkwBnjilqOCO3Np/U0WzNSsPCDWLpi+mknwMObPVhFc61p65tL
         XFmrZgcLD7YV2y0poDeII/V3IO//U7/BFg/MBO9BBi1xIqMgVvuXarLJGI9w1phX05ZR
         9zEW3CSzX3gEe1Y4RQv+FaR5e7aSGYORx/epTzLi3CTsdootHQnYte4YYJJGWiXQEo5C
         o8Kmz4i+G3N3dpFK/rwonKvRMHvKbz7GfwRWEI//739OJrfiOMXZtWDbctjbGb6C2oeg
         OJaTrEBZECGo81L1mGOWJWmVH4Y/TYoKRBpGbqW6EfU/vkZDz+KL4HQ/VoI7a+H5ykwt
         rxrw==
X-Forwarded-Encrypted: i=1; AJvYcCUkbWLmO1YmduC2HHWgS9q0j33kbzVK4ZNZd4GpTVA5T1AKfxxdC72XQhAYBk9A4tM0/5LWYYSMFiGt/0SJ@vger.kernel.org, AJvYcCVIwp06zftGy32CV6UqvjR5W1AF9iqKlGhE6Spf37qvRfiEJm5NA6EP6a0cvugFs5lZtE9S7j4mPdHR@vger.kernel.org, AJvYcCVbb6V9Q3Zbe3VQISKTO2c8q1EF/jv4b/e1Hb2HUrz201w29wLxgKmKzvtX3qkoadz34WKDDr7blgGt@vger.kernel.org, AJvYcCVcyb6EZurpLGbF37odVrnp2lvkY0djwXc5E4r0HfMulw+a4wBWCZuKiKxRVRHUaCJ9NFx8m4tgTBZt@vger.kernel.org, AJvYcCW3wCBnCCSSmS67+CHVPJzIEjic61r/j9PuxHFeFRYCfIvKfMs1bH3oP3fQt1ySz2HoBNkNgtRydtGV33ErQJPldoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSLFgXK8XCjRXO14vvSDaQCzjlsQejjPDtimoxf6xts5vOiyr
	VxJ/C5JTHLtaQfGKjNDrMn5/q30t4vrivLZUlKhRNXYS/WOP80UT
X-Google-Smtp-Source: AGHT+IGf4XNWbs7YR4aHSGzZXOop9qGrIJwSKWyF5QLUzVLZlUFd//3fW5Z7Dds3H/8T66ieEG+8Fw==
X-Received: by 2002:a05:6512:3041:b0:52c:cc38:592c with SMTP id 2adb3069b0e04-530bb30790emr6307202e87.0.1722808533083;
        Sun, 04 Aug 2024 14:55:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:32 -0700 (PDT)
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
Subject: [PATCH 06/13] clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
Date: Sun,  4 Aug 2024 23:53:51 +0200
Message-ID: <20240804215458.404085-7-virag.david003@gmail.com>
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

Update CLKS_NR_FSYS to the proper value after a fix in DT bindings.
This should always be the last clock in a CMU + 1.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 drivers/clk/samsung/clk-exynos7885.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index f7d7427a558b..87387d4cbf48 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -20,7 +20,7 @@
 #define CLKS_NR_TOP			(CLK_GOUT_FSYS_USB30DRD + 1)
 #define CLKS_NR_CORE			(CLK_GOUT_TREX_P_CORE_PCLK_P_CORE + 1)
 #define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
-#define CLKS_NR_FSYS			(CLK_GOUT_MMC_SDIO_SDCLKIN + 1)
+#define CLKS_NR_FSYS			(CLK_MOUT_FSYS_USB30DRD_USER + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
-- 
2.46.0

