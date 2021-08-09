Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99103C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 14:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 721A360F93
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 14:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbhHIOAq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 10:00:46 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53134
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234526AbhHIOAp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 10:00:45 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 629B540672
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628517624;
        bh=PXrJ+BbgGTXejs85MxNsHQpcGJv4nzL8+I3ykkzFz/Y=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=UItA6TtFhztj5GcV5g8jP6Do8rXQoP2xe090xFv9d+pRvdhlN2fH4eOaOKK9gyo5W
         9mtp1wbjLKnCdZ5uKP7PtODpDDCPC9jvwfWzLc8cXvoywfKnF/esAiq6QuTSxe3e1C
         ouv83DiPthm3Rq5Calrk0OkFsPW3ca7b04MrYpW7cKLCdCzMYJmlI3ay7JtLyg3HrP
         uXGsraL8FMV7ojHf7YakFLvfxGsKT1GLIhfBJlplpMUXRbb3dly0GsYamVfm3t3VwM
         oBkZgYz1NzJOf1Z22folkEQMq5Q7+ITaw6XiYEWdeWuxLb/trelGmIPckejjIkJwkO
         lwZh/DPKJYsYw==
Received: by mail-ed1-f72.google.com with SMTP id e3-20020a50ec830000b02903be5be2fc73so2907264edr.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 07:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXrJ+BbgGTXejs85MxNsHQpcGJv4nzL8+I3ykkzFz/Y=;
        b=Rw09fjdMN4h3kem+rNmRctD6F+Gb2HpjD5hbzjOuoSvOCj/K8IUIi7WFcKs7YpXTSW
         Qw42C8aJHYiD8NYmlBUkUalEf1LjRe4Uk+LqsRcSVQZIQjb1nKK6S2u5uyK87Y+OvUn2
         6R35Me58etl2fnsWxEXn6xbiWGlJ2NaOf1yrv7zVmMrATlUS9RsyTCAh8H4eZuTlQNWo
         BqIu8+Qo8elK6AetArcgBj2RsuT2JgB5vbSS0E4SRPb9lORZnD0EF06tVTd+ltkG3tkb
         w4KdaduKIF36rrhf5JWLz1dWW/6jlQtySeS1WEBSnUo2QpBrH+KlTP4oHpx8NJ7Jzyi4
         ibVw==
X-Gm-Message-State: AOAM530/epaFAEnyRNndYjsEakwX8U1AFX+YeTNCrURH7ez2QMXLHPbO
        q0borECGKPwUOv9ScE1Dvy7ry9q5N1y5Crc9zaMnb30xcy/wVMZH+3FspptBlZAJsv4wnHcJg5c
        twFp2iwxI2QKJifGoSjZU+grZK/xLHqT5vFt+WFVx4C/dOU0B
X-Received: by 2002:aa7:c6d0:: with SMTP id b16mr30047979eds.257.1628517624121;
        Mon, 09 Aug 2021 07:00:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy733K83FCEVxUSDiFu+sAff4YqEjYwxphl7rHUYA+ge65yYWoTdLNweov2T/r4nxposORUTw==
X-Received: by 2002:aa7:c6d0:: with SMTP id b16mr30047953eds.257.1628517623881;
        Mon, 09 Aug 2021 07:00:23 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id b17sm7909686edd.27.2021.08.09.07.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 07:00:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: clock: samsung: convert AudSS to dtschema
Date:   Mon,  9 Aug 2021 15:59:39 +0200
Message-Id: <20210809135942.100744-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Rebased on on previous series:
https://lore.kernel.org/linux-samsung-soc/20210809120544.56596-1-krzysztof.kozlowski@canonical.com/T/#t
It affects only the maintainers file change (context-dependency).

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
  dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
  MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry

 .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
 .../bindings/clock/clk-s5pv210-audss.txt      |  53 ---------
 .../clock/samsung,exynos-audss-clock.yaml     |  79 ++++++++++++++
 .../clock/samsung,s5pv210-audss-clock.yaml    |  75 +++++++++++++
 MAINTAINERS                                   |   3 +
 5 files changed, 157 insertions(+), 156 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml

-- 
2.30.2

