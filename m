Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6A4C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Mar 2021 16:38:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4FC2650E5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Mar 2021 16:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbhCIQiZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhCIQiH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 11:38:07 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88522C061760
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Mar 2021 08:38:06 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id v2so15085858lft.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Mar 2021 08:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DXEn5JSpgBw/y2eHpwVO9g48Km7rMDXnZlE1bBW2r8s=;
        b=XbafCFFSFzMS+QhMLTOXgWvBugQJw48RI2zwRMEER0qGPENxJ5iZchaFs+rKwEnikM
         1tw9Xx483823KTezlF5evj1N7lBynSwiixNRWDWfNIVwAwowxVk550YYcbVzT4P0nXjo
         zmqi+9cd7JD9CdkiObbpmaNyz8VKgVTn9dhW1K1yaPxT+7VZEao5sP53AUdNGDXHri3j
         k4lx6fKk6tszQoyJgAFHNqhhGRyB8+9bsJ/F3zZC4Xcu2m+9UA3oJ7PGHWX2fITVWdQk
         Ps67OIw9ivU5AytiWUd3KoemZe4H9sK75XQy3jxZH8dQNjSC9JWOYLeMiNGL+Nh+KsVk
         lpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DXEn5JSpgBw/y2eHpwVO9g48Km7rMDXnZlE1bBW2r8s=;
        b=NT/eHW5p4bivnOBTOUbTQ0/vkxoP1SSHkRsarK/NnM0bTAYhxjCAo6Qw9qu0QG5qdg
         QWk233qAy15ADz3TGREYVO3qFmEM73w1RgYUCRUcp9PEc2VxPMi2bZCwR5H31c+yt5Hb
         AqATtL979qSkLumuE+rvMGoUROqgJqae2Q5K5Ec7IQsh3ONYADnxTuwIhmH1BAa7QROd
         +J/UrzdPOykGPA6hikUJ1D/HY4MISghAEfP3NK1ZtirPKMeykW669FA9aGwNKHPrrdW0
         v4rfaLdq5T20c7CBumYl5mJxllqhE3Vf3BcLkUpa3RYkBYUSlLWba2RXr34Kzxl0zD8k
         ZKEw==
X-Gm-Message-State: AOAM532WqmAEZU42NA7vMH+2LCdB755I2pNS3oJ2LxU57qqqlhcoWOhr
        wenlCJKj0sOjvhs0UNfp0yqAEZ8RAVfaCeaUcYkH9g==
X-Google-Smtp-Source: ABdhPJzph/W4+niKbEazqjfqIFq8ME97OA1IS7zhqExaRlDOuU14W5Llytf7OgyeKHYK9RZaGHLYo9BD0e1mWXcMU3o=
X-Received: by 2002:a19:6b13:: with SMTP id d19mr17882973lfa.291.1615307885055;
 Tue, 09 Mar 2021 08:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20210304213902.83903-1-marcan@marcan.st> <20210304213902.83903-27-marcan@marcan.st>
In-Reply-To: <20210304213902.83903-27-marcan@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 17:37:54 +0100
Message-ID: <CACRpkdYzkOCurtLaeyZ+A6EWnSPGU66by4gYoCpLcn=52hTEPQ@mail.gmail.com>
Subject: Re: [RFT PATCH v3 26/27] dt-bindings: display: Add apple,simple-framebuffer
To:     Hector Martin <marcan@marcan.st>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 4, 2021 at 10:42 PM Hector Martin <marcan@marcan.st> wrote:

> Apple SoCs run firmware that sets up a simplefb-compatible framebuffer
> for us. Add a compatible for it, and two missing supported formats.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Marcan: tell me if you need me to apply this to the drm-misc tree
and I'll fix it.

Yours,
Linus Walleij
