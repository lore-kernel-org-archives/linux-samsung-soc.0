Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E9633B6FC;
	Fri, 29 May 2026 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062315; cv=none; b=o8Jx2aX2ub0sYBajURbehiGJOHRw3/0hEbw7pe3zZywRX9AaclpYmronyiLflLT12rgnR4A+OHjyAQkZBRyLSPjrD5qQY/aCacH/yUm5BK88CyBVawsoGyC9ltWJYPUWjprErBFMPa8Hi0fHkecyVQB/aRtV5XqTJPVWx1uyZHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062315; c=relaxed/simple;
	bh=ibUegnUUG4i3c8ZQMw1dEvawE9WoSOzv5XQS+9KEiEY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qzi1sGw5ev2rozcAHNtVOEigLyU7d9qupDo9z/eXM2CSW8iokftHyGpqqleXsrkVENfKaEMQivlDMKJC+SiMgBVwCatf07eOdrgDybrv3ntG7eyZCJDce2OIP8qKNuX7kwicCwGK/V9FX5nn9/GfQZ2ZTVisdXCfIFC8Bt02ulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOWWQL8F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOWWQL8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114B21F00893;
	Fri, 29 May 2026 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780062313;
	bh=D2Gqqo3X5pT7/OB7PrQNynnY8xsTJGt7leNxVWfYUZA=;
	h=From:To:Cc:Subject:Date;
	b=HOWWQL8FtPL7POLKJByanUk70ZpFIHmztZZlNhmo0zjb5zmEtUMkPI9zYQbPMTQxy
	 Tb7//aDAhQeZwApYF1LCB1+ViIF9IQseV9N/4yrMaKr6gp4aPO19JRN2q9Ldask4jt
	 mFCamrYFkf9GBmt8QxLumw+kSvODlOpeKgevpTV9qLYBYQavadKoAWvvbxwxt8rAuV
	 J2nheOkjLTHmT7O7EpBXdMuaTkRSuKQwCQ69+ezcRPnHnI+g4TF3Dq3cv/0MFdQDk1
	 7b1j2yOXVBnh8I9b8tFdjsMC2uUsSKeysUA5o3CQgYO63a+xGF2OgNzTgFEThEJ35S
	 2S46bRIdBNZ5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Brian Masney <bmasney@redhat.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: samsung: acpm: remove compile-testing stubs
Date: Fri, 29 May 2026 15:43:31 +0200
Message-Id: <20260529134454.2147446-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Sashiko reported an inconsistent use of NULL vs ERR_PTR()
returns in the stub helpers in xynos-acpm-protocol.h.

Since this only happens on dead code for COMPILE_TEST=y, this is not
really a bug though.  Having stub functions that return NULL is a common
way to define optional interfaces, where callers still work when the
feature is disabled, though this clearly does not work for acpm because
some callers have a NULL pointer dereference when compile testing.

Since CONFIG_EXYNOS_ACPM_PROTOCOL already supports compile-testing itself,
and all (both) drivers using it clearly require the support, so this
just simplifies the option space without losing any build coverage.

Remove the stub functions entirely and adjust the one Kconfig
dependency to require EXYNOS_ACPM_PROTOCOL unconditionally.

Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org
Link: https://lore.kernel.org/all/a7994860-24a3-4f87-84bf-109ed653dda4@linaro.org/
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/samsung/Kconfig                        |  2 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  | 14 --------------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 70a8b82a0136..198d8b621289 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -97,7 +97,7 @@ config EXYNOS_CLKOUT
 
 config EXYNOS_ACPM_CLK
 	tristate "Clock driver controlled via ACPM interface"
-	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
+	depends on EXYNOS_ACPM_PROTOCOL
 	help
 	  This driver provides support for clocks that are controlled by
 	  firmware that implements the ACPM interface.
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 83cbd425b652..c73aea30d960 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -68,22 +68,8 @@ struct acpm_handle {
 
 struct device;
 
-#if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
 struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
-#else
-
-static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
-							struct device_node *np)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */
-- 
2.39.5

