Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2693C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 10:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349006AbiASKUp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 05:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345669AbiASKUo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 05:20:44 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A845C06161C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 02:20:44 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id m57so1177568vkf.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 02:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmVHWOnUtiBgSGHEmeCT15nHc03Hy4faMmC7ZVSjOWU=;
        b=s0WTcZw9W/67pT4Ll1semW0LJhuqEWo88jJGvyGJmZK6ndeGAnvdTnGzQuMaDHrrGw
         L7kbz50eiOuSmst0KIyo0T+FYBh8zO4gH7h6msn9icKJlYTNHLrkCz3k/0sivkG/iXQw
         771Iv74UbzmcnE2g59L58+FfzYm1wtv9YHJVIll2C7vOShY34lxZ1RbWxUHjDPSG4q38
         2ZS7UV2Fx1J40TLlZDVgNkA9qCAdQDn1PatjG7Scxkoz442tDqweRhgPhWrwNT1RuMb+
         erK3pm3qDdzcmRBrarpZkQj9iNK2xEXlb4HvMPKFbWxfSnJ0SFkYQzVbg3kWjjU4KjS+
         UIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmVHWOnUtiBgSGHEmeCT15nHc03Hy4faMmC7ZVSjOWU=;
        b=z11voJu8oX2N4uzstp9LD+EHNYt7fOZro3TGR0MralGWEcucsRBQarK6PV2te5CV9R
         wUlA+O80zXkSDA7I9MhQ+SDSzzguH9uVCc86l9NZS+ak7jOUdwJZZyvmiqWVeCB5qmnC
         3gvr00pbcMeLYHjwQqJwxIzBPpxwkWIdpWy0nXXlxx10St6Njs8uMtRotCrKjMeo/aoR
         AjnD1eIXABppUjlMPArNyd5JBv3GIYFGMe+3YrIi2VTkvTEhFBk85ZqkOL1RNzf764xZ
         IscLM/LEP7uiC4LDDvQFP7N2QU6maLoG4UPOXej3xBQhly3qNLtMNhNlGDLTcsJPeJdP
         gV5Q==
X-Gm-Message-State: AOAM533aJ+/v1/hT+1Fu6wD+ksOatLg/dPNBSqJDNfCtbPDkqrbNw+nI
        gD5kMbe31TDxet8yunWXaC7QT6vCsZF9YA9DZ5IVyQ==
X-Google-Smtp-Source: ABdhPJz7/UUqwnG/h9JInWVKxiGqIW5MsJRj+siQVr9dNB704Fl7vZjSX1OdQ5acyv53wpMwXLpX8v/fgYfYRBCKOts=
X-Received: by 2002:a05:6122:7d3:: with SMTP id l19mr11505967vkr.35.1642587642669;
 Wed, 19 Jan 2022 02:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20220118230915.157797-1-linus.walleij@linaro.org>
In-Reply-To: <20220118230915.157797-1-linus.walleij@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 19 Jan 2022 12:20:31 +0200
Message-ID: <CAPLW+4=x90Q17GRW9mAapyb376u2sJE2f8UOmNcvMGB1u_ErZQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] spi: s3c64xx: Delete unused boardfile helpers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 19 Jan 2022 at 01:11, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The helpers to use SPI host 1 and 2 are unused in the kernel
> and taking up space and maintenance hours. New systems should
> use device tree and not this, so delete the code.
>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - No changes
> ChangeLog v1->v2:
> - Split out to separate patch
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
