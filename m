Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13502750F0;
	Mon, 25 Aug 2025 05:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101082; cv=none; b=mvt0I4BANbNVIqoOiEi/tHr14JzpKgjBGYucwxTbaVu97Z3yNsa2I+483t3SJzumL4x4ik5oTS4EuremLpnbF26oMjU27uoPPlyTswVBKPlYr+XUWvfj8H0/BJ5MqV9u3L/tOPgCc0loc+BunUKQ7Zbe+XSx6Iq6pfFMJRcxSpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101082; c=relaxed/simple;
	bh=Off9QtbvNGtxDKOftWIy/912T6OQA9KxOMWtFI7CnDw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dpumqEXdT2KhDjxpY5qTaNHgZ+GWfGsCIR30nLQ/TdOnYNvRnHb3qS9AMurBubOicAyrLxytRPp+YijGiqLvKiGkzilG1XE8GQHmwsw+3cutSNKZcphiqlMiQCG6y5PK1K/QL9Y0hyMdDQak3ELaGsgB/002RnQEcndHSkp+ffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbxHrUxa; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbxHrUxa"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70d93f57924so42226666d6.1;
        Sun, 24 Aug 2025 22:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101077; x=1756705877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Et9oPv2leaDcJBdZKdxROMHYIIJ1YIz1mtADASkQL7U=;
        b=WbxHrUxa+OiHUNsgtAUYzY/kcwGB5cfSHcZPFBQP0TM9n7Aa8bTIAbwG5FP38D0r/O
         B7Rc6LIzPLEU/0EsEEsefDScZWW6Ixpurrg20sKZCYXCp346usa44+rn+YoXGoG7cMjG
         LlJq7T0g3ATrxS8EvALoNYsX7p6EDl9tYnwLG4sS8TRDUAm0k6fPP0Le37xkZygoOrwk
         yO5tvFP9lq27pdnlO/RZ0MtlYzK2yH/Zvvosc0GO6nn2l9nphnaUXchpGnplIlqH/tCl
         tdk5YaWQc7RR2W9s2oesTqHQdhClurLlWjZSHX3zyxbdrzX3FJHGwzY8i5BmNZUGeLL9
         J7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101077; x=1756705877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et9oPv2leaDcJBdZKdxROMHYIIJ1YIz1mtADASkQL7U=;
        b=rKJiUDPUpMmMVRJGXHkDzlTzpSwl1YaIIHktrljrQF+DR3P07XZkdTUQY2JRtHDw70
         D2MTRdL+bNIVwe8zk3NRPHAZTUT+V68mpi1/RuoeImrIZNkIzWTuhtrCyIF8w2okr3rB
         10bCGbM2ffFh1jJQYrwNx1cKTXrT94h9dfcsQC4SXSKWJguSnS4VVubccBUFn5YNm/qc
         chTn/j1s//qSymPQ7tX1klVDxCpSyvC6jyadK4WGdQguqQrovT71SZTkGLL+UglimJ/0
         ShAlv+BS0jfdko4uVCf2uEcE32JCRjBkiphx6syqjvL6P7YjS6804vL845ejGs1TY+pH
         uAHA==
X-Forwarded-Encrypted: i=1; AJvYcCUgL9JdSZo32EhWrCaFuUbfJcQy6nO/1CeTJs4y56fHR/s7ROkMHMl1KPpSYmxbUgoj1vodBPxIA4bZ@vger.kernel.org, AJvYcCVaoPycIahD4me1SJAlFO5v/LEhQSH3hk5XitLX/dqWyG66amByYC3g0O+2ymsSQPWffdyuZvcedm+G@vger.kernel.org, AJvYcCXVWhrrLd5uq7bE7Lp1Ym2YSLloo2XAB10rsI6tF2ZtvkqI47HY93280sSX47qLSsL/sP2XQD+SXebhAhZI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywno90S1PUepm6R7TW7ztUS2DmWZ3YP8gGXVY0XHNtVsNPtIt5w
	fm2MQPtxfQN/InMQeNnuSaOJLyQh5psAEs7A5fy23iL++5MM0nfwr7e4
