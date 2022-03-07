Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BD3C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 17:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236882AbiCGRhQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 12:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235535AbiCGRhP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 12:37:15 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555998F9A5
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 09:36:21 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2EB9D3F60F
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646674580;
        bh=3HG+K+k5QA/B8ff7N43iW1x5z1qS4k2KKhb2cegl518=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=USS7rGBqtxhnbEpubZ14Eqkl7N408ezlmiVgC0lBaWqVu3Nb5PpNOdtbJ06G1Rbkp
         WiwmB1s7kojYOcFfDxkPO8eAPVmw3B12A4WXFIPQjYUHT8qb4/SSf+D2ICsHYsIdwA
         +rTY4Fw884N8DoqOLqao5gsw9fNUwrN1WDUlbk/SiP5PboT7P8LGhkD1EtwyOzmVcE
         rjwJtclBad5sPz5xxQKsMVD5sBJiGVBcyvoF3WX0wAq67ovWUNc6Npf9vfUHK90YW4
         yh8T/zDlHjPoY8YmXRGqNw2lJFZWLtdBoBRJ4ls8ziueyF7M5o7X0XFyJfwG8/9z4x
         47gT3oPBHHykg==
Received: by mail-ed1-f71.google.com with SMTP id bd4-20020a056402206400b004162b6d8618so3288274edb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 09:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3HG+K+k5QA/B8ff7N43iW1x5z1qS4k2KKhb2cegl518=;
        b=pAkxfoBycfcsCZEFiWxE9nS5XftqMCCE56UDo1XTtXpX/xUHjx1UwQ3Pc3mQY5D7RY
         vczN5qNqRk/YcoH9x7dRMjXZ495RYKJxiRitXae/wmT+B8mAMLmdLjRpj9QoAaCxuYPt
         izw2hH1waiIxXMlFU5KI81oM16lxRfICBBgteKNBiH5bauu3CHyJAmkX3JIO/K5o8g2p
         xmD3kRDV00rPkzDw2bBY1BfF0rFTHR9BSsdguIDrxN6mirIzH0Y7EWmw85FVxUw306ji
         2pJHiLRZ4d6y4M2PaxXQ2+X601SHh/lXJHkkXf+ZkP9FkX5byouo+MB2/PKg13wEARpe
         TOYA==
X-Gm-Message-State: AOAM5321dLm0yZkWBKSNNtqARrvXzHHgo02fj4FoHYo7NjfiLnlHalNa
        niiIFzYV92kWNt8DQuj7SCboTxSCQ68OBol6IQcDJbjMfl+XFf3kt8xwaNSR7qtVCrZFeQraTcr
        ObeV0nW82I7pCAuV8dG0ELxtXYJYA9yRCbs814/5/LSYC3LaJ
X-Received: by 2002:a17:906:585b:b0:6b7:73bc:5395 with SMTP id h27-20020a170906585b00b006b773bc5395mr10109316ejs.519.1646674579334;
        Mon, 07 Mar 2022 09:36:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKjiixge1fWdZzZQpMZjyr+5Ie33xOV4IY4yStu5Ftd/B2YpKtjTs3nermPtLrgHBcoNxM1w==
X-Received: by 2002:a17:906:585b:b0:6b7:73bc:5395 with SMTP id h27-20020a170906585b00b006b773bc5395mr10109307ejs.519.1646674579149;
        Mon, 07 Mar 2022 09:36:19 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i6-20020a17090685c600b006daecf0b350sm3284875ejy.75.2022.03.07.09.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 09:36:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanho Min <chanho.min@lge.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [GIT PULL] arm64: dts: various cleanup for v5.18
Date:   Mon,  7 Mar 2022 18:36:14 +0100
Message-Id: <20220307173614.157884-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

These patches were for very long time on the mailing list, but they were not
picked up. LG maintainer acked the LG part, ARM Juno remains unanswered.

These are considered cleanups, not fixes, although they fix real
dt_bindings_check warnings.

Could you pick them up for v5.18?

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/dt64-cleanup-5.18

for you to fetch changes up to ad3c72b0c6b912a0e917ae8010c62cc98012ab1e:

  arm64: dts: lg: align pl330 node name with dtschema (2022-03-02 20:25:14 +0100)

----------------------------------------------------------------
Minor cleanup of ARM64 DTS for v5.18

The DT schema expects DMA controller nodes to follow certain node naming
and having dma-cells property.  Adjust the DTS files to pass DT schema
checks.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: juno: align pl330 node name with dtschema
      arm64: dts: lg: add dma-cells to pl330 node
      arm64: dts: lg: align pl330 node name with dtschema

 arch/arm64/boot/dts/arm/juno-base.dtsi | 2 +-
 arch/arm64/boot/dts/lg/lg1312.dtsi     | 3 ++-
 arch/arm64/boot/dts/lg/lg1313.dtsi     | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)
