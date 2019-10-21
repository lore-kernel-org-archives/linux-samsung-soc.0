Return-Path: <SRS0=nJnZ=YO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0C4CA9EB0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Oct 2019 18:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56F7D20B7C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Oct 2019 18:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571681110;
	bh=0BcjTANX8mGe4ppy5NwJxDZeERSs3amWjEalxQiIIKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GUbyrQh5jN/OQXRd7H5tOyllMcIzCBmxPU++uePtyN7g6gRAd962x/8AzHfgo8P7z
	 uF2PolIZsE8NEXqnosr/XTmUPS4gCSKHWNs/4aCXvNY4xe/4WPFBXrg3PH1AD0asxH
	 ygAa77SvEg1r51vBx5ll6p2Q6jxWHqihSogYMA7A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbfJUSFK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Oct 2019 14:05:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:37720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727017AbfJUSFJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 14:05:09 -0400
Received: from localhost.localdomain (unknown [194.230.155.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30C9B21872;
        Mon, 21 Oct 2019 18:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571681109;
        bh=0BcjTANX8mGe4ppy5NwJxDZeERSs3amWjEalxQiIIKY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L86KXLyA5vMuJrW/zQbzHM54nQvxeDpPXd1ob6lodPjydA0/rr/Csv13vxK4YTfC3
         16gkuZwc61lGAN9v2TAr/W6lEhjf8ZxVmnS6p5Z3Du4XQK4zFZ/PwzGTOm5dGiVTYS
         oAKDFSv+wYXwamypUaodEcp76RE3WiJHyxtDi4fM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/5] ARM: defconfig: Samsung for v5.5
Date:   Mon, 21 Oct 2019 20:04:49 +0200
Message-Id: <20191021180453.29455-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021180453.29455-1-krzk@kernel.org>
References: <20191021180453.29455-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.5

for you to fetch changes up to 54e48a69c117648b18684fe0198f40be1bf21acc:

  ARM: multi_v7_defconfig: Enable Exynos bus and memory frequency scaling (devfreq) (2019-10-09 18:34:53 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v5.5

1. Enable Dynamic Memory Controller driver for Exynos5422,
2. Enable Arndale (Exynos5250) audio driver,
3. Sync multi_v7 defconfig with exynos by enabling useful and necessary
   drivers (NFC, watchdog, S2MPA01 regulator, IOMMU, Maxim extcon
   drivers, PHY for SATA and devfreq).

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: multi_v7_defconfig: Enable options for boards with Exynos SoC
      ARM: multi_v7_defconfig: Enable Exynos bus and memory frequency scaling (devfreq)

Lukasz Luba (1):
      ARM: exynos_defconfig: Enable DMC driver

Sylwester Nawrocki (1):
      ARM: exynos_defconfig: Enable Arndale audio driver

 arch/arm/configs/exynos_defconfig   |  2 ++
 arch/arm/configs/multi_v7_defconfig | 20 +++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)
