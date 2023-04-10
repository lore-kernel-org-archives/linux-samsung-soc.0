Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2317BC77B61
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Apr 2023 12:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjDJMuF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Apr 2023 08:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjDJMuE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 08:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA0E30DD
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Apr 2023 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681130955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gfI+8pNpKHzSRSbn60p2xLlTui4koSe7i9/TyNPKMTg=;
        b=LGOLGi8BlZUC4cOu9PxeFdCytnc4b0EPexxIfHs2SlVqiDU3uWz5siBXNY3vMOC2k4tOG9
        TNJoeg3uj0EotnY1Pc8Nm+S25h4kK4uJCmwdPgzfbETF1BVnngKyTM+1SvyLsm1jOYrEhv
        CF1bn+klc7dkGipl7f7FibA7uxXM/ng=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-0MuLXxGdM_26hR8U9GpOAw-1; Mon, 10 Apr 2023 08:49:14 -0400
X-MC-Unique: 0MuLXxGdM_26hR8U9GpOAw-1
Received: by mail-wr1-f70.google.com with SMTP id d25-20020adf9b99000000b002ef2d0e2d1eso1331918wrc.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Apr 2023 05:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681130953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfI+8pNpKHzSRSbn60p2xLlTui4koSe7i9/TyNPKMTg=;
        b=255EJUs87affE5AnJQaUiTWTtjPmggbulqoreDreJWU7Nz2miHlMZMErNQC/CGBFHF
         C0A4/X+kur2y7TNFtxJqHSXgx4PskHfbzV7kJBBXKnwr4a52aWN1GHighamKmLzaUKHY
         TdPPHr6K1YBU+1Qm7xVvUWCnthZxr8LrgLsPM7pcoVlnEHv//pPYbwZj3+Mpv8xyDh/Y
         I6GzNE/1FK7zaYlGVPiQ+iWYhAiUCXR0ujaVThdW34f1Cv7nBmpkuQrRsgWUL7+x2OZX
         h4OvDvpivNPa3ii1btZTTk/NvmGy+D6+aB52eQM+zfjskTqHmEOjxJze+ttMAYUYTv46
         QTDg==
X-Gm-Message-State: AAQBX9fBku3AzgCN4+Kh2WBbaDm+DbWG9Rtad9C83Sr0G/fBiA2yKHLk
        E6J8BHZ2jar78gw1QecRlA+PIwEe2+RWXE6VdL6rviBibwiKNplYYe1vn7tjrIxkK8233E7lgiB
        MU4+YVbkFI0FC9nARSebnzEWL/8nl0fI=
X-Received: by 2002:a5d:5349:0:b0:2c7:1b4c:da75 with SMTP id t9-20020a5d5349000000b002c71b4cda75mr7297850wrv.69.1681130952865;
        Mon, 10 Apr 2023 05:49:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zf/wmB9Myl3vBu+oEHUuKmq0XEAyi0iCtTxsDkx/dzU4MaidTOs+oWSxrEoWjjViR0eA5pqQ==
X-Received: by 2002:a5d:5349:0:b0:2c7:1b4c:da75 with SMTP id t9-20020a5d5349000000b002c71b4cda75mr7297834wrv.69.1681130952548;
        Mon, 10 Apr 2023 05:49:12 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m8-20020adfe0c8000000b002cff0e213ddsm11791320wri.14.2023.04.10.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 05:49:12 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robert Elliott <elliott@hpe.com>,
        Russell King <linux@armlinux.org.uk>,
        Stefan Hansson <newbie13xd@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ARM: exynos_defconfig: Enable zram as loadable modules
Date:   Mon, 10 Apr 2023 14:49:07 +0200
Message-Id: <20230410124907.3293869-1-javierm@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable zram and dependencies as loadable modules. This allows to use the
/dev/zramX virtual block devices as swap stored in system memory.

Options were taken from commit 5c824e8be64d ("ARM: omap2plus_defconfig:
Enable zram as loadable modules") that does the same for OMAP2+ platforms.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 arch/arm/configs/exynos_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index b0f0baa3a6c4..2d5be864b4ca 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -37,6 +37,8 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_CMA=y
+CONFIG_ZSMALLOC=m
+CONFIG_PGTABLE_MAPPING=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -84,6 +86,8 @@ CONFIG_NFC_SHDLC=y
 CONFIG_NFC_S3FWRN5_I2C=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_ZRAM=m
+CONFIG_ZRAM_WRITEBACK=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y

base-commit: e3adc46da349d4a4cda1c58d8186c5bce0b011fd
-- 
2.40.0

