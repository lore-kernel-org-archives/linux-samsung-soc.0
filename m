Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09C026296;
	Tue, 18 Aug 2026 21:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787090325; cv=none; b=LLVA2peKgbb0X3mCVvxfRxRlHTpMC8EbDRCggonTAqd/XsLN0c5GTyeZBhDRKmdYAixZt2hI5ngoAK31jprsXJ++W1jEtgYAeLIOtPJAWu2DWml9NP30JtgcozagRY5Qws9rjk8XK8s9XgjKyTuhaQc5/CD888mrJpdbrWSn8kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787090325; c=relaxed/simple;
	bh=UDNWr97k0IQ0S9m6OO8km8BsOp+W7P/+APdAzwtHDLE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aI3neonzBoVgNBInKvMoOGrbGNGH3T275nQ1eP5qqrrDbPcxsi6nKzojwm4zU+omSAtoQ79ThSZEkOJlRPuX27HJsKvqp9S4ZfBncrL4BiAfcI18XxILTCmkZE+At3EnVpBneNW+/qxWLuRTIncMhgyVnLQqqAlp7T8640Mz6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvLz9GVC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvLz9GVC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75173C19425;
	Tue, 18 Aug 2026 21:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787090325;
	bh=UDNWr97k0IQ0S9m6OO8km8BsOp+W7P/+APdAzwtHDLE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SvLz9GVCPXcARdMoexJwm9UUkjPP+XawCVvHDkR//TQZOuDo/Cs/qfTpZhSCbC31a
	 hZs7j5nG9Oghcd2i+Y7hyF0LQOTz0J09Dequ/NJ0nGN8SNHJvMObELKH2VP5Cr9NEw
	 kyuF5ygBeC7ybfyWyCQk/DbAWeVOhmjExxHmnozD0uHAZojIN+aXVvht72XFAgt8k/
	 E77KWpPhSQgeRHo4bXz17xq6KMKCTaCdAEK5BwjN0wucO3ojCQyJhcL+yvWv5OlXuN
	 tiPxaEhBtnM/wQDQbKsoOKsg2lbFXFGuYSGlMpUixfcXf3uy00pf/PK7caj6Rn8W6N
	 9UWx6arjLh26w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA58C5DF7D;
	Tue, 18 Aug 2026 21:58:45 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH v2 0/3] clk: samsung: Introduce Exynos5515 clock driver
 support
Date: Tue, 18 Aug 2026 22:58:34 +0100
Message-Id: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIrVhGoC/3WNyw6CMBBFf4V07ZC2IFVW/odhYccpVB41LRAI4
 d8FjEuXJ7n3nIUF8pYCy6OFeRptsK7bQJ4ihtWjKwnsc2Mmucz4RZzBOA8dTT00A9azAmwc1pD
 oVCvKtEBK2fZ9ezJ2Orz34sth0C/Cfpfti8qG3vn5CI9i3/0a6k9jFMCBJ5JSLeUVVXZrqdXkY
 xNM7HzJinVdP6YX1Y7RAAAA
X-Change-ID: 20260815-for-next-lucky7-clock-3b4b7e6b1ce4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Aiden Isik <aidenisik+git@member.fsf.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=UDNWr97k0IQ0S9m6OO8km8BsOp+W7P/+APdAzwtHDLE=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhNWSjMY1I95L0VqIOxvnyDYXRcaVDhL/tc/xa
 sCiBeSgrnyJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoTVkgAKCRBJJwGyxHrX
 6/afEACenWvCS6HggKqzTvionUili9AXn0eqVLMpoVEvXucgWGrfDygJS+7bs19W75SU5qtwYpV
 7W4VfHSYyg1J+eSOlZCDzJThDAz9GW2T0r/gArrcHQ10Wc8xifFqFViWDRL2NkOgck8A5uIruCw
 Z8m0Rw7PZ2T2L35B/7E/thKYFyoPMTbazdNHfHsQDi/T4dFOs1RZPlUbq8Xlshcr5Ik8npTe9fZ
 BFbS1h7wp2ZsfbtMtL4aATrD6sHyGe22TXF78aVe3AZpvD1uqSB9BmzvwU0LlBBBfX1YfL0VIUI
 z5Nk2OEmCmLzyNxdAVIRbTLfHJ8meRk31AOcfsc1jyEIMoTJBtkaqDwyC57m7bVs0RAhVdwr7xz
 vLB2Sn+b82Z5nbCuR5AbOD+uO9od3FAApCtMSAJZjfQoKmbCJx8n7WUb423LaFsf/0eFvAMwjIk
 1RPDObNmfJk0uduDiP0XAUzABN1TnmhT1BgI1PMKZDLDRPnUDZA6HLY4xzfUCkyyg6DO86DDOVc
 S9GwDwq7PXLx/0cqfbEa1YyiGr3HvbcYVDDEFwj8lzIKoTesBtI5+xYyiYwi5Mkb8oBSAx8TSpx
 wl9wbzfyeB6s+dlSg+W36ZEX2cYC4Oo6wrWmDt3lal6nt4jz6w4YRUYt8wkuKTahWU66zoem7VS
 /V9G+An7Xh30gHw==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

Hi there,

This patchset introduces clock driver support for the Exynos5515 SoC.

Currently, the following CMU blocks are defined:
- CMU_TOP (handles clocks for all child CMU blocks)
- CMU_PERI (handles clocks for USI, watchdog timer, etc)
- CMU_FSYS (handles clocks for MMC, USB, etc)

This driver support makes use of HWACG (hardware automatic clock gating),
so gates do not need to be manually forced on with CLK_IGNORE_UNUSED or
CLK_IS_CRITICAL. Rather, the hardware handles the clock gating.

Support for more blocks to come as support for the hardware requiring
them is added.

I am getting some checkpatch warnings telling me to check the MAINTAINERS
file, as new files have been added. I am assuming these can be ignored as
I am not a maintainer, and the whole clock driver and samsung subsystems
already have maintainers listed.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Changes in v2:
- Fixed accidental revert in clk-pll.c
- Corrected mux parent ordering
- Corrected Signed-off-by tags
- Link to v1: https://patch.msgid.link/20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Aiden Isik <aidenisik+git@member.fsf.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Aiden Isik (3):
      dt-bindings: clock: Add Exynos5515 SoC
      clk: samsung: clk-pll: Add support for pll_309
      clk: samsung: Introduce Exynos5515 clock driver

 .../bindings/clock/samsung,exynos5515-cmu.yaml     |  145 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos5515.c               | 1485 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos5515-cmu.h |  191 +++
 6 files changed, 1824 insertions(+)
---
base-commit: acde40ba506aae78633e080b5704d33cf4bc13c6
change-id: 20260815-for-next-lucky7-clock-3b4b7e6b1ce4

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>


