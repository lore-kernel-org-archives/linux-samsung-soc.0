Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B49C0015E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Jul 2023 06:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjGQGGJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Jul 2023 02:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjGQGGI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 02:06:08 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C09B1A2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 23:06:07 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5217bb5ae05so2094113a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 23:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689573965; x=1692165965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rObatz14ueoF+HCkin+hbIMgtGfTqQ6Ld8ncZsAxwcY=;
        b=qLOgEzHNGvVAoU8wOniw8eXFPi4VklA0xlUgO4lyXSlRfh3ayCpZbcAV5Zpy1MwMNd
         eJv8cGQzg8dfeY8P2VOBphrZL8n8HlvjQxQOWPTIIZaYMyTE0HIaQl29JoZaC8/0P9eO
         bRc1KhSiMlrpLF0cOP4e8TkDNqIxxYQb97F4YIJw2svQfx3YxzHhpIY5+yIxBCO1rvuu
         HBnzGBurPZO8zS74mIj+vhcR9+RL3gKpZA1kiF0tBB9TfilmTyvZ6VpgksYrTXmTJRQu
         tt67n90mbo+8HXKV+YCel1MvB/edCj3uA49sYwy7lpCojXYvg+G92KqF/lJA9a+YoF8s
         Hl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689573965; x=1692165965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rObatz14ueoF+HCkin+hbIMgtGfTqQ6Ld8ncZsAxwcY=;
        b=KSBhRBw+g2CJGjSLRMVxDEcj9Yiuc1IsB/QByn0yqLQmIukBOKcNm1EqPGK5GCLwvg
         Xo7Q4GHU0uwEegpRDHuII04tqRL3JMmr+zH67XP23bFf3BbvHmOW4KODgm2Ijjvva6qR
         QRicOdnbiMeQgBG31r6aLkEayPJ6R3HAfoRgCsdviW0iz7rVFLcwf/ZkbUmse0povNaw
         K9V5f4IM/eLBB6oOMwzI3dB7ltR3oZ28i9unFMWT1DhNpCqwP1sfS19N9gcIbG67BS9R
         0lyXFjFAois+EnhGXrZA+sZUa/cTn+o/KLvap4DxR8poi3i/Xu7hH7RyvGksTI++0AcR
         hZLw==
X-Gm-Message-State: ABy/qLZr/+P6xRPXgZARkSkzKlpSd/Bv1e60pDc8eYofiYTKb0aA9xHR
        nankjavQuHraqFhyAZ9Gru0mXw==
X-Google-Smtp-Source: APBJJlGTHRC3PuFHAHtEUyE8XzlIJ9U3PtRyIgUAzbM1Zty2/lq/BcA2oclI2EfQshmAed/s0k7p8Q==
X-Received: by 2002:a17:906:535b:b0:993:fba5:cdef with SMTP id j27-20020a170906535b00b00993fba5cdefmr10319928ejo.8.1689573965708;
        Sun, 16 Jul 2023 23:06:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h19-20020a170906719300b00993cc1242d4sm8733671ejk.151.2023.07.16.23.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:06:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: exynos/i9100: Fix LCD screen's physical size
Date:   Mon, 17 Jul 2023 08:06:02 +0200
Message-Id: <168957395552.5244.10002368214051254757.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714153720.336990-1-paul@crapouillou.net>
References: <20230714153720.336990-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 14 Jul 2023 17:37:20 +0200, Paul Cercueil wrote:
> The previous values were completely bogus, and resulted in the computed
> DPI ratio being much lower than reality, causing applications and UIs to
> misbehave.
> 
> The new values were measured by myself with a ruler.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: exynos/i9100: Fix LCD screen's physical size
      https://git.kernel.org/krzk/linux/c/b3f3fc32e5ff1e848555af8616318cc667457f90

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
