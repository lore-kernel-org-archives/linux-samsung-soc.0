Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EB6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Dec 2021 15:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236199AbhLIP0Y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Dec 2021 10:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbhLIP0Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 10:26:24 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A67C0617A1
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Dec 2021 07:22:50 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id p2so11321275uad.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Dec 2021 07:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=1J+XmU+DI+E9grUJzbC6kqmpdJljZUH9ERdWF3VqDW4=;
        b=wdLsu7dxo6JsUsOMFhDQbVF/7k6JWW4SfduROl3lRRispvueS+VzjduoBSJdTfWBEd
         6WSFxBtUmOKlOmMhQ3z/jkIE7pzpINk0xwSI/SPkCItxTti5tDk/k0IhLQHC+8Px4tjb
         opJUQAh2haWglvTbBYOWb8wBDboplqK/k1wz7pMdWd6wdnUQ/lntzIFt6iSZTILpnD8i
         54xvkltZMUQI8d/TgbxN0KHDTzZgDh9qR2+z7YHpzTmSmEOViRiW6faiJb/MrojlY22z
         iqhnQCWYXF/aRrptPwEpnmuIlyCMxU2JXz5pvmM6Y/9El6BpFI85smH7ropsRnktM+lU
         pV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=1J+XmU+DI+E9grUJzbC6kqmpdJljZUH9ERdWF3VqDW4=;
        b=L/695KThhxyIqcvptLlSHlVWW9Mb6NkoNR3KY5Jsx3LgjmQRB+OrLxHKQhUbuEA6de
         BWtLr4BJoxuErL/RI/RiOQgzenVNyYKii0UGixBPDp40bZsL/1fltgm5Myn5Hk0dEHg0
         gYgc19+Z9hJchaRsEd5ky9SdB98pBbE1ufQeqZ9nEuGNc1PH13oi6fZ1MGz8IvjVjrmS
         WCOQma/48G83JPS7EgywPaOzHT3AQJarE9EUeJEa7mA9EGRVLDloFynmhYtpmlrNhub6
         1gd2Q9GP5lxhhOMjQEd/NGA3a/kH85tdswfo6PDa6TVijSqsCD4jEIeWc1olkysPhjMi
         YVog==
X-Gm-Message-State: AOAM530CuMgtcZOqed6hQagCgyeJ62btAemTD5dyMA/p1MmDLa5iKflf
        mQy+lnsQ5qcv5w/5Xen3JUf6KNi0KHJT/5Iu6coc5A==
X-Google-Smtp-Source: ABdhPJzCfp+KpbSMOwI8zmZeJ5bMvIl0+2m+q7morIH15CbHe7sXKx+R0flGIAcP0B04JBjStSt4FQXkkLNvJzN85pA=
X-Received: by 2002:a67:3382:: with SMTP id z124mr7978137vsz.57.1639063370025;
 Thu, 09 Dec 2021 07:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-8-semen.protsenko@linaro.org> <YbIXVw+as1Sj6yDW@ninjato>
In-Reply-To: <YbIXVw+as1Sj6yDW@ninjato>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 9 Dec 2021 17:22:38 +0200
Message-ID: <CAPLW+4kOr8NBUpgDXCcALP0BbnQ=w0v_oW24Vsa3e90TBxrHyQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 7/8] arm: dts: exynos: Rename hsi2c nodes to i2c
 for Exynos5260
To:     Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 9 Dec 2021 at 16:49, Wolfram Sang <wsa@kernel.org> wrote:
>
> On Sat, Dec 04, 2021 at 11:58:19PM +0200, Sam Protsenko wrote:
> > In Device Tree specification it's recommended to use "i2c" name for I2C
> > nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
> > warnings like this when validating HS-I2C nodes:
> >
> >     hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
> >                                   '^i2c(@.*)?'
> >     From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> >
> > Rename hsi2c@* to i2c@* to fix those warnings.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>
> Applied to for-next, thanks!
>

Just a heads up: Krzysztof has already taken patches #7 and #8 to his
tree: [1]. Other than that, thanks a lot for handling this series!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-next
