Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78504C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C70B6206B5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738957;
	bh=p2adxRzepEbIsLQnxW34looRrw9LWsLu4tmaRjq+7iw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=E1zp4hFLrldFC3k9tRb/IpGXF3oaWANM1PhLyk4Frw4L5pF59zLD6AnEwFb6IsUBe
	 f+XJLXq3MhW5Qm+cZKKMONtu5NWpM9fX9vPX2sszek18G/L/tRI25IjaLd3uoZiVsc
	 CjCK90fpFQ+MriiiYGUAbisjiEhjLacglTHpBuag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgHFSfy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbgHFSex (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:53 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA68C0617A2
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:42 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t14so10615814wmi.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=p2JRocSR61t8MIpRNyaLstFtZmZuGgXB0g+/i6fpFKA=;
        b=asBxqDQEa66NGBXF3Y07MNLO6debM2BgQjXkbNzZlrUSUkeB/HpqPSNzz2uWBWcIBW
         lEjyK37/RqL+DwnhHlB+Ed2Wgsz+YdHPxuiALDrFwBCnkIYFdL1LbeEUUq5OzeqS4rq9
         lZmr9YHbnaQFb+CdbvtIG9cU2/4er21AfwP/HzneKPhjKzibP4QtZ7tTPFqyMAPdG0a6
         a+PGumM6jJ6R9bmeM39wxiclz4r57ob2AmdqNTdpBLYnQye8ssIibRfoxrLQsqPfMKho
         9aaPFapEJ7Nup2HJ4HPCR8zygTgaoByuGnvb+7Y/ie5re5vRbJUxguw2SsWVDD+VMVW2
         ZA2g==
X-Gm-Message-State: AOAM5309AbaS12P7KzxAuRA3iJavXqT84+QZjZRR0VQ8j7v1hwrgDEb7
        Dv4xAEEVPXeGkQ2AGKEV1lHD6lJkrj0=
X-Google-Smtp-Source: ABdhPJxkdjoG0gDPlt1blBR6jukd5DKMoSsdByomMbHYXclIFeAkbvWbSZlOdVE6oPSCXybSF8rY/w==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr9672978wme.78.1596738880496;
        Thu, 06 Aug 2020 11:34:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id v16sm4376761wmj.14.2020.08.06.11.34.40
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:40 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1541011lta;
        Thu, 6 Aug 2020 11:22:29 -0700 (PDT)
X-Received: by 2002:a17:90a:3549:: with SMTP id q67mr9720260pjb.56.1596738149026;
        Thu, 06 Aug 2020 11:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738149; cv=none;
        d=google.com; s=arc-20160816;
        b=LT6i3fqV4ULBF5KEWgfsPzaUebBjnA+S5wZQ7Gc4lsVC1tBJNUCOdN8WlOTeg7MB8/
         EQN1rMAUqd08pMzmZTXiL3mo46QTHxUL//D3jHGCPLxIIQAm/MmGqxoN/xWbDVdreMHf
         brrL2pvN4Wb114Ar8BX54tG3VGTpjRdVcaSP48V2YmQdEi/EStDbsiodHYqmAHIdqLaD
         nGQVMnfgI1gn0kG1DODBJIFrDbDA+uRzwh9pcjB4UrEX1CfsfVhKL9c3Kz9AATnNKhO3
         QX/YLNUHrAa6ILjZZdwfXhk4lBZhqB9byDn6uzq6kAY5OAJp0W5ZVjfojds9/lRVJ1S5
         PB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=p2JRocSR61t8MIpRNyaLstFtZmZuGgXB0g+/i6fpFKA=;
        b=Flvv4CgkJ8fE48SXwc/2GnjosFc0Ooemq5l+tTfQOs++pYWEqEBoGuvqDtPKHVhsqD
         RjziEYnI0ojVg0wffmjblrzg0jt2O/RDE9qZ4ax4hWnVYEqzUvA5D1enuzH7xq4FdZcM
         RIVCL84bfyzYkcKL7ooT85NgzBlQDUEOte5mOZq/90FGMSdjZx2dlMb01POxM2Sa47sT
         8D81HfygQfTiLhw5wewVBW2YalPkGwlMcJ8LxEQcps34kEFSopZroh/HyrzY2rrMdEKC
         qfHPzjRxA44hE1LVTGlXXBWb1a5NcG3FzX+CzBF0fuCBpu3KPVcAZFIhnMj2mS/Oov5x
         ojyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=wcaczOFF;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id y196si265083pfc.20.2020.08.06.11.22.28
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 2638A22D0A; Thu,  6 Aug 2020 18:22:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A45B522D3E;
        Thu,  6 Aug 2020 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738149;
        bh=p2adxRzepEbIsLQnxW34looRrw9LWsLu4tmaRjq+7iw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wcaczOFFmsp8VscB4RMRsZcUMJ3Z9GGnvUERUz4wHqpgjT1ohnI5xUO58LjaXZubK
         XtjlA67UwEUfBH27ZKthnNxsFPkkgEQbTIPoFRm1pwSeQk9Lgi69cKBZtdQDngiuzr
         PsTRrHbU6fm17mWaxBr7oHpYsiM6ZNn/fQRs/wSY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 13/41] ARM: samsung: move CONFIG_DEBUG_S3C_UART to Kconfig.debug
Date:   Thu,  6 Aug 2020 20:20:30 +0200
Message-Id: <20200806182059.2431-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: 1MazrltmgdNt
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Before we can separate plat-samsung from the individual platforms,
this one has to get moved to a place where it remains accessible.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/Kconfig.debug        | 10 ++++++++++
 arch/arm/plat-samsung/Kconfig |  8 --------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 80000a66a4e3..7c34cf5c4a5b 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1497,6 +1497,16 @@ config DEBUG_S3C64XX_UART
 config DEBUG_S5PV210_UART
 	bool
 
+config DEBUG_S3C_UART
+	depends on DEBUG_S3C2410_UART || DEBUG_S3C24XX_UART || \
+		   DEBUG_S3C64XX_UART ||  DEBUG_S5PV210_UART || \
+		   DEBUG_EXYNOS_UART
+	int
+	default "0" if DEBUG_S3C_UART0
+	default "1" if DEBUG_S3C_UART1
+	default "2" if DEBUG_S3C_UART2
+	default "3" if DEBUG_S3C_UART3
+
 config DEBUG_OMAP2PLUS_UART
 	bool
 	depends on ARCH_OMAP2PLUS
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 3aca01067b3c..c3d18b0aad75 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -290,13 +290,5 @@ config SAMSUNG_WAKEMASK
 	  and above. This code allows a set of interrupt to wakeup-mask
 	  mappings. See <plat/wakeup-mask.h>
 
-config DEBUG_S3C_UART
-	depends on PLAT_SAMSUNG
-	int
-	default "0" if DEBUG_S3C_UART0
-	default "1" if DEBUG_S3C_UART1
-	default "2" if DEBUG_S3C_UART2
-	default "3" if DEBUG_S3C_UART3
-
 endmenu
 endif
-- 
2.17.1

