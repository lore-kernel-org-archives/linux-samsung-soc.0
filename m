Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF2DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 07:51:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36F2161245
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 07:51:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236757AbhIOHw3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 03:52:29 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51244
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236746AbhIOHw1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 03:52:27 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B5E5F4025E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631692267;
        bh=3UuhH6DfF97G63xEabBbDhstzQxGbUL43IU2MzmFk4s=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=UYw9c0j9eac3HCzWQmm3jQ6gJ18zP+LHIMsuEOOoIsof7k7nFQdee+EYcCGmN2D1N
         nijS9C4zfkM7hNnbEGnEBrKtcI8PnaBWg4WdS91ztGlhCnCEdViv7rqiP306JrbZKY
         XGBpobvadbOYK2Qnqjt3C1IZAU7NZwkwMq8Z0y8JB3L4+QATTyZOqHHD74LON1QvSP
         3URttKG9mkhakfKFKQhpnqeZ6VD6e2NbyQwi+TpDFoY7SpCoJFSdXhD7jl9Jt4eIVX
         CUX7RP9Lk/O3KrrpQM4jU7oGGxNCMPDR2dRq2LhKoeFcecpeZJxesqX9IcpPCAwDEG
         9L1VfxEUFUs5g==
Received: by mail-ed1-f72.google.com with SMTP id y19-20020a056402441300b003cd8ce2b987so1112121eda.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 00:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UuhH6DfF97G63xEabBbDhstzQxGbUL43IU2MzmFk4s=;
        b=traTxYcY5gohPUDhR4j/9mcJDmD2OxkAfgOeHCb6T7OjOvFXQhgJOLaHgkzWbWSpXa
         9TZS/Kd7jMmya+H6eDCXjPkOrVMPJlefKNAEdlm+nGBzORXvF+JX6qqfX8JPQXq0qH4S
         /x/PoYndxabNX71oVcc/gULli6M8GpnbFTSM7NZw+LNScv0T0Pka0SImH4nBUs7Z6vaA
         9lqn8ymZt5exJz7FGr9DuFo9ZX7lu2kGRz3aNMFnwufMGhzroeeFjcxgue0+HzO3DOq9
         VRQ5Ba4TdxOmAMcbV8vBH9/DpHN2lb9k+hFqSIRlN/zTE2UqmsPi3IOijLE8fk/zAmEo
         grPg==
X-Gm-Message-State: AOAM5303kHeC5vedrIpdpLoralX8sR2WfDymoyn5LsW92Stn8mb5I7qq
        neXy93FIOFoziUqOj/juftdU2ifjPEwITJ94K/E4dvT3FQV6wv96U+R3bhQROYw61B0Sw2xrr2+
        0WTVQ2oGpm/Ks3Rer5Eyujta5shG8Rely1tmrtq7o5EdKecAD
X-Received: by 2002:a17:906:9aca:: with SMTP id ah10mr15858277ejc.471.1631692267470;
        Wed, 15 Sep 2021 00:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ3105Y/iQTlTiucEVyhs8Y5dCC+GLZzdNSu4AJG3m4GNgDvfkECg7+b3PmxdlHBXvw0U+bA==
X-Received: by 2002:a17:906:9aca:: with SMTP id ah10mr15858264ejc.471.1631692267342;
        Wed, 15 Sep 2021 00:51:07 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n11sm591922edr.51.2021.09.15.00.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 00:51:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Kyungmin Park <kyungmin.park@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        linux-pm@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH v2 4/4] ARM: dts: exynos: align PPMU event node names with dtschema
Date:   Wed, 15 Sep 2021 09:50:58 +0200
Message-Id: <163169222223.16372.15525688455985156121.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820150353.161161-4-krzysztof.kozlowski@canonical.com>
References: <20210820150353.161161-1-krzysztof.kozlowski@canonical.com> <20210820150353.161161-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 20 Aug 2021 17:03:53 +0200, Krzysztof Kozlowski wrote:
> Use hyphen instead of underscore and align the PPMU event node name with
> dtschema.
> 
> 

Applied, thanks!

[4/4] ARM: dts: exynos: align PPMU event node names with dtschema
      commit: fb9b199e562d66af90f61d70eb737fa5e4deac2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
