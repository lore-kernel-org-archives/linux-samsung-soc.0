Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609F422D4DC;
	Mon, 25 Aug 2025 02:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756090550; cv=none; b=NMyN3jcxa/oQfiuEPTDVdWTwN2HmNYWce9AqdlroGJoBgtHnEsqtvGCOGFeWlfm5kkbVDwZuhTrVa2CDQfdQF5b+HZGdc8qat/BHd2cr60hJhIB3tDAI1fQhfh4c5U2uZ0HgkqyJx6DbTej4ZL0mz39IGp0cS09tFuAXly2QfhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756090550; c=relaxed/simple;
	bh=Il0Ec3pMC9RC7MiF9xNyXJRyNNelcuGbw9atXy12I8U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fgdtZ5Nsnjkk5ahWp8WJCDi2QrG1UWbQq8rdUBPCnpW10IMl/1L4NaOI9YwanhIzagRT8KMqu9WitYDOjJLtGgfulDlv7GGf4Yd5YIQZ5pvUtiZ8JFOXqflAsmoEfPXpW7tiedai5daunO6Uq1arRSK/dJ0iVKG3nF24HolETBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1YRoTZc; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1YRoTZc"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b109914034so52222621cf.0;
        Sun, 24 Aug 2025 19:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756090545; x=1756695345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1QymQ+N7lTmS95ACDacJw8aP/Wywg82d5BNec1X3hU=;
        b=V1YRoTZcMkQSWfeI/4bXRLdRcBbPg9zIVKNQRZiWGpKiqe/sja9WK7IQpwu6/R4Tdj
         ziENT3guifvD1xJPQVBljhkyUQeWzfKtgLgv1yWbMHJ4tNOY7d9EKgWr7+5yZLMviIH5
         ZK/1rKehvntPgZqF+ZjCqT835RIcJFAcMeMkCBeUb7WhBtKRJHIitiZuhgP3SxMWY0jV
         X9v+vyqfyP1/Zme1gjM/0iffNlvjBiiqkF0zV8RwRmw6lFyHz+uIxAf060vviDJ218RE
         2uhd4dJF0Gyk3bDz7RdaM4UUba/7k6NgtgyUjezF80Y+E3ix1fRttw5zgwq6f36gnMC8
         IYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090545; x=1756695345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1QymQ+N7lTmS95ACDacJw8aP/Wywg82d5BNec1X3hU=;
        b=XT+/RBkVHjgeTyr8QpyfpU6APZjmA8WoYyy8OGJ6Pv7Cd9BORKCb1qUckntEuID9uU
         1cfnU9KULLZj4bpFFtLycJtdnTQJFTK8PKeZ/BNYU9WngmCfVFZgCgzpLuwETKp0qkJ5
         G68Ugu2VZ8YaehfU14Ncc+rK5OVjpOq58RSdEtAbdow4ShaKlDFAPH5Wnmq3fOqi0WSl
         mtRp8rYn/ehuV13v3Emb9AjL25/SzJ+Qz3PmQyLujBZMkCViSz98KsYWfi3gXFowMli5
         ht/GNnM8KLCoyfm91OG4K5Dkh9YSXZ52xyuTSnB+hV0T+CSA1ggKkV4mSjD8DhXG6vMv
         P8+w==
X-Forwarded-Encrypted: i=1; AJvYcCUizjRBoZEnokdD7sWNoXcbWOW5JfBjhd0hQrZKtAKSLH9l1wTTxnmNrCT7SEOy66owjojHE1jtuInG@vger.kernel.org, AJvYcCXHIIzULH6IWWA5pVRgZjAvbSrH7djlYoQWel/hVdMirsVz9NutSuo2ekVvsxrqt49AkRil0HBnew1odjoL@vger.kernel.org, AJvYcCXScTrkZMUyA3B0SVWudHtA6eIvBE3urrKPN91/ah4lEmTxbh4bJ8DGVYPyxvQQ5Ty02dG2IoLaO3Gc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe1+HsPyL4QhmVB5pxCtNi0mcr/NlwIbAqpjO3zwsHFKlhS9P5
	drlN7kY5JCAnrsP/FwbzCDXWIacLHyaR5fsq1rwhvqA8TE4QKbaH4mtq
X-Gm-Gg: ASbGncsCToeWNMZsDaN2qWNwLMrHBypf3C5+lPEpce/MrAE+Lomfh5yxVpDxvCD8ZfV
	9C2NRUJXw/blfEkGHUPVOyfkooH66NOQ0YD6aKS48Sg/rVJQMzi4cW9NhzzYgDnYTc3+5J3jOMb
	yv7bqdBQG+hu61nsOGLu3g0QlSwBAi7jMIM6hHTGMvs+MdLyhw+H14yb7SgnBo4o/pwQ6zm+9MI
	bzn0gEIMuXuIo5n2YxdehX0AceHaeTC3E+9H/yB+VaZbXYddHh0sMUSy1J0WRXTeefU5Niz6GJ3
	/O3ZbuojmV+3nILHDwlRwwiFiaT2+w19BkHrcwm1V3IW+Rjq8oWIOAr9IUPE0+knoolgiwkFRoX
	DqAgoKqQnDGjc7Xc9oXExfxyb4HMlFA==
X-Google-Smtp-Source: AGHT+IGbnGPVJ5DdKKr+vtzGzlXGv4G9veTPN1vRKR/wFKZQjtPT0AZapMpobMePa2S4WRvmzjfMLg==
X-Received: by 2002:a05:622a:164a:b0:4b0:7521:3bb7 with SMTP id d75a77b69052e-4b2aab37f10mr121228581cf.48.1756090545149;
        Sun, 24 Aug 2025 19:55:45 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61adcsm43970491cf.5.2025.08.24.19.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:55:44 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/4] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Mon, 25 Aug 2025 02:55:42 +0000
Message-Id: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7Qq2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNT3eTcUt2S/AJd02RzA8tkwxQD82QjJaDqgqLUtMwKsEnRsbW1AIW
 cgzJZAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756090544; l=1248;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=Il0Ec3pMC9RC7MiF9xNyXJRyNNelcuGbw9atXy12I8U=;
 b=UgqjtqzT/u3t+ZdgWcXKvRaVCsE/5E5v3H1Jf2w8mP52nY0Rb0Y2GRtVdosb+qF8736d4KU5Y
 S9o3sz7Ouk2AOwGVS2NRieQqemj4FgH8DW8xEsuq0rAR9T0UyYYWiRb
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

