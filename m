Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB8C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 15:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239674AbhLTP24 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 10:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238904AbhLTP2l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 10:28:41 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0057C0317DE
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 07:15:43 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id y22so18300544uap.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 07:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JbcK5C+KX0nC+Vsrvih3RpE8RP5maH+bjnVo1AerElw=;
        b=JTjwC3NJoJzwnSCibno9sOQqh0lEtf7yIhD5vCp4L1MsAA3r92MCjQWZstDvSpK2vA
         IypeP/atX6ElOBS9XN1C4LGnZnVKKH3II26gxB36ZAbtbRGNgUNMsHuq7C6H0h7nvkkf
         RtoY9y0RVmYvk0KDOumeKAJX1oirG2CHO1JYewjp+Jkwi5ZKosf/6oWb9xTl4p2gg8CZ
         6vSfFzFGxaPxa4wvu7SW7n3ImHV7mHSeSp31Ffc9UqS3NskxN8UBnmNQqEr3/Lf+J1xU
         V2dr2jkCyw+NqG37b+gO8pABE2Ron7peBC5KPIxQrBIMu7b9dl3F5bzhOg2nBmN9A15I
         igWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbcK5C+KX0nC+Vsrvih3RpE8RP5maH+bjnVo1AerElw=;
        b=ABSvamPh9nFbewACjONzoAYnoxLNcokf5jD8OlrKz6T1yVpXmC6S5Glo3C8STpTKiq
         IKiIT6nyVgF+ZWt39AfkJguqdhTFu51sOn1yqj2lonGN98ss7mBri9Yp8kO2H7mHaIuP
         AD6Ik7togUV0JAyeyUKq5z80i8EYMbZYxvpuvpu2sqn4McKmnSmOy/xmbT9Q5NQX/w8Y
         52LJCSC8vMpYBvbSHu+rMPnUZRPFB7HyCkCWxObLZ7GzxSKWXAeScAoy+wbahH4Voxlz
         qfawqdYReVWx+YKvdJYRJ9XqBeaDbYkZrDJivmcq0xUxgnBH4BQM3m0UJVKc/nxAzHiR
         xbEQ==
X-Gm-Message-State: AOAM530hUZ14COq+iIQw8Ev3k3yCJ3s3kmW79bXKlneCiHxLZ4UJ0hPN
        95hH1eYDZBVlSACuMHKMGRn2pI7UdE39CyyJRL0KTA==
X-Google-Smtp-Source: ABdhPJzg0GMHLLFkikV4NDJ9qt+SCAV5yNLudGVwoNFr9yexyB3HkIv98/XSF6M22Zbe/ve9KUa+e9XNSZ0W4Jvey7k=
X-Received: by 2002:a67:be12:: with SMTP id x18mr5123119vsq.86.1640013343089;
 Mon, 20 Dec 2021 07:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20211212170247.30646-1-semen.protsenko@linaro.org> <b618ff5b-ee41-2c29-5074-24fd4d0f0933@canonical.com>
In-Reply-To: <b618ff5b-ee41-2c29-5074-24fd4d0f0933@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 20 Dec 2021 17:15:31 +0200
Message-ID: <CAPLW+4=wcWv4P_M8kQDjB=QfT5N+mFKm0mUdSDjGSgLg=pRGSw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: s3c2410: Fix getting the optional clock
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 12 Dec 2021 at 19:50, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 12/12/2021 18:02, Sam Protsenko wrote:
> > "watchdog_src" clock is optional and may not be present for some SoCs
> > supported by this driver. Nevertheless, in case the clock is provided
> > but some error happens during its getting, that error should be handled
> > properly. Use devm_clk_get_optional() API for that. Also report possible
> > errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> > clock provider is not ready by the time WDT probe function is executed).
> >
> > Fixes: a4f3dc8d5fbc ("watchdog: s3c2410: Support separate source clock")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Suggested-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>

Hi Guenter,

If there are no outstanding concerns, can you please apply this one?
Would be nice to see it in v5.17 if that's possible.

Thanks!

>
> Best regards,
> Krzysztof
