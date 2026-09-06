Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC173AF677;
	Sun,  6 Sep 2026 03:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666075; cv=none; b=S1E/DfYSIh9vKqP8rpQTk3dhnNFMmkMExHh2jvl+wrqfwS+27zDR50YxELZGUER+gNkYp6B+zH5dAJPJ+kMvYCEgUPSkZ6sbKyisevuhDeW6k4iAnsZbr5jImR4q1ekb2VNhnojL8gV3fsFlx09oOCi9fV4mo0dP1sVUwAx/mPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666075; c=relaxed/simple;
	bh=h0j5stD46d957APBucFRqb6CrKZZBxEvPkSafupSmCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqUhZx7i2wRkOjs2mZ5yIwGS207EOik5AJ2kRGD7cFzwFJ+84x93Zc3SORUDUA1ZXg8Jva+SBy/rDqqRRpd5i7noVNFOoKjWDRWbVesNQeiFFqIBTHuj8iVUbgMl23VaUBxX/W1hnD7dfqqWkzn7x243Owg8NPMe7BVC79ZPFrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cSAuZc6H; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cSAuZc6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=YN
	opptATUu6tkEGXcgMAKMvS7a6eNXNKQGXv4gfsEdA=; b=cSAuZc6HfNkuS5G+1R
	pPSq9pX7ayFbhxLzg9kZoJY2TOlCNqXm6X2O6RkM6bvTVlVRhz4zRd006SA4LZzs
	ItgaTlv6actVkxXIEBe34y01tjLEVPV0yQ7nCvTI7WQUziHc7BxqVFisIn+fTGOH
	MBZ7afz7gTc9zCbq6CaPAdUF8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCXOSWx4Jxqg+X7QA--.59154S2;
	Sun, 06 Sep 2026 11:40:34 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jingoo Han <jg1.han@samsung.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: ohci-exynos: Propagate clock errors from resume
Date: Sun,  6 Sep 2026 11:40:31 +0800
Message-ID: <20260906034031.85248-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCXOSWx4Jxqg+X7QA--.59154S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFW3Zr1DJry8JF1rCF1rJFb_yoWkGFX_Ca
	48GrW7Xrs0grZ09r1DGa4UAFZ7KF1xXF1YgFWIqw13GFnrtF1vqrsrury0ywn8Jw47tr9x
	Cw4jvrn3XryagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb1rW7UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhIm7mqc4LLKIAAA3S

exynos_ohci_resume() ignores clk_prepare_enable() and proceeds to PHY
and OHCI restoration.

Return a clock failure before enabling the PHY. The existing PHY failure
path continues to undo a successfully enabled clock.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: e864abed546f ("USB: ohci-exynos: add clock gating to suspend/resume")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 drivers/usb/host/ohci-exynos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index cc5cb0900988..aa4eb9f9d69b 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -231,7 +231,9 @@ static int exynos_ohci_resume(struct device *dev)
 	struct exynos_ohci_hcd *exynos_ohci	= to_exynos_ohci(hcd);
 	int ret;
 
-	clk_prepare_enable(exynos_ohci->clk);
+	ret = clk_prepare_enable(exynos_ohci->clk);
+	if (ret)
+		return ret;
 
 	ret = exynos_ohci_phy_enable(dev);
 	if (ret) {
-- 
2.50.1 (Apple Git-155)

