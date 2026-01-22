Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853FA335BCC;
	Thu, 22 Jan 2026 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071407; cv=none; b=HhUCmaJ09aS+rkdRd4Ii6eg4EX+c4EkRjozmI6acLr7dTRHIo2w7x2q8o2lp14S3mCaiO1cl7uAa8EDjDLEe+4UcEbyHZ0xTk41DqGx29zOXAX/eA5LIzBOaBrZU39esEQMY3acoV3NDIMndGg5WWfpnRoLQpXXAsByyimPjbys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071407; c=relaxed/simple;
	bh=vTwi/NHZEXCw8rQu6gDRc7cezwzkz+PlJrNrSxFuyc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qqC5GkMTfk3nFv2z0aFo+tRV2Pq4Pk4OdJzniSeX3krk+wfhJY8wiTs2bxHkVo4nUoeXO1Lx6jjZyB7g66vt6hm5dLUq+LhtdrYBT9Sux8MuypWG2O+I+n4MLj4dRX6n/Rs4FrehhTnO/VJ15XMnFOfxXObxwjlJbFaNYOYLH9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsrB5/y4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsrB5/y4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDB4C116C6;
	Thu, 22 Jan 2026 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769071407;
	bh=vTwi/NHZEXCw8rQu6gDRc7cezwzkz+PlJrNrSxFuyc8=;
	h=From:To:Cc:Subject:Date:From;
	b=AsrB5/y4IELmNV85mprWCwbOfZcQjFBmRNqpt8p5c6PX9mdMaKmpjYt9FZZq3390J
	 bm+QwFU1ebCuZBKq5EF/oKXHfOYp/n78Z01vriAFeqEoh2/mdCWa/KrEvl0IbkMTDw
	 oEw1g5sxrFtfLP6kHTFloHn2yDJNrsRyclW4CCiQ7EyMgdzcvDUlShSqGB6oEnn1lH
	 /hU+El7E2us7zlWV/paJN1+qANdXY97RwqFfQ+dRkcvPhugNcrI2nyyruTLZmyU6VY
	 GROXszF1gTBsC865B11qEAPdUBv0HfPfz1dvfKei2CJMkRgaTYznoFpb15B9GDerVx
	 OEjW3dcup1/bA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64: dts: samsung: dts for v6.20, part two
Date: Thu, 22 Jan 2026 09:43:21 +0100
Message-ID: <20260122084321.20861-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=krzk@kernel.org; h=from:subject; bh=vTwi/NHZEXCw8rQu6gDRc7cezwzkz+PlJrNrSxFuyc8=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpceMpEY9BpcVQTRSK8N/qEzFBd9x5yxM0Exjzf faLCT6yKTuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaXHjKQAKCRDBN2bmhouD 15fFD/9CMh4H0Pyi2zGifs2Who2Sm9eAp3+0CQiPzpVUXj1sCnH9NSlR7RwJz37L/+qR1a2E3lT zrtXsKaiDg2bCtE3xXT3RBXb0q2ijO+BiQE2vQFEEPt3UGnj29hdTadjbrcaDhF9pBQkVrhJq59 pblvipcGom4IuC56GzyR+eSDkC9CH10OntYn6kJALtSDGYzyfjA9jGti+7m4WnEZTPlFj+CjzHN licpRLI5Zq+mqaD291CjQBtHTgbPrHTs7KmpPpinFhS+C9vwq6eX8hQ1CQD2WsAHxtSBXZqJ2sX a/hSiRfMi6SYHgrz2+B8LPl1PCXeDXs2TaNo5QR8yGQZsOXNEcUej/c2TeYVjTJ5vxGZaL+rTSX o+e0fwspdPt1UQu333RGtcxCCQDWH1Iq4sTUvtXDKgCbdDHwkWIHY4Y6fS9+Mg9/qUeVCYkOy5/ F7JtBgtFVV/O6pcLiGDSubfsGB9br9/Mwgmt8BKMZjlvZpBforLa4YXc2QBmXFzx6pqQCgK3VcU DIl4n/4Ske0aJtfXRMnq/ry95wjKuAkc6jGkXq36t4lSvSJgVfv1xd/63EGkhn7iL2ILpWsklMU 39wd3RNgcmfCbJpKzd36Ep+TEJ+hMJdCFf+skOrX49pOmGHpn097xRmwdqFXsZ8BOACXTkm6PSw aUVoncaoBE6La+Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

On top of previous pull request:
https://patchwork.kernel.org/project/linux-soc/patch/20260117180406.9361-5-krzk@kernel.org/


Best regards,
Krzysztof


The following changes since commit 9afdf3e1a59e23180540ecb1fe3287c308cc8113:

  arm64: dts: exynos: gs101: add OTP node (2025-12-28 12:32:42 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.20-2

for you to fetch changes up to 024d8f4aa35970c4563c6ef0c4170133719b2103:

  arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes (2026-01-17 20:32:20 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.20, part two

Add DPU clock management unit nodes to Google GS101.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      Merge branch 'for-v6.20/dt-bindings-clk' into next/dt64

Peter Griffin (3):
      dt-bindings: clock: google,gs101-clock: fix alphanumeric ordering
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes

 .../bindings/clock/google,gs101-clock.yaml         | 21 ++++++++++++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 17 ++++++++++
 include/dt-bindings/clock/google,gs101.h           | 36 ++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)
