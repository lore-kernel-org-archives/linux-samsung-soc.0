Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31802F1985
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752166268; cv=none; b=kc3VFU0oGWfuBSe08ssAKjI3y7QJfuyJyFUS0ijJRfMhFMW3ytdnOaJA/Xy7biJG1qUyYtQXs3tGhqZCL5Wx9APQ9JceIjLtFNVlRZmOhfpkDaiuet5zAbWE9Lf3uB4gxiB8d85oQZyjhExsx1pTxpaG6w//rWEssAM18pkQvFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752166268; c=relaxed/simple;
	bh=IBymJfzBstz1MeeVPUcDhdidBI0tA5+7Lk35AymMU+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I62PgvmsPY/s4UNkmKo/URu9vG61S1hiRntP/pZcsJQhzDiQt3oYXPSclDsUHF1a+MN4VUdzo940dDNAdIRayQlRo3UdWu+mLU1c5O+m/Ns0+BTS0J8B9KWX/5UNEdhCtgBvr1HvQlfmulBCrEG/JwHSww8YKkrTBVx3hpGDwGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=WFxwfdD0; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="WFxwfdD0"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=WFxwfdD04n3wF7wZ9j6WuJLs6nwkzhfBs4SMxgQZRUPrlueXnyEX+72EFcAfq0lt60XYtPo0g5ieN7On3OUT+48TV9/j7SCEn9s/gXzA3KxTWVdzcMdYu4J4IuuTiXGpmOY7PBMCr7VB8h2knKu3XldRP/bSEVVMFeJQyqObSLykJHcAaAZ8/yjOiuE2djMVMlbDX0gs4+s4KNELYrTH9NUwICUpEFCcEWrho2hVt2IBk8NzsCQucmCOxdsh5ezf1udT44PKLWl791tVIBop/lnDSKWBzD46tl+aJvunPZbuIziQhejDrEhqeFW/kCAv5CAKVRSG9LkjaF+0NpaAbw==; s=purelymail3; d=purelymail.com; v=1; bh=IBymJfzBstz1MeeVPUcDhdidBI0tA5+7Lk35AymMU+U=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992400030;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 10 Jul 2025 16:50:36 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/5] Add watchdog and USB nodes for the Exynos990 SoC
Date: Thu, 10 Jul 2025 18:50:04 +0200
Message-Id: <20250710-resends-july-exynos990-dt-v2-0-55033f73d1b0@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzvb2gC/x3MQQqDQAxA0atI1gbGkdqmVxEX2sQ2ImOZqCji3
 R1cvsX/B5hEFYN3dkCUVU2nkODzDD6/NnwFlZPBO/9wz8JhFJPAhsMy7ijbHiYjcsgzFlxR2bU
 v4o4g9f8ovW73u27O8wLFMmEfawAAAA==
X-Change-ID: 20250710-resends-july-exynos990-dt-1d693ba89db9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752166235; l=1589;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=IBymJfzBstz1MeeVPUcDhdidBI0tA5+7Lk35AymMU+U=;
 b=dqv4xyGid0KGhulrr1Be+8DqEJEvXiyNT93jtGJCN52SJo3WWH1LR3kT4HIlGmVj69QxZZRdt
 sqyqFf2dft4AxVwIaoabt5T/xFJAf2twVuwc0SQCk+T0w2e2fHW/mXh
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Hi all!

This series adds the nodes to enable the watchdog and USB support for
the Exynos990 SoC.

The watchdog consists of two clusters (cl0 and cl2). Unsure why Samsung has
skipped cl1 on this SoC. Both are enabled and working - tested on a
device from the -x1s family.

The USB controller of this SoC supports full-speed, high-speed and
super-speed operation modes. Due to my inability to get any of my
Exynos990 devices to enumerate as super-speed (even under the vendor
kernels) only the UTMI+ setup is done - as such, only the high-speed
mode is enabled. Dummy regulators are used in place of PMIC provided
ones until we implement PMIC.

Changes in V2:
 - reordered USB DWC3 glue node and PHY node (sorted by address).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (5):
      arm64: dts: exynos990: Enable watchdog timer
      arm64: dts: exynos990: Add USB nodes
      arm64: dts: exynos990-x1s-common: Enable USB
      arm64: dts: exynos990-c1s: Enable USB
      arm64: dts: exynos990-r8s: Enable USB

 arch/arm64/boot/dts/exynos/exynos990-c1s.dts       | 16 +++++++
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts       | 16 +++++++
 .../boot/dts/exynos/exynos990-x1s-common.dtsi      | 16 +++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 55 ++++++++++++++++++++++
 4 files changed, 103 insertions(+)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-resends-july-exynos990-dt-1d693ba89db9

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