X-Gm-Gg: ASbGnctVEzV5xvBAazwMjJIK+HpcIP4kjukjq+BRBflVuB5VrQgMev7JCmy9lVR02Wb
	0z+XOUsIYow6NblsKPEuJJi+X7FJjyyeKQIbaS6GPCAYgJIRjYQhFXFDPhuS+1bQHP0pOQrJQHv
	p9IrOoDlN457wMK+vO9Km4U5drOPHq4A2DglW+y0xqPCaVjcShClxvzELQlKoyRlDQ/yhvwB5XE
	lCQj0Ghs0q+PPlWQQCnH+JXjQAijnhObB76DIfJC8cnytq2A8KnV/I9llVdjeDXIwU+YYOY9Wnp
	CafhdyKTdt726iaT18eFfNQQNXgbJU1uaZyfnjsQI9ftW8X7kKr13ruC85+859nYjTSTdXygm/R
	DBKn2mscKbiXDLpbj+Md7NXMqKDGSXw==
X-Google-Smtp-Source: AGHT+IHApFZ6b9KTo1IQNvy0nr6YRtViA0vjePuNSrQoLr4sy+9IqoBf4NfsRrLOizyuxtEE12Wkog==
X-Received: by 2002:a05:6214:1d05:b0:709:538c:9ecf with SMTP id 6a1803df08f44-70d972015c2mr119503076d6.42.1756101077407;
        Sun, 24 Aug 2025 22:51:17 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v4 0/4] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Mon, 25 Aug 2025 05:51:14 +0000
Message-Id: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANP5q2gC/2XMSw7CIBSF4a00dyyG8rDYkfswHTQXbG8ipYFKN
 A17Fzt1+J+cfDskF8kl6JsdosuUKCw11KkBnMdlcoxsbRBcaG6EZuhfbAsr09jxK7aWdyigvtf
 oHvQ+pPtQe6a0hfg54Cx/67+RJePMGGkuqlVSWLxNfqTnGYOHoZTyBWvV2ameAAAA
X-Change-ID: 20250825-cmu-top-5c709c1d07c2
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=1348;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=Off9QtbvNGtxDKOftWIy/912T6OQA9KxOMWtFI7CnDw=;
 b=8t7UXCstu0Vg6HrVZJ1vdzt5YI8EibOWHS+GFK+sWMAsfJfYGpwbCHweH3K7RctcepDYz88kU
 +Yadd3QmyG9DWIpWN/8/EaFWWAOXu6AXoEQHfKY94X5aUkKv6s3D6u3
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=

Hi,

Two small fixes for Exynos990 CMU_TOP:

Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
CMUREF mux/div, and update clock IDs.
Fix mux/div bit widths and replace a few bogus divs with fixed-factor
clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.

Changes in v2:

- In the first commit the divratio of
  PLL_SHARED0_DIV3 should not be changed.

Changes in v3:

- There is no ABI massive break, the new ID clocks are
  in the last define CMU_TOP block.

Changes in v4:

- Fix compilation for define CLK_DOUT_CMU_CMUREF to
  CLK_DOUT_CMU_CLK_CMUREF

Please review.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (4):
      clk: samsung: exynos990: Fix CMU TOP mux/div widths and add fixed-factors
      dt-bindings: clock: exynos990: Extend clocks IDs
      clk: samsung: exynos990: update CLK_NR_TOP for new IDs clocks
      clk: samsung: exynos990: Fix PLL mux regs, add DPU/CMUREF

 drivers/clk/samsung/clk-exynos990.c           | 136 ++++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |   4 +
 2 files changed, 89 insertions(+), 51 deletions(-)
---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250825-cmu-top-5c709c1d07c2

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>

