Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173CEC77B77
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 16 Apr 2023 17:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjDPRz2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Apr 2023 13:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjDPRz1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Apr 2023 13:55:27 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3921FCE
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Apr 2023 10:55:26 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-506767f97f8so2616390a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Apr 2023 10:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681667724; x=1684259724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7wT7n+DJMWXCwF/JmEqtyfQLfvwMTp3PMeKPlacVvI=;
        b=N50SBxfRyEvNTrmfJYbWrp3K5WfAffRN7269lKy7ZahDLbF6YzyDwCeQmn5st8ZNVU
         TiWP59+AIx+c+ZAGcexmwq8zozFdGU5WSKa0UB25+PDCSc4DR2aFOxSshDG+yG6lZTtE
         VMUmyj7xEqwhgDxlwjVLbKZKrUgLZnSKjeZhv+bN3aVy2SnxHo3wD+ssFpSxvT0fw9Ji
         nJvfEOqJZiPies9FMmCiYIx+QgQtaXzqnJjIOFIiaOXhUbVZsKOGnjX81ore0i2FBzsQ
         emUEEbZhA3wQAmVg2rwJObOsNrFJMsE1DgyeFgvnwHPLIUuX6x4NX+GzS89nY5R8k+q6
         g9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681667724; x=1684259724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7wT7n+DJMWXCwF/JmEqtyfQLfvwMTp3PMeKPlacVvI=;
        b=Anv1IUh/FidC3KJPm9rbF4363syxJb1F21fHgEI/bBGICMd0v9NZdGRaK/WZt7tJEZ
         61x8XAt5kbCUP7jSWilKJZe5RDDBdzV0egPi8Njg3RAS/AoSxVx/Dn4BNhT76k4VE2Pt
         ZP7SAXquxjXVDETiuH40vmo+zy+hSd8p+R9IvlOEeh/p+ZDA0PS5FE1DXz4W4xfl+yr8
         bO5w6rpP38Rr1leL4cIiKDE5vsDWW5yLuXKTwhVtLu47GbM4VfZbuh/Jdbb+REylb8xB
         csuakB1SrKcw3yJFLogry9D1GMF6EbvipVDJb7R9MLkl8/8+zO1Vi1t9ZdyL8rZKyDNl
         AHZw==
X-Gm-Message-State: AAQBX9dZOtqIa0Zqun4AWpoGvLEt3Is1W0sRGaOdgJactwmd6ADzvNg6
        updk3zJ4DjkSaB9mAb2nxOacuQ==
X-Google-Smtp-Source: AKy350avKh9PmUHvsOygNn3GPct8a9xHAE66Mg83Bz+YU/JqH0f5dabMl/mfcrMIbTTp5Lai6EdXjw==
X-Received: by 2002:aa7:d352:0:b0:505:394:157b with SMTP id m18-20020aa7d352000000b005050394157bmr12230901edr.17.1681667724514;
        Sun, 16 Apr 2023 10:55:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id b11-20020a056402138b00b0050690bc07a3sm2240983edv.18.2023.04.16.10.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:55:24 -0700 (PDT)
Message-ID: <99b7f216-114b-c01a-cb27-7dbcfc0c3b5c@linaro.org>
Date:   Sun, 16 Apr 2023 19:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/12] dt-bindings: clock: add Exynos4212 clock
 compatible
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-3-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-3-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/04/2023 15:34, Artur Weber wrote:
> The platform was originally dropped in commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), as there were
> no boards using it.

Also wrong commit. Reference the one which dropped compatible from bindings.

> 
> We will be adding a device that uses it, so add it back.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>


Best regards,
Krzysztof

