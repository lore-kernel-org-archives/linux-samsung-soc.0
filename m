Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A33F0ABE;
	Thu,  6 Aug 2026 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004924; cv=none; b=h2+ZZIEww71xSycgl0/Q+RacLGLD2eOwC/6+xvRx5QG9ESPY66Z+7ieP6gJ2OoAJzOvbkvJtDsKnW2g0qz0wD5caeUvCdWUWRbFY5F8iEdBy+9LUTOxL/VlIr3aSYuUNtBSUVjhLtyG/UbVviFi/IgGDKMG8O54DWdtT1ZrJMnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004924; c=relaxed/simple;
	bh=wHBsbGN9pb7/610WcdUv6xMxzm/J3FNizWzhkmu4r+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7PNRq2cd1ZJWUTav3LEuAZvOeV49nkj6oHEFafyyH96exPo/jQYYf1GCg/5isJAIQbWSTn8LonTVrHE7QQ/eEY+3CwA0p827Zxg0ea5sfe8etujI9ZoaNYVWt/RQBlPSsLnwhK2CS9cqosu8+yVHIzWlp5iEQ+w5saBnZGRMhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdY+aVt/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdY+aVt/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BC51F000E9;
	Thu,  6 Aug 2026 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004920;
	bh=lGVquPdLm5iCHyN6vtfcTrIQSO+K7PXkfivVp8RwPIA=;
	h=From:To:Cc:Subject:Date;
	b=gdY+aVt/d2meuxbCOWFFPYJYgvR4pFknlbSk/Deyyn3duPcXrMIZ7P68rRcUr97yY
	 30dtFUEbUvIOA/r0z89AHhclMGYQOhjldBS8MLkOahnIfXK721VDeTlUpLEhf5p5KW
	 N1houl7xLGegpKxeazqJuCjaWSJl/24qskS7UYoQOnA6Nq4MgMJ6ZLYPF/qcYTbizS
	 GfEKWJyz8oxj1dseSQLkLai3i7BgnFkUqbbCgFJVPGe9etmE8G7/EHBY81OSQmRa9l
	 U2IE8+f7xbOcwwFTrAV8AG8cY/SfHpTVHpAK5jLhhZ5U0p9OAQ2YccFNL9l047r5yI
	 eD+7tERjJheXw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [GIT PULL] pinctrl: samsung: for v7.3
Date: Thu,  6 Aug 2026 10:28:31 +0200
Message-ID: <20260806082831.350285-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=krzk@kernel.org; h=from:subject; bh=wHBsbGN9pb7/610WcdUv6xMxzm/J3FNizWzhkmu4r+A=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEWvE2i5ZJRBaIFs8/5iQLObjFNMadfOnos67 efYVnHTocaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRFrwAKCRDBN2bmhouD 1ywMD/9TQ/VsbVZW/6gsuMTjDfGKfY6fPHx5GPMdwXkhV+zS5KPUkWUlyr800qaHcEV292cbYx3 rp97b3yDwYrDKlvdrWxBpHiSbnGqU3sgmHHHlTVYt6t8zjaAzM4vmsvHkAv07vW9NTxsPwJY/VU JLa0EphKiCVH8uOjMsNHbxve8RM954QsWZ3RQu8rMPhHxzjh4MwLuL71ClHJE5CDCkvJjp3jx2L pODJBZ4/h9HpPDy5IsrzFifm8ql/zZsiT3ugIATcogLeK0tEQNGfLL3ErL4yC0OVoLR+s6jiLpv WaCN0VD4p3s5i6K8xupoDPE77maQX6ijZQhI5kD7fD3qq5JtcAhp6SWMt0VCV9yH7Jr/tMwI+fZ HHNriB4xnJl7NL2gOm7CTGUSCUYQeupXYsEimT/ZTTtRW4tssYDRWp2jIqfB+12RdobKM8embQK 06sJ+Mb6JH+CLX+B0qWu21kMQxrDztSyrqyznhxSf7f7B3fxx+ye2y+TjErvCqeLb57FqJH0dmv VEWJu6+fi8CI95WZuni+IeRG835YQAseXMZukCxhIesutMWH+N2dp9lGel0DSo1T8wW0Fv/fa4N B4bbGVupBWq90NoEIzjzCTM5x6BAkM4HuYo3bP3W9FGp5TyvwU0hHnI740dNKFKlDBMEX7ZLyqY S4SMOJX9yUPnYtQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-7.3

for you to fetch changes up to d441836c9d704d0f3db5dbf44df87af2ba7a9d26:

  pinctrl: samsung: Add Exynos8855 pinctrl configuration (2026-07-13 09:17:05 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v7.3

Add drivers for newly introduced Samsung Exynos8855 SoC.

----------------------------------------------------------------
Alim Akhtar (3):
      dt-bindings: pinctrl: samsung: Add exynos8855-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos8855-wakeup-eint compatible
      pinctrl: samsung: Add Exynos8855 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 132 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 137 insertions(+)
