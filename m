Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085244;
	b=cw+DY5/dwhMhPjMJP/3HswbDKuwU1K98jqJih3AIhm820ODHtQ2l/oWVdeOFv1KWW4yW
	 9XGa1QNrfFyYiJ1R9SAE7JsxhhiB81JFRloGWjDVK3C3ej3VUvQWUW60Js5FIHcYJlsf7
	 08u6+OrAMrvkDezyr3zWIctFuBCBbE2BNCmSZuD0Rw+za7z4EjEKHVikbWHqdQF2KOqo4
	 /g9rkOzUo7qoueHfhU/pyHrmB5n9fMGe176kh28OxERYHrRnpzd9oSj7RK8mSMq/ForTk
	 QKH0QThfCl+4Wewy1BQhKnM48nA6dc8foSV7mgvpZknTNkgi9wxyyH5ApXTtm+9wVQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8Has6+xC9RPzwVP2kqZn9jyid5dpYq0lsSdFVF0q6BI=;
	b=ewQg1ws2nMLoqnQhFHbBKFNbM2TgeVRHosESBPtjbiYKFIO/2IvyenYNYNWc5FvLt8JO
	 oi7J65UEUwPP9jxkgsa0ptYe5q7MHQ0wDuUgd5KlyD5WVYWwm+u9Hq9uMQag9FtobgdDz
	 ma0Vo0BLBuQiP+Wpr1sYqg0OKXsf4AsI7fpK5/QzRLSRpvUE0UQakTer9AU5wLyYbBZ5Q
	 3NmQST0GMJv+a5hpq+GhK3el4EllJDV4zpaVKy3q6/zgSS3uyES0cK3hUuv/Jn1o6J6/f
	 NnA77uxL/71gA0fOs0v34HqH/061x9P+B5OYEhQVSrXhKYIiW3ul0u12KEguP9zyJkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oPcnUsR6;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197AC606A33F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 10:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197AC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oPcnUsR6
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so1799288a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2026 02:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795085242; x=1795690042; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Has6+xC9RPzwVP2kqZn9jyid5dpYq0lsSdFVF0q6BI=;
        b=oPcnUsR6Gr4jPgkqNEPh9je+5HMW5te7YYjWbe8KwCI29hks+TEvLrppeWePa1qkqr
         PSrxJZGnzPDyXPYus31IvgkVgNQSI7vlwTO5SiuXKmt36yymUoJ54mny+CQ0mDbVF9Yo
         jiHB/J24UQPI3qhQ1J89cGUKMPrZCRX5mLURxNXBMoJudvFVdTsLc15agC8LoxxUfCp1
         SeoJqGvYBb9VAlPeVoOkodahj1QF9hPI6rkYX+aOAxSJb+SOvzQMEayTIZVzdLOJzYNo
         zKVCKt49QgtlO1fWNvYyO3n9/z5AlXHvYFaypemMv1kmC7cL87p654wdUWJR8VX9MUJL
         zq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085242; x=1795690042;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8Has6+xC9RPzwVP2kqZn9jyid5dpYq0lsSdFVF0q6BI=;
        b=s9qMFvek7xCY1K8UJ+Gc8mlDAeDFv9O81t6IJk+Q9vUDftqUDnI9mz48MwF9Vo4KmN
         r/95ggKvhCk3VraKKmJ4KyVI8nfe/hKJPF3wpbCJW0xycAQIZ4x18ZgCCllcGy/CmI9J
         dPVBqWHi5aPJGld/UB5tpPWPFImTEzHuaSYwsHz3xIGfF0SfxqG5SSewyHRiAeZc083H
         UVgdygyX44k3HWfU/1KIWsiK521XsS3e3uQcpJKVn7DJ2p3KMStfi8EghsL0QApif63e
         8yxM3tXRSaRtnf9rLDF5PWo1YjgxlsapwoRP4PruOuEZpP6JU/iC8jMxpWb2pzOIS5Sa
         mCJw==
X-Forwarded-Encrypted: i=1; AL+hErFTBTkuCrr+0H/V03i68+g4pXcYjKY0ZgJ8tNddXfAPkOiy/HwI3OvsKuMM4iFKVN5s/rOA3sCKNRRXQL+HlmylHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9e70lXfpMWxYqbER3XsxKiIgvlhr+iQo+qTyLCd7YfLyrxd9in
	KPfdxEagl/sKScXDjUGdvozMnATSYUNQnB5lIZFogUKfUdFhZj3tc9ZG4EsGL1AuXQY=
