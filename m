Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FA9C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 09:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BA3C611C7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 09:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240111AbhI1Jyv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 05:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240097AbhI1Jyt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 05:54:49 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F78C061776
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 02:53:05 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i23so57038580wrb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 02:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=b58ZkjYpdfj8zDbOMDe+XMN5ekBtkvL865AkT93i3pU=;
        b=wkRc0BI6GDhJRiy8HXXE7T5icvX0PjyPg1QyX54AUeRJiIP/QPAF6BCRJVQYrdhK68
         23Ap+SBbac9eS1dv9Y3NhuP5SBs+/MByhatixuu6LCYZK5gGNgb5QFIcC2F9b1Imu3sB
         Y6vWgcbk5YQ3pM+feczlqVGQmPXAhF7kZ04Et/kRNnex7JlhT38dVEyYqwPcnBC482xB
         pm015Z7VOldE9+Ymt+ckR+D10SAj0vweFXVqczw5BeASbexM547N95sQ0MiDPza7xrvT
         MDx7HtlWiyy2hZtM8CxbTrtRIk+IAtI1IuBwMPCr20n3v4LAEcgYm+ay8Ycf6jhT0CF2
         mxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b58ZkjYpdfj8zDbOMDe+XMN5ekBtkvL865AkT93i3pU=;
        b=t+Gbq9pq+qAq9OSYYvXsFn1q/FcQQ4NOtn99LrfvoSihR+2+OmmbE1EoxTwy/t2XL/
         6QHOG3HqNHD/vL+LgvR95FzH/N7nl4JjiWWv/ooBJagc7r1ppjLUmr3536a4nwu5xlK+
         rBDmD0n/9v7d2p8d7t63jr5i97QwnlpIIt/nhwCpY2MIBXEcLN11KzIzhTbbhfEz8/q6
         T7NxiEaUKomPjJA5K5v1a+dPq/sN9hFuTw8lIKOhGwOkWkL+mn1eXqI1aSrZxspG5wPr
         c5wXbjZcaLDP+Bwg/ibYAZAy340oilJ+sZl6XbxGVHkwnvDQOj50VAfxRrNQAQBGHiVj
         8FiA==
X-Gm-Message-State: AOAM530X/27VOd9bA1jLRWcAbSBz85LjMEpsaoZkx+/8CFFJqIGGSHvP
        Lz4XudjOiIH7LQO9qYxIRRgwHA==
X-Google-Smtp-Source: ABdhPJzEvwKkgJZre0kQFe85rHGy9UvvptMGV56tfZJdHeTwlBHDKbP53wFmXle+if333Y2MYHP+hQ==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr5254004wro.99.1632822784252;
        Tue, 28 Sep 2021 02:53:04 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id m2sm2208067wmm.3.2021.09.28.02.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 02:53:03 -0700 (PDT)
Date:   Tue, 28 Sep 2021 10:53:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v2 2/4] mfd: max77686: Do not enforce (incorrect)
 interrupt trigger type
Message-ID: <YVLl/tJAYU5sEFO0@google.com>
References: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
 <20210602110445.33536-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602110445.33536-2-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 02 Jun 2021, Krzysztof Kozlowski wrote:

> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Interrupt line can be configured on different hardware in different way,
> even inverted.  Therefore driver should not enforce specific trigger
> type - edge falling - but instead rely on Devicetree to configure it.
> 
> The Maxim 77686 datasheet describes the interrupt line as active low
> with a requirement of acknowledge from the CPU therefore the edge
> falling is not correct.
> 
> The interrupt line is shared between PMIC and RTC driver, so using level
> sensitive interrupt is here especially important to avoid races.  With
> an edge configuration in case if first PMIC signals interrupt followed
> shortly after by the RTC, the interrupt might not be yet cleared/acked
> thus the second one would not be noticed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add ack.
> ---
>  Documentation/devicetree/bindings/clock/maxim,max77686.txt | 4 ++--
>  Documentation/devicetree/bindings/mfd/max77686.txt         | 2 +-
>  Documentation/devicetree/bindings/regulator/max77686.txt   | 2 +-
>  drivers/mfd/max77686.c                                     | 3 +--
>  4 files changed, 5 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
