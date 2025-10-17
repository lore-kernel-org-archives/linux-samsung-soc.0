Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E0C27B358
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717658; cv=none; b=chqKaq1Y280B64u1nJ2c1POdjhl91Vlis6hfggFAXrHqMsIMBXTmC+a65D2l7It/h4eWlg3lIsEoIUAGV+W1WrLPjUllyjrs/lZT8OFevXR8MiiJ/j0sweNPEUkgwFlgLyet3pLDjSpljBQPaNGVp/dqVB/To4pIl6bWshrfiQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717658; c=relaxed/simple;
	bh=CZmROVfTD8u1AlAo33CGWQ3lRipjkitrHczW2VKKWkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IEQmw8TgB0YzNSBEO0EStvklpCOgkKZkl5Cr8w3/kNsFgRq70cMBxvyMk8MnRD9397TaM89vqJqNl5qP5PbUsyv5hr/KrZ1cY6bW0H6clKHedSg+q1I1rM/jXWp6EmpehpU7RBe/b9Ij4ZVcLodYsGODxqp2/1LCwGxHK6gQnz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZeBBw3s; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZeBBw3s"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso386038266b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717655; x=1761322455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDBtrf04QYUQbsiCFswby2jYYDrs9vGFSiZ+aqY91Ds=;
        b=SZeBBw3sMoXBlUBjq3xUWrLzHSBBv/FVyG1mT4NQ1ZS2SvoeoqFlJoXJmOc1esevyg
         Ymlcr02CdW7mOxEdd8FGAon1BBRu0wFJth1QZXKnzUUhEP2xHB4AyhA0oF+EoD5GDvh/
         roknxByFG9ye6pZQGV4td0lOFD6ZeKK1jAE/r1yVY+LF1U09K4oLs6PorpFBu1NeLJam
         dLL0aM8f+BpJvhqvMAV9qB8YOj2rl3Ip1HVi3NUv4qrplJll0SciTeWCMuhT1tqYHu14
         gRCEEwNPaGZo0Lr1hIGO2Yhrhue5aNjgBQXRTM433NTHSqwnwmni8v6n57P2kJc4VDa+
         onmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717655; x=1761322455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDBtrf04QYUQbsiCFswby2jYYDrs9vGFSiZ+aqY91Ds=;
        b=whDSvlfHCzpS+ppZUGLQZPsjdOeH/yCYJeC+N20GUowCOtzb/Tb63l62+ngyx92m4h
         pOEX7IetIVge42bFU4SoIqtW9lgODC3WyHgMqvnFKdTkw8XhAG6rxI86hNbXtKa+iFg2
         1etZk4+qHfj54y46cL1cMEyDM60dV5mEHseU2JxfMe+yDqNrkMJx2WhH7ZZf6ywDr5mZ
         GVTfzdMabmAOiYfmhDhHLzR3Q732oHJHdm4UW4nBBAU2hl0e+WUVF5JqrfsN8DhtrL7W
         qT+26XQf9lcA51inWmfJWIpkwk9vKJ22+FGDrDRGfe6opuVLcE7mbutiZpwro4Jz3pE9
         uF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNE+2BVvva6sjUqyLUyODeo5ZLxmjF8lkHD9maP9yoLzYsGfarCzk/ePRt/lTpODLc9/sxhKySz7tZhhz5o6OXRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95oEtAoPUdMU4+p7whP2YMNAd+HNMZc0wslcYZlO0feKXxUv0
	JaR8moUpvKkHcRHFRe1FBirG7qLvwpkj2ChgFfiehgJhum6BxxrkluwBwb1LTZ0N
X-Gm-Gg: ASbGncusuh5Fa/kd5Jrp+TZppUFq/ZvGv+cGSVAXaAF1cjeCtgZDmOIjqR2S04F4KjA
	Y1OUgT+7o3vvd628DjLIF+lZQFe45Q978cS+NmFdqVyD3CGv/yeLG3FHLm6+E8dvbo/e9AyvWJw
	cCWodttU2RTnAbzJsr5dIV4tGFifJvmsKFiatZu135JTynUVi5Ke9D1CKZRYgqcPNRb8p4P2nf0
	HjUydFy89IP90jddeJ9aKHyflLs2BV4RcW5TYkOAmvNOGYpwuf9fekJmR+jcHsJDfGTQvj0U24n
	66HeJobQxuhIMau5nWHTdmjmZU5pTyEsUtCckoE9SGqvqMHOYF4LOkOH9Ie3tM38ks6re4IOvjU
	cyHVEVgVeEKP/do66HAz0/SIqcvEx9X201Nc6X6y5DGtmuh8KgxV+zXgG9Nl5g3aeTCtPTNDsuz
	HfTj91RXtfgG0U6mhNePjURFMVDeeC+P8nxZRIfcEz
X-Google-Smtp-Source: AGHT+IHK9WQ4a0UK8NwMypKKKManCE9AjC6PIzjyVE2Ox3e8SVeVLpu0Cb9a9BFD18dkt9RME7LIHQ==
X-Received: by 2002:a17:907:3e1d:b0:b3c:8940:623c with SMTP id a640c23a62f3a-b6472a6a114mr519013666b.14.1760717655010;
        Fri, 17 Oct 2025 09:14:15 -0700 (PDT)
Received: from ivaylo-T580.. (79-100-18-255.ip.btc-net.bg. [79.100.18.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036706sm9606466b.41.2025.10.17.09.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:14:14 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] clk: samsung: introduce exynos8890 clock driver
Date: Fri, 17 Oct 2025 19:13:28 +0300
Message-ID: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds a pretty much full (except for ISP and camera blocks)
cmu driver for exynos8890. It's configured to run with gates in manual
mode, which is done differenetly from other exynos SoCs.

Best regards,
Ivaylo

Changes from V2:
patch 2/5:
- rebase on next and drop the unnecessary new line
patch 3/5:
- rebase on next
- add r-b tag from Peng Fan
patch 4/5:
- rebase
- add r-b tag from Peng Fan
patch 5/5:
- include bitfield.h to ease the kernel test robot's pain
- add a comment that specifies we're disabling hwacg and change
the commit description as per Peng Fan's suggestion

Ivaylo Ivanov (5):
  dt-bindings: clock: add exynos8890 SoC
  clk: samsung: clk-pll: Add support for pll_141xx
  clk: samsung: clk-pll: Add support for pll_1419x
  clk: samsung: clk-pll: Add support for pll_1431x
  clk: samsung: introduce exynos8890 clock driver

 .../clock/samsung,exynos8890-cmu.yaml         |  477 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8890.c          | 8697 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   12 +-
 drivers/clk/samsung/clk-pll.h                 |   12 +
 .../clock/samsung,exynos8890-cmu.h            | 1279 +++
 6 files changed, 10476 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8890-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8890.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8890-cmu.h

-- 
2.43.0

