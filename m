Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4080FC48BE6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F9A261153
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhFNTfR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Jun 2021 15:35:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35353 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233832AbhFNTfQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 15:35:16 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lssKe-00008y-RF
        for linux-samsung-soc@vger.kernel.org; Mon, 14 Jun 2021 19:33:12 +0000
Received: by mail-ed1-f69.google.com with SMTP id h23-20020aa7c5d70000b029038fed7b27d5so20685992eds.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sfJlofv21SpGZDidrB7CsJ8MDr7P7vCKWMcgZ/+7/iM=;
        b=rbEbjPdJTImLe9/OLc3dXiraJGJ9R9jotpSN/UulTW2WmYzI8IUnEsB1J0Lwiptt2Y
         +pFiE4J+qLmCFEFZc6dwngdviDFQVDNycWpqLC2Nfxlt6ZTaiANU4G0/bul7I1vJ7s2H
         rhOFVoF7lTCQPTf9u24AYb91Uft3J36d7KUrLuB8gGTdHOI2JdqZGnUUW6l1DLUxZJVF
         hIwlHdpEPJwtvRGT1V2+38MgC5dgK7Jrt1XhptHtiYLBCBBzDYmhIP3rijq/gxsHYs/d
         q/JnVnxsIOj6iyZPuAJlp27Fc8LVp7+0yriojrcX/Fj0BF/M9288WW1wNK9VBuciysWx
         ZIPw==
X-Gm-Message-State: AOAM533nketsjMghFcZ/6kRup8+JGmzSoE7w8334COmhZg3ykdIS2wl3
        O2/moNsLmzecTWIWAJIZvJwY9/UqkFdn1amsBXotOSuAfyqhrkwsQAUbONN3vj8/6VKqVf88fof
        JwlHIpOH4KeC/Jq7rMzUjlXbisxYY52z/VT6frtDee0FQec3v
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr19246386edt.194.1623699192597;
        Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUwBAD6ChY0/D6TIhrxmWKERXF7uVQl6lBAKO7NbZ1+r6uaIe7co3RLS1phU3lsvHL6vuvqA==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr19246378edt.194.1623699192513;
        Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 0/2] ARM/arm64: Samsung pull for v5.14, second set
Date:   Mon, 14 Jun 2021 21:33:07 +0200
Message-Id: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

For arm64 DTS I have only one patch so sending as is. Second pull request is
for defconfig changes.

Best regards,
Krzysztof

