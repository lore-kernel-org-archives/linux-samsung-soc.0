Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25155217F33;
	Thu, 30 Apr 2026 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567229; cv=none; b=I5tzjb/VcK7ldyOT5g5kRO74jYvl5VNs3QmXdNPb2f+OOFIfxhvWYnuG1k+3nghjRXhZqXboxvKF2WqynsH5EcDdMqMUfP6urpwU4iUukHW1mbiMxTA0ct+TE61ruZgWvgrwX3k9u4SgDI840/wxixXTZiHsyemIEhiJJ1SWaeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567229; c=relaxed/simple;
	bh=BPPMxRD2SSp6eDfvsK4p400r4gcT5Cp2ESrsOWEkukw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jG6xrRdTnYm4Q0mkkfs7+t5BwoFHOfFZYEhaZIl5JXOBE9hMsMu7t3lJbWYgSoXChQanbvWgvzp/su66eDNx7Zhf50Bb76KDgv+R0cG/2sUwzAWNIw6f1DOfxFfgeaR/9E63aVEO/leHEsIUHaS7Prq1F0j3ya8sg8UicXR8mO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dYCPvYtv; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dYCPvYtv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8L
	R2nmJ62loXDtxlHutXhsVIE0IN6VZYRDDuR+Lj7rE=; b=dYCPvYtvGlhcQPpKyi
	69+S6+sI3KzxYSFm1SLj0ihlOiYuQkqwdCRnUuYlp7/EyjE/HOEx8xA8LFWix+mJ
	P2vDM+TBBFCwIszaC/SckWPh3hRyIiIZvTDGXw4L64gP+7eZha4lIMwFtEIHTshT
	/D5F6Kiz52GfApUlOjZtE/mTY=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S7;
	Fri, 01 May 2026 00:39:31 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 5/6] usb: xhci-mtk: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:18 +0800
Message-Id: <20260430163919.47372-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnUmm+hfNptZrZCg--.19910S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4rtFyftFyruw15Arb_yoWfXrg_Cr
	95Cr1xJas0kwsxCr4DCF15ArWqkrykXw48ZasFqrW3Ka4Utr1Sqryvkry8tFy3ZF4fGrn5
	GanIgry8Kw4FvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMTmS3UUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7APojGnzhcPaBgAA3L

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/host/xhci-mtk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 06043c7c3100..d9b865546a67 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -185,9 +185,9 @@ static void xhci_mtk_rxfifo_depth_set(struct xhci_hcd_mtk *mtk)
 		return;
 
 	value = readl(hcd->regs + HSCH_CFG1);
-	value &= ~SCH3_RXFIFO_DEPTH_MASK;
-	value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK,
-			    SCH_FIFO_TO_KB(mtk->rxfifo_depth) - 1);
+	FIELD_MODIFY(SCH3_RXFIFO_DEPTH_MASK, &value,
+		     SCH_FIFO_TO_KB(mtk->rxfifo_depth) - 1);
+
 	writel(value, hcd->regs + HSCH_CFG1);
 }
 
-- 
2.34.1

