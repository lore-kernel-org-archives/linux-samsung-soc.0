Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8EB2E62AF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Sep 2025 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316465; cv=none; b=NAy8hU/DhTlQKMXKDpHZy+Bb7IcF65/k2QTGm1MoPydSK+ycTyS2sv9sdOKNjXLjDdD3WV9qjtdc5kPM59vpBnuLo6G96xpJFVu0oHnldpfJRNB6P3B8ODB5BOWd6Luz+pEsbw6sKpTXKmRVXrfXJTDcduhapG+6DlnIYdxskJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316465; c=relaxed/simple;
	bh=KbAwoB544VyfCgkR76wI4YxdNXzKpy0aQUcINDilY6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTsVPQSEExR2GFZOC8wTpBlNmtZCXrXnEMa0EacG4BUL4ck/PxFYBCbwX4Vcs+cphBplpsy7MCOR9zdgRv8GZI9+otG6Naq5ZKqMHNEEo7DtjVHdNJpaB13EJxyq701jNNck9zbBMHUrPY1CGfARYJ2H4wZr+hanaH8Jfalyg+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=YAb9UJOd; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="YAb9UJOd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757316461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qf0H7QoIfbnmILBxECq1C31tKiAGx2tzl4Q2/pUkfJk=;
	b=YAb9UJOdNfAdBdUcOr9zoP2B0m6jYnebtf1L6ZdPb5du+/zAHd99R92ALmkx57dEl2keWe
	B50lggUXp6k5CE/U7t878jAEQF6iTWtwfBeqnQG5ulOWAOKrSFj003iypRcfiarMUDCFGs
	/eHYR14EPkIfRimVgGi5wF/jRPVOUH4=
From: Henrik Grimler <henrik@grimler.se>
Date: Mon, 08 Sep 2025 09:26:57 +0200
Subject: [PATCH v2 3/3] ARM: dts: samsung: smdk5250: add sromc node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-smdk5250-sromc-v2-3-e91b2375d4e1@grimler.se>
References: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
In-Reply-To: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=henrik@grimler.se;
 h=from:subject:message-id; bh=KbAwoB544VyfCgkR76wI4YxdNXzKpy0aQUcINDilY6g=;
 b=owEBiQF2/pANAwAIAbAHbkkLcWFrAcsmYgBovoVmJ+CJlZHTjGj6B+4MqsiNwFEHTNeZ8+S7m
 hKBOOMUhHCJAU8EAAEIADkWIQQsfymul4kfZBmp4s2wB25JC3FhawUCaL6FZhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwzLDIACgkQsAduSQtxYWvPrggAjttFAwf5leCiLCD6s5sQp7+yGr9EbxZ
 Y7ogrGP/po6WydYPPB0PeiPio4vClMpWLXqcmZj1RNHmrFkLdka/iRy9OoyK/GrKlQKtBbbtZPg
 QwElEOTA1RAnKlxDa6OcC8XRAfugGTxUrgpSBF7+Rwf34IMNzJU5Z8ZNBn+hn1xJZyX9VtgpT5H
 Of+hP7shbRGttGrbZEKGXGia4Q0L08nlWQms8psPaUC5UUbU/86GXZ0iFRNkTTRrmrvSmQAYtC0
 Xs0EpAIPt29KyRCTXxzbyg0frphNKJl4QYLE9Ur6A+vKntzP39hHU8FbvjpfAJ4Z86q/ExkRy6x
 SWFUCunGE1w==
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
2.50.1

