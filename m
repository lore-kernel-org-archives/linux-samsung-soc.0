Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FAA4E06C8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592150; cv=none; b=I0mM+v+yOfldsEBjltFdoaWDntLqsEyJsdqi1+a6wIEdxlJO2QaqLxpc4AlPkBUVA1SNfsbCpPAlvLQrtIwBb+t49FZJPVDTIJK1i6gP8aP3+5AhHhQlOG7psVvmOpTzzxnHqtRYi2/5UUN1QeXZwu9umKLia+ZPSzJpaHOUjk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592150; c=relaxed/simple;
	bh=CzDD2R+HST2rpki6WrApi1bzIWeOuTLg/oljiGd86Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2E3QKpW323KqZMqBm9DWYJ2XlkAUDJ/CPp3U0Q16OosaaiVPUQLgPea+rcJZZpIG6k6pZSxe8N98pt5L17I+E4fELFd/GjxDJTCOlCh9iiSzJEcFclOoQOBAr83Re5cLWd1DRZfjpjAcyIQUBkwka1rAu3QukoaBW0WsKjOKcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=Naaq9cf1; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="Naaq9cf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1789592135;
 bh=WX0aF21R2mP7RGx/+rzffx7XjP8BJ0d9+NlEMIeB3pc=;
 b=Naaq9cf1blR7WlS8lBR9RNR+/G2671wUq9zF+67d9DBCawoJA25NWAxTFo8QKouzkdTTroFkq
 gmYwKR36OdgaY0VGP+z5S4UfAbBsB+Za6gya4QC61p4fCBbqDIjF6/SgdBTTsg084kTfpPFCklq
 Xeamj27K9rkxmMgOxq1DSG4=
X-Forward-Email-ID: 6aab024007c281602cddbec7
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzk@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	semen.protsenko@linaro.org,
	alexey.klimov@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add Samsung Galaxy A21s support
Date: Wed, 16 Sep 2026 21:55:20 +0100
Message-ID: <20260916205522.159393-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is a small patch series which adds support to the Samsung Galaxy
A21s. This device is part of the Exynos850 SoC and its device tree is
very loosely based on the e850-95 one.

Thomas Turner (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s
    (SM-A217F)
  arm64: dts: exynos: Add initial support for Samsung Galaxy A21s
    (SM-A217F)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos850-a217f.dts | 200 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   2 +-
 4 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-a217f.dts

-- 
2.47.3

