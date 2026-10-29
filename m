Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279460;
	b=H41u3rDkg44T33/IGt0e5Ic6lITcalPjc7Wa/QCSdesXAtqK9yr124vxDkxOyiIjYK8i
	 DM1345I8edU0wv6QgF90ytbA3pCc9fQJzTGCdkxXJNPsheJfrMZsf1y5sxn2sIwGeQOOP
	 WXanArn6upTWsxQp/311bJxAnQ/SduYoo9fLlN40HvjtBzzgzJrRlSyHLR98ufPa09lGH
	 Iw8gN2QRxF8mNdBjr1tUqWp1qnyrAeu8/S+9JsVmbq0x6AapULBZ9AgBd8k6TBlyTaWc4
	 io6Z88ys0Xx06bJScoF8VvYnEjdIYi/aPMPzJMfpOUMVMH+qXjmllBpiBRefkz7gkVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=;
	b=sn+8t8PZADZqru7kN8qObRtr1Ont1T4v/3TNxHC5fEGf27eVfbcsSSP/j1wJakLkv/bq
	 Lwnmj+x38m2DXKQqSJieLYWk0CO5MweYemZh0FT+brD70k31fQbuWDhJOBxdBLJk3cv+Y
	 ZJVZbYqsIg3V4kMqH0rvdtAmD9/rUL+IfpnYNvGzRqsIUp+0HRZ7o7N3LBbqGU13sk8bb
	 Clmhg7Y/cqZgiDbFM/o2Ppko6DaDIFt/yyUnlOGnSBpsiIzyfQSX/fWrP4Dl27GnKB8Cq
	 GEUvW3BF+W3Ua1yWAvBOnZlkt89PaNN8YZZGI+Wiju8ytGYYTS5G0RySZZKgwLeK0LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWDWRkH0;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32CA606A320
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 13:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F32CA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWDWRkH0
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-19305bcb72cso1968886c88.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Oct 2026 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279459; x=1793884259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=;
        b=NWDWRkH0HW6hakUMoF6M1i8MT5vj++Az7EvTQKb6Jb3QG6nnCe+Scwevic8JYigQ/w
         PgIi9u3+SgGmp05YZsfuFG+iG4b6XWruiN/SmceSgk9ATYVfosbCRrdUPNWRW0bSLZ0O
         /+kR+UW2PPRbulwMDCymqDR1OiglDiv0SIlqEwmzRAGtzdwVXYGsc3EQPX4Q6SMQjicX
         lO18runGwJpySM23jH24iRNXG+Erl6O7mYh5aLeIYoaclC8xSr2uXuHLEOr4nLo5/xBg
         Lml1bo/SSPWBkq60zGRae1/aa+Mym8T1UH8tXT1jGGmtn4cU9bSxUiFz3Jt0zxx19Jy/
         PFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279459; x=1793884259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=;
        b=MhOvVoVLRnEIKf5D6mY+8oKzo3Yq2rPj6fyRkHRlfqDnxVx1p6OdIF4oejw8sADKHv
         DDJi3o3YHZlYFBYxaia/omgZns4j+JcsCS3/dWziXiKKGaqw7IE5KsoarWvdE86LOUxc
         zL/F4JaiXI8gGpCob6ZpGp5gwU7HtK8IKr0vy9PR8+CnbRWfAVer8XAw9CSOFd/DMb0g
         4xVymNlZ+0m7UcOcPiCSBR3Gi7+os3QVwNj0C4NlLCLPTd6Is5/SNdH+EqmXPv2VuVvM
         nbENwm+Bb/t4F53aZ4XzfFDXcbT/qb3vd0bKxqaY1u20HX4eT2jml1hzk+M9ysTwvokj
         b3kA==
X-Forwarded-Encrypted: i=1; AKwUvBwgNQiFjxAaOJ+JR/yF6+yKRumBLfCRX1qp+g4qS5cLahKZQMrwnrGo5/DeMgiir6Omz7oXnAz90iby1ZOCJdgB0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLiloSa6NB0utayW/6xAocI0+LS4frdIwhLtq3K4jBBsb6Ul/EM
	Bbxdh/5HDA1voIPoqt4T0XRY+m2Oc9cJJoGQuDE7u/bfs+l+l1IkJWfy
X-Gm-Gg: AYBFou1vvMA62bnBXTKRhXmAMuZ7mwzkWc4+iIg2f3LKyad4jSFyI6cGoUUjG1Dtfva
	cE2gNvYVwmziSddRF2EbpFw2dTO89zgRWOwxOY4eFgEcFU9mgQj3Cpx9Xn4hP2Je1fWy4ryiL1y
	uKl9hfX09CY6AOe3cJdwr66abLdtHJbrbse3u6hYneV/77peeeHYWf04zrsIT0mb0iXX3fBF5NF
	zBN3hEW45XY1xMiN3k0Iwo2D4rA0mi9uvXG0iHRlnGVkX9AYsbhIYslL83S6jmtd0uMlwW7Cq8G
	aYj9WTocVJoVQQFUTdegTQNrBjZ9khqltn6VxHT73f3F9YjLMWXmfZtxwDIxeHpyxM1xjekf9HH
	5VkY5mba7bFBHnbrmxyCajM0QidV6Q6i6vcboxrw2uTTXBDvuHg3btIXolBvkZlKm9BpFx4wYcd
	kNfstLW12tUBMMsfpgC4hUnL58dAOLQXiTQf9dChVYXW92irh/KtoVvFVHI2KybNSPmlJF00nLB
	GG1S3ubU8XoH4pWkwSfa+7CuxUnvdNsIP8yRRRLTUP9IIRIA5ZKStzHgkISEQUceLPTibPb8hyT
	AJeQkqMNVKN+MUHq9RCJbv8SzEIIqeiVbr3cHHm1EN8Z34f5OX0=
X-Received: by 2002:a05:7022:ed01:b0:141:5281:8a41 with SMTP id a92af1059eb24-1a6ce01cfb4mr7112570c88.9.1793279458889;
        Thu, 29 Oct 2026 06:10:58 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm22072457c88.21.2026.10.29.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:10:58 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: linux-pci@vger.kernel.org
Cc: jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: exynos: Handle PHY initialization errors
Date: Thu, 29 Oct 2026 13:10:06 +0000
Message-ID: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return values of phy_init() and phy_power_on() to
avoid continuing PCIe host initialization when PHY setup fails.

If phy_power_on() fails, call phy_exit() to release the PHY
resources initialized by phy_init() before returning the error.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..5ad07c0be8e5 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -225,13 +225,21 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	int ret;
 
 	pp->bridge->ops = &exynos_pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
-	phy_init(ep->phy);
-	phy_power_on(ep->phy);
+	ret = phy_init(ep->phy);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(ep->phy);
+	if (ret) {
+		phy_exit(ep->phy);
+		return ret;
+	}
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
-- 
2.55.0

