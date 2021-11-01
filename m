Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F6BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 00:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15712610D2
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 00:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhKAAwx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 20:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhKAAww (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 20:52:52 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542D7C061714;
        Sun, 31 Oct 2021 17:50:20 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id f4so736649edx.12;
        Sun, 31 Oct 2021 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=88hJiuzWD/tUcfEkyns0Zq3ZnTN+CSzx3Is2G+EUtjs=;
        b=QUiGW5Ro1QUnKCbHYw4n/Isjuf+BrJgEeiV8ouf8Mu0hB/BYzERAaGUq6DZ4ocuPnd
         +QQuhewuuYgnSGy1K1hZA67gFQ/v2hsqbasLTpUApTc9r6jWfiGpT3DcomBEydB9YwyV
         kEiXpHw1h2+U3qj21R8KbuFnT3htEGaH+EJAo6AGpB8Wya8MBXsJugBnP/9luIGIRBTa
         B448bXFxWeVx4+WS7+X4PgEcNDFCW7e7fDqv0teJTfR0+/Giuf0hCB2EHpC9fEO/dKKL
         ph0rNbqGNsTy4JdBRVmJu5KeOZ60McbruRjr3ZrkLIuquO9PbEPGwu4jbNEuFWA5+Cju
         A1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=88hJiuzWD/tUcfEkyns0Zq3ZnTN+CSzx3Is2G+EUtjs=;
        b=aCWWNh89wcMeyhVXIRry1A1J63DMmjFTstCLlu9CHPdhYzP4tiHDwCdF4D/bLTzdRQ
         jSEfHQxnlyXEPlOUZJcomXrSjDyP98h1oXC1k1lhjAP7/YEIKrUwkMYzZ5qN5M9JWWbq
         OWmPBN6jZQVwpaJ9zbVtbaRXYPLQMqkGl6+2z9bUQGMMlD0FslEQBw5XKlukQFWUrM/Q
         1doDr4keYkTbS3VlPT1WZeqXhl3LQq59qu+RyTLFkmsThJYbSNqks0YkDzPLPOF9QKLu
         FxqKyR6hl3ZZfMJEz5EQLN2oNnHRw0oaTSZjQLkjDOiY5IrkPF0EeenSaGJMgFQ08OYz
         VWFw==
X-Gm-Message-State: AOAM530nRw3WGzgy2vmftRTdSmGnGG+dbJWffa5CqtwsU4ZaJXBtYXHi
        +AM/24rK8xBzTLyk5jVSzq8=
X-Google-Smtp-Source: ABdhPJyj3Fs5yhihpBUGaBNzQbs69NLrs1RWqN2uMI573ElTN82zfgp2At8x7hiq+FzHWxAR2ss29w==
X-Received: by 2002:a50:da48:: with SMTP id a8mr36522170edk.146.1635727818833;
        Sun, 31 Oct 2021 17:50:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.googlemail.com with ESMTPSA id pw8sm4476065ejb.55.2021.10.31.17.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:50:18 -0700 (PDT)
From:   David Virag <virag.david003@gmail.com>
Cc:     David Virag <virag.david003@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] samsung: exynos-chipid: add Exynos7885 SoC support
Date:   Mon,  1 Nov 2021 01:48:53 +0100
Message-Id: <20211101004853.55810-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos 7885 has product id "0xE7885000". Add this id to the ids with
the name.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - Removed correction for weird revision bit based on vendor kernel
  - Rebased on top of
    https://lore.kernel.org/linux-samsung-soc/20211031205212.59505-1-krzysztof.kozlowski@canonical.com/T/#u
    Apply it on top of that patch.

 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index baf3afc69d79..2746d05936d3 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -57,6 +57,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
 	/* Compatible with: samsung,exynos850-chipid */
+	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 };
-- 
2.33.1

