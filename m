Return-Path: <SRS0=RElU=Z3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB55C43603
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Dec 2019 14:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 816B2224F8
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Dec 2019 14:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XC1fPf0W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbfLEOiD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Dec 2019 09:38:03 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32865 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbfLEOiD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 09:38:03 -0500
Received: by mail-lj1-f195.google.com with SMTP id 21so3898010ljr.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2019 06:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ySkkqpmB/BOI7Ew6QjgGxPInG6fWKDRrslVzVcjzv2c=;
        b=XC1fPf0WppSyHnQAs0FgBjmmzu2VwnQGY3yrZuC43dI2RW/Kx28FDMxjBy33dFTfa6
         /bFH8jm8Bynv744jXTDQGCXj4HjJfbcy9GXvtzGwRDAi3Ji/OGCkMqtjA8CEpdL+aPzL
         WJVYYaHnytbA8G7IYsyCLh6yFuqwWThgRIq2pidgRPzCFyO/+Mit2fMERYsV/wQbNCKD
         7TF2HF7To5RcdNPFgrUHXvFk0+TMlqdHEMCz1v/K/35MSR4+JxKy1tqdaLpSHMknCg1B
         JwtK0DrFT2dO8A3qxsMZzEay/eVgiKdC02k0IpEWoU/bTQ6kDlSZ3szayL7DP7w4vv1T
         I+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ySkkqpmB/BOI7Ew6QjgGxPInG6fWKDRrslVzVcjzv2c=;
        b=Jub8JpoFm/2Erc0kQphOOTKUz7aBSmj88YliJwddudMuKiqCvArerAESqjSESQTdNP
         F46xhMcI1TCLOLQdwHQUTZOAyfH1exYYSqxzRT5KBt+MXEfArqQ2l673pPmDyOjQzMRE
         PhuR8WOL1lZ6Em+Cs5LuV37HYhAg6op+NFogHa2pmsHxtfvyogeu05tBEOB61Nkw/IY1
         J69iJ6ENuKAPZvVljg16kAMrI1+/TZBeUj8wXLWypDSz2p7kA8xdJchgHT39qQHrKlvU
         uHIT0ICh7iMEO7Mo29lswOeDb9o40Iwt9m3DFAfsjsBqUL2WzksUM2XiVScPKul/8s0n
         SCcg==
X-Gm-Message-State: APjAAAWEnCcbRbd8o3F8hxGD+i+K5619xrDzSQ4b65byaoFEPX4L1DIu
        VftBG3i91Q8oNCgnflkumCmiHpw+21M=
X-Google-Smtp-Source: APXvYqw/h/AzAZZmHc8Wi5LZCEupiW1yZV+L37h/WwAkJOovQZvIEuVT13/j+Du7U19X/GkBibSBcQ==
X-Received: by 2002:a05:651c:239:: with SMTP id z25mr3401650ljn.48.1575556680825;
        Thu, 05 Dec 2019 06:38:00 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id q10sm5091294ljj.60.2019.12.05.06.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 06:38:00 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/2] dmaengine: pl330: A few system suspend/resume changes
Date:   Thu,  5 Dec 2019 15:37:44 +0100
Message-Id: <20191205143746.24873-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

I accidentally stumbled over a couple of things for the system suspend/resume
support in the pl330 driver, that I thought deserved to be improved. So here
there are, only compile tested, so far.

Kind regards
Ulf Hansson


Ulf Hansson (2):
  dmaengine: pl330: Drop boilerplate code for suspend/resume
  dmaengine: pl330: Convert to the *_late and *_early system sleep
    callbacks

 drivers/dma/pl330.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

-- 
2.17.1

