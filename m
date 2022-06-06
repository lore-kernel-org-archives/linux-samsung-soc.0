Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A38C43334
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jun 2022 09:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbiFFJWw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Jun 2022 05:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbiFFJWr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 05:22:47 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4ACA18D
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 02:22:44 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id q21so27742310ejm.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wMcWekleBU1R4ydXfALVXkI2NKLW7AgpvxY4ncIRacA=;
        b=ib0YOks0X1Qk7/rvety5N+U7HD32Okyta3mj9sEZg8dYqtUZg7+DA7NaXUELmLiEF7
         1fFBNzRypcuwjK6fFTXHp7ms92pdTL3hyJwVdeSHdlD8GqEfsVOxQ/0GupB/M1JCjrdT
         kY8o7LrU4OmTs1iHCSMz+/DB2A6D9/EdzcxYGCqQLULY49+KavWX9AxdpXQFmtPpC+0G
         8AQ0HpjUlCGDd2LwMZXDZpTangDauyCez+HGthSl37E1lRCGooPPFpNIyGVuYmk9s5jO
         dknBhDL1kztGNkomqf7sp9WwnuvzEzDXESNZ4XCq7nE1Clk7y/cDviy3iqhUJVibH0HP
         P3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wMcWekleBU1R4ydXfALVXkI2NKLW7AgpvxY4ncIRacA=;
        b=YbHMvTnNRcakz+P2Z8RZ6zPnJLJQ3epz9o0lm8POkccv2vtkIWWh/sDvU2i5gtpY49
         qsFPvEUfNXWIbmSn7GFUqy/wtq0uHSzwQ/CR9ueuKTHhAaxVNLz9iTeQJB1GC3iUJVl4
         0fsOfM3EixvV2/drWYt5vFZQp5TzFAEPyaQTB9u+vNdySpScmAWGXYop1628LrAC5Cj8
         FcdK6cVpDhQSDffJkbNQVTgPgxjBDFPo/2CVbr8BwNcuRryF6IX5s48yg73Smzn5NIG0
         zn3zGJjTKJ52p4cJJkIbqnHSJFgyo9fluOR8a0F7G4FONhPuWRQyStsuBAjrL35oy0Hs
         vVqQ==
X-Gm-Message-State: AOAM5305ChK+KbZ3q04ZwqIQpVEXX2bn5VuPDny2cOJS2tN6F3BgW6Mg
        A020RhY5sXxj4WYDru6wZTQ9Wiq8z4P65A==
X-Google-Smtp-Source: ABdhPJwsZCmETJjxs+Dr26KxzjDyL71bfBLLMXwmtQkvBRv0/92dlzjh8V9/I77+6fWnkKoOZnYS2g==
X-Received: by 2002:a17:907:c29:b0:704:fbb:1943 with SMTP id ga41-20020a1709070c2900b007040fbb1943mr20412637ejc.486.1654507363202;
        Mon, 06 Jun 2022 02:22:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u21-20020a1709064ad500b006f3ef214e14sm5956397ejt.122.2022.06.06.02.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:22:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        Kukjin Kim <kgene.kim@samsung.com>,
        Tomasz Figa <t.figa@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: exynos: Fix refcount leak in exynos_map_pmu
Date:   Mon,  6 Jun 2022 11:22:34 +0200
Message-Id: <165450734050.62970.14209862492760707950.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523145513.12341-1-linmq006@gmail.com>
References: <20220523145513.12341-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 23 May 2022 18:55:13 +0400, Miaoqian Lin wrote:
> of_find_matching_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> of_node_put() checks null pointer.
> 
> 

Applied, thanks!

[1/1] ARM: exynos: Fix refcount leak in exynos_map_pmu
      https://git.kernel.org/krzk/linux/c/c4c79525042a4a7df96b73477feaf232fe44ae81

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
