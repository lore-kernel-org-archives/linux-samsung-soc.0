Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50D0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349515AbiAYRTH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:19:07 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51460
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346408AbiAYRNe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:13:34 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5EB97402F2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130717;
        bh=LvBwPzZuQYg1sk1AcEyVLVG7UxYbxMueMK9OojLw1Q4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=CY7PK8+b4bB9aoCAUW0tERxpxzO0v2nWOQ0fzR7bvxf0uuXmbre7Zc06Vd/PnuyS0
         O8uBlpcNoiSNJOquriY5l5fBTFqrJhKrDQXqd/BtaNpn7lUcg3dxRYtP6ZI62MgtNR
         CkCfJuKdyLVJwA2pEo58ykbTMKNophQQJGFncYp4vV6TOd3JShy5Il1XiCbXKMueo8
         OvhTk5ChHAZ9Hx+RkjVtBR1OFBkIodANZahKQrmEjfYTpY5+lao3+BJYmcGFAZeggB
         8YX2YBKG1WBJ+I3DFeTMIVGzLGb2Dyu3qNvnkArmMgIjA90gdO9aVDwEK2l18aaWNb
         MTmNZlV+AtUcg==
Received: by mail-wm1-f72.google.com with SMTP id f7-20020a1cc907000000b0034b63f314ccso1780176wmb.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LvBwPzZuQYg1sk1AcEyVLVG7UxYbxMueMK9OojLw1Q4=;
        b=X+8s5Rm7mr3d7eQnYrawM3AezY86zvoIolWOFz0/YuAjktEvz2QPm6sUKx0hDLAWFj
         win6/afUDSCTuxuqEpEMtbAe//rR/4/1/Me08UkQ2KHpH/1jCDAk9Mv7SLoLR3i+5X6N
         B4p3YFj5Vqvz4xzA8zdRZidJk0QRiicKhWeCrGekaQCIaEvAMqHuYtdgtLPIzOI3fYq5
         sjxS56SmEbDgbkz7ue+90m2t8UR0WCMy0DCqlcxmZx5N63jzfTHN/fXOwa9RgtPVEuck
         BWqdfOeLWkvTpEF45Xsb7cvlAfWfkI30z/d0JRIczJF7+Za+xIkzejcXXdmNglRYKu/e
         qw+A==
X-Gm-Message-State: AOAM531sPoZJQxby9YyX4eYVq6OrUMp/3j0va5QLgbHDJE8giXM9vLjL
        WYyYZ3eoylyD34ZoOWnOCC3RtRYoB634s61UnHn0F8YrHKdq++x5CrluKS0CvtabBpJ4AMR9U8M
        EHbCacY0RrhYuku5kydyYByJSRQ3p3OWZuPmOhGAXyMnXqxnG
X-Received: by 2002:a05:600c:4b95:: with SMTP id e21mr3819814wmp.106.1643130716927;
        Tue, 25 Jan 2022 09:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfP17LMlnVHGMliQrz4/SA8fpjZEApa5SVjlONjtvltbKWP+dIusViDktiO3K5mmPtxTR73g==
X-Received: by 2002:a05:600c:4b95:: with SMTP id e21mr3819792wmp.106.1643130716796;
        Tue, 25 Jan 2022 09:11:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linus.walleij@linaro.org, linux-fsd@tesla.com,
        devicetree@vger.kernel.org, olof@lixom.net, soc@kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org, arnd@arndb.de,
        linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, pankaj.dubey@samsung.com,
        s.nawrocki@samsung.com
Subject: Re: (subset) [PATCH v5 16/16] arm64: defconfig: Enable Tesla FSD SoC
Date:   Tue, 25 Jan 2022 18:11:07 +0100
Message-Id: <164313065136.81319.934364321640879263.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-17-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124143005epcas5p103598aa358ac35fe5e1ee762faf508b0@epcas5p1.samsung.com> <20220124141644.71052-17-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022 19:46:44 +0530, Alim Akhtar wrote:
> This patch enables the Tesla FSD SoC in arm64 defconfig.
> 
> 

Applied, thanks!

[16/16] arm64: defconfig: Enable Tesla FSD SoC
        commit: aeb62e360c0fffd9cf218a314647d0c7254becbe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
