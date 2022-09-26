Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A452CC6FA90
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Sep 2022 12:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239302AbiIZMPg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Sep 2022 08:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239319AbiIZMO5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 08:14:57 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F6A615A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 03:59:35 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b24so6965072ljk.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=bAkC/5EhMydvusKw4x8gqMb/4C/GgXVqhEpf5Mgd+O0=;
        b=pMVX6OCEV5xca7iP7H1U/l/XUIjwsbwYpOZhD0Vk8zPIBv3dBXTlE/ZZXvtoRKF4qI
         nWKbN8YJFSlkfyLxqSrVfC6Ddyge84q7KkCHq+Z3YkYtUFJ5jSB8uIkpwLaMcPtOvl3d
         TY3tV8hfG/fbCEkohLvS9Or3bg7qkqhsusZE7s0QCD8daD4H2i313uA8ZlenbOSHlEuh
         bn0z4jRcJD/c7ccW8qKl65ebzxu2cLBmSiA6rmwIb1cpdhgVb2thJyM1Y1RjiwQrD0jr
         UPwvU8oAqfJbcfgPymnrovUEvqp9CrSeanTfligziE+1AdONA3CQltNo1bcI+VkdjDo4
         81aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=bAkC/5EhMydvusKw4x8gqMb/4C/GgXVqhEpf5Mgd+O0=;
        b=vl+250/zdccpAyx4Wv5Y41HcYKenFqvug5D+Mbp4ICejRMbjUTq7yCN1LL/Rxwn6ub
         mLrYZ+Fcv2xxdJT64iGYyJby3HoM0eUv8BWi9dkzYNeWckVevUDSSTQ3RZk20ZFwfZeu
         k/kzlN9aIk3Zqa1riYPdNMKnTCKSepXlWX/dXMDCyp8zjx76nzhf9rVFwD2p2B3qH5tw
         HawrDh6kpEY7DzLR1AvN1vmbGjHfjgv0+lksopxQUvpowFUrLHCLRG7il0nm1XT+cbpw
         mLYSta4Yiy1BUXzS8sgcud3XCx3mJD9V86LfqgNkWrlVk4y8JsUulJUZ33awDXx24OdD
         S2/g==
X-Gm-Message-State: ACrzQf0zvbQo4mLgqDLy07h+IF7t1S2od4dCnXOSv8zRweQHOQ32IjBN
        uj0BvNI3xxU4OHv2G21u4zdL6D87XAf3bQ==
X-Google-Smtp-Source: AMsMyM4Nfn6b4ILBSLFgD2196HLA3V4ld76UntR6VJ9hoyz4eIomwtEn5Je2Da0hOv9MQdgc/ZlCyw==
X-Received: by 2002:ac2:4e09:0:b0:499:1e3a:54ab with SMTP id e9-20020ac24e09000000b004991e3a54abmr8257161lfr.170.1664189041936;
        Mon, 26 Sep 2022 03:44:01 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y1-20020a05651c020100b0026c423959desm2313408ljn.25.2022.09.26.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:43:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene.kim@samsung.com>,
        Tomasz Figa <t.figa@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Subject: [PATCH PULL 0/2] Two patches for next cycle, v6.1
Date:   Mon, 26 Sep 2022 12:43:52 +0200
Message-Id: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

I got two remaining patches for v6.1 - DTS and ARM/mach code.

Best regards,
Krzysztof
