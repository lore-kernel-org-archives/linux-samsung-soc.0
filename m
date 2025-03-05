Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2A41F417B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741205034; cv=none; b=gqEHsLetGC4c9s/+bX2J6rzA5SLJtjoLjHDBIUW5imGnxETtQdoKO5YZlsCRxwiytLQIUzCHxn1YaPsOfnVVGPKS02q+UB+bn9q22UtvEuSz6ipXd94gcwl8Irb5q09qqVMxP8afqrkYn/pnlU6NmjJrasrT73Qiva220kHaOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741205034; c=relaxed/simple;
	bh=OVU2xqhorUws16KE9g8vqSH0lbvZUNE4DA37myXzLh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dAA3f/C7s5GSfpC2oJxnqUFJHsvM7YEoDIUGsuSsKQd4nSTAD1WNubdKWPwNfFUzf1sgb+4QiaFg10HGWTlr2LoQ8y7fM/p1U6m+aiuSwJ8xNlDWmgkdzyXb0y0bLrL/jE0n7qwduH17a1JmukXMGUPogsRUrwQCBIV3SQb/hFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vWkw/9xv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWkw/9xv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43937d315abso7731035e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 12:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741205031; x=1741809831; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqfxficZrLy3FH8SUQu08tgHcjwZQclNblNbc+7cTpw=;
        b=vWkw/9xvSk6IyjQD9s8rVCdGKDvhM3t8DR3SMZrJnU9DLc5YIHY4C//YQdxSboft77
         hLuHEdlFPjDXcuXU+dR/YTGFwXu/jKkVx6vLKglIF6vDI3RPT9pObWFxpPTJfcZkxDk+
         86PM5EWdhqkUAouH74xYe9kL6Yivtph+zngXq6V0Dh8/dqPSzvhhUf2QzYwyQvkDLdvy
         2mmk3RrLq9Krz59bexNmz4wz9i06+qJtG4fL264PvMIw3tecdJch6xKdyKd50Nzi0ltV
         AlFbaRJmjgnUfQnQGUzZw4xh/kgKa5XSTzC+GqUYA1HMHo2AnxwDRZYSlhYpWo9Vx1Kw
         eCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741205031; x=1741809831;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqfxficZrLy3FH8SUQu08tgHcjwZQclNblNbc+7cTpw=;
        b=RTvN1HnPpotsltkp5ZdSEUT/4SF+fPedV65IdLZMjO2vYr7FnyyqB+TB6J8tZG+ISo
         mELxVpexjRauXZ1svN07FEbIlva+KnlDfZB8WgmRxgUbXqIxaNcRDnNDaDoYQ11D+tlT
         CkLCtZNlBAwFWRpS5prvjaGjzmAJKSisR//SqCvJ3S4us0fWjhyWPneFFd6KTPwZCqmo
         /4RfoTRWhNpJbrPUDCMtwEQsjVd7hVkoCtK831v+y7SpoUTOHkII4CTR5JaK2nWiyl1j
         sXxoTNQL31AVqGlI34ed0uySd0V0fVGFD4i1qADKIWJAkd28BVmD91emBjRTMdvLuVaR
         e5bw==
X-Gm-Message-State: AOJu0YzPXFVipH+wh3a80SUzxtFdotEsMVaDS54zvCNH0Vmoe2IPgS3d
	D1l6CqFzPCvPjk41rgh46OsG2X0dg7flmu7zEXRKmeT7bMfK3MbJ14kMQhJUfjKCKRqWrooLHO1
	o8NM=
X-Gm-Gg: ASbGncvmVseLi8yDVQWLBhhsTqUpO5jb1omZPG4mK4gZ/w7U+pB83Dc8hCAbIsJ0N7N
	gSfp+qGrcscdGeYXD41KnseNtXKicri8Tgh3J5RjBOUnnL34noQFrZtSGkuvNzX3+3+/6oTIBBD
	Y9/N9q6d/kAdcQVA0a1f0b09y902NAOvA3KAB6re5tVg9VMyoW0TVQJj5E9J/x2vD28REOyOpw7
	0Tv2l3GCjZcMxF28vVS1xdjLdXPpjx8FLUeM2zgYyDOUiL8J0COwDSHODlNHWulNQTVVWC+dhHw
	EMTNh3XdybrIEN+BpiUN3c3yZOQibyw2eJFtv5HSzqgNL09NBMzuYkTlgrMR
X-Google-Smtp-Source: AGHT+IEDXv5Dyb5QalrXk6ql6emdOt4SDPu4lj7dnIY5kFx1pre2Zvcu2aTh0CK7l9GsPZKlkqv39A==
X-Received: by 2002:a05:6000:144c:b0:391:10c5:d1b4 with SMTP id ffacd0b85a97d-3911f758752mr1548030f8f.7.1741205030724;
        Wed, 05 Mar 2025 12:03:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b792asm21874027f8f.53.2025.03.05.12.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:03:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] clk: samsung: Two header cleanups
