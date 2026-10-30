Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373494;
	b=3QEpO81viminmLAYF3qFIdx0WMHMzx6BvJ9SkJMk3qUdPygpmnZEdiVfJbTKvGTScr9D
	 uAr6jyDAruVYxlLeHTzcfgsv3gH6eLOrckBT169i5rLrqv2gm8OcSWsRgJJcK/nMUhHfK
	 Zt9aTYE5iVNwcYaNDOM6sUATZTZX/VZV6kNko73tmDeRZuW+NaW96uwmSYBvV376Ho38a
	 T4Uj5v0ZwM2r8Gb6LQ44Khe3jO8qrsrBdXfXOULtUsDIdTkXrmQJUW1OlY0K9NFysvr+i
	 hPumAMBGVHJkkC2hW8fVWPRIRtxi0mXcsSWRU8cWkSLRx8wXk7PiSDEF171YFPqoiuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=;
	b=ZoYhormmtaoaoaNZ3er6KxNLPE9OZIgE139m49hsRKxlnGzdwprz3JGLOWLftzn87XW0
	 8T2p5n8ZtVFcJoIv35lOlWN087rvtBESy7fJ6+nybMOFSgYnrHcPu4f/xTlpQ6G3BZfxS
	 kQ5yGZ4IolcW6VPW+1NgwJsPeYhhL7f7tGJtHKaBCe/LH5lWwclV7VRvMDeWHePoxGa1h
	 2m5bKia1M2dX8bY9kiN54+SMW6GX81ZT+SexjYTmA3qLf+ncPvYW2JVG1OtaLGzAcMAnG
	 kSFwofvgAXgNmyHwCBOSz+xFIY2dzfBeL7UdNlDJA1jbvtB404ZxXTSC3q2rq/Ea9WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DemTJL0U;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23761606A325
	for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 15:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23761606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DemTJL0U
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a8cc11ac42so743401c88.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373493; x=1793978293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=;
        b=DemTJL0UIFQ3Jev4fKVmWAptvN6wwU0fQLGaV6NLWjUFBgh8nlbnQq0VtsKvwBBQ72
         U+MKdlEaRB3clpUIhhyEDYAwosf443/2sgkdwk/pcKCk4wk9X70FNQBvwsev3aq54u8m
         3k6mAKo7zIcIBXAbxMXSNB3Bwjq8uj98IgjSWSkxImssaaexN3DeDQwzD0y3bckUmSB3
         /EjZOuyWctUZ1dwDcB1MDpQ4TUlnjO1ZpKIof3tUsEJN45oTV0GrSMkN1+tt6dKq59OT
         IdoEoEce014J55+SpqKFy1W85BfvOehWA0pPmJkrLO6zDdYyNjPs++8xbwlzlyv8hNvT
         d8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373493; x=1793978293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inKyCOcvtNC3vT1cGkkdWGseNrtGnJ7Z96eWpiC61OA=;
        b=hRpnxSPKS6zAQO4r3GqpUUjxQ3la64a6RXzrcdt+9p2lQ/xepARY0vnVgUDEXjrFHv
         un5TT80l6EZ7BDrxAcjZcGFlslx/tnnSqtcjYsddUJNYMPB6tYNvzGjyCyr2E3Wv5ZL3
         W7Bv3ZuCsE/3VYp+IliBE+RYkwYQg40lWJIlHyNKux4xBTJVQnlwIjxedrdqq/TvY0qP
         lxQV+8FUVCPJHdKFlmWLWnQCqjLUEqKtdR9PRf/QdzX3Z+X+KCS4a71aD2pkGuPEsYD0
         K5ZzR6yP2WX7AvQkXoerLCXgNw7qROREr/qb0ZQfnv5hPH8jM37RZS1ARgFW0QWXi3gC
         Uk2A==
X-Forwarded-Encrypted: i=1; AKwUvBzS0CFObC5IimPVjL2bXFK90u8kEkGu60UjuRiqCVRLEKVFEBClPIXZfam5DGfkL0+scpLoF8xUb/ZWl+bzYPOghQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK30ARO3B3evOrxTIlxXesyF/aB3pgAy7Bs0t6OJnSYI03WQJWd
	zTCSvFzOGAyk0KaFru+l+lu72QiwMZxvSeXXacvgI/6Uh1rb6u9kUCuX
X-Gm-Gg: AYBFou0nAjVBZyF59/mmFt4bdrqELt9GMq93mU1wcmCt+O108L9+rPGe6zkUJsq506y
	4Tk5k6kah5bG8VBLi6cGs2uZooddDptEoI81DxDqTisxEwEr/8lpZpwBOQf53ypIhbqo25wDXgt
	yXaGuvN74e/+NfjXK2zskmRZp6woJiuObEacSg7X7v3BnteSwZkn5/hEJouNXjqGg1uKCa3ESQb
	ngK/BPWV4le6yrwr9PoaqS5hdyggaBVT7jnAUyXflk5l+w5YojJLENaH4PyJGOWFSIrD80D81/k
	wH7FoeogB6dGwXZiXoy+SQ1xw+GO5zM1snOBOt5SJQR7fFDFkqTsJu6HSUewcMAG00CdWQOxMNh
	dSpS76zXg80icFu/NcL2s6tzoVVqhBvKx+azHiPN/c0vflY0EOuxzDr5ikrG40SM1Wpm7mbhcEG
	mPazVHoQgaobmGvpi07u9IGG/yGmxfXGmSGC7ehIAs6hARuche3ItF8DATLywJVP294eyBNIxXw
	FaHv7cP8rE+aIWi5z7ideOP3VHjDeI07J0N/EUGfAKDHNlXeepH0Jtm0anP5/ysMVxioA0twZQd
	hoojsh6OiePUhcDSvPuZl5IMks/gQvB63odLueT55eNEu89bFLdF0cOd7KSOD5Ve1f1yCms=
