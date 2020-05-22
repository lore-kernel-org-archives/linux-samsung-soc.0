Return-Path: <SRS0=bPT2=7E=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E00C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 May 2020 22:35:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19C392065F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 May 2020 22:35:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="BTy7Qzvi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731122AbgEVWfR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 May 2020 18:35:17 -0400
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:53010 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbgEVWfR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 May 2020 18:35:17 -0400
X-Greylist: delayed 972 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 May 2020 18:35:16 EDT
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49TLVw1pHRz9vCBD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2020 22:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4qWL6zdTp7vv for <linux-samsung-soc@vger.kernel.org>;
        Fri, 22 May 2020 17:19:04 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49TLVw07LRz9vC90
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2020 17:19:04 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49TLVw07LRz9vC90
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49TLVw07LRz9vC90
Received: by mail-io1-f72.google.com with SMTP id a11so8280980ioq.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2020 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xf86DUDR0KCytTZe0PoPEVKJWswyj76Qc8cwS/5pEd8=;
        b=BTy7Qzvia67Px1tEvWTi8X/NeNB6jPnEST1ETVo7uBwyZ8Wkew6opFNFU8mNZzW21R
         nNJWn2xhDpBNOD7j3Cqf8M9TKnEA2ESWSydG4JQQoGk92GLN4GiEptxM9qn653V3LfWm
         zR5YMeRMAhWXAYm6MITvDwZequAwm9QG2kyc1w82icjZ3Epz/qAhABqHLh9SCu83Nnht
         ky7cXtHlMl0IFuKy3ERdiQqKPI3GxOFe9PbIeujOsk/eetVdQFtkqjF1ZxhM5b0vv6QN
         cCwKam8UCdajHSyeHNTBnSIWQJzPsZVO4AMp6WGTvZ2GS+ykM4DahQlwnrzZHGVYr66w
         89MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xf86DUDR0KCytTZe0PoPEVKJWswyj76Qc8cwS/5pEd8=;
        b=p+KVItUfepzkOiIs6ga7RMdMJo5id8oLMzacVQFtkHZs8HKgRGtXQO7FHz7/EDIWu6
         G12TOvipU+9Vilt+qTCctV7aLLxBRlWflP4EWNuPbkNvc1KabmcujEA65FsBrUi6//Jl
         5UHq1KD7E8SK+b38AK3v/rtk/7EaRPOWn4K8zxTtJkdktkTIn2cRImwhTDkHP53fq6/+
         24sY3xIJRz8tE7lIb0hTqddltxGewqbADeFgZd28m1luJ6ZtrB2ZEhOKIjOLCSlkBqVT
         pVvjE9o1DrJZFifO+5DqD7sT4BBFlw4xAOfR/WH46VySocF9hSIxQIuSJtko4LhyCBWQ
         DsbQ==
X-Gm-Message-State: AOAM533qHBM6HQ13XA6K9847Rrnzz1EUx/pbqNgJtSXDHb7wKikPqCCj
        GnIVHT2dH2H1sdmAIHjl1ZB9s8BDGNwZMUWJe+5CympoiFCJlE5mK2So7n2Y4LJGE4nbmtET9cb
        gwIj+/v5G/SJI102IaWNk4rehOVCKxVynP6Q=
X-Received: by 2002:a92:c7a4:: with SMTP id f4mr15370412ilk.44.1590185943580;
        Fri, 22 May 2020 15:19:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+J0ruAKNhsdIwEN+ydT0VoCKGFWbQcj4ml3xYNL1KOfJyA/BR/ZbR8JROJoT/OQqoIenz1Q==
X-Received: by 2002:a92:c7a4:: with SMTP id f4mr15370380ilk.44.1590185943240;
        Fri, 22 May 2020 15:19:03 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu. [128.101.106.4])
        by smtp.gmail.com with ESMTPSA id 7sm4210431ion.52.2020.05.22.15.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 15:19:02 -0700 (PDT)
From:   wu000273@umn.edu
To:     sylvester.nawrocki@gmail.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kjlu@umn.edu, wu000273@umn.edu
Subject: [PATCH] media: s3c-camif: fix missing disable in tegra_adma_probe().
Date:   Fri, 22 May 2020 17:18:55 -0500
Message-Id: <20200522221855.7891-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

"pm_runtime_enable()" was not handled by "pm_runtime_disable()"
after a call of the function “pm_runtime_get_sync” failed.
Thus move the jump target “err_pm” before calling pm_runtime_disable().

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/s3c-camif/camif-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c6fbcd7036d6..12ee49638f44 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -500,8 +500,8 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	camif_unregister_media_entities(camif);
 err_alloc:
 	pm_runtime_put(dev);
-	pm_runtime_disable(dev);
 err_pm:
+	pm_runtime_disable(dev);
 	camif_clk_put(camif);
 err_clk:
 	s3c_camif_unregister_subdev(camif);
-- 
2.17.1

