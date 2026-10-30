Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378254;
	b=5F6WUTwSnn4pJm19pi29/DwsuDzj65HElGnmTuT2GKPutWcMVZOz9MyN52GEhvOgr2Lb
	 GjTxbpXxSeV7Emxzrt11EpbdvKprLFyVyyCqDE9/SbhDkslM850ywKUgscYUsnwoJG0Iu
	 FIuS630BDz3SjtkDEQG0FfVjkCeIqfBbYpfuzPclU2pREVuLkAxg8H3oFBmTf9b3+8FHs
	 d6mUK1Xqrs6ZtTapLX6cSJ5GvyqkdhanZkBe2/tQeGSTMDGDPAVhBAYTsMMYSvQP8pYQi
	 0oLAJ49dbQaa1A8bjzFy/Eso+Ah0qrNJk7s+hgTAsg45PfzEohNLbIi1HK4568hJPyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=;
	b=Wsr5LE+KgfI+gxck8EAqAvo9E0qnToQxruL8bK5TRdvTHiO26bng9FWZj5DUJBu4z52a
	 +/5/HgLl1Le92PkmOZtZwBsXRSocSzG8wu0eg8+VUPgkeZkXe0No7Zer/EdpKvXLPMZEx
	 RdqYdXJJgwYZJ79Wb6GpUsgzqYRL8v9V2aPX1FJJbwIQybRg6NrS2jZ5ORDiIGozpt/T6
	 LBz4HNzA14/QZLauh701sW4Hc1pPf+oXy98yas/cmTZraFQfMccLExprwB02T+MFjAcAD
	 u9Pu1/wWiRXHMzJnulE8Kik3bN+bmJa+ADf2RZmyxMS0hdYE0lfjkaXTUvwlvNqNS0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDTIGh6t;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE50606A32E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 16:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE50606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDTIGh6t
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so1306386eec.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378253; x=1793983053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=;
        b=EDTIGh6t3kgeWK6ADWnUzoLCmhtmB9/PL04H+WPsDvVHeo1HknTrMTUYkoAW1mQTQT
         p698ah5LqbJiQY1Rc8Q22G5bo5pWUaPrBs+eYXQ4Xr5MtRfzeDQqJ5+oR940dKjS1OWk
         0iIfu1Pau7DmBW/IJVoADYLGOdzwUZOd3k2fI8P5TPiBf7xHsbrC4ag0CqphbLB8FUZQ
         lgzuDLUttlJkp2dzun+dgTa7sbgoBnuyL+DTGkfjs0eSW4bpF6Tnj8Em97MHXxAe7LK2
         QXMqCJem/1yEYcL5Xj5QQdGSQLj/He0fZWjp9R8U2Q2gmSb44qDhsPR+VN3WnpQo8GBy
         QBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378253; x=1793983053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcZ9lbstnk1GTs2qJHkiYVcgAWVuc0rERzcXapVspqI=;
        b=De5U1PXUJzU2EjBatb4ntmIBe7VD3GyzSxpWuIs4quupkY4HOqmX4ymdm0k8d5+nR/
         tfKml6KY68TmU1uqfMS5UEfgVJk9kNMDl/YGzMwgK1VFBKDRXI2gJ4GpFtTF6S5+b4lF
         zThINVQMPofDHlD5eB1xcxX9DNzTI4jcAOevLJt+mUFb4flwXePNttDlUGbx5IW6D21w
         Q3+PrLEEQ5XpDZDqJLVbp+GmxSNFyprhyZ79PzYKEnxCBPViAdUpYQU4fmCXlbZwuOCF
         qjsVGr72/gyKwEjgJkFHB9lC3pQ9fioLGICh1rnXlfZ8NQ1nW7HSDrX1pSJl9DwDEUEg
         7rqA==
X-Forwarded-Encrypted: i=1; AKwUvBzudIMbPy4zmGpkdqrR/iNs2TlyE6bRTyjxQRetF4ghd3uJYVB8DoofSNirBK3cZ74BwWVCQqW3dJx6fYrj3oIBHw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKloB6DrtpD0zCAY6PCKUFXf/06wpIQCKSc310DfrcMc8+5xljp
	RB/XGbZaubGyuA8o912I9hmV9OtNz3/fganJssI2EbKD2rk/VRGvXFbRzzPNPQ==
X-Gm-Gg: AYBFou0mngtp3tNc6cAoKoawGVahhAQG1vp166JopFtq7vA3vjO7MP0S6YgdiLG2lBS
	zyxGlgGPiZsBUx0KsYq8UZU436ISqo5uW1aj/Q/YE8PzsaIDuYLZWEV8MBwct2dOrKpbbcwtrR0
	Xsi8Z5X+BL+g6Ih8+ZxUy8yko+str0FgmRw792h6bkN94E2Aw42BycUMIuGtAqu0729Q08DFQP+
	k7wrEVGKGLNITwdKoxtwTI0Mnw8Y7V2HprQf+GbDMW4xRDCIjfnlFnOAib5/1bUPyilLfAq26zz
	6ScfG8p3RNbe8UpH+BkOVmI4IyKl5Zmj/+kaSdc4zzVJPEzdBbQjNxPKelihtMQZJQnwPeqmDNK
	3UkY6bwWBOlJv/A5kZGQ4r4BJQpfk4Ba0/QvpAnH9cIwR8KaetB3B2fwMXKXxyWb3yOop9ywsRd
	HaGt221yWvMLHmiRfH9UfTyv1mNFaxsFU5OwefcF5srSQB59M5Gv2dQFjm4AmvhtzfSfsE9dlDW
	6N2vF11vb/q/QdYkqdio23zcxcFpeP0br3PaXbBzvvBo+BpEvBi160Uhb6bccYDfY3yZkrfT0jC
	RAag8pE/4g4W1D4NRiV9nOYi455xNXR7cB5PrmeUapU5/q6s+g==
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr3906559eec.7.1793378252415;
        Fri, 30 Oct 2026 09:37:32 -0700 (PDT)
Received: from localhost.localdomain ([103.170.55.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8458708eec.18.2026.10.30.09.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:37:31 -0700 (PDT)
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
Subject: [PATCH v4] PCI: exynos: Handle PCIe PHY initialization errors
Date: Fri, 30 Oct 2026 16:36:54 +0000
Message-ID: <20261030163654.2733-1-sreekuttan2156239@gmail.com>
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

 drivers/pci/controller/dwc/pci-exynos.c | 115 +++++++++++++++++++++---
 1 file changed, 104 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..5b8d8f1ce8dc 100644
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
@@ -332,24 +381,48 @@ static int exynos_pcie_probe(struct platform_device *pdev)
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
+	if (ret)
+		goto err_deassert_reset;
+
+	if (ep->supplies_enabled) {
+		ret = regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+		if (ret)
+			goto err_deassert_reset;
+
+		ep->supplies_enabled = false;
+	}
 
 	return 0;
+
+err_deassert_reset:
+	exynos_pcie_deassert_core_reset(ep);
+	return ret;
 }
 
 static int exynos_pcie_resume_noirq(struct device *dev)
@@ -358,13 +431,33 @@ static int exynos_pcie_resume_noirq(struct device *dev)
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

