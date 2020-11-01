Return-Path: <SRS0=0bY/=EH=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D23C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  1 Nov 2020 15:29:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E333722242
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  1 Nov 2020 15:29:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P30VYvUE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgKAP3A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 1 Nov 2020 10:29:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57511 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726549AbgKAP3A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 1 Nov 2020 10:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604244538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=bWiVlvXp1WAql73np6JVzWGg8n0Nd1xMuTUmok2L8fI=;
        b=P30VYvUEAJ8mVBQ7u/dN67P6qA5rX3nEKr1LoLr5Wtn2U0XKxoE4NPB8DMi5yRcM/2oEuN
        ESxfyJnDycVYCJm3hYXiPJN6znprntLPvIUj8pNo0KgMJPBM2RSGlPJqVWgQ6XP7SWaQbl
        9x7UFDCZ074dtPzQUw54c0WCwvp5xns=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-_HvNf-xTNI2E63MfiwkP4g-1; Sun, 01 Nov 2020 10:28:57 -0500
X-MC-Unique: _HvNf-xTNI2E63MfiwkP4g-1
Received: by mail-ot1-f69.google.com with SMTP id e5so5184050otp.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Nov 2020 07:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bWiVlvXp1WAql73np6JVzWGg8n0Nd1xMuTUmok2L8fI=;
        b=i77pFlZ5rIt6jlcp+gzFPUuxXDIG5uSqG9g0sjfNeC7dXaEQeeTMTtTJcXs6tCrUz6
         YR9ZJD0kshy6ssH/h8D5CXIfp3ekO9PUWz13jLF/NDmreTdSG7JBsnMApqugVPcpaIoM
         7B+F+d255edtg0WaAKTW+5mdOsZDk8/xopsAbfWW5w8/ZUZ51NLW913ZckTRj8Xd/9pl
         3B+dOxBQix1fIrmn43QGwXo2yNcUe+Ym+EtrOc+75IwSqmEPGhhOLgpzn6SPxK1h0MUv
         6o8UrrOrWYjeLF4MlNXOnERcLpAXwWbRnNl6nQQ7zdW3vpPLCW7dxeanqDpeBQaGROZ8
         AkFA==
X-Gm-Message-State: AOAM532XA8DkZm/Wlg6nm6Y/GAXnanFcmAs7KFFV4CaL49Z41AvWK/dV
        1wGNKY1BoGen7MIq9XqPEjV73azxBLulZ5c8S73avRpC7WKbZIx40y6iEXgBd2RMDefXEevwXId
        C30HfIZhmRp+Yx1R5qTuNla1Ei92rYG4=
X-Received: by 2002:a9d:798f:: with SMTP id h15mr9367222otm.83.1604244536416;
        Sun, 01 Nov 2020 07:28:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzfwmS7mhGV1nrgDknHQb009zyvSbaveWLGdobtmvsJa5sVPtTe4GngH6uTIpawbEFjyUW+g==
X-Received: by 2002:a9d:798f:: with SMTP id h15mr9367214otm.83.1604244536254;
        Sun, 01 Nov 2020 07:28:56 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b92sm2948531otc.70.2020.11.01.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 07:28:55 -0800 (PST)
From:   trix@redhat.com
To:     kgene@kernel.org, krzk@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] soc: samsung: remove unneeded semicolon
Date:   Sun,  1 Nov 2020 07:28:44 -0800
Message-Id: <20201101152844.2290728-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/samsung/exynos5422-asv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos5422-asv.c b/drivers/soc/samsung/exynos5422-asv.c
index 01bb3050d678..ca409a976e34 100644
--- a/drivers/soc/samsung/exynos5422-asv.c
+++ b/drivers/soc/samsung/exynos5422-asv.c
@@ -383,7 +383,7 @@ static int __asv_offset_voltage(unsigned int index)
 		return 25000;
 	default:
 		return 0;
-	};
+	}
 }
 
 static void exynos5422_asv_offset_voltage_setup(struct exynos_asv *asv)
-- 
2.18.1

