Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.126.93.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558214;
	b=ey4EMd6Pyqj99m8w93tK6IM+3Vx0U0LKjVn/vCuNSZUrdzFP8EFne+ygQBOhS57iuJWS
	 YhIdoYaWhBM5ysbGYhykjVWAG0XkwwrWOfaoSQvMD6Ycw5rIifj6hpF18pVlEGugyddQe
	 JCJhnPw3WTAmebfpSPGIVEDJuDz/u5hqxth8ZbGb3dNPGOo6Wz4w++7glWtfX4NUNpUdJ
	 czyUzYE2RERpwo84+2YlI7jRoEupxaNAqhcAEsJxqAtragsLi1WSNv/Cas5jwu2cwLCuX
	 Lk5we2+qe8l+b/4qMWXkkcZC//wOm0P3OEpUG391+IxX26csrIxMl7bqKhwXEO7xb5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558214;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=w1YsYnR+QGwPSWhSlRxBXCH4PXEUD3G/GGrkoc8ZO3w=;
	b=B+EbfPtuFkNytjxmp8zstKN6f2pXLEiaUEbwMPpu4gecCPd/kNruz+VzlszszjWW32gV
	 Db2n/ufxrsfvsNSVO7K91IRCa2/cOzqJsQ5YpGfAl2o+5+w1NL0L/R2mfnFQWpJNWTJ0j
	 N6ktn7W7q7sd6lYfWV4/AOhm/BCWGb2LfLEg6NX26CrVt64jDyXzKGfLDwdkl75/vCxQX
	 wykVBjVmA40GR3kwEeb55WTkEiSfCcNDOVoneOav6PTvurxxdflPh4L1/znVIwe5CbXzQ
	 pqQ29DDUE3CSQ+lfMhpLd6Tm9kPvoaHM/czSK2ZWxnP+e5/maVnQtj2s2MJGpvE0T0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=h+19GP1d;
	arc=none smtp.remote-ip=103.126.93.75
Received: from mail-m9375.xmail.ntesmail.com (mail-m9375.xmail.ntesmail.com [103.126.93.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420F460A5BC2;
	Fri, 13 Nov 2026 08:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420F460A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=h+19GP1d
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be31;
	Fri, 13 Nov 2026 16:23:24 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 06/18] drm/bridge: analogix_dp: Add IRQF_ONESHOT and simplify IRQ handling
Date: Fri, 13 Nov 2026 16:22:53 +0800
Message-Id: <20261113082305.541652-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113082305.541652-1-damon.ding@rock-chips.com>
References: <20261113082305.541652-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d40118e903a8kunm073aab0481a66
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQhoaVkwYTUMeT0sfTB9NH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=h+19GP1d6/6Y1a+nHNQ8dPZCpozhzn1Y2s8f5eFp9Q0bA+s7UsIDl34kXgPbQzYY3YTGIOUj16uMFuhFHkr0XX9sST/O9MAa1sQsIZzq/zBPrWyYjFHYJ8IcERJ7DhnhIginMMbOgJBDM10y3PKSCb+RDzjWBS3dpRTE+b7XcMU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=w1YsYnR+QGwPSWhSlRxBXCH4PXEUD3G/GGrkoc8ZO3w=;
	h=date:mime-version:subject:message-id:from;

The threaded IRQ is requested without IRQF_ONESHOT, allowing hardirq to
preempt the threaded handler. This creates a read-modify-write race on
HPD interrupt mask registers between the hardirq mute and thread unmute
operations.

Add IRQF_ONESHOT to keep the IRQ line masked during thread execution,
which eliminates the race and makes the per-event mute/unmute calls in
hardirq and thread handlers redundant. Move interrupt status clearing
to the beginning of the threaded handler, before
drm_helper_hpd_irq_event(), to avoid losing events that arrive during
the event handling.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Split out a separate commit to improve the return value checking for
  &analogix_dp_device.irq. (Sashiko)

Changes in v4:
- Add Tested-by tag.

Changes in v6:
- Add Tested-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c  | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index c40ab7419f08..8dcfde38a61a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -707,10 +707,8 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type) {
-		analogix_dp_mute_hpd_interrupt(dp);
+	if (irq_type)
 		ret = IRQ_WAKE_THREAD;
-	}
 
 	return ret;
 }
@@ -721,6 +719,9 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
+	if (irq_type)
+		analogix_dp_clear_hotplug_interrupts(dp);
+
 	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
 	    irq_type & DP_IRQ_TYPE_HP_CABLE_OUT) {
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
@@ -728,11 +729,6 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
-	if (irq_type) {
-		analogix_dp_clear_hotplug_interrupts(dp);
-		analogix_dp_unmute_hpd_interrupt(dp);
-	}
-
 	return IRQ_HANDLED;
 }
 
@@ -1513,10 +1509,11 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		 * that we can get the current state of the GPIO.
 		 */
 		dp->irq = gpiod_to_irq(dp->hpd_gpiod);
-		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN;
+		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN |
+			    IRQF_ONESHOT;
 	} else {
 		dp->irq = platform_get_irq(pdev, 0);
-		irq_flags = IRQF_NO_AUTOEN;
+		irq_flags = IRQF_NO_AUTOEN | IRQF_ONESHOT;
 	}
 
 	if (dp->irq < 0) {
-- 
2.34.1

