Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E852D7BF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Apr 2026 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775459195; cv=none; b=PXCwjdConj2FZ1SfOpoctpFJjc0+yUKmxLNZTGqLd4LX1xqCa0/zOp8IACGhsjBdyom1A7nmh28hNbdrb6crxnr8ywpULOqRL9SjU2ZNcp/rpg/GBacV4lZToqidbEDsQ0LLs6bdeVP9stDUM6UEFq1BwV+4RUathvPWMFztnjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775459195; c=relaxed/simple;
	bh=IzwUOOk07arVzGnI3bxwELcmQCPD2zVHN2+sLLaQQaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QxG8QrWit+WrFmh/JOecGCN4SOzMsb7ExXpFPKENF+ojJuVipz08meIi6jqEEwdiQ2UDUlqqq/6Z6fTOOxEeh53Qokj7ROCTStClA6N5/ruff6NECpulaybQrNrgvtWUd0mua+WjT2ZSmL3FfKKYRZtOShnGRirhQRZ0+2xdSxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lvkasz.us; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lvkasz.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b9bfcbaa81eso563691766b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Apr 2026 00:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775459192; x=1776063992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmI+hzyBqRr28Y++VrQXgi0DtpH9W0BGd3T//ob2zds=;
        b=BPAzDGmeUGjUCoZarWGdzKFB3gq5R1Npe4T4LWRhpHdMIOTP/g7Hsj+Lr5HUKDKaN0
         ThhHIRUfixoV0fPpf0yCCt6HeLp/vrGXgWoeRerxN/A4+W6l5nWSlQ0Rs7LGuVgw1I8f
         a9aBQIYPrQN91UXDg40xixZK+tByrbnWtjcAPpUFSsEKaWYdTDH8D9Dzv3YJ4JT1YZU8
         To7SeqaeV/T+7R/q0elNutZtzUs1QrRsI6/Y7GeCGWzrtDucHfgCgnTzrjdHw2b7MhRk
         Pxjfk3mVBVn5uQc2TWQeOtu0lZXLL7pwp5yDHYOxXedfziCfgEwEYC9xhh+5m2z4jiB7
         Mreg==
X-Forwarded-Encrypted: i=1; AJvYcCXupav/g5e6H+1/qsWW7thYGZQEl2t69CAyLZPhxV6ebY7QJ8Jz+NYGu8W1Nj4gL1ey/Ecp91RIWNNOb62ZPrmxuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFR+7tSGiHgbrp8EVpkoQEYV11rY6CbJ8d8oWEveCa16JMigh
	Aay+H1lNTpMVtUiaArIBpoanEviIuWeTNwsUuI/i2muR2URlTJ1fIQYu
X-Gm-Gg: AeBDietkrK5fMfNdvrx3e/rZJHUqUux+KHIm0+odIw658wxgJsop5xy6zisq8K/iHwb
	X+y4KbFzFYe2VKC2XTGS22KgNdtD95KwW64YkcpD1oCiQW4O6U1gyeAEYoNXXjUH0/QyATw4XQB
	+niLEFYoQ1V4wd+zhE09r1AzNdcM1OXJcdmUAGOc9ghLCqViohoJkns/UsQzxroB99dX3dP1LtW
	iL16cgw/mbiNicAXJAvjCLsvvFEccqSpLZN2hUBz/p41ro//4UXo//miMzSXS8XfDeOhS8NG7Ro
	xT36K0f48qqSXo7eujEYKF7GidvhHzSIPW2SFtqpLCTe8Hz/5LvD7qNNvwOyalEAvNKJA6Co5T1
	w9viovWXEoDE0qs3hj+4/HYtHcKSI8AZdzvtusj46VMKot3WDR4Rw2MmJIfCRmkniTmmtRoiq/s
	Mr0MtnH3JNSX+e6skS+/tEtEfo6nWxFAAiJOTNUAswKJMF3Taw50TRgxmkDVuQkQ==
X-Received: by 2002:a17:906:4fd4:b0:b96:e11e:97c4 with SMTP id a640c23a62f3a-b9c676ad8bfmr559766366b.20.1775459192157;
        Mon, 06 Apr 2026 00:06:32 -0700 (PDT)
Received: from aorus.localdomain (5.185.72.109.ipv4.public.orange.pl. [5.185.72.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff131csm450129466b.52.2026.04.06.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:06:31 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	andre.draszik@linaro.org,
	pritam.sutar@samsung.com,
	kauschluss@disroot.org,
	johan@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>,
	stable@vger.kernel.org
Subject: [PATCH] phy: exynos5-usbdrd: fix USB 2.0 HS PHY tuning values for Exynos7870
Date: Mon,  6 Apr 2026 09:05:48 +0200
Message-ID: <20260406070548.132491-1-kernel@lvkasz.us>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The existing PHYPARAM0 tuning values for Exynos7870 are incorrect,
causing the USB 2.0 PHY to fail high-speed negotiation and fall back
to full-speed (12Mbps) operation.

Fix TXVREFTUNE (transmitter voltage reference) from 14 to 3,
TXRESTUNE (transmitter impedance) from 3 to 2, and SQRXTUNE
(squelch threshold) from 6 to 5. Also explicitly set
TXPREEMPPULSETUNE to 0, which was previously missing from the
tuning table despite being included in the register mask.

All values are derived from the vendor kernel for the Samsung
Galaxy A6 (SM-A600FN), as no public hardware documentation is
available for the Exynos7870 USB DRD PHY. With these corrections,
the PHY successfully negotiates high-speed (480Mbps) operation.

Fixes: 588d5d20ca8d ("phy: exynos5-usbdrd: add exynos7870 USBDRD support")
Cc: stable@vger.kernel.org
Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
Tested-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Łukasz Lebiedziński <kernel@lvkasz.us>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 5a181cb4597e..8711a3b62c8e 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1958,13 +1958,14 @@ const struct exynos5_usbdrd_phy_tuning exynos7870_tunes_utmi_postinit[] = {
 			      PHYPARAM0_TXPREEMPAMPTUNE | PHYPARAM0_TXHSXVTUNE |
 			      PHYPARAM0_TXFSLSTUNE | PHYPARAM0_SQRXTUNE |
 			      PHYPARAM0_OTGTUNE | PHYPARAM0_COMPDISTUNE),
-			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 14) |
+			     (FIELD_PREP_CONST(PHYPARAM0_TXVREFTUNE, 3) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXRISETUNE, 1) |
-			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 3) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXRESTUNE, 2) |
+			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPPULSETUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXPREEMPAMPTUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXHSXVTUNE, 0) |
 			      FIELD_PREP_CONST(PHYPARAM0_TXFSLSTUNE, 3) |
-			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 6) |
+			      FIELD_PREP_CONST(PHYPARAM0_SQRXTUNE, 5) |
 			      FIELD_PREP_CONST(PHYPARAM0_OTGTUNE, 2) |
 			      FIELD_PREP_CONST(PHYPARAM0_COMPDISTUNE, 3))),
 	PHY_TUNING_ENTRY_LAST

base-commit: caf08514bbee0736c31d8d4f406e3415cdf726bb
-- 
2.53.0

