Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5356A47669D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235836; cv=none; b=DBhNhx6i+QAdORDrqN6zyfHYS9wj24ei0HMZC5f7dl4Ki1dM9yrhfkOwavY61XIR2dXoNnboNHrrAakrnfZmgg05a1z7aOtYisnwudHvaEM2Z7UwcMLvWIBn/sbhWnkCq4yq5FVidIdWtt5v2zfgbQR97Hj3o8GqSh+c9/gH33I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235836; c=relaxed/simple;
	bh=4VcLySiLNrs2HXanq3NZ/9gYTI3Tejy+OvNDIdy0xSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAhMQBzJatLBvU39BIrsrsgAdbzMPjqgkIG1Z73yrxeCkraWYHDx1i1wLE2Y/mnLkQkhDvovFvPEScLtRBdPGV2hCbY/miT7mBg/WH8TA17lW5fnO+uXCmdio5K4RB7ESIAR6EfQfsclGxJszaxk0X09Aus4ceDH2iODJH2FfVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=M8TA0jiW; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="M8TA0jiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1787235825; bh=X1cEzBJvBztMxBKiQQCNaB02Q/HGS+t/XW8M/wtGoQ8=;
 b=M8TA0jiWCzNZFvnr1C4NRgTWGRThYdce84U0JxyxmFQAhIwD49kBl9ZEPoak5DXoxXzAL8Cwp
 051g+TGxNrYGQsKJUi9EfljXErFzMZ82mhHrf1JbhgW+uVqvMoeDG/apQzGDPvcK69EoKRSbPB6
 WQz+wCJfjFvynamI6g98FXQ=
X-Forward-Email-ID: 6a870de87f958f0d9fc1b7ea
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Turner <tturner@lineageos.org>
Subject: [PATCH v2 0/2] Exynos850 GPU support
Date: Thu, 20 Aug 2026 15:23:28 +0100
Message-ID: <20260820142330.84514-1-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,
This is my first time sending patches to linux so apologies for
mistakes. This series provides basic GPU support to the Exynos850
platform, making use of the Mali G52 GPU through the panfrost driver.

Thomas Turner (2):
  dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
  arm64: dts: exynos850: Add GPU/Mali Bifrost node

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml    |  1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi            | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.47.3

