Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418901FBF5A;
	Tue, 15 Oct 2024 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026143; cv=none; b=NVJdPgeffpc3Ix/M/nKfJ36z4TkMUxLCvQnioPgZItd0U22VbaPSDXTQbztTNuMzvpPCmTraIR4gIvzXziImhGvAh6E0VtJGEPR3+sjB6c4SQzwlPql1NhE/JeBoxGUTKKW3qdVbVIFqW4idZgqUNSXs1zC+u62943WTBK9J8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026143; c=relaxed/simple;
	bh=oFo8Q6ugAd9MvV4AXvtFm4bsZ9qTxjvEoBmwTQDMEwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=srbqnxtz/2DhRgulUiBZonBALKkWISeyCzNFC0EpooroGwC6cgQDdRYnCSTefv1VQASlSWfvrKEO3QpqOJ5ZEnAOVFMp/7LshIgoetmUpcfc0Vd2jgiNMKbDjLt+837Y+eOvlQ2c+JZp1HqSC+cqzPkYlx2aDVbb1CICGwT4JQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=PPw6+L+0; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="PPw6+L+0"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmkg6Ddtz4wfm;
	Tue, 15 Oct 2024 21:02:19 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmkX2ZRlz8sWP;
	Tue, 15 Oct 2024 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026134;
	bh=oFo8Q6ugAd9MvV4AXvtFm4bsZ9qTxjvEoBmwTQDMEwM=;
	h=From:To:Cc:Subject:Date:From;
	b=PPw6+L+0UCB4Vb/3QhoCmCb9cD/TLr88rXv9K/zg/0SvIpAWCXUWXGTrmlF19x8Q5
	 4pr+V4uWisEx59pHeXIux5pkZsaGS4h70EPf4Hr6YbGtgJZ3WMrjoq4eGPoeO/S7Cw
	 pnw76r1oeQrfOfqW6bp+S1GnYaGdnMrh/2mm5T53BQSGb87GFrlc5jrwdqaxY6zOVh
	 XxoMTUhxr+HwzJTFgIBGvlBV3bsrX7uckWEYnuqo1S9O/qSBzoxYzuUjZFO/y6ipxy
	 fSevKkz6loDPzxjSmMhhv3elYD7QGb/UDcxbZWYe79GsxrJZoNM+4THa+ULD3yuVnk
	 f8r+lIqMCo5UQ==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	David Wronek <davidwronek@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Add minimal Exynos990 SoC and SM-N981B support
Date: Tue, 15 Oct 2024 23:01:59 +0200
Message-ID: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial support for the Exynos 990 SoC and also
initial board support for the Samsung Galaxy Note20 5G (SM-N981B)
codenamed c1s.

The Exynos 990 SoC is also used in the S20 series, as well as in the
Note 20 Ultra phones. Currently the device trees added are for the
Exynos 990 SoC and c1s. The device tree has been tested with 
dtbs_check W=1 and results in no warnings.

This initial bringup consists of:
 * cpus
 * pinctrl
 * gpio-keys
 * simple-framebuffer
 
This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

The preferred way to boot the upstream kernel is by using a shim
bootloader, called uniLoader [1], which works around some issues with
the stock, non-replacable Samsung S-LK bootloader. For example, the
stock bootloader leaves the decon trigger control unset, which causes
the framebuffer not to refresh.

Device functionality depends on the 2nd patch series:
"Add Exynos990 pinctrl and chipid drivers"

[1] https://github.com/ivoszbg/uniLoader

Changes in v2:
 - Added acked-by tag by Rob Herring
 - Fixed two stray newlines in SoC and device DTs
 - Fixed commit message for the c1s device tree
 - Changed osc-clock to clock-osc and ordered nodes in SoC DT
 - Fixed ordering in the gic node in SoC DT
 - Fixed memory node unit address
 - Fixed memory node reg properties, to map all available RAM
 - Moved pinctrl binding commits to the 2nd patch series.

Kind regards,
Igor

Igor Belwon (6):
  dt-bindings: arm: cpus: Add Samsung Mongoose M5
  dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990
    chipid
  dt-bindings: arm: samsung: samsung-boards: Add bindings for Exynos 990
    boards
  soc: samsung: exynos-chipid: Add support for Exynos 990 chipid
  arm64: dts: exynos: Add initial support for the Exynos 990 SoC
  arm64: dts: exynos: Add initial support for Samsung Galaxy Note20 5G
    (c1s)

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../bindings/arm/samsung/samsung-boards.yaml  |   6 +
 .../hwinfo/samsung,exynos-chipid.yaml         |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts  |  66 ++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi     | 194 ++++++++++++++++++
 drivers/soc/samsung/exynos-chipid.c           |   1 +
 7 files changed, 270 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-c1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990.dtsi

-- 
2.45.2

