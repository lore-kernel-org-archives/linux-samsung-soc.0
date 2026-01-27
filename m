Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774A5350286;
	Tue, 27 Jan 2026 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541166; cv=none; b=gytUf213a1sTCjC4EJaVjHYwaUYJDn5ub9RnHj4EFZGIaxeRAAa/6/v2o2CLb2dgZiFni2Wb70Fd4RZ0qZKruCHQ72GhBAhAFqxaG8K5r41CEVBOD2wX4D0uwcVZs2xfaIqFlyPi0+H+VfsV92OblFG+ByP0heiIzRXjCsPBRuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541166; c=relaxed/simple;
	bh=DeRyXm1T5uipvh9w9To9lOdi/qiwAC07ODcKudS8zUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RThww0YEZgZELl4ZqHUf2lmL8JZrjaAiavoSrvoykeOr8UlnOBPAUHFnpB49/ZQP6em1kuTTw8DFBiN49wGL/Yqy7cOlf5O0BmY5R0T2WR88RUcldkcLcBnZkKUvyrOSC+bMrqYdc4R1PZx32vhzFBCejTb51MQCeHUJuDhugoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FE3C116C6;
	Tue, 27 Jan 2026 19:12:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Naveen Kumar <mnkumar@google.com>,
	Roy Luo <royluo@google.com>,
	Joy Chakraborty <joychakr@google.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
Date: Tue, 27 Jan 2026 20:12:36 +0100
Message-ID: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Tensor SoC USB PHY is only present on Google Tensor G5
(Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
the user about this driver when configuring a kernel without Google
Tensor SoC support.

Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
ARCH_GOOGLE is not yet upstream, but that doesn't hurt.
---
 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 142e7b0ef2efb920..3ceda9a20d571038 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
 
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
+	depends on ARCH_GOOGLE || COMPILE_TEST
 	select GENERIC_PHY
 	help
 	  Enable support for the USB PHY on Google Tensor SoCs, starting with
-- 
2.43.0

