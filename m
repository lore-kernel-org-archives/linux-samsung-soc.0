Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030987;
	b=mJoi8LlFBqAfiVpKPl7VHa+lV6kKx6sTzu6+dqpULaCr6n8bDnNqngrWEDF93UrJM41i
	 33D1RmU8yTjRDTAsWzMX9qEJlxvelVCCaQnTnzdKHRXePJ4bacLZbNjuBZEcrE0tkpnpy
	 AbfPi4UPZpmO7qb9x1atjt64CC/8LIGLiGioy5Qy8NveCPgJ3qwRj45oayVJ3U+/A+bLw
	 BiQVLNwowaoOvb1zDzC9+npfGgYeg0b2OxGFkRBuS5rZBYbhjboPeQqxp8KDktmB9PC8F
	 Q5yJCcrScBmxLNrpckjkfCtiqgJ61G5LBUo6YDRoFpAbepo3S3tU1bdvlZFzceY5lwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
	b=FzCCYJdEf03qMaSv6Uy9SDxYxESovUdbJyOY2QbrCgRiYHMC/06WLOl1WrIJdrr5q/j9
	 MrPZzgqJZAyx/Zz+2lfTGemmJSxvEolcQSeQBtSAiKI6qhUg5hYZqvB/u26ZUqa6HVGBh
	 9aM8Y/qCDVcXcXYqVkTDa3C3Q3tZc8F1DJOJE45dQB5nA6EyyulurI3SLUDS+hLRRGJ6s
	 tJeHibGfE/CgEEjOfh9wuhxBbcIjh0kyP+pC4CQNcxDUomEaT3+jhnhk+39EsPZXrvlU3
	 95E+yXJ5vIh9zKVhshsEhk4TwMhxpcog9+ahSZW2uwm4MMCR9bsv6eA7XRh1Tyhe8yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VanedlGZ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5F4606A31D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VanedlGZ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so672445e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030985; x=1793635785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
        b=VanedlGZOu5ndUlScCLSxlKNzB5QUBvJHOy7xAvY+y80EAJmk/V9xxksuf8NQwaU8P
         CE9ZNZ5I4maGFZZBUtr12or2LPxp/2FL8+VneSbVf5rkar8wljOEfTGIs8TO1HH/r4LR
         az6MJXoQYmFFLWv4hMzLFxDhabjVMSfzwN7Qa9+LMqNUhNI8xC4lzBoManTpVANSlari
         bBjs9b+DDHRzGGulw9/AIgtEixrr6DS4UqLJXmlGSO+GGs75pLqAvk0DyQI/Wg8KMGRG
         PJw7oflt3vrLO05Gsgx5K4XRgx222bHpxgjMJjEQoYksQNS1QMXHMq2Fvea5H/udQ/AO
         hCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030985; x=1793635785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
        b=w2zZmThTqZIkoT9HyXnUXJUNeBM811dziJeJW7KFBuiJs3btEnZ21bTbjNUQiMpxgM
         WopUiO0KiJ//s+IfdllhS3tKrawW4ToVI1pe7LsyT/xpaSUDL9qKzPG7r325vfEoYpP/
         4WSmMrFyYOdF9jrG1bB8jFzrkJD+bfY4Fcyr4oT49G0Hil3Kg7SFQ34wJbjuw8bMusol
         K70LTJ40QdDkgeXD+pcHy/D6m2xFQ4R0HXV1SduBH6taR1Clwb7UyAXHM68ApJFw+dXE
         jaFoAyJN2etKAUrGO21h/PWWy7B2xpb96x5df8UeiMS3l1u7RBDD1ymaK8ypKU5M2IOu
         h4ag==
X-Forwarded-Encrypted: i=1; AKwUvBwRzq84novJR1+zdfwPwRmzKL4Px4OFV+H5rIQDZa1Mk7LBE1S4xgXze6+1kNCMEmy6O4fj95+EZCo/POpCzw8Vjg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQCwE12UvXZuogGkHq6KmXip/3k6ZDjoZe97ryss0LeqTESojJ
	OlS+moPuGaJiYqAB8Hp7sIJ+rRqY9mSO/c/lYkYQzCM5kwcn9OpooUx+
