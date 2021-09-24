Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECBDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B73966103D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344487AbhIXNf5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:35:57 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37912
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346371AbhIXNfk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:35:40 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8AFCC4019A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490446;
        bh=c2rr929hp7ctSTiZFzB7IuYuTf+oD1xck7mUQWU9nKU=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=EYaakHyGVLyVB5CRwdu2s5kUtL1Cc185Ba0Ig3jCvvhBSo0u/gqqFYvcEu7OmJH44
         +R6HGKj1qj5qnsOu6vTIjasMeyaXe8/GecKbJPHWQLQ8wW2LEtMDiVsUOeDqWtKeJG
         pZC7fa2AU+p62DPjOGD3r9wKfEkDHIrBYYyFkOmBDWhX3UdOLsmiCXw11FNHRd8Vqr
         WelM6jTuJnsAHOQRh073vqPfjH4e5kJaq5RQJ0IzeRFrpF1+2st/k0Bbbmw1VTp7Lg
         T1zgSxmD9dAOxLdeJz07Yn/2rJv/5xVUlcMjGc3qN65k3PdtYwvyD1G1cq9mMPJjzm
         svoO/ftl4beFQ==
Received: by mail-wr1-f71.google.com with SMTP id c15-20020a5d4ccf000000b0015dff622f39so8043095wrt.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2rr929hp7ctSTiZFzB7IuYuTf+oD1xck7mUQWU9nKU=;
        b=Irb0OE2RDcKS9itYWonLlpxaLbb/I8xVxzB7y/z6Z66/bIDHkSVMjsXi98TnSZbcWm
         Xfc53keVh/1phvdfh7ux80l/7C1GMaTpkoFbLS4k55uYGMvbt6qiZxSf3IUfqUg+6VIx
         ukn/HvksE58Qg7N0UKkx+AyM3SiPPRkmcI989D8DiZ4k5WQW5HxP7oRrQSmAHe12sLhz
         2urcTYDf1CLfybAefMBWO55iiZD4yynvVWlWVFGGC8BxRED1EnRTWYCWtcE5eQ352TKe
         0J+6zWde2ZASol3zVcjTZaDZIyCAErsG+g9E+u7613B9giGnlxG/8osr5Lg6yVcixlnc
         wqBg==
X-Gm-Message-State: AOAM5318wRKJCgvaTZcQytkhsh0Qp108TKBdQwv7jVlONDxUsTSJXw8x
        jH4FRZGq7O6GqtxeNM0ackaAjfFP6r8bOrrvhaPYInqM/7f1JMNksPZzj7HdJgdS+yT8lSmE9sL
        pXy0HkusJcSnfwJa4Fpd/m3kZpcfeoDJ+0hWQTdp07bK5WzmM
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr11692852wrc.102.1632490446221;
        Fri, 24 Sep 2021 06:34:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySuTDFUNbQADkW2VZazPIKq+SvCnkBXNyrcbBg66KNezbVsPSVOuYyd/Q+oowjMRif6TMaRQ==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr11692842wrc.102.1632490446106;
        Fri, 24 Sep 2021 06:34:06 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id j14sm8068533wrp.21.2021.09.24.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:34:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] mfd: exynos-lpass: Describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:33:32 +0200
Message-Id: <20210924133332.112092-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ca0edab91aeb..722a7aef4266 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -417,7 +417,9 @@ config MFD_EXYNOS_LPASS
 	select REGMAP_MMIO
 	help
 	  Select this option to enable support for Samsung Exynos Low Power
-	  Audio Subsystem.
+	  Audio Subsystem present on some of Samsung Exynos
+	  SoCs (e.g. Exynos5433).
+	  Choose Y here only if you build for such Samsung SoC.
 
 config MFD_GATEWORKS_GSC
 	tristate "Gateworks System Controller"
-- 
2.30.2

