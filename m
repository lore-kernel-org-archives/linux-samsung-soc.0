Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D754C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242690AbiAYRNm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:13:42 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54820
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353040AbiAYRLp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:11:45 -0500
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1086F3F1A4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130701;
        bh=w7pNveLS0GBUcaM6xZHDvqGiuHIf5TR0krpcnow2fyo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=hqugDulmFV/YpJbTPBNKQtXXj3OCUXpThQUF+/NUp8Gt2EwQZKBnhvcs41NYBKFZO
         piUu24l5/PCp0fpK6R4goyAOzWrvTrx8qWjTEx55rlvucfs6N7EcMGGnshggQTnCkl
         BoUYo3Yiq9dN0t3KS5j9LpViBIm0s79S4XXZDS8kP4oODqBcQhLTbjKKxKR5unjUrA
         oBq2JLNmGk93VohCJwDT6tC9aIdnBS80XQYxFeGUWFG4tdpqrUwWML8+ZynBI4Ndrt
         Vvcd0KlIhZKGUE4aemziVwUSPkVI8ksN1Vq8f1kwmc07U2pQJmcdi7qkR9Zr9j/MgG
         E5YS8DFfdfeWw==
Received: by mail-wr1-f69.google.com with SMTP id g6-20020adfbc86000000b001a2d62be244so3334773wrh.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7pNveLS0GBUcaM6xZHDvqGiuHIf5TR0krpcnow2fyo=;
        b=H01fw/hx3GJj3LOiIaeIwN1eREmeoeIXEnedVDdjd8MrfC9mk6lvW4qWeZDDUykPXk
         Yx3eZOobnqx5dYJQDYdN6pa0IttyRkMNsDti62R08BHfjzIsuN2LnBLJMoM/LukcCjPl
         ciQ4Rm4gEJ3XYhjL6bH+sLf720hpkgVDxWkmuXMeFC3gK6PsD+7lCyhS5wbmhNHjHzs4
         hbMnVX088rXa/Ga8gXhHLyS8XZjzSE7DCOwtxmGgSvK6Hxj84hTBl4PXhELaiyDK/YIZ
         FgMHKh2CaWC408WFJZOr+Vyo2KZLzC3GCnoyVzr86H6w1FaW6ayLtKq3KGC1Nm8Z+qA5
         xzUQ==
X-Gm-Message-State: AOAM5338NYvJnWnfRljaeJ7rC+dDbtP01PF+PzWAP9G1+bB2IMfYcklf
        312/r2yoMoMIFu9m+1SlOize7l1uV8hO2+m9ESd79vW6IDQ2F67GEu772icEcROwZ7u50zGcupJ
        Ku9uBR5EsXxpbB2pENkc6fopqpF1pYec1cH+NUkGH6DAn+e0K
X-Received: by 2002:a05:600c:4282:: with SMTP id v2mr3842235wmc.78.1643130700815;
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0UJNIa6CQvbeScVNkgkIbqxoZi3ySJ1nOLLm6MxdhJFLNeQKvajyCF1/0whS+dTxXoqrw0Q==
X-Received: by 2002:a05:600c:4282:: with SMTP id v2mr3842215wmc.78.1643130700627;
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h127sm4477087wmh.2.2022.01.25.09.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        soc@kernel.org, catalin.marinas@arm.com, linux-clk@vger.kernel.org,
        arnd@arndb.de, robh+dt@kernel.org, linux-fsd@tesla.com,
        olof@lixom.net, pankaj.dubey@samsung.com,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        sboyd@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v5 11/16] dt-bindings: pinctrl: samsung: Add compatible for Tesla FSD SoC
Date:   Tue, 25 Jan 2022 18:11:03 +0100
Message-Id: <164313066043.81586.10760195237607935843.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-12-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124142941epcas5p4bbba53cfc2fc9862da9fd85d44de6e79@epcas5p4.samsung.com> <20220124141644.71052-12-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022 19:46:39 +0530, Alim Akhtar wrote:
> Add compatible for Tesla Full Self-Driving SoC. The
> pinctrl hardware IP is similar to what found on most of the
> Exynos series of SoC, so this new compatible is added in
> Samsung pinctrl binding.
> 
> 

Applied, thanks!

[11/16] dt-bindings: pinctrl: samsung: Add compatible for Tesla FSD SoC
        commit: 98ed04b33f43a80c0d9e218023abce3b47ca3539

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
