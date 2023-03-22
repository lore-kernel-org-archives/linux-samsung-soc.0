Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4436C6FD1C
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Mar 2023 17:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjCVRsI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjCVRsI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Mar 2023 13:48:08 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCF135273
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Mar 2023 10:48:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id x3so76172712edb.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Mar 2023 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679507285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr6TeKOzsge+FFicPSnu2Sq+O0zv/SoC08/DpMmMHaE=;
        b=Q4T2XCaOfbJbsZAlVZtoSvsLC8ZbgLbU3no4b8QA+ypbFvYTOXeDddpLcrdQYRumsa
         M1WYQ5GZxmCd0EXCKV4QJRW9NsTApwhrVLMQd2qYRw8qD4I6WlCkBxS9zEWoQKN6qV5G
         P0DxyD8O+c/QFHAPnShd1uy6dCt3Tn7WhXw/xjDm/GDwcc5l0E1015keX8KYbdLQ7c59
         ImKJbPkfkb/4H/1Q8j92Z8mK5v8EtuZ5LwL6jELS7oEbHcn8El8YO+D7RpcvGZv3CD8n
         czUGy48AScGmIiz0GeF5KwSC/o8AC7e3FubVBnxmzFXAxcKJX2p3gUuOOms0tDrHmTxC
         gEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679507285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qr6TeKOzsge+FFicPSnu2Sq+O0zv/SoC08/DpMmMHaE=;
        b=cvzEsm0n9SSXLgyAX6EIcN652ACS6YdYeBVDNNfOpFFrW2S/KXAREZ4UzZS2V+D/oy
         BrJvEKyMdOD/GrYaVJTDCYlh7gNStsFLP66pD1yH5PowRWivUYllnFm/XMmVuHkuZcQz
         bAYO4e34bpTd89Sjwk4VcxtAJMWJcdndqh0754D+tDipQ/G7l+RGKCebVEkrmxhoY+Lq
         mXw8hDIw5F2Pd+/6zf+OmHOvwNmj8WAxRA6ludDxhaqLow6SGgjuTO9sLrKH3fUZ4Boo
         blk1n2eIMI01+lGMWbZzT4wyZFXz06A33A29s04zPZMEearhlrcotl4MZKNaF8FhKcGs
         SUMA==
X-Gm-Message-State: AO0yUKWmRQrqW9K2wJr5kokLnALVuHZojnzhLss2LO3nicWlRohJllek
        jOFPo5PFG64iYj3cf6G2R3T7LQ==
X-Google-Smtp-Source: AK7set9kbuZpghXxHJT6c08wz2KY1zmFVsr1oRZl6hQ+iQKsD8J3Q/YQAeWyADmeJizgjuY5CWSc2w==
X-Received: by 2002:a17:906:e0c1:b0:920:388c:5c60 with SMTP id gl1-20020a170906e0c100b00920388c5c60mr7757836ejb.41.1679507285210;
        Wed, 22 Mar 2023 10:48:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709064f0700b008cda6560404sm7495732eju.193.2023.03.22.10.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:48:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: EXYNOS: Use of_address_to_resource()
Date:   Wed, 22 Mar 2023 18:48:02 +0100
Message-Id: <167950727877.811583.5299126381937296479.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230319163145.225323-1-robh@kernel.org>
References: <20230319163145.225323-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 19 Mar 2023 11:31:44 -0500, Rob Herring wrote:
> Replace of_get_address() and of_translate_address() with single call
> to of_address_to_resource(). With this, use ioremap() instead of
> of_iomap() which would parse "reg" a second time.
> 
> 

Applied, thanks!

[1/1] ARM: EXYNOS: Use of_address_to_resource()
      https://git.kernel.org/krzk/linux/c/cb56f508e541036ad41cb9a5afb46339b2f83b9f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
