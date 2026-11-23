Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443958;
	b=SsR8z0LNoME7emmJlbaqHc8muDxKvAtaVmm3LopEmqcQ32tHMBGk3j5faP7CwsMTqbvB
	 3ihP15/LoTZvvSwm9AwQXAds5eVC+5xgCQsH6YMBSFsNVMKmTOqNrv6hDMPILC4/7Ytru
	 pYMC70Ws8aTSt+1u7hYt2/QVf+GwQd1kpn0kGZqMA8dmXnpJaQpmxntcwIoUXbhINs1tM
	 dBKqlKVbY1650Sk8A+/sr2ENJriqZ/dFsNwbb9haMTl3zLRE2yX7XLzR7LCCRTQH8661i
	 IkxaXMLQ5h/3/9HDwTSR54K9iUz9mUhMVvdLkziyDRVuwWC8+83Eq6Kz+SnZUYU8i5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AbBHRaOVrs4oNPVZha/XJgVq6qZj1LS6Zw3LSu9DhIg=;
	b=tvKWOZ61bxxGCNz0D4jgBe2oZ9L88nmRVyzWGu+Q3j4rhV+qgIRIyOdzLubPgD31z2Kc
	 5Xx3l0Q5BsKTk7BVegmNMtomLAy3ecJheNGqtQCYsqhLacqio3QjVricAq/4lLb7PHgIg
	 30ziD0r8h5hdccpWoRr+LgwcG+IlBAXhH3w+1/fFrWakZJIYIhk9bfpMJ+OnmzZ1oLXmX
	 Qjt1Zi1OFkr5XJnIq4/roKVXMKj3VazkpXrnm0sAVBchjPR5AAnYMbGfjGleNvsGpNWMh
	 jGLG2knURXtlGaWDhCu9Z9Uha1eAg7/0kGJC6dHAs/vkdIm0RI/98GvSY14cgr19K4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ywHiZj28;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9985F606A32D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 14:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9985F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ywHiZj28
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d21051042so548530666b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 06:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443956; x=1796048756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbBHRaOVrs4oNPVZha/XJgVq6qZj1LS6Zw3LSu9DhIg=;
        b=ywHiZj28KX1WC5K282+urfCqt8U2KuvALLJyk7/5VCv0zD72BSt1VhZ48RmCCQ3upE
         df4CjSZ3lny51MCSZ0+7QsZ3KdfESo6bpp+0AKtxvBeYiVfgVzYca9stH8wfYpWVrN0Q
         3qdM9WRiEGsiB9c3dith8wHfMzK/zf3e6g+iLX9+2g/iQoo5ZqxDTPZ+KYQrb32VZeoM
         BpEKIwZQpks3YYgtVUjrirO+wqu7MZ/6usDRMlLoOvxVL5GhKCXxXxymifsGQhHsyVaO
         hXZKRYlSuTZeW+6zm6pz6gaItyc57Q+HOJ1eeznODc7zrk+DjV0eUf3deWnPM/EaNYgs
         q/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443956; x=1796048756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbBHRaOVrs4oNPVZha/XJgVq6qZj1LS6Zw3LSu9DhIg=;
        b=hJxYuwCvTC2n/3fys+5wZwgOgoCp5TEL5Jf4fh+ztks67lVM7h7K5T0dae7UMc4Ly9
         D6YpSHix5DIQQTlzufCRpq5fenkP2m1ULEP3KOLgs2JtpEKazhmXcVD1oD0gHHD24iB/
         55UpypBam95ptIfkkmENKXIiieowr+Y7hDp/tawvH7OIZbrK8DFNQj8F1JcaBhNl5HRB
         EprTrfvpEGxiCcQEeaOgcb67ylEQh/rYigch6T8tWJ0FDuGOu1LFkOz5iN6dqXMr3tM2
         hle8KJKPRrB/p469UQF3ziSWRdZKBi4du6fUw74z533ZyBwRxF4g+LX0RoSZe2SbvevZ
         oRBA==