X-Received: by 2002:a05:7022:ef07:b0:1a5:8f40:6cb4 with SMTP id a92af1059eb24-1ac5fb18dddmr4578115c88.34.1793373492682;
        Fri, 30 Oct 2026 08:18:12 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm7581645c88.14.2026.10.30.08.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:12 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: alim.akhtar@samsung.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	krzk@kernel.org,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org
Subject: [PATCH v3] PCI: exynos: Handle PCIe PHY initialization errors
Date: Fri, 30 Oct 2026 15:17:01 +0000
Message-ID: <20261030151701.3100-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
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

Check the return values of "phy_init()" and "phy_power_on()" to
avoid continuing PCIe host initialization when PHY setup fails.

Track the PHY initialization and power state to ensure cleanup is
performed only when appropriate, avoiding double calls to
"phy_exit()" on probe failure.

Also check the return value of "exynos_pcie_host_init()" during
resume and abort the resume sequence if PHY initialization fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Address review feedback on PHY and regulator state tracking
 - Avoid powering down the controller when link detection fails

v2:
 - Track PHY initialization and power state to prevent duplicate cleanup
 - Handle host initialization failures during resume

 drivers/pci/controller/dwc/pci-exynos.c | 111 +++++++++++++++++++++---
 1 file changed, 100 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..d7504b0e5d96 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -55,8 +56,34 @@ struct exynos_pcie {
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
+	bool phy_initialized;
+	bool phy_powered;
+	bool supplies_enabled;
 };
 
+static int exynos_pcie_phy_exit(struct exynos_pcie *ep)
+{
+	int ret;
+
+	if (ep->phy_powered) {
+		ret = phy_power_off(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		ret = phy_exit(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_initialized = false;
+	}
+
+	return 0;
+}
+
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
 {
 	writel(val, base + reg);
@@ -225,13 +252,23 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
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
+	ep->phy_initialized = true;
+
+	ret = phy_power_on(ep->phy);
+	if (ret)
+		return ret;
+
+	ep->phy_powered = true;
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
@@ -314,6 +351,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
 	platform_set_drvdata(pdev, ep);
 
 	ret = exynos_add_pcie_port(ep, pdev);
@@ -323,8 +361,19 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 fail_probe:
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	if (exynos_pcie_phy_exit(ep))
+		dev_err(&pdev->dev, "failed to exit PCIe PHY\n");
+
+	if (ep->supplies_enabled) {
+		int err;
+
+		err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (err)
+			dev_err(&pdev->dev, "failed to disable regulators: %d\n", err);
+		else
+			ep->supplies_enabled = false;
+
+	}
 
 	return ret;
 }
@@ -332,22 +381,42 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 static void exynos_pcie_remove(struct platform_device *pdev)
 {
 	struct exynos_pcie *ep = platform_get_drvdata(pdev);
+	int ret;
 
 	dw_pcie_host_deinit(&ep->pci.pp);
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+
+	ret = exynos_pcie_phy_exit(ep);
+	if (ret)
+		return ret;
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			dev_err(&pdev->dev, "failed to disable regulators: %d\n", ret);
+		else
+			ep->supplies_enabled = false;
+	}
 }
 
 static int exynos_pcie_suspend_noirq(struct device *dev)
 {
 	struct exynos_pcie *ep = dev_get_drvdata(dev);
+	int ret;
 
 	exynos_pcie_assert_core_reset(ep);
-	phy_power_off(ep->phy);
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+
+	ret = exynos_pcie_phy_exit(ep);
+	if (ret)
+		return ret;
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			return ret;
+
+		ep->supplies_enabled = false;
+	}
 
 	return 0;
 }
@@ -358,13 +427,33 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 	struct dw_pcie *pci = &ep->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
+	int err;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
+
 	/* exynos_pcie_host_init controls ep->phy */
-	exynos_pcie_host_init(pp);
+	ret = exynos_pcie_host_init(pp);
+	if (ret) {
+		err = exynos_pcie_phy_exit(ep);
+		if (err)
+			return err;
+
+		if (ep->supplies_enabled) {
+			err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+			if (err)
+				return err;
+
+			ep->supplies_enabled = false;
+		}
+
+		return ret;
+
+	}
+
 	dw_pcie_setup_rc(pp);
 	exynos_pcie_start_link(pci);
 	return dw_pcie_wait_for_link(pci);
-- 
2.55.0

