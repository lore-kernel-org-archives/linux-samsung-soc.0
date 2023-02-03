Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0003C64EC3
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 20:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbjBCUqx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 15:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbjBCUqx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 15:46:53 -0500
X-Greylist: delayed 381 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Feb 2023 12:46:50 PST
Received: from out-134.mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A80B9AFC2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Feb 2023 12:46:50 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1675456826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Tzv6ci7dDigN0clI5qRWyL2pWOLseLNBFjSQlZJJdx4=;
        b=UnbhqFaH6QkrHxwD8iO4AupWyytplWSZwV2rTYgLpfbBurJCzsdsxBDOVUVFy0tjuo4vxJ
        UTuozG3wdNVdtq87vzHYiPApkRysXKHIV8woTBMRdkxZhiV68nxfJUjI0ztOUdD/Rs5OTD
        lr5Qz3yuSLfjCD0uwWPcKGeshTfUi88=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        virag.david003@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 0/2] arm64: dts: add mmc aliases for Exynos devicse
Date:   Fri,  3 Feb 2023 21:39:58 +0100
Message-Id: <20230203204000.14410-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It is convenient to have fixed mmcblk numbering of the eMMC and sdcard
so that assigned numbers will not change from boot-to-boot or
depending on if storage devices are actually attached or not.

Also remove mshc aliases, as they should not be needed after [1].

This is the same patchset for exynos arm devices was sent recently
[2].

[1] https://lkml.kernel.org/lkml/20211124184603.3897245-1-john@metanate.com
[2] https://lore.kernel.org/all/20230128133151.29471-1-henrik@grimler.se

Henrik Grimler (2):
  arm64: dts: exynos: drop mshc aliases
  arm64: dts: exynos: add mmc aliases

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 4 ++--
 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts  | 1 +
 3 files changed, 5 insertions(+), 4 deletions(-)


base-commit: 28dd277e54ebb499bc59c166078596767bbbbdd7
-- 
2.39.1

