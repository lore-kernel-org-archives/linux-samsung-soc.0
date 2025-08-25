Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CBC27CB04;
	Mon, 25 Aug 2025 05:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101084; cv=none; b=OtMsz3gObhqwzC0clAiiGwTAsALonnsRrHDNqYm4RZ9hKxVqdU6hNgruQikYXci2tJTryq4rqzHpOs6WL8BSSICFmSBJmJ+ztYzVSHYawmjiGq9QGhQjBvR398Uz29JXEQqUJzUj8X9b5koeagNgn1lGRFRAMSOYc2AMH5FFdpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101084; c=relaxed/simple;
	bh=KshG0umwTRkOxCv1V2lWLWj7+xMZ/xwWZ8K/klaG7Hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DpUHdsHd3Df5EYmNR+f0qfUcBaCJN3CG6hP2ZspwoQjK9rJFjXoQF+g8NP6X3TYo9QjaAZYbk9Brq5WHn99WJO0ONLGF+m2HDL+D3ulToBmzj1QfMn/CuYXslxeIKHTediXTnojMQFwiG9sN71zUN813bUCL7DrIahgUkgsAgPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXPX4p7X; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXPX4p7X"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-70ba7aa136fso39637796d6.1;
        Sun, 24 Aug 2025 22:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101080; x=1756705880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh0k76F1VcFejnbUFNxz+uVibEQce92HxFpCY6rugsA=;
        b=hXPX4p7XPXbwq2cgbEVCMPFLXQNZcKKyh+y73qU2Mjsjs5cQpEcecAtIV9O8lkfhOy
         h2dQkhE4ybKyqlREF30PSax9DlENE3m9X7XpftHJtM3VFIIMHPM3+hZCxCuDWtd3QWpm
         o7s4WusvOGG9ggtcO5IXhBPUZkcEqXWgb0jqP35k/OgI/Jjec5MfHzIeGYSGpxVLX/ir
         2TTAi8jTfnzh3zUi+q1DypVX9E1sxbCZ2yt30ydOLmCEMEOLaOfK9DnWBnyFagXFG0+A
         hoYcWnnHEePj2DuAGCd64Gelsd2HGrW57YBxRkheI6CexNDNJ6QEp3rhr5c4WqC0QcjT
         3yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101080; x=1756705880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh0k76F1VcFejnbUFNxz+uVibEQce92HxFpCY6rugsA=;
        b=qFMC4wr+Mk17NgX3nojkT+dJJ0UTjqPgtznmlLixs6vRl3UlQ2LaBBKmG76uF80cpQ
         Rf6nLwtyVPE4UsPzNmK04aTgZo5PZR6yj8Wg72joJhu606dDRDlvhoql1mWULM5oTRr+
         XPc/i6f1X7smOQbiTT4hb4YuyxJDA4XRDXs9eKg9wCtzBOGBkHDHF0WSP2ciZ7/RUa7U
         RCvKV/JHNs4171rDgLcpJgqhRRjBrfdou/ssAxnW38aWfR2DtFivPaefMf3F9+t9zck7
         9OsqVkNlxQyPiQ/uPxsprWr27k/U2vWQTUQZg2erAKJoJ4C+ywtIBdtfw42m0duvUOZE
         uDRw==
X-Forwarded-Encrypted: i=1; AJvYcCU+gQVtHjcSxAq6ZwQ/6DRqSkePHu6oxmDjkifIW3ZOwsLzO9atxRchpSX9nlPtCIG/IudXyeMTW9htKv0r@vger.kernel.org, AJvYcCUTfw/xMXkeYXBeautYecJ7AZNto+Hyc8Z3FRcmbfzwfBhmqQ/E5Rj8AQyn7Wwy/QyhvQQaSyr8B5aX@vger.kernel.org, AJvYcCWBSpwcUnYShi7Ww4Y3E+uFaPPUGykLAnCN2tjx2MTUzu5hBzMblDqrBBVWLPwLlg2cDm/3mIIpq8nm@vger.kernel.org
X-Gm-Message-State: AOJu0YyzcQqUtePuIaXXA3fvoFW2+8rZ6VsDq0gDj9OoRKh0Q4pl9yuT
	9qkrbeMtf3/5dwaq3715iJDO31uOmt66fc6qntjQlYscOUZurwSqj4XRoWZnc6xf
X-Gm-Gg: ASbGncsewunSIXXsLqOUssTjDsrK8fBlfnFb4/kmzuaFRTnQwTUEx/GkF4W2qyNnZk9
	+IcB8d7ZHJKgY23uJuWG4G3DiZ10tN57QvX8cZo1RwFJdmDCVtXUezP6E9bPCBzTqtv0PqH/O8b
	wx7sxdNmW/2pIQPMImVeZ3SV3NekzhlG2yn5KMOR4H09Fwgv6yblECe17+5PblbUBdMqV8VzYU/
	cjawKEUmhLB0n0hZlzQ1NJaDAn+1M1t0dD03T1eErfpRj6J8joVjkxbdHKwr4jNhOA2cQzk5FeP
	k6XZlXgvkZ8Bc+nDj5eoT8I4G9FYUW5AcDhX+VKCdrbQiTpsoMSJktM5X5Wc/1XZoMOeYhdXbSx
	Q82l+C/VCLXXH904Ivw2VlGkVyWdvzw==
X-Google-Smtp-Source: AGHT+IEaP0Zwl7X3dGOq/mwFIJc8Rr6yBUUT3o+fFX+xFVajSdc1UPZj/jJ2cXOQpaTuQ7HP4xbkIw==
X-Received: by 2002:a05:6214:21cd:b0:70d:6df4:1b1a with SMTP id 6a1803df08f44-70d9720f384mr126231936d6.55.1756101079984;
        Sun, 24 Aug 2025 22:51:19 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:19 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 05:51:17 +0000
Subject: [PATCH v4 3/4] clk: samsung: exynos990: update CLK_NR_TOP for new
 IDs clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v4-3-71d783680529@gmail.com>
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
In-Reply-To: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=799;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=KshG0umwTRkOxCv1V2lWLWj7+xMZ/xwWZ8K/klaG7Hc=;
 b=sHj7Cnj2MhG7M0vHjH1Q6Ak9rHV+FWEzfch2nuIl9sDn5a02RL15KFfLARo+Ym+YKHQog7IzG
 WK7oRg+7rhQDMY3lrhIfJrZRlQupSke11v0Pv4aVbFtoVtcLWijn/Ic
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=

The new clock IDs have been added and put last,
it is necessary to change.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 105ba0363..9fcdad7cc 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -17,7 +17,7 @@
 #include "clk-pll.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
+#define CLKS_NR_TOP (CLK_DOUT_CMU_CLK_CMUREF + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 

-- 
2.50.1

