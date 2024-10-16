Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BDB209687;
	Wed, 16 Oct 2024 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093694; cv=none; b=W86NMQP0ttXo4XVW8F7XQUpDUSELizMbMQYlewa0dv5Uaplb8lijDKOo1KR20YXN170ze4nslCjxyatxxIiQMq+SiZw3zTcGbuv7de36Vq6IZy1QLtxi0RBoV4VA5zTmICjqJgAMaIyw/sSKApDlqkkDXxFQm91keM8udstzT2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093694; c=relaxed/simple;
	bh=UzReICUwjuiKmaYcPXjeBNBkJrLCOu3fJf7hC55t7gA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FtbzYfn2+MQ7u+VJTBzp3qVfr8Iz/+SlN7rFLl4NxGeECsZ2V/nyLtgWzb9FkjgLBGAxJvj15Z7eOicxgKRTSyizaix5MizTXsaByPR62VI8MFTKXd4RiIP24SjJWCjX5LoAmIaocNrrDAsPEJG+tjQy4Y5DIiaRarBFfETJOI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=QB+pov86; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="QB+pov86"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTFjk5W3jzGpQ7;
	Wed, 16 Oct 2024 15:48:10 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.245.91.ipv4.supernova.orange.pl [83.8.245.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTFjb5XBwz8sWQ;
	Wed, 16 Oct 2024 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729093685;
	bh=UzReICUwjuiKmaYcPXjeBNBkJrLCOu3fJf7hC55t7gA=;
	h=From:To:Cc:Subject:Date:From;
	b=QB+pov86J65XfMneAp09XeIRJd1E3+l+zmjICsAMWFrmppQ0/smimKMK1cwiPOKop
	 uBxPG/qtVfOWPCgl23lounrxpiVjBT3UFm/3MwZ+7DEcT23g5lN3xeWbJ6OKus2WnW
	 0dYtio+uL6wo56Jl/fCOsiCqFVTKupdvTnsYQC1g0hvwtCQpjVJXkulZDf1e1ssZK0
	 wNm/wdAMdPMPiQKb3lcnCbnmnzv0QSKpuYoGmMm9f6yuwh1LEu9+5sa4NxBQJSdeW1
	 3S0cwvuRFnkhiuvmRxyC3Jjjfq7Fn6Bwq7hm7I8oRdvHtUK9eFSSGi7JZ1LCcY4/3W
	 26Zu2OkN/rlnQ==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 0/6] Add minimal Exynos990 SoC and SM-N981B support
Date: Wed, 16 Oct 2024 17:47:41 +0200
Message-ID: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
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

Changes in v3:
 - Move pinctrl DT nodes from the 2nd patch series
 - Resend patches to the correct lists.

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

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 .../hwinfo/samsung,exynos-chipid.yaml         |    1 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts  |  115 +
 .../boot/dts/exynos/exynos990-pinctrl.dtsi    | 2195 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi     |  251 ++
 drivers/soc/samsung/exynos-chipid.c           |    1 +
 8 files changed, 2571 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-c1s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990.dtsi

-- 
2.45.2