X-Gm-Gg: AYBFou24+RseDGISKzVMs3tK9lCB0lhNmbIoRcIc53xX90KJ+8gueI+kzivJ4gLwL+J
	oGp9rCgHqPRax8PAOeVD+oHnwetemzh2lcW+4bdNih+QIKi6xRYoZ0pnVt9xJp+HP+9bGtrrj55
	rFRK/Omd4+ZMxn90vmfiU8hRKbto2iEP3ERNLMZJqIX9RUwnpi4J0ASSSPqsj8WZ7tOgeQjYFrh
	qsnjeXIk/NRRVXB4sfJrt+TPScSnP3UGicXpgFsNP/omIEWn0m6rwinDjPVLvMy45kY7YDD7bZC
	iqMyzrFn3Ea494X0X4ELeNAJxaQEQu3GdKOOgQFDWcPZnwRqTkot4251G7zKtN73ZmIjYR6mhyT
	Q14y2XcK1a7EJFzucEGKlfDQMgp5CDtK1CaWR3OpBZfA3HbiFBTzLrYMxOQiKAxXyRfxE9fO4YB
	ORl533zOG9+Hu5TxMovj/KADkEVTyeifGaSTsHRv+CYCtYggIVwnAY/CMNsksAJGw1rk/HF4eJT
	Dtuq5v2HlmS012V1roYVOwmM2H2HrZ0/qNP9FCuhlETegI6vTQW+Dlj3OgMnG/59Gr8KubRPqEY
	KoejSqMuzyo29pS1vnwOYJk78G+x3w==
X-Received: by 2002:a05:600c:3115:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a7c16c5294mr2538075e9.13.1793030984491;
        Mon, 26 Oct 2026 09:09:44 -0700 (PDT)
Received: from theSameSurfase.localdomain ([89.216.103.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm224923225e9.3.2026.10.26.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:09:43 -0700 (PDT)
From: Artem Utkin <thesame.personal@gmail.com>
Date: Mon, 26 Oct 2026 17:09:14 +0100
Subject: [PATCH v2] ARM: dts: samsung: exynos4412-p4note: allow powering
 off the wifi card
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
Message-Id: <20261026-exynos4412-p4note-brcmfmac-v2-1-14b372972163@gmail.com>
X-B4-Tracking: v=1; b=H4sIACl732oC/43NQQ6CMBCF4auQWTuGlgrqynsYFjAMMIltSUsIh
 HB3Kydw+b3F/3aIHIQjPLMdAi8SxbsEfcmAxsYNjNIlg851qXJtkNfN+WiM0jgZ52fGNpDtbUN
 Y3rkiVRQ30/aQAlPgXtYz/q6TR4mzD9v5tajf+ld2Uaiw6PIHm0dJmqrXYBv5XMlbqI/j+AKcD
 dU7xAAAAA==
X-Change-ID: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: stable@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Artem Utkin <thesame.personal@gmail.com>
X-Mailer: b4 0.16.0

sdhci_3 serving BCM4334 was missing cap-power-off-card.
On my N8000 this resulted in the following messages after sleeping:
[305.759883] PM: suspend entry (deep)
[306.514698] brcmfmac: brcmf_ops_sdio_suspend: Failed to set pm_flags 1
[306.671504] brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
[307.127267] PM: suspend exit

The regression was triggered by commit 8c3170628a9c
("wifi: brcmfmac: keep power during suspend if board requires it").
Midas already has a fix in commit 2ff147fdfa99
("ARM: dts: samsung: exynos4412-midas:
turn off SDIO WLAN chip during system suspend").
exynos4412-p4note.dtsi does not include exynos4412-midas.dtsi,
so p4note did not automatically inherit the Midas fix.

Fixes: 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board requires it")
Cc: stable@vger.kernel.org
Signed-off-by: Artem Utkin <thesame.personal@gmail.com>
---
Changes in v2:
- Drop the paragraph about exynos4210-i9100.
- Add Fixes and Cc stable trailers.
- Correct the author name to match Signed-off-by.
- Link to v1: https://patch.msgid.link/20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com
---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 8d52aa13b8..03b514a82b 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -1232,6 +1232,7 @@ &sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 

---
base-commit: b47faa6004d86ade16b90d24fa1e1f179e6f7230
change-id: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf

Best regards,
--  
Artem Utkin <thesame.personal@gmail.com>

