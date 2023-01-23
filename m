Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D632C38142
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 10:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbjAWKCP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 05:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjAWKB4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:01:56 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A2DCC3C
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:01:52 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so10189036wmb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdnsFmNbrdKiXDK5mA+9lOKKIJ/fodMoPTrcBE3d8b0=;
        b=Wt4IQ0/u8mRIbLs8nRHWFRH3CLXBHzwZQy6me3Txzepw20y9bGZyBQGkli+HVeHGce
         Qb1zFaaMtjNip39iUjM1vJZ/6d98U/xWAPW2vniITuizVqLHqkz3tYCUyBVoFXomTRw8
         78O+FKtic1M7imTbzL+F1+fg84d1oBgRRJVPPhgXoOZGgd75Bvac2iWhdgyACIQYmOk7
         rEfkopaV2NRDJGPYFj5xbUjjpx49IjisnvWL/rti2MfS4GXzL+wMwiy3wY7D/710YVXi
         XH0o2yve0deA+/prKHxKsES5bIAL51DH4zF2BdPvnb6Lq7n9HtHjV0CJ3o5UZGCxQgQ5
         cPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdnsFmNbrdKiXDK5mA+9lOKKIJ/fodMoPTrcBE3d8b0=;
        b=z3E6Tla7ooYmacSP++CvTWmXDy9gfrxcQZfXfXeVmiug3epNBsuwmUZNw4toEVjvBU
         7ht3I/oRQsvbR1ahC3BHyAZ6Z8Uob1SXHJrH4R1lXE4OY1Z2zrIMvxR4aonITuwRF1QF
         TjIfqjyK3jn6vVp9dzCQi6cPGyjhO+34fHa7UxzG4O67QFnB50UoM+vmSgDJb14yRmGe
         8rGaECsYOZasN8C2GNDyKLrEddsFi0rF0gKxrsP+jDqUmlVTRnhQUQL+30TF+UlVVTfy
         gZkSMOfLlE+DyrJT4h6szaLKA4jXJwL/TKtwhkWouhAm2DxMzboK2FAVBMIAgdeIQzfW
         hcPQ==
X-Gm-Message-State: AFqh2kr+4i/EbkVmkCzsG4Qswgn3pf0XLK0sRcUez2TRF1NkFHlTJEdb
        cGhrHUGMBVWOdUeqHSOpdiDrRw==
X-Google-Smtp-Source: AMrXdXvvby54p3PUVxoYWQ06w3Nmoq+NRjJnHR3tTX5+ciEssl3hms0rATN2Izdl/MyNbmqN4AP1Tw==
X-Received: by 2002:a05:600c:4f42:b0:3db:2e62:1d69 with SMTP id m2-20020a05600c4f4200b003db2e621d69mr12821028wmq.31.1674468110997;
        Mon, 23 Jan 2023 02:01:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c4f4200b003db0ad636d1sm11050831wmq.28.2023.01.23.02.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:01:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: drop incorrect power-supplies in P4 Note
Date:   Mon, 23 Jan 2023 11:01:41 +0100
Message-Id: <167446806832.57213.14059225386091066791.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120071151.116272-1-krzysztof.kozlowski@linaro.org>
References: <20230120071151.116272-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 20 Jan 2023 08:11:51 +0100, Krzysztof Kozlowski wrote:
> simple-battery does not have supplies, but it is referenced by charger
> instead:
> 
>   exynos4412-p4note-n8010.dtb: battery-cell: 'power-supplies' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', 'pinctrl-[0-9]+'
> 
> 

Applied, thanks!

[1/1] ARM: dts: exynos: drop incorrect power-supplies in P4 Note
      https://git.kernel.org/krzk/linux/c/4069be845bbff7b4761aa513c30d6400e5f63846

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
