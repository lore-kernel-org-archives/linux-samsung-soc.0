Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D8FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 20:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239761AbiASULk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 15:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240108AbiASULg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 15:11:36 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01986C061401
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 12:11:36 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id s9so5965455oib.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 12:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Ux0XE7RoJ9M9u9eFrS5FvbzwFObKaVh7eojK5revoSE=;
        b=OppY9DT86SovagpCZvYO8aRmIb/yj57hBcyw+SsmOCeJ20AxLkGpxulk6NNYQ6W4Ll
         YFleAZQ5HmGZoRqFDQosyuscrvxZvwTvD7RSIMRQwCnvoUV/XV/vX8pT8bxiMffSvWAd
         pzizFhbXVg2xXF20pLLi1Q3zt7o9IVRJ+GkQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Ux0XE7RoJ9M9u9eFrS5FvbzwFObKaVh7eojK5revoSE=;
        b=FfShxqUDqFyS0SqtJi4cRc7bmgwp9hDGD5iv9jsrulqupmvHNlgjNyoLcY/Xc/egn1
         d1eTOzJJM+mmehPCoqossy1+5mVMOjseHsahBjrR0qsf2JqCt4u8NtdCC2AUh8/HpO+K
         zunpcClstFnmhHpFyQQjlVgZH/rCZJDGNGDoB35NoVYKj6cw5JWyrOxT3DB8ukA6wgql
         vGomYGxgYqRY+8qB4mAKvwfFETT/PQo/8jzEVZuRVcxrX3a2rEszKxQ6RBfWYvrIa7bn
         j0NLF5l8B5O97M74M/c1NLztowG7pBrWznYjAl8NaJ7I8Al3GeHT5pISKZ+Zs3KCWDs8
         AAcQ==
X-Gm-Message-State: AOAM531qGl3xnGs6cv3+Gzi2R1hGXTLxoUxrOfZeLb39vY0mxOUqc4Pu
        ZvCZI5BqXOPYb+FBiKfWpfs3k6qnGdhS27muz3UFpA==
X-Google-Smtp-Source: ABdhPJzEno0W0DnWhBvwsJjSg5D+E9lMOeYOjDKQVHxpxyCqvXx7BVqTDPR+FBASM48cOMdflS4bgsfc9irgl3siz98=
X-Received: by 2002:aca:a953:: with SMTP id s80mr4673449oie.164.1642623095415;
 Wed, 19 Jan 2022 12:11:35 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Jan 2022 12:11:35 -0800
MIME-Version: 1.0
In-Reply-To: <20220118144851.69537-3-alim.akhtar@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150018epcas5p32642af7af63869d08a861d00d97e3b68@epcas5p3.samsung.com>
 <20220118144851.69537-3-alim.akhtar@samsung.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 19 Jan 2022 12:11:34 -0800
Message-ID: <CAE-0n51KLEbCsvR7ByzNXxKg7gK4y6UNvg5vfAJ4C87QUweC9Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] dt-bindings: clock: Add bindings definitions for
 FSD CMU blocks
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org,
        pankaj.dubey@samsung.com, linux-fsd@tesla.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Alim Akhtar (2022-01-18 06:48:37)
> Clock controller driver of FSD platform is designed to have separate
> instances for each particular CMU. So clock IDs in this bindings header
> also start from 1 for each CMU block.
>
> Cc: linux-fsd@tesla.com
> Reported-by: kernel test robot <lkp@intel.com>
> [robot: reported missing #endif]
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
