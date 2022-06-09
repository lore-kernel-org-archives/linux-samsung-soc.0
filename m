Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78091C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jun 2022 08:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237726AbiFIIYb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbiFIIYa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 04:24:30 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8613C1285F1
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jun 2022 01:24:29 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D446F3F1AC
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jun 2022 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1654763067;
        bh=Ej7MHp6szfum25ZZbPC/is2Fiy22+A3o4874paFglCQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nCW0+OZlxDfONgWALch7QrZKfWnm0g5/Cw4aIVtqJHCAIAvU9uX/7ywqzXWmSNC1s
         Aagk0paxSBCKlCRY9sCRZ5SRtaOKVq48Waodek936150ZzdxYF+06XZv5ujFvWQDLS
         j1KjU309afMxorc6XyK21GHKomrxDisuRl/h0LHFQyHUKkzEQTOCYJYtJLBG23ef/6
         HIPHloM70qPQrlHPuKAPIT2nkSMgmLETEU6ngl0Os8uEBQFraFRs1cvsVOFsEBukqv
         4XO7tF081jTG66n4k1ePERoJfnVtmF28yg3uUEM2xDJWGHJ+fr27aaya1Vj/tRPZ2n
         VYqHzOuLvzxCQ==
Received: by mail-ej1-f72.google.com with SMTP id s4-20020a170906500400b006feaccb3a0eso10649945ejj.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2022 01:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ej7MHp6szfum25ZZbPC/is2Fiy22+A3o4874paFglCQ=;
        b=VE6AwgksVenwBG+nePgd5rq4V6hQjlxiO3LkISoXh7dcthEE3PoWfAFwjHGfzTSXJW
         9HHtifawtvRpxsCb3a6PEHe7O4NldABDRNrvF0P8h5d5zjmXUr3fRhgur2I95Zk9s5fD
         pq+CX0t1m2ZEWal10jGCzW02E3oqq6CEAz+4pCGsoPJJsde/C+ljr0oCTBxDKEWo4vjr
         9f3YA2oY1Ll8IIr7vvSb8zC/lpRB5fn+DxcKRdJJ89SpT8OGDc1ryLFCeTdMNTj7CIMD
         gck6NIY36OhWk8dG0ThVOtgNATndbqMnBcHLKAevIU+aEuLVtW41n1tTiOUlnL3LOuUd
         vJgg==
X-Gm-Message-State: AOAM532v5aNbj1itF4JRPUMgMrG7xJ9l3Ny3we3Vf+JDL0KEhtKiMlSR
        HOCc64wV5kCkNcpunFN53Ug5u9pTWn4eqrBmxODETKJuSArFNfIA7ydRjOXIG1muz4tEKYIhy8I
        XJMK73YHPIWVyHViNcHWHmf2p4CFWdqpZ/sDreiL7Sbj/0ePx
X-Received: by 2002:aa7:dcc4:0:b0:42d:c666:62b5 with SMTP id w4-20020aa7dcc4000000b0042dc66662b5mr44905185edu.206.1654763067586;
        Thu, 09 Jun 2022 01:24:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu9Sf/BKYFBfqgQU54mvPSdUFw3OdRIuggAHyJ6DOVWjhoG6MjHK5fpN+rTN/vuK1hmeJLZw==
X-Received: by 2002:aa7:dcc4:0:b0:42d:c666:62b5 with SMTP id w4-20020aa7dcc4000000b0042dc66662b5mr44905170edu.206.1654763067432;
        Thu, 09 Jun 2022 01:24:27 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id v9-20020a170906380900b00711d546f8a8sm4664834ejc.139.2022.06.09.01.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:24:26 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
To:     krzysztof.kozlowski@linaro.org, linux@armlinux.org.uk,
        alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH 0/3 v3] ARM: s3c: Kconfig: Style cleanups
Date:   Thu,  9 Jun 2022 10:21:51 +0200
Message-Id: <20220609082154.115301-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <63eabd40-761e-3b4e-c1be-43a12516e1b0@linaro.org>
References: <63eabd40-761e-3b4e-c1be-43a12516e1b0@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The majority of the Kconfig files use a single tab for basic indentation
and a single tab followed by two whitespaces for help text indentation.
Fix the lines that don't follow this convention.

While at it, add missing trailing comments to endif statements and replace
tabs before comments with whitespaces (which seems to be more common).

v3:
  - Match sob and author email addresses.
  - Rebase to next-20220609.
v2 (patch 2 only):
  - Mention additional changes in the commit message.

Juerg Haefliger (3):
  ARM: s3c: Kconfig: Fix indentation
  ARM: s3c: Kconfig.s3c24xx: Fix indentation and replace some tabs
  ARM: s3c: Kconfig.s3c64xx: Fix indentation

 arch/arm/mach-s3c/Kconfig         | 14 +++++++-------
 arch/arm/mach-s3c/Kconfig.s3c24xx | 26 ++++++++++++--------------
 arch/arm/mach-s3c/Kconfig.s3c64xx | 16 ++++++++--------
 3 files changed, 27 insertions(+), 29 deletions(-)

-- 
2.32.0

