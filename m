Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D1AECAA27
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 25 Aug 2022 17:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237877AbiHYRGX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 25 Aug 2022 13:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236857AbiHYRGW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 13:06:22 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B041AC26C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Aug 2022 10:06:21 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-333a4a5d495so557177797b3.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Aug 2022 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SOy68UEC0YgOxRxAM7LgXUvCsgIpZ6R1Pgijw93SqxM=;
        b=gx+Erd/icC6qh4IpZ0BSBdmpw72IdDomoBSPsFosYc0KoaDrWd1W9SM9staylbgCNc
         MPf88UCEPkXGCaLJenxA1lV92FL/7Tytze7zn18IyirkGA3f4FW7S2ZPVZiyQ87rhIlv
         BA+2ZCv+U6jBOexCd2weKguHWIl0L6x/13GKSEoKla7Y1FdiXagdokJBwVMPdIoeD3r4
         7qF9JZnVZiG5e8VqAL4XtxEb6Gxyd/8KpR/4fJNHIb31YnikFRKxIbPpEMYl1Az5uF+L
         vQs1ogcJ4Qg65HcaDMHd9jxwXAcrqpEXuCx6xxi/57iFcFdsmp9DViLsYfC1N4HpflD3
         dyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SOy68UEC0YgOxRxAM7LgXUvCsgIpZ6R1Pgijw93SqxM=;
        b=kJjH3tujdDwOCasQ8EUFQ+KaRCTSTsW/I//nMRl97RGyvdTSrjpkba9g9Dk8wY+wvK
         8L3zfvUfue9kHTCAqcRXIbILdoV4WQyiVs/cJXEEjpD3mh8JkKCXQlJzYx61WW7eTMoQ
         hrjP0b1RXBz13BI/Ber1cV1MFqV0Bki9RM3I+qWZ5pWNy9hf/A2jCEcY0tcBxFj76yCF
         4H+Q3R6xBVb/R75m7u1Bkp8NJim4XHbqPP9/YuGydn6r+h6nqUFGS1Gtu2cZ2HIPc3Xm
         aYJWUNe5CODKPcDde6/VWyRKXUqMheLK80YVrnMjJw7Fg49GjEWcMEYVAa5AYFpfZ7mh
         Kd0Q==
X-Gm-Message-State: ACgBeo26eUEEEaEOt2hliqddg3VSkTokrEK/CxTBf9ZcOQmuwSTY8MK9
        Qkat2qjmEEE+E2aE8syOA2Cc2dJDumgjRRBDrlTUmQ==
X-Google-Smtp-Source: AA6agR4amXEIKvXMXuUDe8G8QYLGEe0SPU95eszKZrRMSzAgG7u84pGBQ/1fQFxjQQcM+hKkbwNc/Si/sXNJBxpChlc=
X-Received: by 2002:a81:7992:0:b0:336:8015:4889 with SMTP id
 u140-20020a817992000000b0033680154889mr5015363ywc.80.1661447180125; Thu, 25
 Aug 2022 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220727013349.3056826-1-saravanak@google.com>
 <49e4f45a-51da-ec4c-9ebb-dfa022bf8a88@linaro.org> <CACRpkdbS2SGUMktB4a8T-cMW5d=s_BiygrSmAbOix=BUg0JOSw@mail.gmail.com>
 <13dde9ca-35de-bd8a-ec47-87fe1f844308@linaro.org>
In-Reply-To: <13dde9ca-35de-bd8a-ec47-87fe1f844308@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 25 Aug 2022 10:05:43 -0700
Message-ID: <CAGETcx86fMqRVgFr9yzemcwLAJkJWUPH3+WxPAtHoaNckNFkNw@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Aug 25, 2022 at 5:11 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/08/2022 15:08, Linus Walleij wrote:
> > On Thu, Jul 28, 2022 at 10:32 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 27/07/2022 03:33, Saravana Kannan wrote:
> >
> >>> As soon as a gpio is registered, it should be usable by a consumer. So,
> >>> do all the initialization before registering the gpios. Without this
> >>> change, a consumer can request a GPIO IRQ and have the gpio to IRQ
> >>> mapping fail.
> >>>
> >>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>
> >> Looks good.
> >>
> >> Linus,
> >> It's too late for me to pick it up, so make you could grab it directly?
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> Otherwise it will wait for merge window to finish.
> >
> > I sadly missed this during the merge window, as the commit message didn't
> > make it look like a fix or something urgent. (I don't know if it is?)
> > Just send me the patch as fix or for -next, I let you decide.

It wasn't anything urgent. I found this issue when I was refactoring
fw_devlink, but that series hasn't landed yet. So it's okay if it's
landing only in 6.0.

-Saravana

>
> I understood, so I already picked it up after merge window. I'll send
> you this in a pull.
>
> Best regards,
> Krzysztof
