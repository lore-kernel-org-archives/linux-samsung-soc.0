Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F322475C2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 06:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756966264; cv=none; b=NCU8mCVoom+coJ663Z8j4HQF/c5Phwji/dDpdZ9rN8z+TTa6DmQ+gt6E/GxCeC38zIJoDfrh1/+2MrE25t30xqdB6iH0eAZFyw7Bs4dgvS8/lHKrup5vPtfUfBnfftmagQKf8qEq6bUt5h8I3Nnd93btzLbqeI6YE5Q2ndD8huE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756966264; c=relaxed/simple;
	bh=+RqIKnwtu57DKNAvk31YMXlcTX+OWZxeh3S/lJS5aIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwdvBsqTj1afaULHYYPcn1jsPzwOokYzfA3IxAlJHUuHbMKQSDCFdCL/9zFvXFf3n3WXhDFturPfmWueIMA0hlj2Qxb8n4akZcVqByQybuOd6yMlIOADpHvfiSi0cL+4C4FIi0wxXPlFhRYGQ9N+Hjm4/csGOLgJaPNBHrjJVkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=cG2eG5xX; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="cG2eG5xX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756966260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7ZAexcl7NA+Yx5jyarUQkkoImsrTDPo+86HgrQfNaw=;
	b=cG2eG5xXds808wU3nuEWB6Er2ulibXKlSPJNLqTW0LmflDACh57LiEN6ziu2GOd8XjmnDe
	OiVhHsLfvrhqe2xY9yORam2uNLyFtVlSxmMggXDr2CyEqA6RioRp0ZnNzrMMX7wFv5tjd2
	j3Rtu4XUMf9qIk+p6y0k7yCYfsH/12Q=
From: Henrik Grimler <henrik@grimler.se>
Date: Thu, 04 Sep 2025 08:10:11 +0200
Subject: [PATCH 2/2] ARM: dts: samsung: smdk5250: add sromc node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-smdk5250-sromc-v1-2-b360c6ab01c6@grimler.se>
References: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
In-Reply-To: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=henrik@grimler.se;
 h=from:subject:message-id; bh=+RqIKnwtu57DKNAvk31YMXlcTX+OWZxeh3S/lJS5aIU=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBouS1sON8k/3z9OyHSqL6ujTUeUuezO/9jrm17a
 k1vOsgJHq+JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaLktbAAKCRCwB25JC3Fh
 a5dMB/9EeVN7NTfjd0ja0jjzlrzz6T4MZ05OSDqMtcNECYRZy78B2rId76xLOynzJz1hc79Ita1
 Hdx8yo3NBnlA8M9BYIRr0VvHpKCOSYR8xJZzycn+EiHlFbNzB+XsUaunxrhDFDL7zlMPDBiC3jd
 IDt+avz6eUgBlP/ocyG92bxh+C2ePyqQYABv/SpkVHzIgFVkkDE6u0df/b/beYfP/fFfasGKJDA
 qET4uNO8Y3LiVHzzbUikq4jJJSqqHHRlffXrlB4SeTIr4j2EwTbhy1UwSLS276Uw5/YSL5ZJeel
 OJYCfjky5g7FoRDdUMhFgT+dgGfHm9GTy0IgK4WF6LkjNz+Z
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

The smdk5250 board has an ethernet port which is connected to bank 1
of the SROM controller. Describe it.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
index bb623726ef1e614c50074ec2890072b2b37d212e..6af1f64c984ba6e8344d759d2feb7fbfa320d81f 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
@@ -422,6 +422,43 @@ max77686_irq: max77686-irq-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
+
+	srom_ctl: srom-ctl-pins {
+		samsung,pins = "gpy0-3", "gpy0-4", "gpy0-5",
+			       "gpy1-0", "gpy1-1", "gpy1-2", "gpy1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	srom_ebi: srom-ebi-pins {
+		samsung,pins = "gpy3-0", "gpy3-1", "gpy3-2", "gpy3-3",
+			       "gpy3-4", "gpy3-5", "gpy3-6", "gpy3-7",
+			       "gpy5-0", "gpy5-1", "gpy5-2", "gpy5-3",
+			       "gpy5-4", "gpy5-5", "gpy5-6", "gpy5-7",
+			       "gpy6-0", "gpy6-1", "gpy6-2", "gpy6-3",
+			       "gpy6-4", "gpy6-5", "gpy6-6", "gpy6-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+};
+
+&sromc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&srom_ctl>, <&srom_ebi>;
+
+	ethernet@1,0 {
+		compatible = "smsc,lan9115";
+		reg = <1 0 0x100>;
+		phy-mode = "mii";
+		smsc,irq-push-pull;
+		interrupt-parent = <&gpx0>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		reg-io-width = <2>;
+
+		samsung,srom-page-mode;
+		samsung,srom-timing = <9 12 1 6 1 1>;
+	};
 };
 
 &usbdrd {

-- 
2.51.0

