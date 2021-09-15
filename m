Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5F4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 07:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2390761185
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 07:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbhIOHwX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 03:52:23 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51208
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231631AbhIOHwX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 03:52:23 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 18B8F3FDC7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631692264;
        bh=ZPPsEFlwBfA1eTgPCoHOeJvzGiA/qDxA8TsO1MrIx1M=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=Vwz+q9IKMN4kFjk/Q4+bvGGw/Px279gxdBJpKpf2xeA1vB7qQsZ6YrJRMGFRU336o
         qg9LukGIxiItYRw7gyP2SEkWKj1KsDgLqFluDdBLfGPDltupiXgWYgCke2pTs4/xcX
         deSsLK26ZGa4fSu0PuxG/E2YWJ8eCWwXv468x6kTHy7Xxgk6Ct/DC/i9WLMRMH/RUH
         k9tS09TD7FVS/6+X713m012G54TBFx5hopSkQ2i/mVHxDgw23k3bf9nLcVxH6I+LA/
         00P9jbaZXJfiTP5KfVuW2SchoBBRUzmCovNj9OGqm98xbQEBTnklf++bdF1/K3YGe6
         rfG7/oF+bFIYw==
Received: by mail-ej1-f69.google.com with SMTP id ga42-20020a1709070c2a00b005dc8c1cc3a1so1036432ejc.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 00:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPPsEFlwBfA1eTgPCoHOeJvzGiA/qDxA8TsO1MrIx1M=;
        b=ewE3E6We1862tLUz5I2ELnKrDsHVQmpHd9mg9X6wYzwKkz9f7T3rCnp7Td0VEnow3n
         anxM/vaYoS4tTRuXngfYwL9Fc5SJ1yZoFd1RIn1XFYgU5MANGJho9s87nXtf7GF/wYaS
         5YmxOj6m7eTUhBEFt8wtO6nA9q5h7Hcyg775yMaEnRJ4QkCUqv65A6EIIssq0Y/ZGw3y
         dqIdSc6AYlf2nNs7SHtJx81AADWQfpLCr34BpXQQ/AFqbEl9isMC03JEulOCww45xOPk
         ZbKpMhHAMscuEOrk9cyWPkaapDkYobdO1/hQkOqYFYxlZl+c50XMQzuqMaRko4HV4QMb
         ecuQ==
X-Gm-Message-State: AOAM532lLHSSpOh/HL2YxQ0AODZv5nsMUi2fkVA4fyXkyCNBOeDfhUZy
        wWAVPRNq1rcbdRgTDpXFpyiMHfrL6mga70YAoB04vVouLlFmvnG51LUindMyn2FbdXuirnSwyUN
        Dl2NeasgypJw2alG3nIGyMrlWPS6YcKg4oT/bUeHI/ibdlNNq
X-Received: by 2002:aa7:db4d:: with SMTP id n13mr21505139edt.398.1631692263449;
        Wed, 15 Sep 2021 00:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+WyCHnD+lfmB0FjoPiCQDeKX4wp21vo3/85j5pwzMA7v8zxcjkjew58uNFvFPYNOOjESEbQ==
X-Received: by 2002:aa7:db4d:: with SMTP id n13mr21505124edt.398.1631692263328;
        Wed, 15 Sep 2021 00:51:03 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n11sm591922edr.51.2021.09.15.00.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 00:51:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: exynos: align operating-points table name with dtschema in Exynos5433
Date:   Wed, 15 Sep 2021 09:50:56 +0200
Message-Id: <163169222223.16372.5421804464819720795.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820081458.83406-1-krzysztof.kozlowski@canonical.com>
References: <20210820081458.83406-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 20 Aug 2021 10:14:57 +0200, Krzysztof Kozlowski wrote:
> Align the name of operating-points node to dtschema to fix warnings like:
> 
> 

Applied, thanks!

[1/2] arm64: dts: exynos: align operating-points table name with dtschema in Exynos5433
      commit: ee3b1f976c5214b79d939ecaba42f9e83b5efc86
[2/2] arm64: dts: exynos: add proper comaptible FSYS syscon in Exynos5433
      commit: 6de3cc6db06d2b9ba1e614aa58a413c9f8f22712

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
