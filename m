Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AE4CB8B6
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628171; cv=none; b=ortaN23zn9EFihQCRHeJF/xTGfXyKN3J0el4b6lSmfF8zWLkUGJTaWH4w+6Ok1UA2nvuSVSqcGWIMYza+1Wd0TXFrvACPXQzQul+qb1CwSx5JkUx6nZjjaEm7CslcLo+CdO0IayYzDTFaxKuR43V8/E+UJ+ztBHYUX0p7qyKRn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628171; c=relaxed/simple;
	bh=4XB/I+FIqmb244yO8hTo1zUisuonT4XFLkLy0pw0SRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pe1XdJ+MCHSD/RUlzd2P3uYA/eVTySnzt097KEMnOTRRsMalYlKaqhQ1In7iH831l2eIeMFPVdToGCSNaegi0p8Gv3s57Rsx65eGnovd8spkz5Mr703HKrTKKv/I7wR+mTn91PewqgABafHELDUIUIfdQA6kuVdA47PcpmBzyhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=XPHF4fH1; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="XPHF4fH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1788628164;
 bh=5ENYo56kYOoaOL7ZeChMo/ToS0E03eRMjgDAeWj53nw=;
 b=XPHF4fH1P5cJ63Ngsqj50yAB4/L1iQ/M0Rb2jhAYCmeZ2VTzL5igDAAZLVTB/TLV5UfEthjxM
 BMw1oeGefemSY4jh31XA5SD2CCovRL0KHDao5+grjxIx1vICE4vKq4hhxW4GmKLg15ZsP4FYPws
 0k3Cct6aLTkNmZtzKbWOFos=
X-Forward-Email-ID: 6a9c4cc0a8f35195ccacae01
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net
Subject: [PATCH v3 0/2] Exynos850 GPU support
Date: Sat,  5 Sep 2026 18:09:12 +0100
Message-ID: <20260905170914.1640-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series documents and provides basic GPU support for the
Exynos850 SoC, making use of the Mali G52 GPU through the panfrost
driver. Only basic support is provided here and as such lots of features
are missing. This series only adds the GPU node for the Exynos850 SoC
dtsi, but keeps it disabled, so it stays disabled currently on E850-96
board (The only user of the Exynos850 SoC dtsi upstream).

Thomas Turner (2):
  dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
  arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml   |  1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi           | 13 +++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.47.3

