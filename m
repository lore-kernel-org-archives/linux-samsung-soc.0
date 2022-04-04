Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284CFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379690AbiDDV1d (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379364AbiDDRDu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 13:03:50 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3B140A28
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:01:53 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id u9so6774970edd.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eaDWQWz1kiQwWpxivLYYrV+X0cEZrsrmIAZxsaFLj0s=;
        b=gAScoclBpW6c8jHDTbBeFYVOa8Vb+lZKB19UpeLijcAa46WH1Ox68XOcWSaAUa6OBV
         regey1nP+Y3uKapqeAPAX4mWaPulwjzHqwqatwf8SxMB4kos9WXVww5xOBhuXmjC13Jg
         9LDRvPL3S9pXoljZ8d3MmIY96mHXRSlQc0i/huBbI0IptKdGmuAe8HbMgFq0jCVbJQL9
         k92n27ryfAkqptSU5w4CditBkdG1Qciyzig70GNy9Bafz2/+PS6+2XTB19NdgaENJ6f1
         OS1hhUufxYUb3RelMQPm/CTPokqCVWknj9w5a+Rl5K2SdT1rIIasATZT5878meuX85RI
         OTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eaDWQWz1kiQwWpxivLYYrV+X0cEZrsrmIAZxsaFLj0s=;
        b=MKLZ0+soU47nFpK+dRlzjxfKOPGc5E8fBYBa1ekvejZIBKwoVUYbMnwA7eE5eb65fr
         p5mH0mLfta+yhWjv3ZvsOV6HvM+U8N205xbQ3jT1cHqG/r3Qjukn0ERlq4TYrYexxAnN
         0ayjQKYdFA7/qUuBJNxIE1+otkW35MZ2qRjKnhJq6TrsBEs5fTn1+Ib6beQtd67fzpe6
         OpLEJlGNVm2Mj1l0iw85MmVJ9mgm4E1xfrmUqtk/8+2Nw4AZMbh3dS3qFZDFoLHTA2vd
         lGYFj+ah06qo5KI6PVKi+8Fwc3Gm1jW+m+qYzeHdvlMYdyXGcN5uMZyjtRDAioiVtcjc
         XLKQ==
X-Gm-Message-State: AOAM533TBoYDmJsNlYke0q5+zsatnC8mYjwQGXHvB7oTdOyuCumpKdYd
        ZvTQHwkIJeDi6VLMB0ZKwN645Q==
X-Google-Smtp-Source: ABdhPJztm/eMGvOu12ArL6gqzftWaXUdqGzWTTBrItmoOSsRyFaBAtJtYP+WVN7AQinWoayC6HgN7A==
X-Received: by 2002:a05:6402:2043:b0:41c:da2c:2d5a with SMTP id bc3-20020a056402204300b0041cda2c2d5amr1132137edb.373.1649091712122;
        Mon, 04 Apr 2022 10:01:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b006ce371f09d4sm4557770ejz.57.2022.04.04.10.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:01:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        kernel-janitors@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] ARM: s3c: s3c24xx: fix typos in comments
Date:   Mon,  4 Apr 2022 19:01:42 +0200
Message-Id: <164909169269.1688455.6988886329557682550.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318103729.157574-5-Julia.Lawall@inria.fr>
References: <20220318103729.157574-5-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 18 Mar 2022 11:37:00 +0100, Julia Lawall wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> 

Applied, thanks!

[1/1] ARM: s3c: s3c24xx: fix typos in comments
      (squashed)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
