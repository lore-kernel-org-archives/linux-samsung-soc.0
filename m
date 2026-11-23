Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443957;
	b=KW8+1KmHKH4sT8pCrmOa2mHg9t0oo6BayeX79qNEVt+UJfm0vVmT9+JSLMkOJ+QjQxcD
	 RgBrPvpyVLCrMYGXClqY7djPPFiKOJmZWLdjjyIglMk6edBg4eTCBIIfHIuyJUmmlKu5A
	 bqeblj/cyth+ij4wMHD3YFB+hJcN0NY0Jq91A+ZrLFNeHvEyrbp1QpUQ33NCN4q+6kj2t
	 BqDRhRS6eHjrUiOp4wErd0zUujs3NmY6B99MwJerHiSqvQS6ftO5MuWXa9Mes92OGp89u
	 u2OZVgLOmv+vyanNGOdus4JV7mm3glxBdzXLsVeEZlw+bOGP1JU9L6b5IEsWulcSPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=;
	b=Ho21qG34BV5mDtF05aVFEZ9eVyZW3nJeqs/cFCvPvwcoG5HupU5drv4v1aBHsn1CVQ8g
	 FOMi1w8sqjEx0T73cWe5QndSCRzxmtqTix+FAewvOKfWZ1FepLBWBpVpFQgx0QSK5v65F
	 gdz0LZQIp12e/x6Ao789TozWqbO4tnYnQtW8k3PlJEC7mQpE1FJVtI2T+d34EOOCuVBNm
	 aqlhLQNnlnk+Gwbqmc69vFgcNu9dfmHoqvrad7i4JPD0ZxwIDiHpmwTM/Grj+DHH/XhEd
	 Z1oQJWDeMRdsFuCyutuX64b6c03iCCg4ww3jDYlAHJzMUz6wqjxaZn6cbHbzwM8xbgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6nuidiG;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF3606A327
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 14:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CF3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6nuidiG
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c513a854320so553376266b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 06:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443955; x=1796048755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=;
        b=N6nuidiG+5vQf5rbJG0/ZZfSA2H5qTBRj5x8gfftXQ+FifN68FFoSAnREczQihSB7I
         4mEqGLi6FyO4HCGknJJSPwjJRDTQJ8GaV2bR81cyt8zHv3IpKBWavSMuZ7fMwq9EXvR/
         THT/7p8jzu3qblI/XshVDHBwxvpZwFmLKLUodS+41Jlm1SWbV7aN1/mCpBsKhiSJx4KT
         vfuCrR8nXJU4P0mWCN65wRo4pOgpiL4yZo9JrXTmtQOJxH8HExQyZoeeHRO/q6wla2/5
         okCOZz+c1/7NbQug6TuG9/kNcQw0TqxzyUot8l0W1FCELUJjZWC5VHm4xLwiFMV4/WZo
         QHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443955; x=1796048755;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=;
        b=DeW2U/rOB5FTq7OvmS1GAkbAyh6zoYhl0Ef5d1pPr32/JmFyhj8i3dDMRhsQ4qAatl
         cOmNTZdcEyV7rKbkKfLFd4hTYkXbR/aNPoSqk0ZAuIYjmH3HSVrIrYcMnR2F20IDz0SJ
         LWhEjHoRT7ueT5KfVLNSXbaApEir59/xjju7vqAKqjPPWh+RmVDRSTaN/gGpzKoVjvkQ
         xXwJI616iHSt3Q5ydqn6TtlYvFKSi+muMyRoU8y9MQlH5kHNHXtZyqwMoauEyprnUFsg
         VRzVL/A7APWLVmjAUbu3qgUPzMYqB4rugzU9Q+Tro4jzCxK3YtRqQQYCOoMNCpcFS7L4
         7rfw==
X-Forwarded-Encrypted: i=1; AL+hErGDcb7rbfLf5bpP1PhxvOVh3L6+aUVtGq+M3QZgQ9JKKB5DCysAIzbwBM/Ptu5LkG6u5nLFDwwpYTj1RsfA3JRxAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uuTh9VqTu+e75cBV6SqRA/W3sgSMhOcs8hW2nRHI22fAhN9mt
	RzWjwklNkZ8ivHZvjZDUiLCDP9FrIaNltMgqMZQd3uL2V8FoMYmH4Zd4TQ2WTDIMsDU=
