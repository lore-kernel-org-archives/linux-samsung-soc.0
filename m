Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430107;
	b=OH2ZdvxR5Krgir5kOW4EHl5PNg8OUXoQFpH2CXbY+no8F7y1O9YjTlHz6sDan2ij94BP
	 cPukyA2Hwen4SuFENTovtkjbyAlhoKUj/QzqilXy5l+071Pgt83Q3Ux8MYq6qDwvHBMV4
	 vVfarDioymMW1VxuvMNuAnH/8/uaxw97F51IVT60Jl+w9QG2lafNiWm77317b5BEtExgs
	 ZxXSUSXx4etkh+X5bOFDz3jU0iSylAy+DlEqRE+lnjrY0BaxcMIhFh5a73QjwCLigJqQE
	 RAq9QBRpQ6DMbghaA2+RXxs7eJJbQQxPrFYI8J6OvL6EJDVrGhGSgIgmGul5NIYTeQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ADQcrm8YvdoyGGOqaxYX7L9xoyUfoiCcnIaPiCNu+Wc=;
	b=WUD0UR1zAELl5V5hfHH0bmvmInpTUQLsQtJKAaja1U8JI+hdSbKPPX/WKDbMk7V6hxbb
	 8XI7x97vXR+VzMQOtXS0rjsCXFjXabjlP02TlTyzy69IvhuDThoiQuYV7ULB9EveRjT9N
	 yY9GjY8YAwwvsOgGawnIDR3z/ud5EQqmirukkk0b1Hk5y4drIsktIvj7eWXfeHSJD8fm5
	 vFfiHo7avcurn/kUJVjl1eZPXMFPmwHx/V7XbAp0SlCgDLtlPyFVQbGVTZwYF8yMWz+Mn
	 eDDPHozTjuae0L/ZiazAbr10FPDrCK9b7ZEZ7TyMnsgnqUdxOZbQvCgxJ2JaXMwp0XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EdO3/FEh";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC6606A31D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 07:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CCC6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EdO3/FEh
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so765448c88.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 00:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793430107; x=1794034907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADQcrm8YvdoyGGOqaxYX7L9xoyUfoiCcnIaPiCNu+Wc=;
        b=EdO3/FEhYJcmAFyJRCDfby7H2ialJiK9oLcCKZpNeBRfc2lAi8OO58Oyb9ZU6mqrOL
         TTx2oE9DmEWNW1b8jaoh8XeBXFVtrx1fRiq8ctKmJ1eh0v+4+REUCNIC535ucSbKsMM1
         DnDvL337fYyFzl/hfigGgVwH8KPVPUggvRv/7Sy2SRt+lOtja+ek8cw0m7WBUr2Hh9bG
         5L8yhjBtjUq6KjsObZfxtRgAZ2ZuwT3mFJb6o8zTEeBAm80Un9rqyR8/K+u3Sbb76i+J
         hu9fC+KSaDv56khxXiFQB60dAziQz81DHdjoYpjdBLY3TiIrzMsZJLFBQTE7qSCnFdBi
         +zXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793430107; x=1794034907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADQcrm8YvdoyGGOqaxYX7L9xoyUfoiCcnIaPiCNu+Wc=;
        b=D5K4R64u08iAKLX11Eak0du51zfKzLZ+FocWNsDRaaScWxUbOcwbon3hug+0bDM/lU
         Z60ojglJCQd/Her5927rXUX2RokFFHykxntLoqtSuxK2Q1wa54E4tL3IwYlg07IyOWf3
         KQy0+DyFiXauCTGDVGdY1gEpMeBMvY3ukCuwCzvcQErxPZzk3SxLbVStTvrrflQRn7GF
         8IaEhMpsKkMbk6ewUvBw+vBE5oJeZ8nmz3qcGhFL0it45QwPRVasxCPt/7pDSMS62X0m
         ocikw+5Ys8VSEnup8oKmn1PAEAID7XwSyoGz+eefruvcr62U+AvY7S//48MEuKKkbhYW
         zWnA==
X-Forwarded-Encrypted: i=1; AKwUvBwAJe3g6abmJqBPUV7+rh0zPP391DqgVJczl1Z5ruSSSLa74XpzB2seKAbnBAjQLVcgdslL70zn9dbdXYkRzg909A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKqHNQcbGYU9FWsc5z5R5vhM6R5QcnWyZtauhv+M/D3mGAY/aby
	rWFIFLCiTeqSJzYzDx89ZX24/RUCa0wy9WVK8ptJcZWfzT7mOy3m2TCs
X-Gm-Gg: AYBFou2nxIU0+vQQ7xoTISC/tm8gaAP2k9BY+cYqbIUvD8KHAGkxwJ/houg+DKQ+4Il
	6v160AJjmaiejUltHnXsSQESBGEcK85OwD43M+Lr/kbntULur4PhP+Z4UklcQ/QAOzlOINN99f9
	qMJ5SAkRZPIK2WbjWVD6Pv/eCiG3nr9TMVqBKcAW5elgzT5278Nn3fpbBzxw3hvaPGDEnb9kRqB
	yRogvkgASv0TQlGk0DPWBc19TLhXg4XT7bXicG9DinCf+eiB+5FhQRm9Jxqc3Q/jyQaS8iAYRJJ
	hWHgAK/17XLQAVn97xUdikKf6aLIXE/7GSeC8hbyha7N+DvoJA356bJk1sCv6+31tuxQKFs9H3m
	uv62kZDAtbpaSd5ldKefUWNDBnPcGSO5tU9FqOjh+LdcCTkfYIDgI+kgPQVF+iFFTGGs0TuK5At
	5zeDFmDSDNEWomzjOg5PWPMRK3oGzzA5wc4FErIKARs6UIDx0TdO/agIvtZecJyrdCHiz6sy/2a
	uZx2ls4pO+4/uqVkZCDVIdgyCNhle5/Fc6OiT70mCx5qcvohHACl+CmhPp4BYuzk2gEMlZKODdz
	zsB9E+1KwSQhJdmiOMPWMBhIoMw1S5HiSjjhui6onvmmCYImow==
