Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38617C001DC
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jul 2023 09:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjGTJhy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jul 2023 05:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjGTJhf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 05:37:35 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C67E448F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 02:32:41 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9928abc11deso105675966b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689845534; x=1692437534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zw3bdOgURyGZIIE9jpH5JtTpJ3WaiiUVFo6x2TqJrlg=;
        b=NM61oky2WpWNmPn9JR/sNPqgSvsN/awLuT+IZG9HQjGdUWRPU0NCCdVSebojvXrlVx
         lPdkVv9JQcoV3Z9fo6iEqymssPeF4WADUu92trATw82IaQP2IoZTcbgjAUhydoZtRqDP
         EfnlqMQrw6xw7VWodHAC/CmRJaQ+COqbVZoqy5abFX0/ptoV2pFmzIU/dE9osq8TBdVp
         P6QNox/H8qN84IjvUnwiOPEatv+VB/80O3+XK461HpICdetzPpmlnZTVo9pz/1MtjPTB
         EYMHfVZ145y5IMGi8SKmqOO30xTob09chPTtyt4JpsbENFLnmunu1TAMVWW333Lijndh
         K10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845534; x=1692437534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw3bdOgURyGZIIE9jpH5JtTpJ3WaiiUVFo6x2TqJrlg=;
        b=iPeSrqS61vXLTBzlw/7SjKzsHTaaHz+NDMWJW3EjK3RL+F1KZNmzVUkwXCV2rHmISc
         8nw4FqdGHbt4773f0t3P0msNVIfK2wuyGNtGLCNj7BwFLULsn5xO1p/yiB6Kx+ko/tgA
         iAOh4ZHwAQNevZ9rpItBftn2hST2vZG2cXG/IOir0sOzf09+8xxXDQnOSqxv2KGHJ/w4
         sUQRmM+TO8xhEhqejdfjoKnTtst5DyyDbVvP+dvAi+8SID6GOdePyShHw/IiCfkpGihj
         h9S7nXGBIHU8ZVw1yBohkVHOsPbIrOBkPMV0UuWbGc9NrkD4GNySulyXmClqwgtK5rVt
         AOzQ==
X-Gm-Message-State: ABy/qLZ+jCpBJ/JmVR+1wLBu/514HeF91bXXXkmcWpv5xsYhZAtxfCaI
        eOz43N98mfLPaz1qssUyMUg96w==
X-Google-Smtp-Source: APBJJlE43eipzZ1egWwNTBOXwhW52noTrldVfENXVIc1LoMlYeyn6gBmCyKcncjwJoZ0UtJOoqRW7g==
X-Received: by 2002:a17:907:7eaa:b0:979:dad9:4e9 with SMTP id qb42-20020a1709077eaa00b00979dad904e9mr6123529ejc.50.1689845534461;
        Thu, 20 Jul 2023 02:32:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dt15-20020a170906b78f00b00991bba473e1sm430204ejb.3.2023.07.20.02.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 02:32:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: samsung: Explicitly include correct DT includes
Date:   Thu, 20 Jul 2023 11:32:09 +0200
Message-Id: <168984552538.79008.14079472296169361189.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714175147.4068046-1-robh@kernel.org>
References: <20230714175147.4068046-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 14 Jul 2023 11:51:46 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: Explicitly include correct DT includes
      https://git.kernel.org/krzk/linux/c/4c4458375c5633954eda8fb9e7d31d56836b2bbd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
