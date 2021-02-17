Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73062C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 Feb 2021 08:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 164BC60232
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 Feb 2021 08:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhBQIo1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 17 Feb 2021 03:44:27 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:50989 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbhBQIo0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Feb 2021 03:44:26 -0500
Received: by mail-wm1-f42.google.com with SMTP id a132so1251529wmc.0;
        Wed, 17 Feb 2021 00:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HM9Ed9VK7QFCdL2LC2Q7uP7A/EnIqoKacM0+9fsn0yQ=;
        b=tjqGFwY1i8tCXPkd0tEEXdpeZrH7il+UShcI4CLE+Q7gePb8tRgkdMh9aWPJxnmP28
         wQUQPCNCy3lUVwfHSmr/KkhW8C5eE9iusHlfIlGc+hE9KRtjSwYUXIWEDdzuOZcG4GzG
         cjHXYu42JFGB/xIKjHFbCEK6Bd6eVhHVW8BK9Y6oD7QCaLXRYqtmXdKskWftMNRBltD/
         40Yp1kPLiHa2Ton13aTgy+4obYcKOuPjfiBsLaGQIedk/mFzRCm8Jj/3XKnbQk6ml0aC
         9Acj+Fb00TmKmgiRh6KkcYBjx/C3u0XncxTeeEKS5+hoOh3rQx3W3AGE1ao89fTm5fTc
         sBEA==
X-Gm-Message-State: AOAM532MIzsgHkSO5etbPWmlj2/07gZYwwQMPl81p8JBnZ2oIhSCYLd7
        E+gSFvXGXtNKqoKoNrLQdyg=
X-Google-Smtp-Source: ABdhPJxA34OFeXKV76dkYXxsHjLutRVnhz+BPRwZ1RWJzc9Pq0sAW49JabygCXoUJ5sMkgRGXRM9lg==
X-Received: by 2002:a05:600c:414b:: with SMTP id h11mr6149605wmm.125.1613551424165;
        Wed, 17 Feb 2021 00:43:44 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q140sm2707349wme.0.2021.02.17.00.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 00:43:43 -0800 (PST)
Date:   Wed, 17 Feb 2021 09:43:42 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jesper Nilsson <jesper.nilsson@axis.com>
Cc:     =?utf-8?Q?M=C3=A5rten?= Lindahl <Marten.Lindahl@axis.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, kernel <kernel@axis.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: exynos5: Preserve high speed master code
Message-ID: <20210217084342.wqtrdeisfs5gb7wq@kozik-lap>
References: <20210215190322.22094-1-marten.lindahl@axis.com>
 <20210216075141.o4wjnwmmjze2p3cn@kozik-lap>
 <20210216220933.2wzmft72bhjptzl3@axis.com>
 <20210217080747.a7nqzbotszwlb3dd@kozik-lap>
 <20210217083211.GN30470@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210217083211.GN30470@axis.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Feb 17, 2021 at 09:32:11AM +0100, Jesper Nilsson wrote:
> On Wed, Feb 17, 2021 at 09:07:47AM +0100, Krzysztof Kozlowski wrote:
> > On Tue, Feb 16, 2021 at 11:09:33PM +0100, Marten Lindahl wrote:
> > > > Any reason why not "|= MASTER_ID(i2c->adap.nr)" here instead of more
> > > > expensive IO read? It's quite important because your current code will
> > > > bitwise-or old I2C slave address with a new one... This should break
> > > > during tests with multiple I2C slave devices, shouldn't it?
> > > > 
> > > 
> > > You are correct. It is better to use the macro instead, and yes,
> > > safer too. I only have one device that supports high speed i2c, but
> > > I get your point. It could potentially break.
> > > 
> > > > On which HW did you test it?
> > > 
> > > I used an Artpec development board as master and INA230EVM board
> > > as slave.
> > 
> > Artpec development board with? What SoC?
> 
> The ARTPEC-line of SoC:s are Axis Communications own ASICs, in the latest iteration
> it's a Cortex-53 and includes instances of the exynos5 HSI2C ip.

Cool! Good to see that this code is re-used. :)

Best regards,
Krzysztof