Date: Wed, 05 Mar 2025 21:03:42 +0100
Message-Id: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6uyGcC/42NQQ6CMBBFr0Jm7Zi2IDSuvIdhUekIjdiSGSEaw
 t2tnMDle/l5fwUhDiRwLlZgWoKEFDOYQwHd4GJPGHxmMMqcVKkq7MYHinvKHHscyHliyY5cnCf
 sVHOz3udhrSAXJqZ7eO/1a5t5CPJK/NnPFv2z/3UXjQqtbrSl0pqqpssYouN0TNxDu23bF2U9U
 mjHAAAA
X-Change-ID: 20250304-clk-samsung-headers-cleanup-c07b8dd50360
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OVU2xqhorUws16KE9g8vqSH0lbvZUNE4DA37myXzLh4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyK4hZwctbAzba4JB0QKbXAwVRbl4QNOEgos3u
 CJMZxyp30CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8iuIQAKCRDBN2bmhouD
 18maD/4nNwX5HRCdqZWHRrEVVhcMsDDFAy8RuJ3/FryYbfTMY0u9BZpRwVwXH6SogOPF5oP0IYL
 pf8HHOPWPNMjt467fToLT+INiIXjGNUbwe3sm2PrlOG1qvB15VwPRV6VZVjWt+BMZGlLkZLyJuX
 bw7lh27yusKawHyrb3E8uRw4DWmiDns9ceXzAGobVtpL+/lBJLYvuY8+uZoE2bdhh1yQZWmeLwi
 Bf3yX572FrVi8/wvuRMBqmPv0poSdLEzhiYr1tzGRNPzA9LmpNmHBIJf99aXvw1uGB2fUvGzkpW
 gqfWkF25llYKqpnCW0ZAOVNz2SShFUyeL+daQjKIVp+cttr4BNayNOnPkOYb/SxaBzUlvqrARMb
 8DnjjTOy43aFg4EkLs34cDD10vf8gJfYoB0hbsPIOY9TM/W7XRx3lhQlmxKS6IDFWAaKIPhb0Uo
 Ook5xJvB3AwgGFNaqoZDpBYncl0yxeh5lsA7kKm00SvU7v/LH2qlhmKbQKjh7gBBmrFgOToh1CL
 IzFN0d4u4pJNM86Xj3mdLPpHmoSU8HL9n9EgdTKxFWktp6TUyFsZNaJLZqWYTEZ8einwVubTN6r
 Hv8CF0ddS56oqHvKYANoXJh/kDR6gYXb9a4gKLG2qFcizESLSqtg/vWbtsfgmrqvaibHUwDiFLo
 h81U5jNo/wxR6bw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- mod_devicetable.h: also clk.c, clk.h, clk-exynos4.c,
  clk-exynos5-subcmu.c, clk-exynos2200.c and clk-exynos7870.c (Tudor)
- cleanup: clk-exynos2200.c and clk-exynos7870.c (Tudor)
- Rb tags
- Link to v1: https://lore.kernel.org/r/20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      clk: samsung: Add missing mod_devicetable.h header
      clk: samsung: Drop unused clk.h and of.h headers

 drivers/clk/samsung/clk-exynos-audss.c   | 1 +
 drivers/clk/samsung/clk-exynos-clkout.c  | 1 +
 drivers/clk/samsung/clk-exynos2200.c     | 2 +-
 drivers/clk/samsung/clk-exynos3250.c     | 4 +---
 drivers/clk/samsung/clk-exynos4.c        | 2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c | 2 +-
 drivers/clk/samsung/clk-exynos5-subcmu.c | 1 +
 drivers/clk/samsung/clk-exynos5250.c     | 1 +
 drivers/clk/samsung/clk-exynos5260.c     | 3 ---
 drivers/clk/samsung/clk-exynos5410.c     | 2 --
 drivers/clk/samsung/clk-exynos5420.c     | 1 +
 drivers/clk/samsung/clk-exynos5433.c     | 4 +---
 drivers/clk/samsung/clk-exynos7.c        | 1 -
 drivers/clk/samsung/clk-exynos7870.c     | 3 +--
 drivers/clk/samsung/clk-exynos7885.c     | 2 +-
 drivers/clk/samsung/clk-exynos850.c      | 2 +-
 drivers/clk/samsung/clk-exynos8895.c     | 2 +-
 drivers/clk/samsung/clk-exynos990.c      | 2 +-
 drivers/clk/samsung/clk-exynosautov9.c   | 2 +-
 drivers/clk/samsung/clk-exynosautov920.c | 2 +-
 drivers/clk/samsung/clk-fsd.c            | 2 +-
 drivers/clk/samsung/clk-gs101.c          | 2 +-
 drivers/clk/samsung/clk-s3c64xx.c        | 1 -
 drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +
 drivers/clk/samsung/clk-s5pv210.c        | 1 -
 drivers/clk/samsung/clk.c                | 2 +-
 drivers/clk/samsung/clk.h                | 1 +
 27 files changed, 22 insertions(+), 28 deletions(-)
---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250304-clk-samsung-headers-cleanup-c07b8dd50360

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

