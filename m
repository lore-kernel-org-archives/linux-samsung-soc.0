Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48427C25B0C
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Aug 2022 20:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbiHHURb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Aug 2022 16:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238363AbiHHUR3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Aug 2022 16:17:29 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9AA1A3B4
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Aug 2022 13:17:27 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id n4so10331807wrp.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Aug 2022 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=vGj2Bb5L9+7NMTTYbD14Ip89h8qRunV+1yfxzA8G/sQ=;
        b=esymICCs8SCBzsCp5qKs+HX4CVh3Br9azs/Wh+m0cBJHFtCPan/gFKvtYA1n942dsZ
         zmaHIPBJ08pXkB1Gp6uToR7fOAq0lbJ49wjV8cxL+CTvqXmDNd8ATVq1AIdVRaegx9pm
         65An1dlP/sAG5oV1NTZ/0+p9FuaDILYEuRf4VRAVC1OvmNX3AfVOTTA1LbigV7fuzTt9
         OKb0cNsIXMTY6ExjtHKf2KmUCYAIVxKL9Rk+iyKxkBHQvgw44WurvtwKfzZhgJ0mFLmO
         cWiN+836mtdKxTE/asNlcUXPyYf2diIL3s3UqefwBrtWmZl7icWkwtwXrtfTEjKKh/wZ
         JxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=vGj2Bb5L9+7NMTTYbD14Ip89h8qRunV+1yfxzA8G/sQ=;
        b=2JP7j4D6CQYXOhf8jjSTpvRoMVOHgsMcBE8m95PEpYwM6NNpWkkl6UMY5VL81wssAq
         0aStVM42QJj33xJXdJzjmi6z3gXM7IIHFRHPoV82u9FKpe55bEun32uErVyEJhhbt1OB
         6SLz/tI1/kZ9qUD6loiLxsW5N5i/byPcfI6zBP2Gy+sKpmtHhrN2004lUEtUVkcm/HIg
         4kWnDc2UoWQ6Sy1q8Qvilqw1MsnfSk951Cm2Vn4DmJvTWwrmK1DBcXu+u/ybpDACLS6y
         ccXMBhSf7NCEHxc1bH2WwFl5/mQylTxzqUXukbayGs1LQzGIHLoWAwCc3aQ6WE9sVGlY
         DodA==
X-Gm-Message-State: ACgBeo1bLiHFnlOKxbY5w/kmPbvDChb295DTUAk9bunyOsxBDyiK85ti
        LKpF4rFBG1V6KfDZgnwXc7tEXA==
X-Google-Smtp-Source: AA6agR4mP4bc40EK/gFwKYGWHP5+iz33mqkaGVmznELuOo+WmfkPApX/bXu6XMnp0NqdtlQ+I+aTtg==
X-Received: by 2002:a5d:6da8:0:b0:221:7db8:de0a with SMTP id u8-20020a5d6da8000000b002217db8de0amr8088080wrs.405.1659989845995;
        Mon, 08 Aug 2022 13:17:25 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id p29-20020a1c545d000000b003a54f5fcc5dsm2059702wmi.10.2022.08.08.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 13:17:25 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: exynos850: Add cmu and sysmmu nodes
Date:   Mon,  8 Aug 2022 23:17:22 +0300
Message-Id: <20220808201724.27831-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Now that all clock domains needed for SysMMUs are implemented [1]
(pending), and the basic SysMMU v7 support is ready as well [2], let's
add all related CMU and SysMMU nodes to Exynos850 SoC device tree.

All those SysMMU instances were tested with "emulated translation"
driver [4] on E850-96 board: both the emulated translation and fault
handling were verified.

This patch series depends on [1], so it must be taken into the account
when merging it.

[1] https://lkml.org/lkml/2022/8/8/752
[2] https://lkml.org/lkml/2022/7/14/1215
[3] https://lkml.org/lkml/2022/7/26/950
[4] https://github.com/joe-skb7/linux/tree/e850-96-mainline-iommu

Sam Protsenko (2):
  arm64: dts: exynos: Add CMU_AUD, CMU_IS and CMU_MFCMSCL for Exynos850
  arm64: dts: exynos: Add SysMMU nodes for Exynos850

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 83 +++++++++++++++++++++++
 1 file changed, 83 insertions(+)

-- 
2.30.2

