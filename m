Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE40C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AE05221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738967;
	bh=5nwPKu2c7dkQrGtzL6LA+yW44/UqSKxYq4VNokfpuKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nskcpwxclROwEbKj7A7r9eXowyupKC4N0l8Cf16okiA1ZFtL0vQ7YmHGI51M0qdpR
	 CaZCVzKPt9ogO+vq4wADKH8xd9Lq2oNarVbv51BSeLq+rb51d0IQ2u9qkRkPyNtGZb
	 KHQQUs40E/S2sAGC2Ys+qHMC1U2aOlIBFbR6/FFk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbgHFSf6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgHFSez (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:55 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D157C06138E
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:53 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c15so8720822wrs.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=2E6LQ50CnvjCd/CoAktL8qEfQ3WEzqedRb21YtEdQfI=;
        b=eQl8TlcF+0z+XMpp/9AcYykihwkm592FlMCXELOzpG4yXlBn/BIi0HGI7+3lhQLzfd
         VdO2l1AkV5bck9r4xt/Pa9tgwwMRPLloqREn70VMsqmzaeAtzA+TzpFw07c1CCmi+eWr
         12gEJ626B/Zl2bppjNsMH2DDKXsqQ+3o7v8rSI9/IPcuA6zpypW8o8zHzk4YiAtRNZAl
         Bb96fniMyoALsHY8KOpaVc4mYzUviHNkLBtGqTTHX9ZLTaBBmRq3vbreMI40Kcx3Tn22
         ikqUmqwk0m/OWMPGS0WURtN0d/tuplRupNRTuRQfQEzzDEE0efnlBSNkAqVPXV4hewci
         z8Ow==
X-Gm-Message-State: AOAM5326RwRcgLa2wgzMYDDbtaXzGfOIFlNVr1AXiQaI3GC3vFoOpZmr
        +XGoWRaNvLzgHiL3A35XuOK2uMa5tpQ=
X-Google-Smtp-Source: ABdhPJy/MuGo8CkwCle9Ai7AAnjmjk5u5/5bEFNhBYTIfkC9Fo0/662nRY3kyOEaMAhZzpWICKKDAQ==
X-Received: by 2002:adf:e904:: with SMTP id f4mr8556357wrm.300.1596738891852;
        Thu, 06 Aug 2020 11:34:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id c10sm7423102wro.84.2020.08.06.11.34.51
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:51 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1540535lta;
        Thu, 6 Aug 2020 11:21:46 -0700 (PDT)
X-Received: by 2002:a17:90a:14a5:: with SMTP id k34mr9869235pja.37.1596738105868;
        Thu, 06 Aug 2020 11:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738105; cv=none;
        d=google.com; s=arc-20160816;
        b=w3U2Fx/hA2vfh+a2fRM9L06e79wRrO5zN9NPcxlNS3WnQVRGOijan+B2UlzNQzfazQ
         T2sQAqlH8nMHvvjceirAKfC7lSKTC8AxgE1STCMbzYtMCukcIGuCwPQ46D0M6KwhF0gx
         4gZgOklZvkbPXLN1y/X8gNPhp6t1ucLXNXrje9BoJFq3jXMVWNnOJo/8mdOMlUXmi5zb
         rRrQ7lhhrXMIG3+csA43rTNZAGK+g77P6FiIcZofKpXRPinYiwG+jOMHGaOqo/wOmxSv
         j11nV/RJ8TrNqE3Jh+xa9oisPpAJTdMrp1qwrobHObwIXU6T5vg0HBI1sUEV6mItxCvo
         XVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=2E6LQ50CnvjCd/CoAktL8qEfQ3WEzqedRb21YtEdQfI=;
        b=FYxMSxPr3RsLzWjqY2XTkpTYl6u4NBsPN0MUhLXbwek7Tirkf/yJ+0+WKA1AgoFS37
         I0EIUcY+VvSMvy4Qq86hrEOF4SD+9Q4wtwXhGZwGI+pcSoHqGalKL/lsoyg7UncdtVCC
         ZPJRiYezUFkijG0J+b9F96ZJCAt1qw9Ob7sbbn4WSpci8Zuw1msme2hiyYeYTaNcQFZf
         0iCWITd3IDNg6M07Wt7ltp7suSlq6L6YBVXTbUdALfYYWXc7LpeupSlS1meP2mnbZNFP
         YVrrqFaVQYNSxrgzWc2w1O9EO+p4CAz3lULc7VG/rErXVeNynLB5lfeMvxeSX9ohQT+e
         BnOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=hEgyjoms;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id q34si1229301pja.55.2020.08.06.11.21.45
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id D21C022CF6; Thu,  6 Aug 2020 18:21:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AACD122CE3;
        Thu,  6 Aug 2020 18:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738105;
        bh=5nwPKu2c7dkQrGtzL6LA+yW44/UqSKxYq4VNokfpuKc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hEgyjomsMoi1BFSWY8gCec2B4/q2Pq75dQpIw60bSofKWB72/qyz5rcT+tpYSEhE/
         agpw62Ugw4k3jgXE5TpFTFC8Rvy6hcmfjCWN8qOhxQsQ5uYZo4Vhh8bOBfGJEtEnRS
         PEy1pSyBCQLsfnXBnVNsplmQIyAdng8RyS1xKyHI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ben Dooks <ben-linux@fluff.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Subject: [PATCH v2 02/41] mmc: s3cmci: Remove unneeded machine header include
Date:   Thu,  6 Aug 2020 20:20:19 +0200
Message-Id: <20200806182059.2431-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: FzKRXdyLN3AR
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The s3cmci driver does not use machine header mach/dma.h.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mmc/host/s3cmci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
index b5df948f8155..60fc3fc30fb4 100644
--- a/drivers/mmc/host/s3cmci.c
+++ b/drivers/mmc/host/s3cmci.c
@@ -26,7 +26,6 @@
 #include <linux/mmc/slot-gpio.h>
 
 #include <plat/gpio-cfg.h>
-#include <mach/dma.h>
 #include <mach/gpio-samsung.h>
 
 #include <linux/platform_data/mmc-s3cmci.h>
-- 
2.17.1

