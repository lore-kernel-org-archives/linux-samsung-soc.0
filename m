Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BD5C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Sep 2021 07:15:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A69C161107
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Sep 2021 07:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234717AbhITHRV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Sep 2021 03:17:21 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49322
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234695AbhITHRV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 03:17:21 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E60123FE02
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 07:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632122151;
        bh=Wx09CSLf2BUcoT4i99Nl9tot/C6qmojAMi1r7QcpgsQ=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=F88/hhCqft4SjmFIrnn8SUkG3Rp4QL9B7zzk/rBk4YB1D+eJlpnGO2UQCy4V0iDEu
         MTWIV2UzYQ8K68r+oyWauJ+LYR0pEqepu1y7pLCKEz7fxTAovmF2zGOrXXTzRgebwj
         W9tErtYhb/tnyJOjge1sFE6NHQX/2t5EgnIhhMhwA9c8l2Z0XemyQTGiAgOL2snWRc
         75RrCETwdgEq+ApOaYSmwZ6xTBs1pHmZBMZMPbhAWu/L+runVSp8vgJsf6vyGTowD7
         m4PuEw3qyDEVCErD6g74M2ddX61nKWNY1STHNpGBfL2SzPOg0uVDXW1uWEpfUSkWV6
         u739zyFpjt4gA==
Received: by mail-wm1-f69.google.com with SMTP id v5-20020a1cac05000000b0030b85d2d479so47409wme.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 00:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wx09CSLf2BUcoT4i99Nl9tot/C6qmojAMi1r7QcpgsQ=;
        b=ValIYvYaDTPsmG4h8GVk3/M6qtFOJY1z9/SReFWh7quROxycRV+Ew75Acr17LKdJow
         lOYCd/xbQ62yhr3l1jAEx3sVaUfzIScgcXw2u7iPRA16+aMIu1RkO7ycI8Wm8xq1EOLC
         J4qSMZJ+HjsUgov/m4vVeLqZlujqwH70Y1Y5pnOd2TdK7Q0DmcHJdUjt1ZBlgW8ILWDG
         uOBNvShTp8kMbfe0masE9QwN7bhQkTztkIc81Tbwqlz7G1FMxQ5r+9NbPOI0qAOAX/PV
         4eppCBmTf2CSodA3pEtGC+JEoh0Q4ASmogIclbd+fUrNKWj5qD6jCr1tpm3+KH6M9avJ
         E7Dw==
X-Gm-Message-State: AOAM530+gGTe/Osbt1fE0PfW/GaXS2JWNNMx8K90ecXcgKod7aXIBrkU
        AxRkPxB8ttSOH9dARvh1EE4tVY+2Tde5nlbRFqbPhP/xsfV8cTOL9ACSHCWB1uVI4mCbfcrq51D
        yxXeoVPjZopaJbI4l/obS7OaNSJBw9xIYBiqwLK3+WUh7XW8r
X-Received: by 2002:a1c:7e55:: with SMTP id z82mr262577wmc.95.1632122149443;
        Mon, 20 Sep 2021 00:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+/JWO4KawW9KMTN5QacKUh4LzdTsDtHGOI8eupCw/ohf4m9JVuD9eePbgGFUp8uXDjI5x6g==
X-Received: by 2002:a1c:7e55:: with SMTP id z82mr262553wmc.95.1632122149216;
        Mon, 20 Sep 2021 00:15:49 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id x5sm17456153wmk.32.2021.09.20.00.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 00:15:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 0/3] devfreq: exynos-ppmu: conform to dt naming convention
Date:   Mon, 20 Sep 2021 09:15:37 +0200
Message-Id: <20210920071540.38337-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

My previous patch 3/3 (ARM: dts: exynos: align PPMU event node names
with dtschema) caused issues reported by Marek [1].

Tested on Exynos5422. Testing on Exynso5433 board would be very useful.

Changes since v1:
1. New patches 1/3 and 2/3.
2. Patch 3/3: rename event-name to match node name.

[1] https://lore.kernel.org/linux-samsung-soc/0212a402-1490-0f8f-005e-32bb6f636a13@canonical.com/T/#m570c0257204af553fe11f9122551311beb56c15e

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  devfreq: exynos-ppmu: use node names with hyphens
  devfreq: exynos-ppmu: simplify parsing event-type from DT
  ARM: dts: exynos: align PPMU event node names with dtschema

 arch/arm/boot/dts/exynos5420.dtsi   | 16 ++++++++--------
 drivers/devfreq/event/exynos-ppmu.c | 12 +++++++-----
 2 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.30.2

