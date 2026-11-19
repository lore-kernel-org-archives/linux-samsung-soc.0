Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115897;
	b=I4fXUr2aI5mpz+WsvxHAgiu/ODdLERnKKvW8jc4oTyyehkF2znS1H/UvxDYzXK7G3Rji
	 YsciSyfFV74ml3SVHC4hB63tmk9bSz5eHWaBApEitTX3CJgWjHrPkcd4U+rZidoFI7ylZ
	 wUZ80U1hdOhah2E4UoDHe2gp3DT4YO2kBW9mLSsEN/doR8rxi8dIXrO7v0/GuPVOB7zCq
	 k0pvnpmXsJAlgsH5AMQO/I4fkSovnKJodQtwvimNwmd8awSf0wNyey3lQG+kwqIqyxrxI
	 xfQncRtbM4WXicVPnIppReXMDZHjPOfOOPDb4A4BBFLhS5sQ+j7POfDgtghtElQ0q8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=;
	b=YfIfKxjGyZmyAmmzBjQOsDoHSNH/RwSPBBKdbahIHdIjWDCP8ovWVDm/VvDXLVvXkeic
	 0f4UNIqqynb+Xh+nw153rglE0OeYuvUnsGBMu9sIY5Eq0j64qgz2GBz1zz1en8i9LiLx1
	 L7mgI9gktMtjrOuz9Ex3CrEwNBJil8+GnXWktovc1Q4HV4A7P8//ZFEGKalMc+4JWr7en
	 m4nDUck923b3xEowsIO37HpHwqYG54pRxK5PmEFs2cIxYyO949M4HSPHcbI4o7XWa57w5
	 SGMxtbFlAY+/tm9Ms2yXPx9KOwwGdAaDv7o3r5S3h85v9ymLEf0oeeRvBgaxo7baGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yDbqjUqB;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A264606A32C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 19:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A264606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yDbqjUqB
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so126528a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 11:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795115894; x=1795720694; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=;
        b=yDbqjUqB8/LIQbMMrTTmylORaM8GCLvTtIU4IxxHQOGwJvgrxbIC/bvsEypIPl4Pxn
         sLOBpEvn89kCCYo3rhA7/nZKfazVpJQOLk5q/hZ41kfXVU2CIee2gp+58245ghBIMSxF
         /ogAAeCeI7lHZXba1wkuPO0gjqXp/1T0qcZ5Iyyi2BdNoJL+Re5CzGOmXYZe8+Ydh81g
         lPcb7T7R/53oKOpeNNJZnORBV3m1lv4CeYhMIumhFHPNCRGXfh4qOKDsfX8Y2qHOwoab
         NvZLAr1cFhrpQUdI+zOInh1y5JhKlMNt8tUgGk6dCoQXVIxHklSh4SdsM2fUCg64Gf80
         MHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115894; x=1795720694;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VtOWtZ3YiekVd4GKDKB0dokNmDLbKi4y9lRQRY8pzpo=;
        b=ac/sDnqNtQIN3hqmqARSVeuPYRN7XObzetmHO/66JfUuXbH3IwwPZfPz7AOQwfkElX
         CE0Aa03QmY8/lvzawspZj08WhftAhnWi9zP86eLy6lPy8D2OxE00AoD4oL9H8rxBobRV
         U8rEudWvUGr6Lok5wJ1ikDsOjKxd0Vs0rwD0dA/dBLamS8As50lJeyqGi+Sgce9zTz6X
         cfFtqG8QONBaDs7dQnjMEKz13mn/VzAmU5cYMkG+UiZJDsYQJkgi4rRlC4ezT+b/T1EY
         DFRuFwyHDbafnXtQbMUb89c78xMV+z2EOySvwkR4mLzrV75B/iifgvqVDawmE8ormPKb
         0Tkg==
X-Forwarded-Encrypted: i=1; AL+hErEuTO/K9tvDa1ezZgeqhOwlrFyyxqtZuNiy3tIXXrFJa25J7/iw3me6fPhmilBbw1bBwxDgY1c4hJpz57qWFimoGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6+jfG4bUU+U2VnkVngb1T69H4ryZkbwAwXCA2RFrhwRSVnYPS
	tXZm9X3NFf21kpTYgJaMl5IhaTqZrcjbwlPhvJVMdGAFfQ/iQqw7xEjWNgtmh/90RhM=
X-Gm-Gg: AYBFou1XEGDhL90qDTUHy+K/zY8LaSifZW7KX7UfXgAUIQmHOeo+Egv+p28UMMT4hdj
	g0HF5T826g7tDqV4XAL177jGM8U7ar/duy+l6gz7ALU92CTgDvQlEqwWCw/J2Jy43CrYNdyWtai
	gHI/crsbwQzXVNPI+6+xrhzgB1oDtU/PmrafV1u7ZNWkHhniFEgGAJbxSGZFN+RwS7ELLn4pJE3
	OjseVKhOqmZjeKlj4whFnx6ijgNkiNjxVOXO/6/i5JwIhM3HRrBVMeaMHtgvIWXbWcfBlPa3j/l
	/7MYBfgMaioFr9AQ1JU5a2NynVKc2pssBvSy+ez/H5+c9RxEzeIY7W1USkXF6zk41Ecx9jam8Ks
	6DirOKS56L304DTRmj+VStjdK68LwUGoiWiC169Jeb9d+x6mT+0sP//KEu/5i+PEdyKvldMaURa
	xeo+ZclvO6XQ18piODMMpkClHF9ClGs2f+soBN7Y5EcvGUSsxlWWVwC1JbzG/iCUKG2xGHlItVo
	owPJVFfw3O21oiZer6i2UMW2GUk/whgKQD3ihnM2A1WbCHpIUjfVIacp0IMrwiUGH60kCMGJ0SX
	zSyHQLBBZWss+NsMToLr/Kn2BFvl1E1x2O+aVfwMtUfrPV3CzbmAznKHvle3VIqMun1aq+jXmcu
	3K6CpDPOAd6KT8l3GK09H7DnEvOm3JzpVKW7Wm8o=
X-Received: by 2002:a05:6402:540a:b0:6b1:c5c3:9624 with SMTP id 4fb4d7f45d1cf-6ba37e75559mr319355a12.22.1795115894304;
        Thu, 19 Nov 2026 11:18:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cd368sm217651a12.8.2026.11.19.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:18:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 19 Nov 2026 19:18:12 +0000
Subject: [PATCH] phy: exynos5-usbdrd: gs101: re-init PIPE3 on orientation
 change
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
Message-Id: <20261119-gs101-usb-phy-orientation-v1-1-bf3c4bbf328e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHNL/2oC/x3MwQqDMAyA4VeRnA00pYjbq8gOrkvbXKo0Thziu
 xt2/A/ff4JyE1Z4dic03kVlqRbUdxDLXDOjfKzBOz8Q0QOzkiP86hvX8sPFcN3mzRSGEOOYKCT
 nHZhfGyc5/u/pdV036x4sgmsAAAA=
X-Change-ID: 20261119-gs101-usb-phy-orientation-44cc8f14f020
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
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
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

Cc: stable@vger.kernel.org # 6.15.x: 2ef1e78ef722: phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
Cc: stable@vger.kernel.org # 6.15.x
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

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261119-gs101-usb-phy-orientation-44cc8f14f020

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

