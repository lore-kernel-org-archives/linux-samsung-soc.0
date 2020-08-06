Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5723C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0B35221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596739115;
	bh=19UAshGsZFByjxw/aSzh0Z+vb1p8CceYaowS8Z/9iZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=U5Xs6ofEg1y0vELTgFoRIML2i0xRYy/IkUfxoUyFRC5W2ZHECzQi1NZXwi29W+aqz
	 VUfrd8Eu9DiVU+eM9SCU6zwelyhx5goEADKoHZsbk1i1wLpI4ICsx5QF90GL1SiXKQ
	 acM9jpaZQSBSOoOdOBD0il5lL/X50fkvzgDX6Lc8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgHFSib (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbgHFSei (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C2DC0611E0
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:21 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so44964870wrw.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=cb3xaLXInirpGkk/D48FifpupJLA9iX1TfsDWj4AnNc=;
        b=X6bskorCSS9jxhVZ63UIGWEq48IZp5z2UJC7k/AZ858SNODsygd27S+Gr2ZQAdmCQF
         UrEsmqmIKSovtv/XNkKJaAeGsLrmLALvKXnL9RVps6w4LxtkZ6+nQ/kM5Az1KICMwfGH
         eBeUzw+WUn+Iraxmz4wdPQFDGoLdPypxHxjs8CaCzdDeXdSI+JohFjJL1SaOPKzExCW8
         q9nWxoSnLPs07E5vIVm35w1CaFk8w9Qup0PwfBURgTN4UOE5IO6Egw+rDXUPZ5TdBY3o
         L2Qc261+tPi+HZSXv/gdsgKEJ/W0ZVaO4NCUdW0EshbZXb3W6KnMSVQNTf5wFvsERcKW
         C12Q==
X-Gm-Message-State: AOAM533LMir7Er15LhfRj0ELkFwUP+KrjzujHl71n3CVO+F8/mHX8VLs
        BBP3gBr/zRf3tKscEbBlhwXNoJlVkJs=
X-Google-Smtp-Source: ABdhPJx23ebKC7+dT4tP6wl5MOTRxNWhrTGc3ulYuW4fHbTrIspT/+1pkFrR6JD3nrAuJJxjmZVlNA==
X-Received: by 2002:adf:f149:: with SMTP id y9mr8279474wro.93.1596738859623;
        Thu, 06 Aug 2020 11:34:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id k4sm8033016wrd.72.2020.08.06.11.34.19
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:19 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1542031lta;
        Thu, 6 Aug 2020 11:24:04 -0700 (PDT)
X-Received: by 2002:a17:902:8697:: with SMTP id g23mr8688297plo.94.1596738243954;
        Thu, 06 Aug 2020 11:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738243; cv=none;
        d=google.com; s=arc-20160816;
        b=Y84fImSfKKm8tFdVCh4c45PGirgvotVRScragW0XIpu6Q6Yof0rQB1TNb/6e6Lh0YJ
         Xab0DH4HuJs7BigzXbMZr1qGB5vyZ59K8n3S3tUs4vOPnQZet2DRmNRtELSnZlDSyimK
         yE8fRdOg20VXB04bpOxzAv3dfq2ZR9/6QBPRgs3tbthg6fUvUj1ttbsIgcjVTS0BYG6z
         6izxJr/TCqgSjtJq3erVSv7ds71Orox9nKoQRmneqwADERmVRvW5acANaTMG6SS86VVu
         KyB6U6aIEyRZ6osRUYOEBFZdrCs50vQU0AZRNOUCPef/VGnSAJ3MVpfaCbdEQsRG6Ttf
         +3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=cb3xaLXInirpGkk/D48FifpupJLA9iX1TfsDWj4AnNc=;
        b=LEK2Y7ACBKugmnwrLr0QojPNzrr3ciGs+Ta/eGUnvkYQCgfYNN6VLJ01RHROBMcHWZ
         RUqQuS+vGv+bUgvHPUdOWP9YKNqPsRQbc8k4amUC6D+SWq5EI9gHnj5gPjfttZp02zUH
         tDT71gYIMJd0677qsn8pOWG1BWWFROiM+KUT2mZ13APnhrJaw3977gFyYwWcCOkSw7e2
         Qi6ttAAHhDSFejh4Dv83mKU3WywAYkbXqEHgJniQ1XBqiqGaxNvunAwKaQmFX9oINNza
         XI4ArccXyC0p+MPAzRRh6+hnS1aqSzbD1pMW5saCDgPkLfUob28L5lnNw56n04ih7i7s
         BkDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=nBIXHt6B;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id t11si3854691pgl.502.2020.08.06.11.24.03
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:24:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 076ED22DFA; Thu,  6 Aug 2020 18:24:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEDA522E03;
        Thu,  6 Aug 2020 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738243;
        bh=19UAshGsZFByjxw/aSzh0Z+vb1p8CceYaowS8Z/9iZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nBIXHt6BD7bu9YKm6SGfQefDgMp4yTD7C4X5F+YWz9/xT40rusPWXccz/CjQy4xRR
         1nDngaN5OmaCmfryBkNOScYWHyU3HyXefCs2apd46s0WTbblvgak1E8vlQKKZu+rp5
         kHpj4c04WnpG+MkflTaJ+/sv3P+5axMKuR8q44Xc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 32/41] ARM: s3c24xx: bast: avoid irq_desc array usage
Date:   Thu,  6 Aug 2020 20:20:49 +0200
Message-Id: <20200806182059.2431-32-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: n22KpQK9U7IH
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Once we move to sparse irqs, the irq_desc[] array is no
longer accessible, so replace the two uses in bast-irq.c.
The first one can use irq_to_desc(), the second one seems
completely unneeded as we already have a pointer to the
correct descriptor.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/bast-irq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/bast-irq.c b/arch/arm/mach-s3c24xx/bast-irq.c
index a6db5e2c910c..141a35d58dd7 100644
--- a/arch/arm/mach-s3c24xx/bast-irq.c
+++ b/arch/arm/mach-s3c24xx/bast-irq.c
@@ -62,7 +62,7 @@ bast_pc104_mask(struct irq_data *data)
 static void
 bast_pc104_maskack(struct irq_data *data)
 {
-	struct irq_desc *desc = irq_desc + BAST_IRQ_ISA;
+	struct irq_desc *desc = irq_to_desc(BAST_IRQ_ISA);
 
 	bast_pc104_mask(data);
 	desc->irq_data.chip->irq_ack(&desc->irq_data);
@@ -94,8 +94,6 @@ static void bast_irq_pc104_demux(struct irq_desc *desc)
 
 	if (unlikely(stat == 0)) {
 		/* ack if we get an irq with nothing (ie, startup) */
-
-		desc = irq_desc + BAST_IRQ_ISA;
 		desc->irq_data.chip->irq_ack(&desc->irq_data);
 	} else {
 		/* handle the IRQ */
-- 
2.17.1

