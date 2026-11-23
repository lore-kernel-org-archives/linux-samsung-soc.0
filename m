Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443958;
	b=EHFUxsdD6VtJREzwZ1gkdijzjCkJikci2lEzWuSriL/ULtH/PVSzxxdw7dYHAfERQNtT
	 3KyXedxYxUY38WyefSbGdHcSjpL1Rt4b7r4UgEe7UOe/FsK9GhNGIvb8YAhjmtTsO1DTJ
	 tOt4GR02bQ+V0omeG+BZPOC6PXp1nABxBHGp7BFE3lYDw9tsMBf70RRKTQcrkpNGF/fGb
	 0yjc0AaiGqbAprpaLOzQKbIX9o/I6FKLCSwlTwePsoZ4vqhmfuwcaL01FsbvSyeVIRpSl
	 QY2EUrUkZNy3aXWOBgUyswJlgWAI87s14QwNB5M0g5fqIa6DFonAXGxe67PtKsrWB1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=;
	b=MPWK/c4TS2asI2sAFFKnaRJQEfLogvfeT+4/DvlqvsNzBENd1OmWfiDbefczdhNP3ucU
	 aqkFG95pOG1zS5JFoWE7CZ7Zpztr9y9754C+yd10mlYLW76ZCryoQnJ1MDQNVCeuR0A5t
	 1kgRjHpseBI6tontdigODpW4OfTGlrApCUcpivRzftUJF7yWzWW/aVFOd8A686q+TR0C7
	 v/W9AXMEy/tTKFb6fQRZzCWjpCd0wOGKzPuLneb0pWdYlQWyblassNJOUIns/O03AHoH0
	 peLEKAszB69Eq/jDgLPdLIhv/d3cx8HeK5/22GU3VYuU5fEpr0BAfTEFVutJMutCG3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wf+xxF8O;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35447606A332
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 14:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35447606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wf+xxF8O
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c511cdd5a82so375915266b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 06:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443956; x=1796048756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=;
        b=Wf+xxF8OO5GuqvnQ2zIev3BeaWER3LI7P8xCIf8fXe+kg6oH3YbTcTloUcLNeFfSU5
         CQYYWREsIe5p+ouwCQfiIlUSLH3FqqLldlcSaLozZbyTEqYne5psCLV2f8YYUW7feAaL
         ASQMIoGHSQTW56eSLRxbTz8omtgd7ivtrZqRE/0QD1/iS3sxGjiXww+i/dwqUivfwUx9
         BrWCq/BoabCXoDfMm37sHq4Gp8f4zcIjWoFYkDUyYlfLH5IFK0Cf5cg/Z+LkNnGc1fmm
         T6/X7IMtij1Y/lAp4XQuWZC9XHiI4rPl0IDR6G534/ukOBys2U4qsZ9wQKym//zhfxsF
         zuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443956; x=1796048756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxmsdlRkwXKs6xHOy9xMbMTKjN7AQ/1XvZ4ccJmXMbM=;
        b=zG9k5vr7w1Xs7y79blobpDWWR/J0Tzrs9eiu3Fr3aTPvhh0pSl7I6ZHB8ZKLO0+Lsx
         3Q+helFEQQibAJJ8IYv37BUhS85Gcv5bNubmoCMceGxvj6evFxBCFHbMvGuzC34xol7h
         eGAcS2dywq0EeedNxNYjRUXgZvzgsuXJ4WDP5bunW+nxYYNhb+Ar0S9ylk7ZmyrDjzAf
         GCOMptPMZ6Fjdef55dJ6a39ytgIlbi/XSNHFOcDPg0zIgrz4WG6m6Wj0Lv90Grtiqu3q
         XCK+MmigUhyn+SDDFOeO+QYOY4BOlmpPzbr6M05LbsZY2Rfer7+vKF0sUJ2/IEVScVz2
         tGpQ==
X-Forwarded-Encrypted: i=1; AL+hErGjAIBDl5HfsoTxMYGQxOVyzfulAX2LoKBmEJhL99Rw5uV0gil0EQlHwLVRFJX3c/yhb4/3i7suK+K8bkArJLTfeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+u0Pcci+Y/oLAVDPTRK1BYeBMSAGx0KSo5XP5BUe4CAwvNz6gP
	sF6VfjG2XiuGpRj2yUwHBZWGh89Rlm2h9VS/zb81xtVxTcIWCg1inarS64aKzvUdQ6g=
X-Gm-Gg: AZFdTZd7geSzYprCl2yURtGt1WjKJMI55Wu7Qvb/EWB68EeAgu/MjHM3aX1JsXvwuQq
	AfSuVU+GeKlfC9JPjcWJ70PFtoQgDRaBBk2I9DvNrNDedmv+R0LHauPDo7N9pCDSwCmREeZ76Vc
	z5LccZbsfyscIuOZh+J/zbQRjP+wPq3g8XJE8x5tcOy1OICmLzVAj1w/Sl7f8WqF7F3FICihwuU
	57NuM3bVr1v/ejvwJ8fdXgEPoLANqwe7+H5RUhrTYBhKVwYZ3TXmdSncOuRUDrepEsbwW2lGFP3
	/qIKXMR+NyAMvChQ5u6bjm1l9Sfk+z5X+3oTMOJ8lEqqQkwVttjRkZEA81MNIl+obK2U0lc0w1N
	b0oTArzXhKjCEKTNIhk+oQRx1E8UTgkzFlkmzjDldQbDztp/Yh5v+zx8bFrRmPu61VhWrrbeXah
	HeCxb4EL7Tzh9PTAtTFn+ZonpbbZ16YvbL84jJr/vdBXZ2mYGzs5VS/fGxZtfKpnyoDahYhIiXC
	QWocuUGFo0nafdff/7ezQLwbPAzPoqh5wL4ubFfsHXrB9Hxt3WjSx7ls31YPaP+QLFnO4rmGlFt
	dCCOurCpkmRFxh6POZqzDMIIQbk2htZuZ6KOjOkjwMSWraDEj2NHBv64kFf6IR5d6PEAS6RIATq
	wrI5b1UUqovJVNCiv8Q==
X-Received: by 2002:a17:907:a890:b0:c41:266:68a7 with SMTP id a640c23a62f3a-c513aacd82cmr967497166b.10.1795443956585;
        Mon, 23 Nov 2026 06:25:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm428224366b.14.2026.11.23.06.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:25:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 14:25:55 +0000
Subject: [PATCH v2 2/2] phy: exynos5-usbdrd: apply gs101 postlock tuning
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
Message-Id: <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
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

Phy tunings to be applied after lock are never applied on gs101.

On gs101, gs101_tunes_pipe3_postlock[] disables the high-speed squelch
detector when in P3 / U3 to save some power. In U3 (USB3 suspend) there
is no SuperSpeed data traffic to detect, and link wakeup uses LFPS
through a separate low-frequency detector. Disabling the high-speed RX
squelch detector in U3 avoids keeping it powered while the link is
suspended.

Apply PTS_PIPE3_POSTLOCK once the PLL and the CDR have locked.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ccaf0f27c4c8..f647688c3bfb 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1745,6 +1745,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	if (ret)
 		return ret;
 
+	exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_POSTLOCK);
+
 	/*
 	 * Set this while still holding phy_mutex, so that the orientation
 	 * switch callback can't miss an orientation change.

-- 
2.56.1.750.gf70dc682cf-goog

