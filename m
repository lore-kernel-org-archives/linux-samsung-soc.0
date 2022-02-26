Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9AFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 26 Feb 2022 22:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiBZWCA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 26 Feb 2022 17:02:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiBZWCA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 26 Feb 2022 17:02:00 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC14F1BE102
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Feb 2022 14:01:24 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 95B413FCAF
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Feb 2022 22:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645912883;
        bh=wEJI0tsPJ58dwyE9Xp27AwQHbd9ZGSbsPqkX6S6UniU=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=gMQKDLtIpkrsrkBTeJuWzdwteXI488j2vZsFYzU5XX6oDRVX3DDQ/ZdxZUrfPiUlA
         5SlI3m1Qe6+0zZdW0K0E+9SGPB7uEnXlPB73KatmRDKwOwln98BoQ8+9UGue11MMLc
         SVfFxMTGVWsaW1ByymfwdFVQidBr+6QyndCln8EjXLoqxO+RhTtPQ8yn8zJawOfF6l
         wt2At1hsVdTQmcLGgqcHgt5ITKMgFPl9Xn/Elw6DgKUnjLUq1qz6ESfZ8im5wFffLB
         QOtm1LMz14RRFu+jQyFumrpS7IVfcD1ZMLsDQuEhMEbLzFXogLaT0c99IbV41UsTXy
         I01E9ktWjgy/Q==
Received: by mail-ed1-f69.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso3427064edh.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Feb 2022 14:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEJI0tsPJ58dwyE9Xp27AwQHbd9ZGSbsPqkX6S6UniU=;
        b=gzY6W/0+hsntUfLrRR8EbFKxn9sXdd6jwQr59ntYxng9BjPy5DDnH5k1SRkpVnhXXd
         zzCNN5hoo/fwjby5se4XeWDf0Z0tjxdhC4avjTvemerfn7gOx7aqKm0a5e3GzudXBMpy
         CPrcSZilAX/08OZ4kaZFklXZF3KHAu9Jlzinr8MIKP7u8wBi+Ffzzxvz6/iLdwuYUXps
         0gricLssfNQ4NDBqfYPjxur2nDq3coKTUZ7gKct4eChS9tDplonp9K/5uwZjRh3m+sIa
         9TcFGT2AgZUMiF+hVK5NHWP0nQCje4mbNjAO/2WrWKjXTbJwAgwp2+B7rKpq4plHRAgr
         BdLQ==
X-Gm-Message-State: AOAM530Eo5abyKL0evLC6bRmiKCncg0jxs47WhRSEQHmYN+sfJdoMZv0
        VnPWsUtrUvFCaH2usvvqVEPR18XfjkmHa7PV6kqcKK9SjcjCUCjCD8YSMumfugWhjdz8aLnuvCw
        099EEHFry8VN9/tBSMtg08OEzvCLjOJIscPQnLRoEZFLg/xKo
X-Received: by 2002:a50:fb89:0:b0:413:94d8:7c56 with SMTP id e9-20020a50fb89000000b0041394d87c56mr3352376edq.143.1645912882490;
        Sat, 26 Feb 2022 14:01:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEBhuaA6wu2knYliwBM0vfBK3OqsI4wC3+TjCY0HhYvYRPRyZBWMQcEQwW1VhP271dIbvvaw==
X-Received: by 2002:a50:fb89:0:b0:413:94d8:7c56 with SMTP id e9-20020a50fb89000000b0041394d87c56mr3352361edq.143.1645912882295;
        Sat, 26 Feb 2022 14:01:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id s2-20020a056402014200b0041285556b7csm3497424edu.72.2022.02.26.14.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 14:01:21 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] ARM: dts: samsung: Second round for v5.18
Date:   Sat, 26 Feb 2022 23:01:14 +0100
Message-Id: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit f5b721d2c91144b7c494a05003fc840f1607e876:

  ARM: dts: exynos: use generic node name for LPDDR3 timings in Odroid (2022-02-05 13:04:43 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.18-2

for you to fetch changes up to 7cdfe3b3b60c89f0e12e8ee194a7cfbfd46515dd:

  ARM: dts: exynos: align PPMU event node names with dtschema (2022-02-18 14:17:40 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.18, part two

Various cleanups after introducing DT schema: adding missing HDMI
supplies and aligning PPMU event node names with DT schema.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: exynos: add missing HDMI supplies on SMDK5250
      ARM: dts: exynos: add missing HDMI supplies on SMDK5420
      ARM: dts: exynos: align PPMU event node names with dtschema

 arch/arm/boot/dts/exynos5250-smdk5250.dts |  3 +++
 arch/arm/boot/dts/exynos5420-smdk5420.dts |  3 +++
 arch/arm/boot/dts/exynos5420.dtsi         | 16 ++++++++--------
 3 files changed, 14 insertions(+), 8 deletions(-)
