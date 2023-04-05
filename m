Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6DBC77B62
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Apr 2023 08:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237290AbjDEIFD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Apr 2023 04:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237332AbjDEIEs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2023 04:04:48 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAFF46AC
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Apr 2023 01:04:43 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-4fa3c1a7a41so202881a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Apr 2023 01:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680681882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knNBWU1tEPnpVgHr0NHSaq41CVWca8alYZPbI02km30=;
        b=UVfLyJ4U1LTTsw9/l2Ezvobf38cBIinJ6k1Wn4FHs5A3VFvzepgpOTTipJ0mhKt9hy
         04xhVwg5jn/MCno6zaKR2LEZR2MPT7jh77ipxI9CTKy8vyzax6saAN0iASPnRcHvz0/5
         VO+QDjmssHzCOHccG3SHDVEgcNrTHc3CPRJ6PyV7XAd31otafioMGfdCn/nhZp26xGWS
         4tCpHmaFlK2XwywMhmtoMQvP8cUPNoA54gCjNZel/0bCPAoMB8rpB2hStnNFZCScSHvj
         7/sQLhYpujqe4RydsR2eIB7JxXDh0H7gnhFMXBsXwpAfSWMOBmkJGh7Naivou/PW+6hS
         nDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680681882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knNBWU1tEPnpVgHr0NHSaq41CVWca8alYZPbI02km30=;
        b=3cvgVu4O8wbJWg2oES+QD3yqQ4NyZyBQP3wEnOwKfBUzSkdZolHITCVd24o4j/dxfV
         UsofcbfIFtsemeKlms2STJ+bkiCivGzmj+QEDExmNTnUqBI3NO3+fOmPjce3nYvnJ1Cv
         CSF8v+ElJMnq1qF+vtrwbrIPbpW+p9Ezz7oeonrS37dqPTZwWuvpgUdMMXrp/JkVSIiU
         A99y6VTwvRVJhDtsp5At14/vbIsEHOjZeId5xhYwLpJ9aC+ioQ1aqcApEKEob2JSdNlJ
         +NO5ylwESVvMUAeqsjLaFWxe/ydrF5daSVcb/+gZ1hq+kln5+z9DpGfnzBSfSMboLpAs
         c6UA==
X-Gm-Message-State: AAQBX9eZKNPyPbm5BxXBFv5cuRpaRM+WkBq1315su+Y1vn0qCduWIraZ
        CXTx6q2vyvyX26wyOgGJVsx/eg==
X-Google-Smtp-Source: AKy350bgJJjBqVOKkAvuIHFoVn9ZmTBnPLaEXXwVS1XU/9ZvvW5IptbzaN4hC9/iTQUPBMsKyVCmDQ==
X-Received: by 2002:a05:6402:202a:b0:4c6:10a7:c422 with SMTP id ay10-20020a056402202a00b004c610a7c422mr1122764edb.18.1680681882390;
        Wed, 05 Apr 2023 01:04:42 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id z21-20020a056402275500b00501d73cfc86sm6845839edd.9.2023.04.05.01.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:04:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: soc for v6.4
Date:   Wed,  5 Apr 2023 10:04:38 +0200
Message-Id: <20230405080438.156805-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
References: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.4

for you to fetch changes up to cb56f508e541036ad41cb9a5afb46339b2f83b9f:

  ARM: EXYNOS: Use of_address_to_resource() (2023-03-22 18:47:01 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v6.4

Cleanup of OF-related functions: use of_property_read_bool() for reading
bool and of_address_to_resource() for mapping MMIO.

----------------------------------------------------------------
Rob Herring (2):
      ARM: exynos: Use of_property_read_bool() for boolean properties
      ARM: EXYNOS: Use of_address_to_resource()

 arch/arm/mach-exynos/exynos.c  | 8 +++++---
 arch/arm/mach-exynos/suspend.c | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
