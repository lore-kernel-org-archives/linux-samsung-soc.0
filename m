Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1345FECAAD3
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Sep 2022 12:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiINM6y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Sep 2022 08:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiINM6w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 08:58:52 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730FB7393D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2022 05:58:49 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id y17so29462681ejo.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2022 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RbeM9DZniF3+BT0n/bil36L/UN9NE1w4V5SmRGWQ15E=;
        b=Sk9Sv6K0LAVqg5NkER8hGVtz1lY8vgR5kQkURSb0bBWvQdp6b5TRWDYlnqe1IPls//
         kwYrnHjMmJVEYrRZs992Y4+oIR6cu7Qz4y/BT2qhZv5wJjNt3hQkl/GFFN6rWqinAd4D
         mYQFwi/D5TQ06aKzoZBomC1Cz/MeoGKvz67RuyTDlopCePzGXtBPWTDz70yGbfnE7AUD
         zujS0IGqwmqxJxbbKR6yknxyrpr4qGcgScMh2KBGF1sBDl8D5Sx503EMGJB/BLkSdCeU
         7zQeDy1lQdFRmNJqb7d6wdaF9Miwbq1OYkadFT3vKa64e8cEsZrRezgTwhrpOC1nuHX2
         iPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RbeM9DZniF3+BT0n/bil36L/UN9NE1w4V5SmRGWQ15E=;
        b=mSl9X4DtQp/+wWpNsIKVTn5Pfjae1vu6YJB5qK1s8gn2UiEXbzGCxauFtDwMWjowBf
         djNxrRhLQ36FWOfaQF3NWv/XO21Gue7HwNK6jJBAOK3cKZJTmuJ6VQEtvWjnvxFIZyft
         ovhngWMJcOFhgwrq1EhE9WZea3OHVjoMqhu1Nn3KtZROsGqHCBdBHwwlxIdyoVyP0dkV
         UIHCatMxsVAWt0689dbV3Bf0W4qcoBFz0czI0X/DMNcn4OvRvALsvln3QTtiu+lNXjC9
         EiuksunM9u32rErULhN80Te/YdAhWhIrg6c3duL8cWHs3H6sHhicWibpkrRelxQsQPlJ
         Lplw==
X-Gm-Message-State: ACgBeo0hHhWqDv8wGb+cXrVOTejLS7rBCPexi80PkgzjOQkUBakvbRjn
        d9tNzlweJNZcYrLCk1gQNEKJA9Mf+OOJRHuGU7RdpQ==
X-Google-Smtp-Source: AA6agR4JR88clS0aetO6jT0vyk4MuwBqg1K1qnwtnMfXx3GWwDQs4vpwTRHZrGOnQQePAzb8qtteFI0vsOD0JzLVzAU=
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id
 ho30-20020a1709070e9e00b0077f96882714mr7738909ejc.208.1663160327903; Wed, 14
 Sep 2022 05:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220913164104.203957-1-dmitry.torokhov@gmail.com> <20220913164104.203957-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20220913164104.203957-2-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 14:58:36 +0200
Message-ID: <CACRpkdZaVrF43K8hSyamd99b+tCs-nEsKH=1oqo=5ww4v6EKfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: s5k6a3: switch to using gpiod API
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 13, 2022 at 6:41 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes one of the last uses of of_get_gpio_flags().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
