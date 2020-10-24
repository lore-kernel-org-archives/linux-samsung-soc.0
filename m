Return-Path: <SRS0=oj0V=D7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9FDC56202
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Oct 2020 14:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1B3922203
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Oct 2020 14:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tm4c5Z8o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762103AbgJXOpE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 24 Oct 2020 10:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762101AbgJXOpE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Oct 2020 10:45:04 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7433C0613CE;
        Sat, 24 Oct 2020 07:45:03 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y12so6166645wrp.6;
        Sat, 24 Oct 2020 07:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GhAOWaWIlyhIBd+vE/eqpDFIiE9Ns5tUs5jw9i9fY2g=;
        b=Tm4c5Z8oORffuGHjtdSawtiz+tScmL0lNriChXh6rZBmFoixqOc2f1n1LSiKx6HZ/X
         X3ljaLv1CCkUJqPuyKSNI440WZ8m222II5vhdM8iPC/COLASOdqwNtCFUmI3/hNo4NjN
         L40HlP/XFtdGyb434Bs+6w5yBg16uACjDHOrJcVP0y1Sn5UZuiLCwh3MYeaS8aVM3N2P
         fsJ2Ct0nqJcKO/paiWFuQnJ3YM/0MbpYfzVKRUFm/siVdL3kN/4pRRKDcV8xP+oFkEEQ
         7sHdvzmkTsbAzTrI1JIxtcI2O3kFCUYr6+4CES9XI8419arxx84hWACOonT/ODT06/C4
         6lIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhAOWaWIlyhIBd+vE/eqpDFIiE9Ns5tUs5jw9i9fY2g=;
        b=sl6bPKgpuOp8k//fwAa32ZSq2/qHyKk8H1qwAYbde9Sawt3tPBUKGT3+i9LbqudUyN
         cAL303G3kGEOIyl/wdcGVN6jZmfSixcx5mefTeQgxHeijB8omVhsmczpKA7NKf1kGBIj
         9EK1jP591BGI9jS7TGajl/2dFrBnyPykmfBMWoe4L9C0sUbFp2KfYgBuQtjYlyrLx6H8
         Sm0oMoJLAdVE8wb7m28m0Cr11AG6UZ5kXuDSTJhNjwENsRar0H3EpQ5WaAKGUUEfjFlC
         gGE4SN1MO/GzANFukp0qbeVRoJJGt2AOOAI7/+3ekRE3twr3+f6sM6TKJAykp2iyq8pT
         3iAQ==
X-Gm-Message-State: AOAM530rDFNZfwNcsHP7RgeFN8nSE3/jM/hIihADa7CjHC4eRwZa9ga0
        tOxgjH/vJM9f6QX+jfMMyUc=
X-Google-Smtp-Source: ABdhPJzdnmHGlfMX7EgtFZdv2b3+l8wK3QDzfGig4y32JX3DgAvQpOPlb2nR+jdU9guHR61yN3AfKQ==
X-Received: by 2002:a5d:5009:: with SMTP id e9mr8123654wrt.104.1603550702417;
        Sat, 24 Oct 2020 07:45:02 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id o3sm12057564wru.15.2020.10.24.07.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 07:45:01 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        martin.juecker@gmail.com
Subject: [PATCH 4/5] ARM: defconfig: compile Atmel MXT touchscreeen as module
Date:   Sat, 24 Oct 2020 16:44:20 +0200
Message-Id: <20201024144421.34435-5-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201024144421.34435-1-martin.juecker@gmail.com>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Atmel MXT touchscreen can load firmware and settings from the
/lib/firmware directory, it makes sense to have it as a module to have
more control over the loading process.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 arch/arm/configs/exynos_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index c9581e603a32..bad4f3d306ba 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -125,7 +125,7 @@ CONFIG_KEYBOARD_CROS_EC=y
 # CONFIG_MOUSE_PS2 is not set
 CONFIG_MOUSE_CYAPA=y
 CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_ATMEL_MXT=y
+CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_MMS114=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MAX77693_HAPTIC=y
-- 
2.25.1

