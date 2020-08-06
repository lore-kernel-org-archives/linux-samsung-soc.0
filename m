Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59ECAC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9485221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738948;
	bh=owgygttJoaXudGgUle7hLKq1gI0hpguByw/gxau5EAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=UAvgD3aWLBYVm1xOGk/rm0Y/uOlW8MVeP5kDO3uQtUrmpbdp2j46+BdZflvi2eFnN
	 Mjj9+rbUAecKWVqHqBtFl5Ry1bcz6Piz8CQkFU1nOfm3sbclbbA7mwsuvjpQYlGgNt
	 No2h/1AsGD9b1bSvM7H/kcY3lL0HMBel4aqdSgYQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgHFSfq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgHFSex (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:53 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C93C0617AA
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f1so44399925wro.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=DtMV9yOgugrV8GsvXOMuutTXAsueynbX+Z9y4uN2Es4=;
        b=UZQFpiU/vPcBwKXvOOmwMkGaEY1lI+M+87Zc6sUDVKvQIjKgl2ulvzno1feCop7S2k
         vVHnFZfTSmoisrImIrnYmQk8RSQSNWJBlZvgb2WKUtDwdrc3WRLBaW5CNAvVUKbj4Ff8
         JhQJI4lJ8E1xQqA5o/33F1bii8nPRjAhRYa2585wLNniffZHhxYsdtdSoT2JO4XQDbKl
         7OnbkMIjLwnNezdQrlOiKKc5k4lowBgyW4ntgELI9SUXrTc1NBv4iqEhA/plqG5PsSJ1
         ejRQI6dE4HrUdz/H1MXCksVlL9NHxbiPB2dK8LxFv8bvzruHCTFsOUUnLw9RKgYyiNdu
         IWlQ==
X-Gm-Message-State: AOAM531g57AYf7O1Oi/TOis09d86CEyGjCucesQ5bZ762kogauopjyZQ
        0q1BMsCpEt2l9tleI0WpD/HRVQa9BYw=
X-Google-Smtp-Source: ABdhPJzb6BsYiyn26Z6mPG9LWmTI6SbQ7zEzTGyqGJoKGPhgTLUBlFmYodEgBX34lmHWYdehRU718A==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr8639560wrn.109.1596738882461;
        Thu, 06 Aug 2020 11:34:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id m8sm7608730wro.75.2020.08.06.11.34.42
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:42 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1540885lta;
        Thu, 6 Aug 2020 11:22:19 -0700 (PDT)
X-Received: by 2002:a63:1211:: with SMTP id h17mr7109822pgl.265.1596738139243;
        Thu, 06 Aug 2020 11:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738139; cv=none;
        d=google.com; s=arc-20160816;
        b=DEKJE+/q2QqmioTll1Zrogt7qt2bKaY7pAx6RDsLdBxnvZF7VEexvicMDij+m9G4Ds
         elYcXoTsx4fzRRvrtt1jz3Ox36pRpCjPm6aXKM5AmMdv8uBSfsDuiw+FdkPoL6VtY2+U
         tCSiV6Jvmdz2TvHpFHUSEP4hOQyCZhd0MlJu+8Agi+wrru0YfjcdUQTXnaUn8XY5cBM2
         60e6JpolseHHFdEy0tWTYE/qWbrbBAxyz3ytyXQPyAOtX/DaS12ZlTyGblvjndlJmfss
         9ZXZSYAY9PRUZ8xY++IpU8AQokEVQ8QSBYpi9sGvfcH/bU2g855cHNAJOlTLVtEWlz13
         GgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=DtMV9yOgugrV8GsvXOMuutTXAsueynbX+Z9y4uN2Es4=;
        b=hwyzSRnSZ1C0pBD81SqMhROa/NIrZTsffMwVaI0ZElDRo6AjIAU9c5lJJRpr90+9wC
         X+aqfEn4bV8QKoHavCWSZeb+gwgn8ZMA1ZCQ6YcRSK8xY69HY+4gp900kPn8FQ9gZC7l
         64kt3n4M3GhDgfwYiQ5yiqM/0d7zJxl2GctWGY+//8kBtwuuMWuNXhItfk/OINcXKw5m
         A7blyqcY2I/MMVzpDu1KulTlpB4Xtq1sCwp93HLlioYkYiEGKsyW6tbksigoaVSzuXAu
         tRx7LGxkbuQC4aGNMOBa9RkbCL4E6YkWgsPFb+a+4PKRzxehrB6Yr/62/Or/NlL2UsUL
         Xeog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=pncnbxRS;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id 190si1238520pgc.519.2020.08.06.11.22.19
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 44F2422D07; Thu,  6 Aug 2020 18:22:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79F8722D2C;
        Thu,  6 Aug 2020 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738139;
        bh=owgygttJoaXudGgUle7hLKq1gI0hpguByw/gxau5EAc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pncnbxRS1YGYxt5bbAaV7uBIk0K2zEZ5T7EBjSFe25aAcC8Vb0JYpISWHBN3IpNCW
         oYnKChADpbr5IMtWx4MKAJMVjfGvF4PB67Cooqq9YZiEzQFIEWib+zEJLW8HXza4ki
         KQqoD3mm9rjQrMJZReiQ4t5XcnGJXqwFyHaw3XLE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/41] ARM: samsung: don't build plat/pm-common for Exynos
Date:   Thu,  6 Aug 2020 20:20:27 +0200
Message-Id: <20200806182059.2431-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: Odg24HtfRJDu
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This file has not had any callers since linux-4.7, so
stop building it.

Fixes: 5901f4c279f7 ("ARM: EXYNOS: Remove SROM related register settings from mach-exynos")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/plat-samsung/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index ce339a96fbf7..d8a80fbcebb3 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -25,7 +25,6 @@ obj-$(CONFIG_GPIO_SAMSUNG)     += gpio-samsung.o
 # PM support
 
 obj-$(CONFIG_PM_SLEEP)		+= pm-common.o
-obj-$(CONFIG_EXYNOS_CPU_SUSPEND) += pm-common.o
 obj-$(CONFIG_SAMSUNG_PM)	+= pm.o
 obj-$(CONFIG_SAMSUNG_PM_GPIO)	+= pm-gpio.o
 obj-$(CONFIG_SAMSUNG_PM_CHECK)	+= pm-check.o
-- 
2.17.1