X-Gm-Gg: AYBFou0sVm8syupmNt1lVbL4D++LCJYoxcKsZWEq0Qr2JHlj0oPL+0nzgyzqy8uhEM0
	sEKycmmBq1pmSbiitwtMwyYwEfa91EoMK0YKUWpY+KuyA7LPGlopfzOqA+/3HVYFgnOu6d+ZInn
	2bSXDBjGk93DVvlGNCGyAKVoOGkGFKyrBkQq5Op/niTueCKix8VkIji641uXuXQjreLKhALbBsJ
	yr9NQI2E7fzzjL70/TEmCvQ7UnMKusdIr+D3ffWXONrvTtPLtg6mvXqeMFV44/cZ2U50jdY1y/Z
	g3rZdSFoWL8LA0JhlL+dImYT0Lvo7uVHb81pWxpiMEMwajhUneQUOOOUQk7W2NVQV4ASxJqEi3S
	1giPQMz0MZQjILBjl0V/YUJnFmvzF6eaD4pEh+BGZBjT6Tpf3Mrd6CmK/80W+UZUBj1u6YbWH6A
	THqLhLdm+0lw5bm8GCiQXuFkAgwBzqsGHt2DGhtj0JeNMPPid87NG6RKz7SQkgyP/rsX9QeLMqs
	Oh8iuqkza+h9zsbkALmHZL8yJBEJW6ut0Maea9JDA7DD/pSc4rBfPDufuX3RPQs8iPvw8Qq+N+l
	bJr/H/SAQYwsIbJymX4HnJfNomDj2uI5UVaoMNMb9YAeVAm1rxyz5pC8d+IfrRon4Tr7fyPzDli
	7hkRIweSxtTrPLK3vWw==
X-Received: by 2002:a17:906:f5a5:b0:c48:1977:e1c3 with SMTP id a640c23a62f3a-c510e2ecf42mr554018366b.21.1795085242017;
        Thu, 19 Nov 2026 02:47:22 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234c9089sm93095666b.72.2026.11.19.02.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:47:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 19 Nov 2026 10:47:07 +0000
Subject: [PATCH] phy: phy-google-usb: reset USB3 PHY before init
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
Message-Id: <20261119-lga-usbphy-init-v1-1-1de4e0e6b191@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKvT/moC/x3MQQqAIBBA0avErBtIC6muEi2sRh0IC60opLsnL
 d/i/wSRAlOEvkgQ6OLIm88QZQGz094S8pINspJKCNHhajWecdrdg+z5QK1k09aKjJEKcrUHMnz
 /x2F83w+WqoWUYQAAAA==
X-Change-ID: 20261119-lga-usbphy-init-a624836eff26
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, RD Babiera <rdbabiera@google.com>, 
 Neill Kapron <nkapron@google.com>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

google_usb3_phy_init() assumes that the PHY is in reset and that the
Type-C Assist (TCA) block is in its power-on state. Neither is the
case when the driver probes for the first time on Pixel 10, where the
boot loader has used USB before: the PHY is out of reset and
operational (lane0 phystatus is low right away, whereas it takes about
12ms for a PHY that really was in reset), and the TCA has been
switched to USB already (TCA_TCPC reads 0x1).

When the PHY is initialised in that state, the soft reset of the DWC3
controller hangs in about one out of four boots on blazer (Pixel 10
Pro, 12 of 50 boots), with DCTL.CSFTRST still set seconds later:

    dwc3-google c400000.usb: DWC3 controller soft reset failed.
    dwc3-google c400000.usb: error -ETIMEDOUT: failed to initialize core

In addition, google_usb3_phy_power_on() waits for the TCA to report
that the transition to 'no connection' has completed. The TCA starts
that transition by itself after a power-on reset (TCA_TCPC resets to a
request for it). Without a power-on reset there is no such transition,
and the wait only succeeds as long as the event is still pending from
earlier. Just asserting the PHY resets before initialising the PHY is
therefore not enough: the event was gone in 8 of 32 boots then, and
powering on the PHY failed with "PoR->NC transition timeout".

So, before initialising the PHY:
* assert its resets and drop the reference clock request, which is the
  state google_usb3_phy_exit() leaves the PHY in
* clear the TCA's events and request the transition to 'no
  connection', so that google_usb3_phy_power_on() waits for a
  transition that this initialisation has caused

The resets are kept asserted for 1ms. That is the duration that has
been tested, not a documented requirement.

With this, USB came up in 20 of 20 boots on blazer, and in 25 of 25
re-probes of the controller (unbind and bind of dwc3-google).

Fixes: 8c2b331e6327 ("phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
For now, I've not added stable@ as the phy driver only exists since
7.4-rc1. If this patch isn't applied before 7.4 comes out, it'll need
the tag.
---
 drivers/phy/phy-google-usb.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index 2acdb2b0e534..4d70b2f1cfe3 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -366,6 +367,25 @@ static int google_usb3_phy_init(struct phy *_phy)
 		return 0;
 	}
 
+	/*
+	 * The PHY might be running already, e.g. because the boot loader has
+	 * used USB. Start from the state google_usb3_phy_exit() leaves it in.
+	 */
+	ret = reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+	if (ret)
+		return ret;
+	set_pmgt_ref_clk_req_n(gphy, false);
+	usleep_range(1000, 2000);
+
+	/*
+	 * Request the transition to 'no connection' the TCA does by itself
+	 * after a power-on reset, and clear the events of what happened
+	 * before: google_usb3_phy_power_on() waits for it to complete.
+	 */
+	reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(TCA_TCPC_VALID, gphy->usb3_tca_base + TCA_TCPC_OFFSET);
+
 	reg = readl(gphy->usb3_tca_base + TCA_CTRLSYNCMODE_CFG1_OFFSET);
 	reg &= ~TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL;
 	reg |= FIELD_PREP(TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL,

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261119-lga-usbphy-init-a624836eff26

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

