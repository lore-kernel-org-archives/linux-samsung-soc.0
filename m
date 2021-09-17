Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0FFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Sep 2021 17:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EB12610C7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Sep 2021 17:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244321AbhIQRxO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Sep 2021 13:53:14 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44280
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241517AbhIQRxN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Sep 2021 13:53:13 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6D59E402CD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Sep 2021 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631901110;
        bh=XL+qDC8QutxbDamfZzlmocvfMVRa4rk6KJUDa0xLVTk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=kIO9IB5ZanopXdTgFXUTbDgSBL2DMKb9sGZzCbYQ0yOfx1Fgmi/w5KEqzOD9y9ls0
         3lnWn3MEVVzI+rzxVpzNd3FL8WEmoADqyWLCQE5XlwKQleE/N7FA7I4nsw0/KuvpzV
         Tfd3TdkkXUQEfTmKQ8TWnnpoa5fKD0cCylYl8rk+J0sG1l72zW2hV4CtmRJPrVNVES
         9F+naLEG3SdQZcHOOghKEEbsAgAYklHWcCiJMCEEnnDkPdVAmlWIfLM6UEljVw31rq
         8MuldyxfHv9p5O46tCbe8oJJPHxR3o26Wj5zjU67dIAK+OvWjMUu3aQ6yFA7vNzrSl
         85IgVHW0wfSEQ==
Received: by mail-ed1-f69.google.com with SMTP id q17-20020a50c351000000b003d81427d25cso3317131edb.15
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Sep 2021 10:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XL+qDC8QutxbDamfZzlmocvfMVRa4rk6KJUDa0xLVTk=;
        b=CwF3PNyUaQn5QVO+RsjhbkIHVBQUMGxoBW4oltT3LEMxi0uPyKiRZ/oHEB08kfKBzn
         MhIb4GcSpX9nbaCAXQy6AybVM0AKkGKHdxrryzPOV40l8nFQAov4DXLAuyaijWQi0yvM
         gU5Og1iBykiVOdDxZockC+vGEV7k7TSIGrdTftOl7/hOLYkp/0Vofaa6x9wu95XAvTrl
         dzTxmMzL4+POuAMpfGVDSJAY2G3OXDgZq+ErnJ2xm6tLOrUcJeMfFSZZ6z0ivz9vvvLH
         nQnWevAq5tHNZWW7Uq/Weaq+fwuBSRJ9b2hLZvkKBjfrsvbLBtK1PYE6+fg9NrtZtLCk
         2wNA==
X-Gm-Message-State: AOAM531pgEShSsMds+ScyRsblsYJmxTcpjL8Qbu5PeQP9H8Z/9HGScPh
        NsSUtQd6Idq3hEstXN5Z/QMbDSIwFmJ2frBfyFD3kdQnZYbtDo7OuCD29e6+IV6tHnIZX1/ADEl
        /qDjOwRqWHHNhs2YX22XNsPN/X1Pwvfc9N7IOmbyqDFRueI68
X-Received: by 2002:a17:906:269a:: with SMTP id t26mr14212777ejc.20.1631901110126;
        Fri, 17 Sep 2021 10:51:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiBqKd7lQL4Mbz9u5aHsSslkQWyMUiD657MnLRkC0FSktYOb2f/xv6iKKNdBylREGwFbkM2w==
X-Received: by 2002:a17:906:269a:: with SMTP id t26mr14212759ejc.20.1631901109984;
        Fri, 17 Sep 2021 10:51:49 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l11sm2951345edv.67.2021.09.17.10.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 10:51:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/2] soc: export soc_device_to_device symbol
Date:   Fri, 17 Sep 2021 19:51:33 +0200
Message-Id: <20210917175134.252882-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917175134.252882-1-krzysztof.kozlowski@canonical.com>
References: <20210917175134.252882-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In case if soc-bus drivers are modules soc_device_to_device() has to be
exported.  Since it is trivial, export it as non-GPL.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/base/soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 0af5363a582c..ac8db303daa1 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
 {
 	return &soc_dev->dev;
 }
+EXPORT_SYMBOL(soc_device_to_device);
 
 static umode_t soc_attribute_mode(struct kobject *kobj,
 				struct attribute *attr,
-- 
2.30.2