X-Forwarded-Encrypted: i=1; AL+hErEBz+2HRjbqWoV0Rh3Pi/sOLTf5qQRlUK0b4gajA8nRDmb4VIYmge/flieh/sHH2xkdLzUH/QJFm7yOWgGXjcaUHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YV6mcB/3TwJ60VgKrMB0S2ZFChUTxOda7nzpaWGczCEg+oxPz
	IMOBR/mBTIqPBnPVZkzeaYNCfQXynrzWXVP5he+SFdR4kT5Q3thVPbptzzd0O/0I9oY=
X-Gm-Gg: AZFdTZdXTFOnCohBKcDRlEhE02gegCew8jBoMdHT4xoxv0hr7IdBoOlt3DGFPpEc1MX
	Bwezyquw4GkatGYyzncgS7/lvuz6wVUBgfz9XZbVxTcVanK/BSdJGBhR4VT6dQuK2rQDxYbsqyK
	NxrgxuaF4takbx90kmyGuozqAZYnGp8LwNRGau8dCNAKiJf5ELzv0PIGrmqstLBy0TxheT7tARJ
	XYTh4UokqV/6ip9wq1DhduXXow39WKh07TOp1Y7SXMJ1YqSQnFCrwsfD1pcA8Sem1lyI4OlSyHy
	f11OHPD9FqvN9hJ7EzZNQ/ru8p4v1LOTEtbb0e1L46KUDHQbhuF4MmlmptdrnrlSN9GihydczIT
	QGxOsT9tDpnDvb9JG0xQXrMPXzIcStyZmr2KtmZRyt/GreJ7vwJy+DKwmsz6sM3ISVE5bfZF0zx
	S5AWwZFHqwcZdH6dE6/z8EeNr1qdYBPTjta28hYHRGgpojlcx4rvL72WmpGxYu1yWKXHALenYIm
	hgdlwIeyDvw8LTFum/97lfqG3HkbKKS3PHfcK6ndQeXv3wh84DY4QXmcgov9DLYp/SA3lCriIOH
	CTR0oU6pfJ7VuEvPHvzTWL3Oare3SjlIIOd2LsfTPbRwyv7C4Mq6+2c/m5oc0zzUwMGf6tnYmbO
	XcIh2zsLmITDlSxN+Mw==
X-Received: by 2002:a17:906:8cc:b0:c50:933a:e12f with SMTP id a640c23a62f3a-c513a8669bamr567298066b.27.1795443956033;
        Mon, 23 Nov 2026 06:25:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm428224366b.14.2026.11.23.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:25:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 14:25:54 +0000
Subject: [PATCH v2 1/2] phy: exynos5-usbdrd: gs101: re-init PIPE3 on
 orientation change
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-gs101-usb-phy-orientation-v2-1-3361fa5f7543@linaro.org>
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, phone-devel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

The SS lane mux on gs101 is programmed only when the PIPE3 phy is
initialized, based on the Type-C orientation known at that time.
The orientation switch callback just stores the new orientation and
relies on the USB controller to exit and re-initialize the phy, which
only happens if DWC3 enters runtime suspend.

If a cable is connected during boot, the phy is initialized before the
TCPC reports the orientation (e.g. ~4.0s vs. ~5.3s on Pixel 6), so the
lanes are programmed for TYPEC_ORIENTATION_NONE, i.e. as if reversed.
DWC3 doesn't runtime suspend while the cable stays connected (and
runtime PM is forbidden by default anyway), so the phy is never
re-initialized and the link comes up in high-speed only.

Re-run the PIPE3 init from the orientation switch callback if the
PIPE3 phy is initialized and its lanes are programmed for the other
orientation. Rewriting the lane mux registers alone isn't sufficient,
the link still comes up in high-speed only with that. Re-initialize
before signalling VBUS valid, so that DWC3 only sees VBUS once the
lanes are right. A failure is only logged, so that the TCPM still
configures the USB role.

Mark the PIPE3 phy as initialized in the same critical section that
programs the lanes, so that an orientation change can't get lost in
between.

Also stop storing TYPEC_ORIENTATION_NONE on unplug, so that the stored
orientation always describes the lanes: while the PIPE3 phy is
initialized, they stay programmed for it, and when the phy is
initialized again after phy_exit(), which gates its power, they are
programmed from it. This avoids re-initializing the PIPE3 phy when a
cable is plugged in again in the same orientation and the phy stayed
initialized.

