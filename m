Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDA0353345;
	Tue, 19 Aug 2025 22:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755641988; cv=none; b=gTrzVL+vAJQ6lO0HOVoLxmhB4z7uqEUrrcZFWSSj/9Aq1a/RRmdjCn1FlSY/XxOiJzqJQ8R1XbBHRMhhlCagLp240ZwegCiFlhVl1wgeDKaBh9BYc+k1IEhwjAB0WQvD9vfNbh7u4SxPzzy7h6OUqUJwpJLtIkMDJs7K/dI2iSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755641988; c=relaxed/simple;
	bh=9xnTT004xILa2UhRGzJrZPOdnh0XmNdq4Be712m2VvE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NYYtwGJLeCUu4Ew53vizrV45DW+qLW2KKhuVwRb2+MIAA9akBqUFzutBaGk6PJp0saLY4zNHeh1Mhut+NWLWpB03RlLdDV9mP+JdldByYdmK8Hy0GLTB2JCNVat3wzNRbGrApcRDToviYuMjaFkxsTB3uWua2D2DrXL5y/FGpoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrREl4mR; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrREl4mR"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e2ea94c7dso6428348b3a.2;
        Tue, 19 Aug 2025 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755641986; x=1756246786; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xa4yNFnEl2+GCJiVXv/vbsFbdWUzJ8PFt4Rgx/UrWQ8=;
        b=XrREl4mRXT+eVO8KkYpe4Sz7Fv0WjOR7iXqsBH5UShw2mhnpAi8S0N9A8q5xzQsedS
         XRO6ATqFq4g+mYiCHTNoJ0XlvpnTpS4elP0XRp/goqA3KV14lt4jgGh22bVuopsrCiVs
         2+3faTga+yrkPclI0ZeeDTMeF8jcAI7yx8cJ6g/Swx3QmyBS4pIxNMZJEhwd2Ep/b1vX
         aYYAZ3wYMbA5K231Q0c8X5QgPX9dlW3USBAkq5+0gn1yGiQjWeUgDY105u/3ZXM0MTih
         Fk8bEhCRlLaJD9e1hLEL67iYUYgIaWOQ3DhkUUJtOpCIbW2rNY1B+bRFP0zbLbAzmEVe
         rpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755641986; x=1756246786;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xa4yNFnEl2+GCJiVXv/vbsFbdWUzJ8PFt4Rgx/UrWQ8=;
        b=qM8WbcaqKqzvV6b92GXPvA48QY9zPkmTgieuJwbTt5rwDsHq7STSkT2UwLvqMXeNjM
         ax40NWE3ylsl5MKdjDDhjSCdm3pT830bWd6rs+CmV9gOefgcQjp5NfPRpFzFUAJMjsM6
         xHnIfj8L+v4PY8zGSPBowLeGCeFfA83KVCNN57nWt2Jd7V9y2ZURCnZ/U3LOtc/osTJ/
         lyW/jjezzmp0T7nVrPvxpMMY4TmOtIVBmlssAAHi6MtnFA6qjwdR/iWn6ZEjstV3Xm7e
         7O3QbRAgWrKy2/4apIdM40XA8H+OCnbjRZSgamVceix0xmPXlvFV8J18cta6nEpTuZXr
         ZGKg==
X-Forwarded-Encrypted: i=1; AJvYcCW/gtT1KlRCH0EUpMZBywEK0ZLjn6udwi6kEixOD5leq9aI0Vrz6r4Xi0jbahzJ6u7a70Luja5QbZeS@vger.kernel.org, AJvYcCWj60MCGX9eg47wpoo1Jwj4yvnSNpw9hHhWeJn+DvWU1UAbeossIe7E6q51U+LXzQAdtBuXasEh2/qt@vger.kernel.org, AJvYcCX6KPgbx/Enra6QpUaqi4310fzRTdRg/NQ7YIwrKaRiIJZP93P27Bh4ddmQ8GBF+eGjCNrzeWI1DJndJZEx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Bj1WChsWUI2dteF1vwV1qqI3iUEPuHp0SsmTv/fsKH64adMN
	tG7l4wzMhla/W9vWhHnVZEmc08WLZ1oyhGAvHPjpjEIUhc12LGkeyyP2
X-Gm-Gg: ASbGncsAw+1JMobhbchHWUXwBBrkVxYwXA86fwf4FL73A7Wic4KmjX1hxJc2oliigly
	pY+gu3nCT4vOUROqxz66kXm3UHVeSnw7yFsD/g/sBXoyG320LZqVhMcjY3ky921JdqbNBegJhQg
	Xi9SrN7zxxgYo0AI0qfDQHY1sPepFdIh5IUagFHekdkNk9PPLQF9fUSmodpDyxbuMAApAQmhMLt
	0Ss2Wzi2j0/cZLyOqzy9jOAqT8OZo6FY2Miz4hWzRWxHj5MAXnGhZMsPGdLWy4HACeSLEUiOas/
	jxBwx5J8T8IleKd+6APutmOnOsf/KOMc0F9k3zN8rvX8xDYN5uCgR/tMpw0YbhWt0zbjVqQG0wP
	mxG0bMG0d8kLLhBuSiSGUev9ZNRBRnmoLbhikrfyqEz8lcm0=
X-Google-Smtp-Source: AGHT+IGKAGY0PBPZKHCkHC28OiWYdaexqUW3c63hGO/z977zliS7OCS8eRNBxqJSK768+D+wCJy0DQ==
X-Received: by 2002:a05:6a00:194e:b0:76b:ffd1:7737 with SMTP id d2e1a72fcca58-76e8ddd18c2mr905568b3a.22.1755641986361;
        Tue, 19 Aug 2025 15:19:46 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f76b5sm3431545b3a.59.2025.08.19.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 15:19:46 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH 0/3] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Tue, 19 Aug 2025 17:19:35 -0500
Message-Id: <20250819-2-v1-0-e84b47b859ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHj4pGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NLXSPdxCSzZIuklDQD8xRzJaC6gqLUtMwKsBnRsbW1AGSoGL5TAAA
 A
X-Change-ID: 20250819-2-ab6c8bdf07d7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755641982; l=1033;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=9xnTT004xILa2UhRGzJrZPOdnh0XmNdq4Be712m2VvE=;
 b=8MVLXZojb3zm1GhzaT8ctC5m5NWK4ZNxXo7JbD3tlEiHyK6JCcNfUZfaBEO7MR8Yg+qe0XTNt
 m/0J203ote8DAIN8TGNjqFQrn8eYRIuCCsT6AqtRQsY+3ZKyZVLGCl+
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Hi,

Two small fixes for Exynos990 CMU_TOP:

Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
CMUREF mux/div, and update clock IDs.
Fix mux/div bit widths and replace a few bogus divs with fixed-factor
clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.

Please review.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (3):
      clk: samsung: exynos990: Fix CMU TOP mux/div widths and add fixed-factors
      dt-bindings: clock: exynos990: Reorder IDs clocks and extend
      clk: samsung: exynos990: Fix PLL mux regs, add DPU/CMUREF

 drivers/clk/samsung/clk-exynos990.c           | 154 +++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h | 402 ++++++++++++++++++++++++++++++++--------------------------------
 2 files changed, 297 insertions(+), 259 deletions(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250819-2-ab6c8bdf07d7

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>