X-Received: by 2002:a05:7022:68a1:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1ac5a0b5af5mr8832094c88.9.1793430106458;
        Sat, 31 Oct 2026 00:01:46 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm5185987c88.12.2026.10.31.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:01:45 -0700 (PDT)
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
Subject: [PATCH v7] PCI: exynos: Handle PCIe PHY initialization errors
Date: Sat, 31 Oct 2026 07:01:11 +0000
Message-ID: <20261031070111.3130-1-sreekuttan2156239@gmail.com>
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

Check the return values of phy_init() and phy_power_on() to avoid
continuing PCIe host initialization when PHY setup fails.

Track PHY initialization, PHY power, and regulator enable state
across probe, remove, suspend, and resume to ensure cleanup is
performed only when appropriate and to prevent unbalanced
reference counts.

Assert core reset on probe failure after PHY initialization has
been reached, and handle cleanup errors during teardown and
suspend.

Also check the return value of exynos_pcie_host_init() during
resume and abort the resume sequence if PHY initialization fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v7:
 - Guard PHY initialization and power-on against duplicate calls
 - Guard regulator enable against duplicate calls during resume
 - Preserve PHY and regulator state when cleanup operations fail
 - Update commit message to describe regulator tracking and core
  reset handling
v6:
 - Prevent state/reference count desynchronization in exynos_pcie_phy_exit()
   by ensuring both phy_power_off() and phy_exit() attempt cleanup even if one
 fails
 - Assert core reset on post-init probe failures in fail_probe if PHY/host
   initialization was reached
v5:
 - Avoid PM core state desynchronization in exynos_pcie_suspend_noirq()
   by logging teardown errors and returning 0 instead of aborting suspend
   on teardown failure
v4:
 - Fix invalid return in void exynos_pcie_remove() and ensure regulator cleanup
 - Add core reset deassertion on error in exynos_pcie_suspend_noirq()
 - Prevent regulator leaks in exynos_pcie_resume_noirq() error recovery path
v3:
 - Address review feedback on PHY and regulator state tracking
 - Avoid powering down the controller when link detection fails
v2:
 - Track PHY initialization and power state to prevent duplicate cleanup
 - Handle host initialization failures during resume

 drivers/pci/controller/dwc/pci-exynos.c | 131 +++++++++++++++++++++---
 1 file changed, 117 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..3e76a818a45c 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -55,8 +56,35 @@ struct exynos_pcie {
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
+	bool phy_initialized;
+	bool phy_powered;
+	bool supplies_enabled;
 };
 
+static int exynos_pcie_phy_exit(struct exynos_pcie *ep)
+{
+	int ret = 0;
+	int err;
+
+	if (ep->phy_powered) {
+		err = phy_power_off(ep->phy);
+		if (err)
+			ret = err;
+		else
+			ep->phy_powered = false;
+	}
+
+	if (ep->phy_initialized) {
+		err = phy_exit(ep->phy);
+		if (err)
+			ret = err;
+		else
+			ep->phy_initialized = false;
+	}
+
+	return ret;
+}
+
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
 {
 	writel(val, base + reg);
@@ -225,13 +253,27 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	int ret;
 
 	pp->bridge->ops = &exynos_pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
-	phy_init(ep->phy);
-	phy_power_on(ep->phy);
+	if (!ep->phy_initialized) {
+		ret = phy_init(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_initialized = true;
+	}
+
+	if (!ep->phy_powered) {
+		ret = phy_power_on(ep->phy);
+		if (ret)
+			return ret;
+
+		ep->phy_powered = true;
+	}
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
@@ -314,6 +356,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ep->supplies_enabled = true;
 	platform_set_drvdata(pdev, ep);
 
 	ret = exynos_add_pcie_port(ep, pdev);
@@ -323,8 +366,22 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 fail_probe:
-	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	if (ep->phy_initialized || ep->phy_powered)
+		exynos_pcie_assert_core_reset(ep);
+
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
@@ -332,22 +389,46 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
+		dev_err(&pdev->dev, "failed to exit PCIe PHY: %d\n", ret);
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
+	if (ret) {
+		dev_err(dev, "failed to exit PCIe PHY during suspend: %d\n", ret);
+		return ret;
+	}
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret) {
+			dev_err(dev, "failed to disable regulators during suspend: %d\n", ret);
+			return ret;
+		}
+
+		ep->supplies_enabled = false;
+	}
 
 	return 0;
 }
@@ -358,13 +439,35 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 	struct dw_pcie *pci = &ep->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
+	int err;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
-	if (ret)
-		return ret;
+	if (!ep->supplies_enabled) {
+		ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			return ret;
+
+		ep->supplies_enabled = true;
+	}
 
 	/* exynos_pcie_host_init controls ep->phy */
-	exynos_pcie_host_init(pp);
+	ret = exynos_pcie_host_init(pp);
+	if (ret) {
+		err = exynos_pcie_phy_exit(ep);
+		if (err)
+			dev_err(dev, "failed to exit PCIe PHY during resume error: %d\n", err);
+
+		if (ep->supplies_enabled) {
+			err = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+			if (err)
+				dev_err(dev, "failed to disable regulators: %d\n", err);
+			else
+				ep->supplies_enabled = false;
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

