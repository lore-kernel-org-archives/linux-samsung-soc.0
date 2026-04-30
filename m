Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B818477980;
	Thu, 30 Apr 2026 16:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567234; cv=none; b=JRAyq9pUdfxnYQBg7dH2jt6Kg14HGXj7MgoZW6kLlSEgTOdeSAjG2yG5rsEdnfrjEEPs6TNDcndB+0JjzsKnmMe2O8GYpwlECEBV5E8sPBKs3hQe4ocCkUETBicqYyfqOeTxk1hfC76GVPGfHUT4VGIvzb+eiijX0Y3d1Mx/040=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567234; c=relaxed/simple;
	bh=sKOEqJsOrWKT8++JhNth1eqD0mPHunjATG+2YZfV7qY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GjqfWqTImOwzGm9oVfRwS+zeD4DTwG+U421YilzByApWMVfjU6OPRAlHeTvRG01DB4PA4UIwhwLVYT+AdH1MmckWXCajoZvHJRShU7kjSsoOaHM1OFHhuhObHD1LO99G+Mqxjz+Ezco6I7UG0McWzM5v5BFnPRrVcL1YwTe/wGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=A4+Y8Gsw; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="A4+Y8Gsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+y
	6l1pdaoPallINfZ97mYoBt0a1nOeHpavNgPm3SNZU=; b=A4+Y8GswvRq4Q6OR/R
	XJ0wL77xFznNKE3+KXDYF9hgEPKh70hDL/7zq8/Q7lvBhA+yIn0vKXROtKF+X4NA
	vMcA5moJRaLcM+punh/dQAWSAOvfyOejRIxvI3Lu6F0dkRr2vtIOMpRV8IYMKAxm
	SlwlnxwrUw96sYfqXXbMQOFjE=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S4;
	Fri, 01 May 2026 00:39:28 +0800 (CST)
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
Subject: [PATCH 2/6] usb: dwc3: google: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:15 +0800
Message-Id: <20260430163919.47372-3-18255117159@163.com>
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
X-CM-TRANSID:_____wDnUmm+hfNptZrZCg--.19910S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4fCFy3CF4DCw17Wrg_yoWDWwc_W3
	45Ar1Svr1Dua9xtF1qk34fZryqqw10q34xuF1jqay3Gr1UKFW8WrWvvryktryrZry7Zrn2
	kr4DuryY93srtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRu89K3UUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wDojGnzhcDQDgAA3O

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/dwc3/dwc3-google.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
index 4ca567ec01d0..60ee4cc99b28 100644
--- a/drivers/usb/dwc3/dwc3-google.c
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -104,9 +104,8 @@ static int dwc3_google_set_pmu_state(struct dwc3_google *google, int state)
 	regmap_read(google->usb_cfg_regmap,
 		    google->host_cfg_offset + HOST_CFG1_OFFSET, &reg);
 
-	reg &= ~HOST_CFG1_PM_POWER_STATE_REQUEST;
-	reg |= (FIELD_PREP(HOST_CFG1_PM_POWER_STATE_REQUEST, state) |
-		HOST_CFG1_PME_EN);
+	FIELD_MODIFY(HOST_CFG1_PM_POWER_STATE_REQUEST, &reg, state);
+	reg |= HOST_CFG1_PME_EN;
 	regmap_write(google->usb_cfg_regmap,
 		     google->host_cfg_offset + HOST_CFG1_OFFSET, reg);
 
-- 
2.34.1

