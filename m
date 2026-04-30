Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EE646AF2B;
	Thu, 30 Apr 2026 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567248; cv=none; b=jt/oxwICnHkp5+MBgZKVnl3T3s+iyfVcOO7crIXVM3SMiw+7oqxUHcSxDOMybT2xpNugs23/lH7LFRj0e4La2QT1748auekW4MXy0A2xEmNb2NNxkiVUloXM1wc2GJlI36/4wUCxm8HnTbSNipmJ6EdWNCxSyipx3MEQWxw780U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567248; c=relaxed/simple;
	bh=daaboz3lT0timGg6vXzQNu6jqBf2GgW/CH3PoOFfb44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qy3nBJ3IPJMWpPtDCiARtearHb5Q0zrvkVvSYg14B6Qki0Wyv0ALxDzykNYzJ/CBMHNdSfQOnD7Pf/slsE/ISJB9boDC+QsTLxz2APozk3P4NMlKSKUs+5xErCr9bZa2QjXBOpyUKwtf3sG2RSBdvd8JeG60dflrjAmT/LonSpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q/S+pJtk; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q/S+pJtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vS
	LKw/EEYLKveE2xBfEMTup8/azVODA4pMSSclWxodw=; b=Q/S+pJtk04i9h8WuFE
	0fZEh0udPon40eNurFhhR91lmf3n6abGkbo05EE7IsBvBMImfPSM1HOebmu5nvE8
	HspkYhLaZk/lKGsSlqpTTe4nQTvnNevpd7l6/gXCIa8S8DAhL7zQTjFEyKVc9rKJ
	9XVZ5iVvH92Xg7BBBfyXSZuxs=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S3;
	Fri, 01 May 2026 00:39:27 +0800 (CST)
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
Subject: [PATCH 1/6] usb: dwc3: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:14 +0800
Message-Id: <20260430163919.47372-2-18255117159@163.com>
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
X-CM-TRANSID:_____wDnUmm+hfNptZrZCg--.19910S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF4xtFW5Xryktr4ruFg_yoW8XrW7pr
	y8tr1a9an3t3WfA3s3WF4jyF1Yq348tryIga47twnrZwn8CrWUWFZxGFy5XF1UJasagFyU
	Wa1xtry5GFZFgaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piXAw-UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxADojGnzhcDnvgAA3m

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/dwc3/core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 58899b1fa96d..f95201470ab2 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -425,8 +425,7 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	}
 
 	reg = dwc3_readl(dwc, DWC3_GUCTL);
-	reg &= ~DWC3_GUCTL_REFCLKPER_MASK;
-	reg |=  FIELD_PREP(DWC3_GUCTL_REFCLKPER_MASK, period);
+	FIELD_MODIFY(DWC3_GUCTL_REFCLKPER_MASK, &reg, period);
 	dwc3_writel(dwc, DWC3_GUCTL, reg);
 
 	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
@@ -456,12 +455,9 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	decr = 480000000 / rate;
 
 	reg = dwc3_readl(dwc, DWC3_GFLADJ);
-	reg &= ~DWC3_GFLADJ_REFCLK_FLADJ_MASK
-	    &  ~DWC3_GFLADJ_240MHZDECR
-	    &  ~DWC3_GFLADJ_240MHZDECR_PLS1;
-	reg |= FIELD_PREP(DWC3_GFLADJ_REFCLK_FLADJ_MASK, fladj)
-	    |  FIELD_PREP(DWC3_GFLADJ_240MHZDECR, decr >> 1)
-	    |  FIELD_PREP(DWC3_GFLADJ_240MHZDECR_PLS1, decr & 1);
+	FIELD_MODIFY(DWC3_GFLADJ_REFCLK_FLADJ_MASK, &reg, fladj);
+	FIELD_MODIFY(DWC3_GFLADJ_240MHZDECR, &reg, decr >> 1);
+	FIELD_MODIFY(DWC3_GFLADJ_240MHZDECR_PLS1, &reg, decr & 1);
 
 	if (dwc->gfladj_refclk_lpm_sel)
 		reg |=  DWC3_GFLADJ_REFCLK_LPM_SEL;
-- 
2.34.1

