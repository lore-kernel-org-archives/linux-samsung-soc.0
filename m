Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136603;
	b=hMmmZhM5Hy9+0GSTotTqTYnGVDaV79biWp7Zf1+DZ3ERLsSTYWEJBvkRFXSMLq7P4rnj
	 hKfrBSiDhgizXQMku6JyuQnVsmFbaaBbGAWMF2tSRFOJBK8CJK/itdpLaPENzW2V66+sq
	 DOEEMEAup/wIEDKNzjG4ouSNq+0SM469wlvOvK2+FGCMVKxMUmhyq7nXoEanDsEj6S5uC
	 pBuERqPK8xWpg6OcESZJ+g1wPxc2d+xX0BJ8kZu+zs9ZhhpoQjYTZUy+zICoXAyweSSwY
	 EUfgtQ8n3dtUVG0FRi8GBc6JuL2o521935ut4K/BH3wZXOz2D0zwwR27vzj8nOoRkxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=;
	b=vxpT+QDmg/UDCvxnSu2rtG6xhY+ymw0a9yxYAfpNNDfqjLKkF9FEPkiS6bsEbHM7kIPz
	 m2HRp9mFtZzqPiaeT4wh68ZmCBBEvgquzNhFpdxKC2/WC8CY4tx0eRd230jdn0oK7ZCaJ
	 WC6MTxqo9jjgBFAcc+NjT/bFYHA5CELE86HVadcvd/s5CiDTWfsXlrGFvfSFw4U+RdVlI
	 YaDP+8Yn+XApG4KURxUsHGb0yxCez2roTa1e1jzLY+KqTMNDj9oIlpl+fUMwKwE3pDh5z
	 JKjCN98ZwovirIxFzUKbGw2XWtAyuX+aZPMoDqtjr0gs7PNavtdIn1ZOvEjgCz2F6Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjYdwL5w;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D62F606A323
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 21:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D62F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjYdwL5w
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15943c9c005so389012c88.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136602; x=1793741402; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=;
        b=sjYdwL5wxM+HRiApAJpmIxcR1QkNSobITLQX+78/9zaAgfOT917BPtC4m6unEr0F1L
         U9Bqkxy2WVHU8Utec8/R8It/NOpSIvrKdo+yl10zkJINaYakkwDaFsTzOXZUwP5fCGb/
         zBZI0FX+9dT13cRRL9/JS3BsHV0+cPyRzvxNRvqyzSNAZUxZWiegCh/htQAfwruzMpPR
         yHdDGTGCMKw+ezS2laWwfzXW4XZHja/wad3mqIV6nRIckT6fRFNQABlDS4xSUrQDt+QH
         M0Yru/0o9qgm+wjq7VlT0Ifttjn7IBfYUyPKSNYzSdwjgOa5FCZ0VQg63SlOXdcSV6q7
         FdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136602; x=1793741402;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=;
        b=M2nTuZIXm7nHuNA1t8XTg/uWGWez6AmvxOPNm3SR7TfO6oelYmtU8RPLRSpebkLDKS
         KOpXJSQ9KhMpD36KgyAiAwqsJzrb5RKWNJSqKWCm0ZKNcxbc5urAhvtVHUM7gEa9DG05
         MEY7zcBugzdk3d9krbVNn/tubrs7TBzMAJdwLqdJhvDfYSxBKWBsTR6OndqsExJcZudH
         5adWYb+WYoEbeNMEa8BXV3cnR0sQDnZQW+OUdm4WeiHI3hQsjFM1ZY6dV+l+nKR/iFB9
         LyNEKL3CVDK/YLZADpqLsBKxgOkXUU1Nb4gr3qpSeZZbJEgr4dulUVh2vidvyZu8kqxx
         JjdA==
