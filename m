Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4689C22257F;
	Thu,  5 Dec 2024 19:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427368; cv=none; b=UPXGFCKYGySxuGEAcH+gDpuiSb8LR9TnL1kUirVGY86apKX3KmWjxuP+6rGBANpq5FKx+Y+T9ZnaxfW57v31rqZmuYP/Hv1BWzdO37uSF/5dJPwSqkOBmzN2MHrZwR8cQKDLRXTfAP38x5VMXyMaMZZbYNXOQnKFBdRVB2tgxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427368; c=relaxed/simple;
	bh=Wcwqyb0t9X8Dian9aqmXA7QSUUAXJ9EdO7wmHSMUfAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+mlqLGgf2CeYswEG+970U9Xs4aboa308lhGKyUXyS/c2Xxsiy8fvo5rrNi1iwq+CDHLJwnpV4lK6joz7F3lvyzZipREzyDyo+H6RCBcFB3xy3VTjhcIi4egnVWpmbT3cs130a8T7Bwz+WFodMyak+beyIaN3TppTOrCy/fcRBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=R+knRNXp; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="R+knRNXp"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44PW2Zp9z4w84;
	Thu, 05 Dec 2024 19:35:59 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44PM1J9Rz6tkK;
	Thu,  5 Dec 2024 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427354;
	bh=Wcwqyb0t9X8Dian9aqmXA7QSUUAXJ9EdO7wmHSMUfAM=;
	h=From:To:Cc:Subject:Date:From;
	b=R+knRNXpFoK5kazo6L7cMtbEIAPAE1APKmdGwMnFEDtCYulqxwUZ7y5eN74BZJrCr
	 K/9sUJgqCXgqu7JdijDEQQmp+u3quu4PHEAif2YTZ7vm/y2coNrBv/dM0tNdIWB2cy
	 ieSDzsy6Ta3zhv9JCYnlmzYte/DzKqWUwoRwBo8XOTENq2oOihXAPLB7aVoxlgSjMw
	 ihe4KZN1VOhDjcVvf7LqpiQgxf/gKWJ12xekbyhat5CBTF/WQreaZk/cnP3CzBOS1W
	 U2jAivb9UmyL4B56xrr9n0Et0vzaq0PkAwZBUSMIcT9mbMujLVimxW5pi8xs6YRMPr
	 9BhizRLS37mNw==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: v1-0000-cover-letter.patchFrom 10d9a244391bcf592fd3e5fd902bae7f01cb4d4b Mon
Date: Thu,  5 Dec 2024 20:34:20 +0100
Message-ID: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patchset adds support for the Clock Management Unit found in the
Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
MCT, et cetera.

Currently there are two blocks implemented, CMU_TOP which
generates clocks for other blocks, and CMU_HSI0, which generates clocks
for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.

Best regards

Igor

Igor Belwon (3):
  dt-bindings: clock: Add Exynos990 SoC CMU bindings
  clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
  clk: samsung: Introduce Exynos990 clock controller driver

 .../clock/samsung,exynos990-clock.yaml        |  120 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos990.c           | 1343 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   14 +-
 drivers/clk/samsung/clk-pll.h                 |    3 +
 include/dt-bindings/clock/exynos990.h         |  236 +++
 6 files changed, 1715 insertions(+), 2 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos990.c
 create mode 100644 include/dt-bindings/clock/exynos990.h

--
2.45.2
