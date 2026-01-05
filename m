Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C192F4A19
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616480; cv=none; b=ZMJmL4j2wCA86P8uMCcSTX4NVY6SoH0sHnnlg7fm8a1coerEq2Rr9nPOljzVufbP+gUT51kCAt3DZfi1oFbk04lEYkLspBGIUPjGRdyrw+w9dvKAiinscsWim+YsQ2tymJBqnMlyxHPSNBchKf6IQYysOmMklQkTHxBvFyv1QQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616480; c=relaxed/simple;
	bh=HqzC2VW8RCj6irT4FNr6pRiQ80sjvoO8y02jxVde2ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=apsP6EY7RpzRwX5OdYRScoI0LCTf5DoZwKdgDY0BjyCOUiFLionc9JMiBY+/FnD/Cv2/max7gV7LRGfwbC1LPflaCcKZEmmAn39r8TpRa6PnKm8k1zW6lJbtUVEKdKiLlHrEUHCv6tzPb2judhD8mcdinwRyMgymjBahf+Wc9/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ll2yhJ0f; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ll2yhJ0f"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65063a95558so367993a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 04:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767616477; x=1768221277; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GbECqTLc9hkL2flK0QE57LZGXpZua63SU3JKDn7QVHs=;
        b=Ll2yhJ0fuPDl694m3d/0I8C0Y4Ocec0aEsFnE5smFsuWN9VOLh2uKadqZAbQNKChh+
         rEOoWOnlmd1L0p66T0FRVKXq7NfMvFqSWdqVYLNsg/KaOcpPv+4K4JHW8YjlmiKVQspb
         k9IpzKE4PYP3F5v4gsKt52VBxGKYljT9h+KI5kj0MI10J+m9QHAHSbcOVxDp7O3Awb3M
         EDlc0/047qNbKHfblJXRd16eLfSsDTcrUPIe69LYGo0noUHVxe+hBnLW9uW86fnkqvU2
         nXmzNihR+86r6nenEp/DDB1lZGTWyalp9/KlCKGWjR44kaq/0qb3kjex8I51YFGnLSHs
         ilfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616477; x=1768221277;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbECqTLc9hkL2flK0QE57LZGXpZua63SU3JKDn7QVHs=;
        b=Ub7A/LQP+FItEdBsVXhSZPDQm8jmqapOSKDZYn5LF6m8HTJwOq9UKYP9YU/K+tucWx
         ZBLMfEk8FPpQQQDEqgYfhH3uZXMi7zA2T2QNaRw/Cc05L/yvZ52IDsTnLsCJl3F6opgC
         M+lZj067KOohzpWEbFKrQwTeXZMduTabebhMmNnJYC4UlNVxUe8NC3d9jKGhSWgl52pD
         tocSfnXVKh5+7FiDJV8t0hc+DWZlNf7E8mts8RBpcsSt/bdoSR4LepPFhEYMAYC5nnUP
         ULVIg2YXHvsJ7ku6fnbZlcgmlQU4jw2AHPGRJLLVdn5vmm6POpywvFFsTd6tHrS1rfGS
         sV7g==
X-Forwarded-Encrypted: i=1; AJvYcCWSRD0uJQaI6xIGLExF1Le3Ro0R8fG9Tn6dBPCy8AVo1fwfe7N/Nyh3dKlyttNgjmz6UUlqPlcR9gwQ2u2Y4KTrEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzzK0t+TzAsX987MhnVjyZn6fG+8WwHcIBu3vcLpOqjauJGc/V
	sJ2aANKWBzfe/JYYIKBesHJv2kBhDXO4yYZuK3DvuOzSiwrBzbp/PeEYNJkLzp4YpTc=
X-Gm-Gg: AY/fxX7HpDg9ryCNtxcSV8f08krqhxyeb6HrdWwX5guYqTcB9BPx9MD+Pw+hGOLfnLG
	XgU/mM+FeqeP/9s853q/VnazdVtSd4KpsMrzBHp//LYzhZskEDnub0vFdJOxdcKQqyXVPeiJsDV
	RLb4p9f5MRwGpYSToIaBrIAA/z1JytCo2ZxrFk4+H5ziJwOSxSbIzgVaF5UdUxGpZbcaytqyw2k
	nQctxncClAdJssPpDxaQAtoYHMBP00z1lkzLS9tO5iEFwMCh0yO/4NUtrOWvMSPvZO5XtnU99CA
	p3m5WLRhD1RcBpNoWqQv0YuYAgAKUgg6E8SuTS3guRoKrFnmsrum/tywDl0abtrcNPC599WjWpY
	wV/CGfa5/LI6JcahIVRNigLkvvVEJCWB/MA4YqVjPukMll2scjPxlI1Wt0sqXukk9/AQguOMINu
	jY13T7haLTY0In6GD+OJLgNGIzoA9WgRBklOsBhMB8X3cHQ9OiTVrWE6QmUh4RpEpedeW7KL4ET
	V0aLg==
X-Google-Smtp-Source: AGHT+IE5r/KAj2uaww+sm4UEQ/vQ6irilbY4I/Rj/25jmRhewjMrD+2mfDGapwoYYRdj/y/4boYlFQ==
X-Received: by 2002:a17:907:7fa5:b0:b76:d548:f85b with SMTP id a640c23a62f3a-b8036f2d2demr4611141266b.11.1767616476813;
        Mon, 05 Jan 2026 04:34:36 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b803d3cea32sm5371678066b.34.2026.01.05.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:34:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 12:34:35 +0000
Subject: [PATCH] mailbox: exynos: drop unneeded runtime pointer (pclk)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
X-B4-Tracking: v=1; b=H4sIANqvW2kC/x3MSwqAMAwA0atI1gZqtYJeRVzUGDX4K62IULy7x
 eVbzEQI7IUDtFkEz7cEOY+EIs+AFnvMjDImg1a6VoUyuFvZhvNBS25HR9uK7vJI2lDTjJaGsoL
 UOs+TPP+369/3A4d8qktnAAAA
X-Change-ID: 20260105-mailbox-acpm-pclk-ptr-c25c99dacb34
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

pclk is not needed past probe(), just drop it. This saves a little bit
of runtime memory.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 2320649bf60c86980c0e8554f2d5fd32af218a6d..5f2d3b81c1dbec8d1a15353769b4b3a1d6ebdf21 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -35,12 +35,10 @@
  * struct exynos_mbox - driver's private data.
  * @regs:	mailbox registers base address.
  * @mbox:	pointer to the mailbox controller.
- * @pclk:	pointer to the mailbox peripheral clock.
  */
 struct exynos_mbox {
 	void __iomem *regs;
 	struct mbox_controller *mbox;
-	struct clk *pclk;
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -100,6 +98,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	struct exynos_mbox *exynos_mbox;
 	struct mbox_controller *mbox;
 	struct mbox_chan *chans;
+	struct clk *pclk;
 	int i;
 
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
@@ -119,9 +118,9 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	if (IS_ERR(exynos_mbox->regs))
 		return PTR_ERR(exynos_mbox->regs);
 
-	exynos_mbox->pclk = devm_clk_get_enabled(dev, "pclk");
-	if (IS_ERR(exynos_mbox->pclk))
-		return dev_err_probe(dev, PTR_ERR(exynos_mbox->pclk),
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "Failed to enable clock.\n");
 
 	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;

---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260105-mailbox-acpm-pclk-ptr-c25c99dacb34

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

