Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F52C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236126AbiCGIKc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbiCGIK2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:10:28 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0307445AC5
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:09:35 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A963D3F623
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646640573;
        bh=4HAGUFdmLrEMxU9EFzkJe4Ux3HcmnFK/yDcsBQCmOjM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=e1AUiT7qakrbezj64vxttoVNwYMCdWU3ly9Nd2DI5BPjvLHZrgZtmASbVy60aywZP
         3FGc6mbv1esEpSPaoW/gAr3418SntY/mvnmbUh3/kQGnSk7mSM8m/mUtWL5DxE9XUO
         SrsdPBOsGW4knPH3aA831USgCfjRIg7/txa7ZPs+iDCMH1ZgA+fJ/0gMllOgyMwfBe
         CBQUKgdByTZQwMkOH1UekB6rUt7hsGrcydUaNQ7CgqHE2Q9cINYtbL+AO8OYKdakgO
         gRBT5mvhp71oNEP1ZQPJikEB9rOLJUTtQnCMHW/8mpwy2ZkJyC46HDASE+AbxCPLg8
         rriHFvGM2ZM/g==
Received: by mail-ed1-f72.google.com with SMTP id b24-20020a50e798000000b0041631767675so2259043edn.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4HAGUFdmLrEMxU9EFzkJe4Ux3HcmnFK/yDcsBQCmOjM=;
        b=E/qT1DWvSi0kCpyTqmuxfHGNE+ibgReDNzei3N5cK4+m0BqsX8qn+8sL1Uv4AE/VnC
         RLWkCFZe2M0FYKB3Wqdnn3Olj5MHz4du+/Ytp4dZ7IquNxCPNfkzoaW5zPiUKrOCbMZ9
         iur++nopOLfjlqQ12iYJfaQPM/W6aAQL8AEDhodd+eTemYLbqJLMLZ3Bx5gXlQWVEZk/
         S/vl1jilnoj2VRb0yQVrSax2NmrcYANyjteuJkLrdZS1Itzm8n8wm3byBOVoPo/Sa1Tv
         dgzvUpONmfOv/In4vmzPBNe0O9PkIQupir8SGLnEv5BKVUUIyem/bndcT8atM0G9vgRO
         PP4w==
X-Gm-Message-State: AOAM5338yHN2LxuW6GhmyksFhWz2lJzqaPuYb/fo+0HVEi1FxlgaK+F0
        Ted4oWPaqWZxtjZS4num7CbUB2wX288jcmSn2agfaaUDYLOJA/OgRO8qnu/I49BQv/leG+b6buB
        m3vfBtgXa9IJX3/T5P4fmse+4CF4pBEY1jSJjgZxpW0Bk+grB
X-Received: by 2002:a05:6402:18:b0:410:86cd:9dce with SMTP id d24-20020a056402001800b0041086cd9dcemr9810257edu.70.1646640570857;
        Mon, 07 Mar 2022 00:09:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgU+c7KFSylijaRWQXv0cNRe/wpPkgSFLwallIr6sdnzfiO44fulIE699j1F9ifcnE8L0KOA==
X-Received: by 2002:a05:6402:18:b0:410:86cd:9dce with SMTP id d24-20020a056402001800b0041086cd9dcemr9810243edu.70.1646640570665;
        Mon, 07 Mar 2022 00:09:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fq14-20020a1709069d8e00b006da650af5a9sm4472594ejc.3.2022.03.07.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:09:29 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] tty: serial: samsung: constify UART name
Date:   Mon,  7 Mar 2022 09:09:22 +0100
Message-Id: <20220307080925.54131-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The UART name from driver data holds only string literals.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index c4b13f2d6e26..7025306f76b7 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -63,7 +63,7 @@ enum s3c24xx_port_type {
 };
 
 struct s3c24xx_uart_info {
-	char			*name;
+	const char		*name;
 	enum s3c24xx_port_type	type;
 	unsigned int		port_type;
 	unsigned int		fifosize;
-- 
2.32.0

