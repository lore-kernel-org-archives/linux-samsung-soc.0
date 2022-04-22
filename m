Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1B5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Apr 2022 22:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbiDVWPM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Apr 2022 18:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbiDVWO5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 18:14:57 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90DB313D37
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Apr 2022 14:04:21 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id w20so10448851ybi.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Apr 2022 14:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aYWN6UcwQn9hYVNP7fZKjl2zkX+QOzOchBwUv3s4NaA=;
        b=KCP19bQ8+TN5wujNrgIYpA+fa5UJ7pdOt3IlkVujAsJ8FfaSHSreaQjpwXjwEbpQMf
         JLB5TO8pPFe60g5ugRq/hJiCFDbc9WMseIIW7G+EsqF8zKlRYPzjvAYr0ZWZxceqtCLh
         gAfmHy1cCeOljPcOY4DWjEVmM1uj2aQQIRYWuhNQV9/M7g2CdHR0Zn01S+imG7K3phw8
         1WQ6XeHNGEKKdIG2Z4S+hwM+/BR7/8pt7bQSNra4xoO+vNQTLneNef+eVD1+asgcRFk1
         omTC6wbYNJh7ohtNzO7Ci4TBfSSjtrD1GHjgdkheHW99KeWHCv5DXQVzoDp6eqGvuHFn
         YGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aYWN6UcwQn9hYVNP7fZKjl2zkX+QOzOchBwUv3s4NaA=;
        b=lIwdXUce6UxwQaSKDnsiXxgRoCIgD0i3I/anIB6glxvrQsxrZmeEH9czkujVlD6i5W
         0hQ9d3Gbi3cexwnIUEQ9yH00jZ1stCyNnyT5cW0fV+2QdTmhOhxpJXIFVX3xbiWIfEtF
         0yjtR4WjqOscc02FMjbZgdTRMn3WNChoAl7kV6+4t8cDi1WvL2DG29LSpOrHWzSzbRMz
         7Op1Y3FIl/ZPCwF4O5Qzv3T4O4nRgtAtOpyjucuhbOa4s/Fsndhm5KoW/uFv0XusIbdz
         eOYa5S50b4R3x3iC3DisUmWL1ktG+NCJLaRvH/Ik3vB9FrX0jo4P7LOGxr5zKVCw4jzL
         FeLg==
X-Gm-Message-State: AOAM532BlcbDkxWJreIZDZb7dzUaBd2TWMeVzb/YfkcBPeWBLwMwqgon
        dnoO0o8Ngf28nM16PgD+QwFwmR6eJz7+n9E7nIIGxA==
X-Google-Smtp-Source: ABdhPJwOLl69ONZse3LlMSadJfpSlZ5uJgM87jIpZDIuTAvisilaQaJ5kbGJbmhH0Gsjd3SEDd1krUQk9FE89Wl96E8=
X-Received: by 2002:a5b:8c8:0:b0:641:e8de:a6f4 with SMTP id
 w8-20020a5b08c8000000b00641e8dea6f4mr6305577ybq.533.1650661461208; Fri, 22
 Apr 2022 14:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220422102541.33372-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422102541.33372-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:04:09 +0200
Message-ID: <CACRpkdaLXQf6ZuH9VHAKCH2Qe2EjHZEbHmZffCy0k5K-xO29+g@mail.gmail.com>
Subject: Re: [GIT PULL fixes] pinctrl: samsung: Fixes for v5.18 (current cycle)
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Apr 22, 2022 at 12:25 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Two fixes for the current cycle.

Pulled in for fixes, thanks!

Yours,
Linus Walleij
