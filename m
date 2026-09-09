Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7963C2BA4
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983109; cv=none; b=LowitU7O/MGm4HwrZsJRqiFkML14rCDJfI3rU99bC3ktwUJ24nP1P4VQvTRZdagO8zJE/i7dQeAM+s2Y/YYWEYzFThYlg5eCwtqo3X2eqbE4eE3sJGDAleKGRfhTRKAva79JpWCTU/mUSF2e11M7/e1Za/OraP24mFuqXMiT7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983109; c=relaxed/simple;
	bh=4XB/I+FIqmb244yO8hTo1zUisuonT4XFLkLy0pw0SRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DCi+QPGViEIUGDmfjem5sQ7WXThR4R6Wg0alR9D5IYTyRD6sirJALB6oFSZ7GhIm4GBgwPEmNNMfAFK5QKngR9/wou1T2hUcoLKhfAh50K5cshL2abBzaFd5X1W+EBH/Gk/z4cI7W3tlIGayCBqbwa6E156c+hiiks6Gy8MRfoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=kPCYlq4Q; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="kPCYlq4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-2eefaa527c; t=1788983101;
 bh=5ENYo56kYOoaOL7ZeChMo/ToS0E03eRMjgDAeWj53nw=;
 b=kPCYlq4QFFsWgl2/vPxglOHfZ6sF/TCthjTr/ncpVcXs9fSL4+hcnMgBPviNk+r6yAsSxCrzI
 Vj4dEwhs2pF9E3CYXzdm140Df6WCSl4vkTzd0Nxv6zTCthm0QC9CipAQUjS/WYCjoXzEWBl8KBF
 3d2YbuR3vRdzIaRiu10SOCs=
X-Forward-Email-ID: 6aa1b7365382f19eb5d6c7ab
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
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
Subject: [PATCH v4 0/2] Exynos850 GPU support
Date: Wed,  9 Sep 2026 20:44:48 +0100
Message-ID: <20260909194450.183693-1-tturner@lineageos.org>
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

