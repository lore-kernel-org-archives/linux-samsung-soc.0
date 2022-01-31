Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFD7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jan 2022 13:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359493AbiAaNIx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jan 2022 08:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351538AbiAaNIx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 08:08:53 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C8DC061714
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 05:08:52 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id i34so6406504lfv.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 05:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eUKtZxAd+dzlqs3bgiMRNaEBrRq0j+2Bu8S8xVEySAM=;
        b=UmkpCc1kWb11H0clHkuRkVm3Qm21uJitdNCJc8x7ypdmcmthmBWycYWcHk4FW4j+fU
         a0EKu8Ft3XvnFUcPCev5XzVkY3QLLdWgyeRs2mH4GtDJY5ehK5mgOhNFOlHg317iDeX9
         N3epY0KI4Jg8aByIlEjc0Hr9Pv0qkUCrtegvPlnGc3vj2QlbUPTxBFgjXgRFYlY68pSR
         K5YXZKNEuYWImTL+Aita1LipGosdHrEwQ7gocqIbeuIjbu1+aam3MtXXL7i3ifLz4IRA
         Mxgz2zC88kOf2XyJ+ChcmQLZGsL/HYQC2kLGF8U//synx85IbB5RsZgaIidffhZfj4hg
         D+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eUKtZxAd+dzlqs3bgiMRNaEBrRq0j+2Bu8S8xVEySAM=;
        b=wXUVYj0KUpwBQnZNE+NGfqSz11lfiQirQj4HNhrUVTcl27rNXiHzeJ1vSX2thxo/g8
         5QGvH33UEcYq5ziQl66dsotTsb+UArJtgKcex6VvFPkYVlHvAQFtCmwFarF++bm9ifq6
         r22KbSPidIhdPHU5+oP9GfYIQ7jWk5etT99jfjNqT/jnc5TvFbg7T+dD7ZnpRqaedSjN
         xaHRKSY/5x8JFWUUU5+7ht4iL0aW8e6bI0DczAH7JGBnq/uIv37NJLHh5CDbMK7YIa78
         wWjnLNtYjs8Z4i49XwFtnNFCG0Aocw+Ep4JPDHuf5KFpP+tyTHco5Ff9ydHT1ijb4Mzn
         6PTw==
X-Gm-Message-State: AOAM530iaEbpt+q8gW7IJWfflXFE3kgCDVQamBb/UvzYJAcq9FpExtG5
        3WWWdBAcXW5V5WU9wm/sNGic6Q==
X-Google-Smtp-Source: ABdhPJyixe4IgW2WPwC9jUSFDLHbkaDNUlbid6bxI1hYzuSnhQUIzuAJ7UtSLWdim2i4LPhbMQi1KA==
X-Received: by 2002:ac2:5542:: with SMTP id l2mr15600977lfk.252.1643634531315;
        Mon, 31 Jan 2022 05:08:51 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id 8sm2335798lfq.200.2022.01.31.05.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 05:08:50 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] arm64: dts: exynos: Add E850-96 board support
Date:   Mon, 31 Jan 2022 15:08:47 +0200
Message-Id: <20220131130849.2667-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

WinLink's E850-96 is a dev board based on Exynos850 SoC [1]. The board's
design follows 96boards specifications, hence it's compatible with
96boards mezzanines [2].

This patch series adds the initial support for E850-96 board and
Exynos850 SoC. Only basic platform components are enabled at the moment
(like serial, I2C, eMMC, RTC, WDT, clock driver, etc). Right now with
this patch series it's possible to run the kernel with BusyBox rootfs as
a RAM disk. More features are coming soon.

[1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
[2] https://www.96boards.org/products/mezzanine/

Notes to Krzysztof:
  - This series is based on v5.17-rc2 tag; please let me know if you
    want me to rebase this series on top of some specific tree/branch
  - Please apply your patch for fixing gpio bank node names (including
    new 'gpm6' and 'gpm7' nodes added in this series) on top of this
    series

Changes in v6:
  - Got rid of clock magic numbers (added in v5), as corresponding clock
    patches are merged into mainline now
  - Integrated "arm64: dts: exynos: Add missing gpm6 and gpm7 nodes to
    Exynos850" patch into [1/2], so that separate patch can be dropped
    now

Changes in v5:
  - Excluded applied patches from the series
  - Defined clock binding constants in SoC DTSI file to workaround the
    missing patches in Krzysztof's tree

Changes in v4:
  - Removed slew_rate pin nodes
  - Moved rtcclk clock to board dts file

Changes in v3:
  - Ordered the pinctrl_alive phandle alphabetically (patch 7/7)
  - No other changes in v3

Changes in v2:
  - Rebased on krzk/linux.git (for-next), to account for Exynos7885
    changes
  - Added missing and new tags (R-b and Ack)
  - Addressed all comments for v1

Sam Protsenko (2):
  arm64: dts: exynos: Add initial Exynos850 SoC support
  arm64: dts: exynos: Add initial E850-96 board support

 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos850-e850-96.dts     | 195 +++++
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 663 ++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 741 ++++++++++++++++++
 4 files changed, 1600 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi

-- 
2.30.2

