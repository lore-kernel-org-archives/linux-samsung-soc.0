Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A0CC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5F5960EC0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235325AbhHINLq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 09:11:46 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:48822
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234597AbhHINLq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 09:11:46 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 6EC323F347
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628514684;
        bh=RBrWNEsM4hpvDhERmxPrcwjfu4LtC8P3Itfo+sJHtYA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=VZgYkGzM/QW6cTY+ZwKPFvg8odw7iZ3rk/CmV870FHU3h9dkm4zRtu2Xyoo/RVPBC
         qB0ASYvwToA1wfX21esb7evAOYWU6PQlEDq3Ho3F8J2GVL2ysX2BDI5DVnNEAV2JVO
         mTcNllgRoaqwD1KRAXnUo9pN8giP2NkwRw1HzuiPfKI6U3M7SQlpT+iTubraQxEngt
         nHZ3HLxZw0iMNlrMyyEGpETtAjxDt1ubOPthQEkWZlpBY64ToXAM7H//+nen8DQs9g
         F6gaKhdKJJRysy+0HN6Z1JoA8xfg3JVDTfu9gh4fVNVmc0biKeJyPnuocAREIkAjwx
         Mt7PDgBH2oExQ==
Received: by mail-ed1-f72.google.com with SMTP id b16-20020a0564022790b02903be6352006cso1659030ede.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 06:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBrWNEsM4hpvDhERmxPrcwjfu4LtC8P3Itfo+sJHtYA=;
        b=OtcQdPapc9gvmi3Pkws4qHoIfs0fbpdTGjkYfsLsVIkAsYKyOrQgX4zEICss/n4ILJ
         eCy3iyUNnlkC3Sl5z7kyay4JRk+Z2961JUANzdlEWAUP90jla9eK8nW6tsiMzxbmscc1
         r3m3pD5HFYGKPM7meJFy/Vtvi/zUQuDDVzf9+C+OCnRlDkw2kSA5GN8iMlpIdBZxsX1O
         Hx9J+jKMKmTBay5qoBhoscpwrgZF9qX/4lzWhRI8au+LGHtKASLyU6zpfnzX6UhhwNxy
         livoCtJigHJDQCqXDAXpMz/K6lvWdAxBHgLFp3hyq6CdELJ/h0ho+ZJ/vuPtBSs3V7LR
         V+pA==
X-Gm-Message-State: AOAM5324rR/kxj5LU0ewolrFcj2PKKfOw9oa1k0nPCDUJ/v19unN/++v
        tGDw5laZNrJxLaq+nMihwRLXo8Lpcy61HsnBZ48l+Y4iMDtPfkyzycQ2ZWz7bWraVq6/sstnjBV
        RkMsGanFtPjcuEibik7LnlUtsumTYABuNml4eKexp0+q2Z1qC
X-Received: by 2002:a17:906:405:: with SMTP id d5mr22339554eja.189.1628514684104;
        Mon, 09 Aug 2021 06:11:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTLC+OlaK/O1lvE3JnmIxxQBbbFpcaB+prP+VoyxmDkoBcq7h0z45WNG/NNtiMCCWgCULeNA==
X-Received: by 2002:a17:906:405:: with SMTP id d5mr22339525eja.189.1628514683894;
        Mon, 09 Aug 2021 06:11:23 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id cf16sm8023425edb.92.2021.08.09.06.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 06:11:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: clock: samsung: more conversions
Date:   Mon,  9 Aug 2021 15:09:33 +0200
Message-Id: <20210809130935.80565-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Conversion of Exynos4 and Exynos3250 seems straightforward.

This depends on:
https://lore.kernel.org/linux-samsung-soc/20210809120544.56596-1-krzysztof.kozlowski@canonical.com/

Best regards,
Krzysztof


Krzysztof Kozlowski (2):
  dt-bindings: clock: samsung: convert Exynos3250 to dtschema
  dt-bindings: clock: samsung: convert Exynos4 to dtschema

 .../bindings/clock/exynos3250-clock.txt       | 57 ------------
 .../bindings/clock/exynos4-clock.txt          | 86 -------------------
 .../bindings/clock/samsung,exynos-clock.yaml  | 32 ++++++-
 3 files changed, 31 insertions(+), 144 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos3250-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt

-- 
2.30.2

