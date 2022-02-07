Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ACCC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 18:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236668AbiBGSB0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 13:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242796AbiBGRz6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 12:55:58 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D14C0401E0
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 09:55:56 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 12BBA40326
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 17:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644256555;
        bh=iL0LIepeQaRgfvOw682KQCC7APivisHIQkh+XV3XvQY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=s/R8Sngq+OaS6sh6NHe8zsUyuOQ8FKnmvari+FhDNC0VQPZW964d4ry4OYmgGkkLu
         iMC8xa/lNA6eQE3RpmXyM1zYCqYrZs0SsWn9htTqTUfoSU8mCInW+QWi4IJ9lH3QzJ
         t7Vgrb7RqrVJOB44MZkPyRs9AJ4K9/UWvLJfJylZMUFDg0wY8hHHZiKPdLEJl7Ouhf
         wsHygPEH2h9DhpFaTV6tsivCfKCXmOX8airBhPCed/+jI8mKjMMZ1rT6FLJq8Kgg6/
         qki9u2q+Z/O3IOmSZfRj/cxqMagUasOO7J3uiasVCaZmrgeRBxABjIir39+ps9tDrX
         wf/pEMdgeVnbw==
Received: by mail-ej1-f72.google.com with SMTP id ky6-20020a170907778600b0068e4bd99fd1so4627774ejc.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Feb 2022 09:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iL0LIepeQaRgfvOw682KQCC7APivisHIQkh+XV3XvQY=;
        b=02qaCTK8nRE3GRKaqKYBYF63sY7VdERKBF9shBLnfR+6z4TaGEt2EAu2waus2L9z+W
         6cMf0wyLaxTWNROKWqJ3jFJUwDvkjh+bmsE6uT8AgQyZWNEtTiufoC2W/R8hPnvEyYQF
         zbAfv6jlvjwV5H8VgnlRE9kKgNrSNXgj6pVdSnuHGdVkjgkvjVTxgNL0gA6rQQLg+MSr
         fhEhc+TOUbKjT4XRPm6FYIQ+kpw+Igkud8OevDTDfgfI32Yn34FChAQ4dJ4Ah3ERHasN
         bTlavVglJqBGsC9V+jqhafVWiA0+z9uIC8wAbaZTUwuAaQGVsUEQ3RK98RHBgtYLB1a1
         AV9w==
X-Gm-Message-State: AOAM530C8kCBdkhZOcz1aIjE0RINmfMbDgoBMSiVs2fB+aWgU8Dk7Q2O
        olWrYfEWi2I+KcbqqdrEABK9n4bNM90wZWvwpO7VgQirM6QsJNViBEi2YDfrZ+3snC355vTtTWT
        3fmCGos3/M2KzMJEFyUAcVLtHxr7KIuYUXTfh9ldSxTn4MW25
X-Received: by 2002:aa7:db01:: with SMTP id t1mr637159eds.394.1644256554744;
        Mon, 07 Feb 2022 09:55:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1G4vKpj2os6F6Z7fqUqCrdFZ65ttguW/jqIW3WbwlVZjZTC1cTnFdJkB82oG6+PYM+9UXHw==
X-Received: by 2002:aa7:db01:: with SMTP id t1mr637145eds.394.1644256554541;
        Mon, 07 Feb 2022 09:55:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c20sm3765210edy.41.2022.02.07.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 09:55:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] MAINTAINERS: add IRC to ARM sub-architectures and Devicetree
Date:   Mon,  7 Feb 2022 18:55:03 +0100
Message-Id: <20220207175503.425200-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220207175503.425200-1-krzysztof.kozlowski@canonical.com>
References: <20220207175503.425200-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Mention the IRC channels used for discussions about ARM/ARM64
sub-architectures and Devicetree.  This documents purely existing state.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e219ba2c5ac9..95ecf8ac709b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1623,6 +1623,7 @@ M:	Olof Johansson <olof@lixom.net>
 M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
@@ -1630,6 +1631,7 @@ F:	arch/arm64/boot/dts/Makefile
 ARM SUB-ARCHITECTURES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	arch/arm/mach-*/
 F:	arch/arm/plat-*/
@@ -14443,6 +14445,7 @@ M:	Rob Herring <robh+dt@kernel.org>
 M:	Frank Rowand <frowand.list@gmail.com>
 L:	devicetree@vger.kernel.org
 S:	Maintained
+C:	irc://irc.libera.chat/devicetree
 W:	http://www.devicetree.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/ABI/testing/sysfs-firmware-ofw
@@ -14454,6 +14457,7 @@ OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 M:	Rob Herring <robh+dt@kernel.org>
 L:	devicetree@vger.kernel.org
 S:	Maintained
+C:	irc://irc.libera.chat/devicetree
 Q:	http://patchwork.ozlabs.org/project/devicetree-bindings/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
-- 
2.32.0

