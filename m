Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5F340281;
	Thu, 30 Apr 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567250; cv=none; b=E0EcxRlb4bAiM0wDhLGDU1u6pE1QE9GCD5F0hkPDECNDBfU7gfcOeklJquoV0ioJlhbaJXve9fGfHksnSH5gCOjQlDRlMl+FBjrjAQ2rp2DBVnDuGIewslc2Qxr+GkUo+LrJKgGTIcgat8Ik8c0+0iHxza9oWNJ+YISIBcNqagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567250; c=relaxed/simple;
	bh=litEndzInZQlLNhJFQfIMPTNL+60r06FJMhplvXKHFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FPnxeriSf3wZm//CR0oZKwVO7vITmlQNQXqXNJqfxsbpewBhkY/7Qn995rIpK2+n1q5CqqcgYEj7E0A+8/+dyQr95Z1+EV6erwZshDByofY3h72n8P/7K5+wqTB6zmW8LN9lZ7S3+LQ9+FcpU/BM4hBKeuOCqDORd8wxK8xNXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W0e3U/bg; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W0e3U/bg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nm
	hpT4qL3TiNhJTJA/kcqIVRxB45Z2PLUQn6pZidorQ=; b=W0e3U/bgin+AuHDDL0
	BIQE7AKnX9pGu7MeN0X9SlxSCh4a2+z6e7KWdCDcBevH0JL6NLRJWHi5ZoEMJB/+
	dybTTH+4RPO0CBYg5V1jNxYmicqJSF/KCZf6YlYTr+sAlxa0EyFBnT2Dk7e2AkjC
	rovquYX589WMPKQ5gPBKI9a1E=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S8;
	Fri, 01 May 2026 00:39:32 +0800 (CST)
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
Subject: [PATCH 6/6] usb: typec: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:19 +0800
Message-Id: <20260430163919.47372-7-18255117159@163.com>
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
X-CM-TRANSID:_____wDnUmm+hfNptZrZCg--.19910S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4fWw1UJw1Uuw43GFg_yoWkXFc_Gr
	18C3Zayr9YvFW5A3W3Ga9akr1kta1jg3WagF1rtF1rAr1DKr18Wr45C3ykJFyjga1F9r95
	CFn5XrykZr1fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMTmS3UUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxATpjWnzhcToYQAA32

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 0148b8f50412..24c87dfa6b64 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -141,13 +141,10 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 	}
 
 	if (vconn_pres) {
-		if (polarity == TYPEC_POLARITY_CC2) {
-			reg &= ~TCPC_ROLE_CTRL_CC1;
-			reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_OPEN);
-		} else {
-			reg &= ~TCPC_ROLE_CTRL_CC2;
-			reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_OPEN);
-		}
+		if (polarity == TYPEC_POLARITY_CC2)
+			FIELD_MODIFY(TCPC_ROLE_CTRL_CC1, &reg, TCPC_ROLE_CTRL_CC_OPEN);
+		else
+			FIELD_MODIFY(TCPC_ROLE_CTRL_CC2, &reg, TCPC_ROLE_CTRL_CC_OPEN);
 	}
 
 	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
-- 
2.34.1

