Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70681DF27B;
	Thu, 17 Oct 2024 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183427; cv=none; b=dYCERpCVyuhh5tk/OtJlQ3RX0ZrQf6wc1mLNRZybujqzmWprKAVXNVrSsmt913smhmlaQfOwRNEVC7OWWdwheiRcnmMv5BXuF96XNpV32gTeC8tXT/NkDaUYTbBKFMzrXb9HBbgHuDHhoAYUcG9ZD8zKZMR/6YX8Wa+AoVcrMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183427; c=relaxed/simple;
	bh=myOoGL5xyiVsKOACRTACaGSVj0z1M0vMgUF1is3sZy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O/3iYvwEuWit5PVQd6MrJXPrWRyVmmx5mUhlhU9ng2aSW2UkGAPVs3mhWDyvEkQrlXhR6a9yvi8ZKHDKXcFRjPpUv3qo532r9//SrrUuTqY9eg0/LVO+OnAKAePk9y4yxs+kGCGhHM6enMz9bImaTxYUlCSH7xHE1UOzTTNrDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=fsYdlzyh; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="fsYdlzyh"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTtvG3ddtzGpSk;
	Thu, 17 Oct 2024 16:43:38 +0000 (UTC)
Received: from l-latitude7390.lan (host-80-41-166-50.as13285.net [80.41.166.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTtv70712z6tkK;
	Thu, 17 Oct 2024 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729183413;
	bh=myOoGL5xyiVsKOACRTACaGSVj0z1M0vMgUF1is3sZy8=;
	h=From:To:Cc:Subject:Date:From;
	b=fsYdlzyhhS8KM6A8NvPGYDwX3UFkXGWzAec2dZ3iOcleXtL8thR/U7cOd7IFhEhyC
	 lHAAbdcx9pQgogSc10/Yio8pPo1GjaCXuu5ibVu1uGaBs3QyEtbl9SjcZX7TTn9sML
	 dacbVBFvAVr2jjGvxOKpXjN2uXC+XhDaTa05MvLUR2GqHM850vmCcaWkxKYM+oWmOu
	 3Wpec6HghzXALzK362qE06Ppls+TMEvPW6SPg9IdQMmpHTNMluu1jMSEWmX9a0rew3
	 QOPZftO1zk3WqSm740mgx4fgy0d0ZmQCcE0hVziTZxnAK3jvkk0ZmEh/kf6h+26yvJ
	 a/p2ZAn2BtwjA==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v2 0/4] Add minimal Samsung Galaxy S20 Series board, SM-G981B and SM-G980F support
Date: Thu, 17 Oct 2024 17:43:23 +0100
Message-ID: <20241017164328.17077-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial support for the Samsung Galaxy S20 Series, also
initial board support for the Samsung Galaxy S20 5G (SM-G981B)
codenamed x1s and the Samsung Galaxy S20 (SM-G980F) codenamed
x1slte.

The S20 Series feature a lot of similarities in their configuration
and internally Samsung named the common devicetrees in their
downstream kernel 'hubble', please note hubble excludes the
S20 FE series and Note20 series.
The device trees have been tested with dtbs_check W=1
and results in no warnings.

This initial bringup consists of:
 * pinctrl
 * gpio-keys
 * simple-framebuffer

This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

Just like SM-N981B, the preferred way to boot the upstream kernel is
by using a shim bootloader, called uniLoader [1], which works around
some issues with the stock, non-replacable Samsung S-LK bootloader.
For example, the stock bootloader leaves the decon trigger control
unset, which causes the framebuffer not to refresh.

Device functionality depends on the patch series from Igor Belwon:
"Add minimal Exynos990 SoC and SM-N981B support"

[1] https://github.com/ivoszbg/uniLoader

Changes in v2:
 - Add Samsung Galaxy S20 into device tree bindings
 - Add support for Samsung Galaxy S20 as well as the 5G variant now
 - Fix typo in Samsung Galaxy S20 5G commit message

Kind regards,
Umer

Umer Uddin (4):
  dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B
    and SM-G980F board
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series
    boards (hubble)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G
    (x1s)
  arm64: dts: exynos: Add initial support for Samsung Galaxy S20
    (x1slte)

 .../bindings/arm/samsung/samsung-boards.yaml  |   2 +
 arch/arm64/boot/dts/exynos/Makefile           |   2 +
 .../dts/exynos/exynos990-hubble-common.dtsi   | 109 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts  |  23 ++++
 .../boot/dts/exynos/exynos990-x1slte.dts      |  17 +++
 5 files changed, 153 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

-- 
2.47.0

