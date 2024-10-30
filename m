Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA30217644;
	Wed, 30 Oct 2024 23:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730331004; cv=none; b=pj9TVNH7KK6CK2pf0jKGrJSwHduKX0Sf0z+vMJm/iMMKvsCRV9hbH+PNjysLberv5Ob1cdvEOdP4sBGTMQ1p4VwKC6CcGW1wD+hiUCfm8VW6sdXZcxkxh2RPt7rafjefNX3ZLuEuSK3cW9tlXS1xRVh1fmUqw9XByr63+lfaXyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730331004; c=relaxed/simple;
	bh=ySGE6+spXq07duUYoCM1MEjMmiwjMBzSrzNtt8dRkUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KqzDjvSJIrHC0Pwdq/k60r5mobKwyWA/U2s6Wyms5sOmUIn5Ph7nJkowgXtzvv1ngnkaH3H0IKszzEW+4oBUFGdEJOF1hPOgBIQWwomgVwnT4wxXLyjHScWwcNYlN1LZRXgKjrw2XCcr70/VnaF65FWgvrov2Fmz06+sMSXLCjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=crSA89ni; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="crSA89ni"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Xf38m1G3bz4wJj;
	Wed, 30 Oct 2024 23:23:36 +0000 (UTC)
Received: from umer-b550pro4.lan (host-92-8-254-228.as13285.net [92.8.254.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Xf38c4KZ3z8sWP;
	Wed, 30 Oct 2024 23:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1730330611;
	bh=ySGE6+spXq07duUYoCM1MEjMmiwjMBzSrzNtt8dRkUY=;
	h=From:To:Cc:Subject:Date:From;
	b=crSA89nitLEjy5kyJ6Rq1Ywgdg03QxqjJ4Is2tvO0iEzCosmZ5hDxEmrI3uLQyQ/V
	 csXbEufYzhSqKGpllwvBqTub7lYbKbsZIxzmSrlxXP8hS63wTuNPBCl7V0ihbTHA9V
	 Cmax7kNgrbp5jIa3xV4MRhjYNmtIryorlwo0LblPo3oBYMNMDgz/mQbrH8GhPgZ9D+
	 BlKzAAoxJwMd+S0ihoaI/qfgFEDBr3rH8O1QmGzarlVMvsYhKOaOVf/DgZhHNoB//E
	 RNUGCULDkm5NMcHmm2/6+Q48T6mfQeazhhsh3plcN1zv3VOrXzdpX3rxWqTTAhTT/f
	 uDEB6dMKkVazQ==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v3 0/4] Add minimal Samsung Galaxy S20 Series board, SM-G981B and SM-G980F support
Date: Wed, 30 Oct 2024 23:23:04 +0000
Message-ID: <20241030232308.72210-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial support for the Samsung Galaxy S20 Series and also
initial board support for the Samsung Galaxy S20 5G (SM-G981B)
codenamed x1s.

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

Changes in v3:
 - Fix oversight in yaml
 - Decommonise memory map

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

 .../bindings/arm/samsung/samsung-boards.yaml  |  2 +
 arch/arm64/boot/dts/exynos/Makefile           |  2 +
 .../dts/exynos/exynos990-hubble-common.dtsi   | 98 +++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990-x1s.dts  | 28 ++++++
 .../boot/dts/exynos/exynos990-x1slte.dts      | 28 ++++++
 5 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-hubble-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

-- 
2.47.0

