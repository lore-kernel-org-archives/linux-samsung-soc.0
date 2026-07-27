Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF2C3563F6;
	Mon, 27 Jul 2026 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178821; cv=none; b=horVIYOaEHf5biO8FbAfxqjyxjdWPgdtBNgLKerawH97YxPZO088AvzZG8XZkQc00qvqZvvhldNzMQciqY8xAb8J2m9jBt4BUucYFetk2ovzUqO5OWyIZor3oXVdYNVL/ez/IT3W8jxQs8FRxp0EeCzxCd49m+rjSfblCSMP6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178821; c=relaxed/simple;
	bh=rYIh72XF25YLtMkQ1atMR+hym/ldzSeNr/6aOYMQpt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qsM7EUqB4lUt5qh4K+oLo3ZcpZO85D7QS5SlhWJt/QttC0uAg9cnOA4GEyuHw5Kpy0P41/6rbjyJkhHxkXEqnYouN/jSgnuCIT0YuXQGnQTco3FzWmnnIc+sn8VNhS6IfveDT2Zu6W8stoR/Jkn4OdzCK49V0v3ZpgmhOm3OWfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Juff+TE3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Juff+TE3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FE41F000E9;
	Mon, 27 Jul 2026 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785178820;
	bh=to/gd4X6LaSNNZAdxvsgERKxojbIenZcMcO/zkvD++4=;
	h=From:To:Cc:Subject:Date;
	b=Juff+TE3lRb7sru6aoIwZMTtRRgNHaiF8m8ztEaqSeusE/7EG5oXp6jibDS1ju1+E
	 lfoK7sYotuFnij0PmhOL8P8+IBDpAJ9ntmdQwbuH2lbzrqR6TNnR3UM4V7G79DusX/
	 kCQ+31y1LjmNSr2yhBmZCitVzjcATuQ2IQ6v3haIu6xmlJSDf17KvLeLMLiQ79cu7f
	 A+XkruZxBBDUBdc2581dA9zlrA92vjAz9bwn1Jq/UxgilfMvghLK+ACdNv1bsHRitE
	 TAh/QkihD+ZZi+M82YPLGBziGVnw7exiyZ+4DvzwdBRGNgQxkTgCXcyQsgQxxdsA3w
	 gvXIQKT3Rbtjg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] samsung: drivers for v7.3
Date: Mon, 27 Jul 2026 21:00:09 +0200
Message-ID: <20260727190010.404981-3-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=krzk@kernel.org; h=from:subject; bh=rYIh72XF25YLtMkQ1atMR+hym/ldzSeNr/6aOYMQpt0=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ6q6NcocqgMAzuIwXGHz+MdwjCWeW1Qcu79Pq ClQqBIj+/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamequgAKCRDBN2bmhouD 1wHSD/9n1mwjVI21ZgDi5+oUoh/x6ZWS6GDHeGSvqt7gsT1Ox9ObKyTde8MOudJTb8C8lhusNL6 QR1+fNjr+E44KUxlFD9Q/kjYkK1lGgMn8qy7dgG+OtWP7pJ3GIxlBnWxKspeyYFn+2OK1lCv+l7 PFYw+Vz6FoCVAxSIwX6qa4BG53EoWyCHaDY6xTWPsoanR1C3hwwELgwZiUcNksYiTHMHjwXVM9f TYhwo/eHypuoma8kScS5yn9afqe+1monWYwIFCrDpRIN1gnFBKvHhc7PEeuOZB24r05hxZBiJJO +41crEggSJGTHxoa/IDr46i1NlG8A1kjRDXBrS1T0pO4XiiM2e1xlhVTl+WAQB6r4CWHzcWH0iS wxhHW5zXqfC2+ukVHPVYqpCxqZbyqyjepYiHsc6yboXHD85boCFNHsBSTQFJt/emgFxDizelm4A 7+QdYDt/4EOA9noKyYp1k9NYCi2WBWdJ6auEq1/Gvn1EspmPpyh4LSEbB2cYZ4AHS6ekqPmPnFj Trzu5NfuBju52v0i74n7LLExymedxP9Ew4iRLCAiAWkm+yeENYXFqpLwVwB6RaLo3swVwkfL2Un +II4/A6+uhQE1L8fWo7r1FGcEpN6w7bio3nGgpzYg+/AzUD+lNC6w2t/UdxscVuUZMNxOn2mZVH lDxSh4MkeBo7QEg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.3

for you to fetch changes up to e131ca83dabc8bfb8c1d455d02bf2d7a7bc1198a:

  dt-bindings: samsung: exynos-pmu: Narrow allowed reboot modes (2026-07-09 15:17:42 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v7.3

1. Fix very old leak of OF node in PMU driver.
2. Few cleanups and new bindings for ExynosAutov920 HSI0 syscon.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      dt-bindings: samsung: exynos-pmu: Restrict children with unevaluatedProperties
      dt-bindings: samsung: exynos-pmu: Narrow allowed reboot modes

Sanghoon Bae (1):
      dt-bindings: soc: samsung: exynos-sysreg: Add hsi0 for ExynosAutov920

Weigang He (1):
      soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()

 .../bindings/soc/samsung/exynos-pmu.yaml           | 27 +++++++++++++++++++---
 .../soc/samsung/samsung,exynos-sysreg.yaml         |  1 +
 drivers/soc/samsung/exynos-pmu.c                   |  4 ++--
 3 files changed, 27 insertions(+), 5 deletions(-)
