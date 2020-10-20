Return-Path: <SRS0=ufbU=D3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C35C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 13:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4233322404
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 13:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3YeW56b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407390AbgJTNP3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Oct 2020 09:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35645 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407386AbgJTNP2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 09:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603199727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=LjmPMVzXWf6DnC/UBBUMQlfucytTz/vlaecv5F/UKBM=;
        b=A3YeW56bSEymTU+GyHsE+gUE46E2hfnyyE4tQ6oXnjebCDa3lDcPqunUAdiVyvLHR1TdVn
        FWevIlRJjdtXM3iStqE/go0JpvG5ScijT+nQL5Pm0lwGg1Vlu8rK+CdOaAqcfxYrhPW6s4
        vQxfa61D7xOOxBGznXsDWb8wcl2Jygg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-o_GU33ZDPX6jen4QgRqHOw-1; Tue, 20 Oct 2020 09:15:26 -0400
X-MC-Unique: o_GU33ZDPX6jen4QgRqHOw-1
Received: by mail-qt1-f197.google.com with SMTP id c4so1546838qtx.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2020 06:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LjmPMVzXWf6DnC/UBBUMQlfucytTz/vlaecv5F/UKBM=;
        b=YR9kidNcM9lwlVwiPnvOb8++6Yo/zEQxoJnByKFXTcIPLR0C+U36tnqqgk+LEi+gOd
         Cf8jcNiXGlNcVSusofcYP1YdWfBjePdfL0F27JUF6dsqKNuDSBKHUCd76N90GDBlThXQ
         CGEEvRujYgIJtcYF3Cjx+aquiyyKkREZBNX90SAfMbDFEFGS7Nx4MGFbLemnasVj9/tl
         hn9kJ88dGzErXQH3L79rzKK+KrGUz0Dmlg8B0tIjSXvsnnluxhGTStX4KC4IU0P6WVsJ
         6Fcoy46N9S/mExFudn5XW/3xloILQtVE/4Hr75fU6r/YexeGRFjS5rCYHD8zHIcpzP0Y
         d11Q==
X-Gm-Message-State: AOAM532ARt3gQ8Ib8Pdm4RYmkmXhtLrcxeIvBFrFxR878sOOy/aR1ID9
        zsx/0hAJdAN3WUXX9kaTSC/GGdvjNVkEnsSxRQnv9eMPrOV6rb6MWcz/gtzKAD5Sv2O4Q10nnEU
        V+zJMp4WZENjO3G3zH+L812hhwIP6h3A=
X-Received: by 2002:a37:6246:: with SMTP id w67mr2420712qkb.35.1603199725595;
        Tue, 20 Oct 2020 06:15:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxPR6bV4aLBGYacEtAaH/79e0HSmuiKtMeTJx0qcZazIVj5QKtDoi7jlYYjqw+n1IkdtGPIQ==
X-Received: by 2002:a37:6246:: with SMTP id w67mr2420695qkb.35.1603199725399;
        Tue, 20 Oct 2020 06:15:25 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id s90sm713248qtd.15.2020.10.20.06.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 06:15:24 -0700 (PDT)
From:   trix@redhat.com
To:     kgene@kernel.org, krzk@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] pinctrl: samsung: pinctrl-s3c24xx: remove unneeded break
Date:   Tue, 20 Oct 2020 06:15:20 -0700
Message-Id: <20201020131520.29117-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return.

Signed-off-by: Tom Rix <trix@redhat.com>
---

v2: Improve commit log

---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index 5e24838a582f..2223ead5bd72 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -108,19 +108,14 @@ static int s3c24xx_eint_get_trigger(unsigned int type)
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		return EINT_EDGE_RISING;
-		break;
 	case IRQ_TYPE_EDGE_FALLING:
 		return EINT_EDGE_FALLING;
-		break;
 	case IRQ_TYPE_EDGE_BOTH:
 		return EINT_EDGE_BOTH;
-		break;
 	case IRQ_TYPE_LEVEL_HIGH:
 		return EINT_LEVEL_HIGH;
-		break;
 	case IRQ_TYPE_LEVEL_LOW:
 		return EINT_LEVEL_LOW;
-		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.18.1

