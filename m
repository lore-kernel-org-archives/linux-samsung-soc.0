Return-Path: <SRS0=F6EI=D2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB917C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Oct 2020 19:01:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BC302242A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Oct 2020 19:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKIOdEgU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgJSTBH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Oct 2020 15:01:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35024 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731120AbgJSTBG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Oct 2020 15:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603134065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=XwLMs+G9acmS2aakBMTMjzc5I3FvZvwGMkn+7uLCDjA=;
        b=dKIOdEgUsfshD9SRy/pqV6WsA6j1GMbAbJilCizutDBWkHNoPaUzsWZsUCKsIowr8yjJ/f
        VKXgmtK00Y8pohAzqzVSmoO8kWvV31lzdBEHfiEBCQFJPChYX9CoOCaLamLB9S7R74ZNJx
        QnFA12Yf8ILchzsTb7S3Vj4zPXMjMhY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-Sjme6ZnrP7y3S1C6F3lOpA-1; Mon, 19 Oct 2020 15:01:01 -0400
X-MC-Unique: Sjme6ZnrP7y3S1C6F3lOpA-1
Received: by mail-qt1-f199.google.com with SMTP id e19so612863qtq.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2020 12:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XwLMs+G9acmS2aakBMTMjzc5I3FvZvwGMkn+7uLCDjA=;
        b=I0tDM5vTtNXyGtqiltGQvD/iY9mW34emd+2XN16178zDqef0AuD/ZnbPuvNLagwS2i
         tHxVpvJGA9PQNvuxSzlGXXMT6Gc8DNRquxTUDHdTFPaVi8fPnbb3kW4ayZYzAnMCOfkv
         3bNqVElvDIABnwx549b6GZdunCJm3pYDQdhkaWRI5G45fag8RN09a/X9YzAt9aa1ZD+N
         YcqRQ7QyBNDrY23VxW6vhpvVwZsTbyo5MLvxTWRAIMSCElrdADkeR0XNkq+0SV/9Jejn
         MqHFZQfei0E3rHK44h38OWTTqvBVPntIECFbGpg5/2swEOep46S+5twldslA6cR4hb61
         pu5Q==
X-Gm-Message-State: AOAM531MvEe8tnkJmpC9scesYvYv2spOJ41vT7CjsfE4oWVXTy5vv59p
        wAlGqIxo779UEtsuGRbMu2F1QbLO6z+beBYAcD04zX8Xbe4YWFjbdgbc6oLz098GUwIuEYdCsXp
        fqZQCW0knOHr8NJ4BYTiz3wBNETfLlS0=
X-Received: by 2002:a37:2dc6:: with SMTP id t189mr1048637qkh.394.1603134061005;
        Mon, 19 Oct 2020 12:01:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzErTIxJNieTSDYoXo5Y00wXQUVggwoT0V7lhKV2TN8og4s019OyWS/oIKDVfNG0iHfaiHwQQ==
X-Received: by 2002:a37:2dc6:: with SMTP id t189mr1048611qkh.394.1603134060763;
        Mon, 19 Oct 2020 12:01:00 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id n3sm307910qta.10.2020.10.19.12.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 12:01:00 -0700 (PDT)
From:   trix@redhat.com
To:     kgene@kernel.org, krzk@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] pinctrl: remove unneeded break
Date:   Mon, 19 Oct 2020 12:00:55 -0700
Message-Id: <20201019190055.7371-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
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

