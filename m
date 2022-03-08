Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD35FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 08:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344619AbiCHIKU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbiCHIKT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 03:10:19 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F3F3D1F6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 00:09:23 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8A4AD3F616
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 08:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646726962;
        bh=/d+cuTswHRfObofzKWlwwKYoIDQbzww/xiphIp91T7k=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=JQYDH4O/5ePgzf4QoE7pjk0iuIl01btcpLqQts5lOlIzFTU7iwAe0qGMQLl8gYFns
         jBE+IGdgeaOrwjMob4aSqmtFGYv4pYoCvHL9irn38IZq+kRsJlgpZ/WIxs9MZXPa2X
         4B/4Gv8xBo3WkOg/0G+hhu5YINEjNTkhvfE8uPItnt83X3Hbj5a1fXX1gg7Qi2k4LM
         jWFEEMdVOoQjZ608wV/9mZsip8yYEB2uV998Y5kXiFOTfKn/xyRrU2LfxBXPr7mfYF
         8u+I2FDbBZss+moIT8DoQ1vqySu+L6Y65FQEmzWuXJaOm5w/KVpdzu7IvORnLHa8K+
         0gnOeUbiVm+bQ==
Received: by mail-ej1-f72.google.com with SMTP id d7-20020a1709061f4700b006bbf73a7becso8242064ejk.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Mar 2022 00:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/d+cuTswHRfObofzKWlwwKYoIDQbzww/xiphIp91T7k=;
        b=bMvCOiBhZ5AMQRTlm8+LQ9WONVoRx8AAzCPZ2YqHPQM7ZQ5TwCzYDIfWPUnPRduXyc
         edgMdGzX3h7KajHm3dl3hS2x7HpaiZUmcplq8OLAMo+d0cuouBLaoHpuQyAju5bDxS84
         vmtZlZTQ31E1Sa61/gsqiWacD8laRd5X50dSDnifkKBMsokzTy1i90nBcI+NLkW92D8w
         uMtEeVviFC8+zEc94s8Ok82VGqjhUXXQd8N9EbLy4YxJY7RmX+M2WYO9e7wwmINA6OKn
         2JSSxjm0gp5jShXZPEitTeR9kghxP+6LzgnoyZii3Q0wxgzDV+2NJiUaBLLoOmEj0P69
         dyxg==
X-Gm-Message-State: AOAM533jR/lRZ3dNloUMQs7LrRqoqP1djJhs2QfqbZ+a5J9hnSVsUgMn
        Jc3zdjS8S6fQjxWbV7nHwKvBdMxvf5dVSRJ6t54Ks37bUd6/lsF51wPe6yX+GIA5RYG28YO06ce
        +mIOpyhXtOUi+EVi33fipyAw3cn8eiKKTCmijClxgQGLaGugG
X-Received: by 2002:a17:906:7245:b0:6cf:d3c6:8c63 with SMTP id n5-20020a170906724500b006cfd3c68c63mr11721619ejk.677.1646726962242;
        Tue, 08 Mar 2022 00:09:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJPHLp6T4YFWmBiyeFGtCdgDPQn1ALmFmvSZMWVXgp434TU3oTrRtaUyzLLRSlPxfGODwAEA==
X-Received: by 2002:a17:906:7245:b0:6cf:d3c6:8c63 with SMTP id n5-20020a170906724500b006cfd3c68c63mr11721608ejk.677.1646726962084;
        Tue, 08 Mar 2022 00:09:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id t4-20020a056402524400b00415b90801edsm7385697edd.57.2022.03.08.00.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:09:21 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 0/8] tty: serial: samsung: minor fixes/cleanups
Date:   Tue,  8 Mar 2022 09:09:11 +0100
Message-Id: <20220308080919.152715-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v2
================
1. Add review/tested tags.
2. Use dev_of_node() (Andy).
3. Split cast-removal to new patch 3 "tty: serial: samsung: reduce number of
   casts" (after talks with Jiri).

Changes since v1
================
1. Patch 3: remove unneeded parenthesis and module alias change (Jiri).
2. Patch 3: move unrelated "constify" bits to patch 6.
3. Patch 5: fix typo.
4. Add review tags.

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  tty: serial: samsung: embed s3c24xx_uart_info in parent structure
  tty: serial: samsung: embed s3c2410_uartcfg in parent structure
  tty: serial: samsung: reduce number of casts
  tty: serial: samsung: constify s3c24xx_serial_drv_data
  tty: serial: samsung: constify UART name
  tty: serial: samsung: constify s3c24xx_serial_drv_data members
  tty: serial: samsung: constify variables and pointers
  tty: serial: samsung: simplify getting OF match data

 drivers/tty/serial/samsung_tty.c | 225 +++++++++++++++----------------
 1 file changed, 108 insertions(+), 117 deletions(-)

-- 
2.32.0