Cc: <stable@vger.kernel.org> # 6.15.x: 2ef1e78ef722: phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
Cc: <stable@vger.kernel.org> # 6.15.x
Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 61 ++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2186b745d58f..ccaf0f27c4c8 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -509,6 +509,7 @@ struct exynos5_usbdrd_phy_drvdata {
  * @regulators: regulators for phy
  * @sw: TypeC orientation switch handle
  * @orientation: TypeC connector orientation - normal or flipped
+ * @pipe3_initialized: gs101 PIPE3 phy is initialized (and not isolated)
  */
 struct exynos5_usbdrd_phy {
 	struct device *dev;
@@ -532,6 +533,7 @@ struct exynos5_usbdrd_phy {
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
+	bool pipe3_initialized;
 };
 
 static inline
@@ -1713,6 +1715,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	u32 reg;
 	int ret;
 
+	lockdep_assert_held(&phy_drd->phy_mutex);
+
 	exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(phy_drd);
 
 	/* force aux off */
@@ -1737,7 +1741,17 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	if (ret)
 		return ret;
 
-	return exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
+	ret = exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set this while still holding phy_mutex, so that the orientation
+	 * switch callback can't miss an orientation change.
+	 */
+	phy_drd->pipe3_initialized = true;
+
+	return 0;
 }
 
 static int exynos5_usbdrd_gs101_phy_init(struct phy *phy)
@@ -1783,6 +1797,9 @@ static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
 		ret = exynos850_usbdrd_phy_exit(phy);
 		if (ret)
 			return ret;
+	} else {
+		scoped_guard(mutex, &phy_drd->phy_mutex)
+			phy_drd->pipe3_initialized = false;
 	}
 
 	exynos5_usbdrd_phy_isol(inst, true);
@@ -1880,8 +1897,48 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 
 	scoped_guard(mutex, &phy_drd->phy_mutex) {
 		void __iomem * const regs_base = phy_drd->reg_phy;
+		bool reinit_pipe3 = false;
 		unsigned int reg;
 
+		/*
+		 * The SS lanes are configured during PIPE3 init, for
+		 * TYPEC_ORIENTATION_NORMAL or else as reversed. If the PIPE3
+		 * phy is initialized already (e.g. the orientation is only
+		 * known after the USB controller probed) and the lanes have
+		 * to change, initialize it again, before signalling VBUS valid
+		 * to the controller. Rewriting the lane mux alone isn't enough
+		 * for the SS link to come up.
+		 *
+		 * TYPEC_ORIENTATION_NONE (unplug) isn't stored: while the PIPE3
+		 * phy is initialized, phy_drd->orientation is what the lanes are
+		 * programmed for, otherwise it is what the next PIPE3 init will
+		 * program.
+		 *
+		 * Don't return an error, so that the Type-C port manager still
+		 * configures the USB role.
+		 */
+		if (orientation != TYPEC_ORIENTATION_NONE) {
+			bool was_normal = (phy_drd->orientation ==
+					   TYPEC_ORIENTATION_NORMAL);
+			bool is_normal = (orientation ==
+					  TYPEC_ORIENTATION_NORMAL);
+
+			reinit_pipe3 = (phy_drd->pipe3_initialized &&
+					is_normal != was_normal);
+			phy_drd->orientation = orientation;
+		}
+
+		if (reinit_pipe3) {
+			const struct exynos5_usbdrd_phy_config *cfg =
+				phy_drd->phys[EXYNOS5_DRDPHY_PIPE3].phy_cfg;
+
+			ret = cfg->phy_init(phy_drd);
+			if (ret)
+				dev_warn(phy_drd->dev,
+					 "Failed to reconfigure SS lanes: %d\n",
+					 ret);
+		}
+
 		if (orientation == TYPEC_ORIENTATION_NONE) {
 			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
 			reg &= ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID);
@@ -1900,8 +1957,6 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 			reg |= HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
 			writel(reg, regs_base + EXYNOS850_DRD_HSP);
 		}
-
-		phy_drd->orientation = orientation;
 	}
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);

-- 
2.56.1.750.gf70dc682cf-goog

