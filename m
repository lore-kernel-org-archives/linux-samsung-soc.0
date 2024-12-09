Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA471C5CCD
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733755746; cv=none; b=YGmBSFVeWbooTOo3zmJdHnDxbm1OJkx1XSm1RVIyuvSxp/pV703/juX6z3ZCk7oPUYFu97gnd6S5YeIVWJXPoffktwQuxe/7EgdBehmRidK3Lj470Yi8opYxZKfd8UXjuUAKOEMgyuHfRR64Jp9omebr5r81E2tDI2d6Uz7bd38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733755746; c=relaxed/simple;
	bh=hh17fuoERmwRARxXBgfxrvHDUdhwDZCDEWgY13T37ps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fEkmn/TTS4TFfklWMSFANhfTlfBAKlWArf2ZOUMY9Dc+hg2OEwJBBL7krFC1PWfb5oO+KBqsdGkZDlFUASM/SNSQ5gCKtjAOc/5jMoMgRnZnrn/5nBYY1qZz6TOKprYhRHByTTlRn6ZlRWFFIRS8+2w+dnWoJ69vLgTHQQyw6+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=omU85tSB; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="omU85tSB"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=omU85tSBO7Y1q8Jp3QkXwT+aCv1XLNNRnNDhMEk36Mctts3wts4Q9ocOoPdbLHhSiNcsorar1HeB2MCipsookfHTix9XiiKZahfHmSm6Gf+NclFawZGGxeBPG9WU91blZsjpMmjpkAPS0wrw7koDEJwbcK5okcJ1TBWXuMTU/pmFmVW15kWM0NlmkhLzdaVBe0VaOgSaMB8ZaA6V+RSIF1tU+kG/VELWlboGyWL7mxWxdapttCHEgqjSi60iH//tvQ83EJ3MH0A+S4C9DbyKV7GgtFc4bUM7ucWzOBVlFMelDEPod8poE517KXsVTjVe1lMi+2JAGgxljf9Y1+8m9w==; s=purelymail2; d=purelymail.com; v=1; bh=hh17fuoERmwRARxXBgfxrvHDUdhwDZCDEWgY13T37ps=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -291099510;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 09 Dec 2024 14:48:35 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v4 0/3] clk: samsung: Introduce Exynos990 clock support
Date: Mon, 09 Dec 2024 15:45:20 +0100
Message-Id: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIACV2cC/33MQQ6CMBCF4auYrq0ZC63WlfcwLkaYQhNoTYsNh
 HB3Cytjosv/Je+bWaRgKbLLbmaBko3WuxzlfseqFl1D3Na5mQBRHgUoTuPkfNQaeNW/uDxjjRK
 kwlqy/HkGMnbcvNs9d2vj4MO08Ums6y8pCQ68VEoZAwhaP649uQG7boroqEfrOusoxIMPDVvpV
 Hxyp2+uyJyACowiBGHgL7csyxvgLNW6CgEAAA==
X-Change-ID: 20241206-exynos990-cmu-58ada5056ad5
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733755636; l=1630;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=hh17fuoERmwRARxXBgfxrvHDUdhwDZCDEWgY13T37ps=;
 b=n3BbgPVNEwn1n+dt2NNprNcTmKWI55eTVgUHFTXMOkPkPjCCxxVMDf93F9LLt3h8pEOv/r1TP
 8/ttTbd6CPoB4sFnPG6Hmuh6ttsWaGrBvjCxmDwVmUFrH8KujfvLkTp
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Hi all,

This patchset adds support for the Clock Management Unit found in the
Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
MCT, et cetera.

Currently there are two blocks implemented, CMU_TOP which
generates clocks for other blocks, and CMU_HSI0, which generates clocks
for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v4:
- bindings: Use one-per-line convention for clock names. (Thanks, Krzysztof!)

- Link to v3: https://lore.kernel.org/r/20241207-exynos990-cmu-v3-0-20c0f6ea02f0@mentallysanemainliners.org

- Link to v2: https://lore.kernel.org/r/20241206-exynos990-cmu-v2-0-4666ff0a099b@mentallysanemainliners.org

---
Igor Belwon (3):
      dt-bindings: clock: Add Exynos990 SoC CMU bindings
      clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      clk: samsung: Introduce Exynos990 clock controller driver

 .../bindings/clock/samsung,exynos990-clock.yaml    |  121 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos990.c                | 1343 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   14 +-
 drivers/clk/samsung/clk-pll.h                      |    3 +
 include/dt-bindings/clock/samsung,exynos990.h      |  236 ++++
 6 files changed, 1716 insertions(+), 2 deletions(-)
---
base-commit: ed74808ae420a2ae611738c2d62800ab157a9ee8
change-id: 20241206-exynos990-cmu-58ada5056ad5

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