X-Gm-Gg: AZFdTZfAztCB3nFNj99mDfQg0YGmbG2ZsEjgVKDWU+w42q9QEmTplmLv0M2Cl6nSKdL
	vJWyaD0zPh777pIK1jp1bLeJH4BSVyqNQNRaT4lI1x6Aulczlp35SzuEoBT3wRT45phcnYdudx5
	7fQNtzYtkt5ef+zbmXR6hLaNw9UsHuMuage3vXknMSRRvZOA/0DXFuEQ7Ra9zVlyOPe8y4xgSfX
	6ro9OSonZ3M6dcjuDS7CV6dmIi2CDp+IAc1Kmq3oKF1AikyOeu2nXf27apaV81x+W09XO+l3ji0
	zPmHzgYtEafjeCf2Wi9lZ9jhfkXZGunjVMYOoMIATqrmShkfmbsG6gzGND9ypOj7hlD9iRkCln2
	PJYElS0k1Gh2gBATeBgectxrnxk1ComQgBNkDuH9XTRF1ZEzPrT+LFmvz2V6vwlRRX2Cr3FRc9u
	ICnIMlwVny+D+7gkQP019myhpFj9FumPi6RzCYtivpsOIIPdVDQsyk5iDObD2XiJryWK2IUABHB
	l9iuw56Z/CtZP2c99jiR/PIADNr5JMv1/rdEeilrkmkoRaDkpc6O6RySb7BaTCaBgRS7FeZ35Ug
	YfGKhglGmPIhxAqLt/cApi6iNDlSkhIOlQT4kWRzZsbGA96RWRDrYDLJ7TW/aGUjtGw/m6knQms
	WZQPeXiGEsooZHPkb6A==
X-Received: by 2002:a17:906:1c11:b0:c50:8d2b:4392 with SMTP id a640c23a62f3a-c513ab38967mr715904966b.49.1795443955446;
        Mon, 23 Nov 2026 06:25:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm428224366b.14.2026.11.23.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:25:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] phy: exynos5-usbdrd: gs101 PIPE3 init fixes
Date: Mon, 23 Nov 2026 14:25:53 +0000
Message-Id: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAPFMBGsC/42NQQrCMBBFr1Jm7UgmBqmuvEfpoolJOiBJSWqxl
 N7dsSdw8+F9eP9vUH1hX+HebFD8wpVzEtCnBtw4pOiRn8Kglb4S0Q1jJUX4rhanccUscpqHWSw
 0xrk2kAlKKxB/Kj7w59jueuGR65zLelwt9Gv/WV0ICW24OGMldesfL05DyedcIvT7vn8BPNREj
 sMAAAA=
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
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Hi,

This series contains two fixes for the USB 3.1 PIPE3 PHY initialization
on Google Tensor gs101:

1. Re-initialize the PIPE3 PHY from the Type-C orientation switch
   callback when the orientation changes while the PHY is already
   initialized. When a cable is connected during boot, the PHY can be
   initialized before the TCPC reports the orientation, and DWC3 runtime
   PM is forbidden by default. Without re-initializing, the SuperSpeed
   lanes stay programmed for the wrong orientation and the link comes up
   in high-speed only.

2. Apply the existing gs101_tunes_pipe3_postlock[] table once the PLL
   and CDR have locked. It disables the high-speed RX squelch detector
   in P3 / U3 to save power while the link is suspended. The table was
   added in commit 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos
   USBDRD 3.1 combo phy (HS & SS)") but never applied.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- Add patch 2 to apply the existing gs101 postlock tuning table
  (PTS_PIPE3_POSTLOCK).
- Patch 1 is unchanged from v1.
- Link to v1: https://lore.kernel.org/r/20261119-gs101-usb-phy-orientation-v1-1-bf3c4bbf328e@linaro.org

---
André Draszik (2):
      phy: exynos5-usbdrd: gs101: re-init PIPE3 on orientation change
      phy: exynos5-usbdrd: apply gs101 postlock tuning

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 63 ++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261119-gs101-usb-phy-orientation-44cc8f14f020

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