X-Forwarded-Encrypted: i=1; AKwUvBzjt4mt4PxTC/5Lij0OSWCuczvQJAm7VoPPn2Zy+UMORwVEYeEHfK4ZvkfOfngUxKR0YzSK860cgbFgj6jiaKycoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIcYpXmBC728vWeuaHFQPx+Dbklr8NR0wu9UHBzQsdaOh0VuKXw
	RwuLvFytlmgxItJNu9nToBh46iXQTBIXZcXjz972H1j0AVlRwSirE7PG
X-Gm-Gg: AYBFou3ccgq4Kcc/4J+KRpyF9Dd3FpvygNn1JhxOpQ+5V0NqwhLnp9IonbT6OirAxeQ
	oi7bbotQMVIlRNKLjeh0JB3sQmtscbQHjNWYmrqArZoZz8V9VMZb9bAgj4yWw/x5pbEujwTZMUJ
	ArwHwyZcvNj/VfGSaBiX/xC+fdqsfQWhsnY0gOSMQ85fuJKNUFJ/2z/f4qF/0PxHkFW62n6avqj
	T9rZFPur3ZH8DnAAjDOAPb0q72wP3f3j3Wnrx4Jslk5LjH9nUISw0Q0472NCQCc1ryhIVVq9J/A
	nVm7GKWhiaZ0dN84dzEtBhVMwB6Jw7efeXxvxwof0DUrCO7iFGil3NRAE3ObIKYxE2a0Srl4LhU
	9InWtZR2Cg5dqhRSmhP3yC2ik8/kJDtbdCa63T3bluGkK7c+ImG2ridx1DJ5jPaJCRJN7xH+Vdw
	9BOEWGYL3wgJ661BzgB5V4xw4eQHMgcSr0k8ctWfzH7PAFiz7Q0nZDQ4kq4I+pMFBJsA/zH8GBD
	iyaO/htZKgnAv5YvNoAP5XXb3od89cTc9t7nWsFRSqZ9RZzFfGbgemNJOS+mr2msGhbZAQ0OBlc
	+QPhvwLUvNSIp1iPu/+vXOMziSUbZJJf3IBr7sOoRGUm
X-Received: by 2002:a05:7022:ea8b:b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1a6ce2fec4amr557384c88.31.1793136602060;
        Tue, 27 Oct 2026 14:30:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ARM: s3c: crag6410-module: software node conversion
 and cleanups
Date: Tue, 27 Oct 2026 14:29:54 -0700
Message-Id: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIX4WoC/yXMwQrCMBCE4Vcpe3YhiSWoryIe0mSsK5pI1mqh9
 N2NepjDd5h/IUUVKB26hSpeolJyg910FC8hj2BJzeSM87aNYw2j763he0nTDazvXBI4IO53g3f
 bYCy186PiLPMvfDz9rdNwRXx+a7SuH5Phj4B6AAAA
X-Change-ID: 20261026-crag6410-module-swnode-aec98b623a01
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert extension module definitions for the Samsung S3C6410 Cragganmore
board to use software nodes and property entries instead of GPIO lookup
tables. This also fixes GPIO chip label errors, corrects the WM5102 LDO
enable GPIO lookup name, and drops the custom WM8958 device name that
broke regulator supply matching.

Additionally, remove the unused CODEC_GPIO_BASE definition and switch
codec platform data to dynamic GPIO base allocation, drop the empty
wm0010 platform data, and configure the S3C_EINT(4) falling edge trigger
type for wm0010 in board setup code in preparation for dropping
platform data in the codec driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      ARM: s3c: crag6410-module: convert GPIO lookup tables to property entries
      ARM: s3c: crag6410: drop unused CODEC_GPIO_BASE
      ARM: s3c: crag6410-module: drop empty wm0010 platform data
      ARM: s3c: crag6410-module: configure wm0010 interrupt trigger type

 arch/arm/mach-s3c/crag6410.h             |   1 -
 arch/arm/mach-s3c/mach-crag6410-module.c | 202 ++++++++++++++++---------------
 2 files changed, 102 insertions(+), 101 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261026-crag6410-module-swnode-aec98b623a01

Thanks.

-- 
Dmitry

