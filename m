Return-Path: <SRS0=YSTQ=YJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8835CFA3728
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Oct 2019 13:12:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DF2121848
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Oct 2019 13:12:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UB9ELyOZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390036AbfJPNMt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Oct 2019 09:12:49 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46831 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfJPNMs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 09:12:48 -0400
Received: by mail-qt1-f194.google.com with SMTP id u22so35966432qtq.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Oct 2019 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8JThs1XG1ijPDoWXd001r2c0QxpUa5W2X+j98FgzGb4=;
        b=UB9ELyOZDOPd221KTRZ44E6coQpNcftSoMxNazf7t7nDHFWdnlu49LfY4juaUuij+u
         uyg+XuKVTfjGgg6f4yohjI/jki6Ey5vm/kSgHuM8jhxf8/TeIfQLhCTR8hCp5SKkjOEc
         aghKyx6Go8GpAiGyEFJslvNxarC4F497LwkwyzhKWbLaZ7BdJv16xCl6s8xTFOtqdhID
         TJFzruv3A7f6Abldxi7qPSb4ZpmJ2yHh+g3JpVmUCO+vLOrQZZ3rIcfXGEVyYPEgFO+H
         f2kIyl+jZ8TgDuq7pviRq5YjYRyEK5T0FwsIZlAqJsL0s9vXcXnOHCVpJctB3HcgeqZH
         ClHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8JThs1XG1ijPDoWXd001r2c0QxpUa5W2X+j98FgzGb4=;
        b=fMZEip0beSLu890uIyM8C2xxED8jbqAzURBsfPg9BhldehuvuKDE75W4h+lsprj5/7
         m/eeR/fP19pkgI1q1XFVmGtuzUuTmfLKn+fCrmAlQe1A5+pYdSo3GUiYJkYrZUY/naNB
         kkEAV+CBa/RL5Am3G5pjQmEj88ZX+D9fR06abO8jeBQUJLeR4WdmoXXfMEE3oZSWye8h
         FBVTLG2mGyyr7M4/19w+sl398JGGDxU9/K+bTHAcTRwoOS6L2Gsa01+xn4IpdkdwNBWL
         YEBeBpqJ0yoyGz2eaI6So2yk391VzRWYwkKFlREQ3xBl9yDiWLPcZDbx2/lAzKZcB5+n
         jDRQ==
X-Gm-Message-State: APjAAAWkK8evEPNXW9BXn7n1eHGZaOfj1eSTX6pxX3H1m86KzhCBSxWq
        JYou1Yc6dCKXPuS/Dt4StgcZ++E/y0e5h6/mgIqqcA==
X-Google-Smtp-Source: APXvYqz4WACK7QZCPQXxStJci3zXaPb5Yc24BDtLg9Q18h0g3nKjgnK1rXsHGJ3td2yB7eQaUO55uFjrFVgjSv4QrKM=
X-Received: by 2002:aed:2462:: with SMTP id s31mr45553740qtc.40.1571231567878;
 Wed, 16 Oct 2019 06:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de> <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-23-arnd@arndb.de>
In-Reply-To: <20191010203043.1241612-23-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 15:12:36 +0200
Message-ID: <CACRpkdb07KyJDgACuh2ho822pHAUcw2ubu=WJwqxf8NO-Pv+_A@mail.gmail.com>
Subject: Re: [PATCH 23/36] ARM: s3c: move s3cmci pinctrl handling into board files
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ben Dooks <ben-linux@fluff.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 10, 2019 at 10:47 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Rather than call the internal s3c_gpio_cfgall_range() function
> through a platform header, move the code into the set_power
> callback that is already exported by the board, and add
> a default implementation.
>
> In DT mode, the code already does not set the pin config,
> so nothing changes there.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

It looks good:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

It would feel better if someone was actually testing it on these
boards. I see Ben is listed as maintainer so I bet he will
pull the board out :)

Yours,
Linus Walleij
