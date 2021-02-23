Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6881C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Feb 2021 20:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D98364E5C
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Feb 2021 20:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbhBWUB7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Feb 2021 15:01:59 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:36811 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbhBWUB5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Feb 2021 15:01:57 -0500
Received: by mail-wm1-f54.google.com with SMTP id k66so1176925wmf.1;
        Tue, 23 Feb 2021 12:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=re9JuVE3j71DSjFtA55yc3sgj05t4h1URbbxhbt/bbE=;
        b=kESVbfDOPLH8SOXAdPEvOyg8VACB+iKlRjf5aWgpulMA5A0PJXVGjCjiwPzBWVpAOl
         TmdkTI3IprxCXPnZXmEgH+lQfkZMV44G88r5RmjX3Q9oJBzF629s+iGcTaAQ3wbZPrk/
         iGM/XOQnbwOR4ahA59VvFDDwZygAcB3BfIUV1JuWwoNheVD0F3YRyUwHA3bsGhp5GUqF
         nSU6uRI728OpDaAvaKqKmAmi20wr/iq75SwCOQMUy5zbINHe77qAlaKMpVP/lsO+1nwU
         dXZlJErKY6hw91Uh7VMQ5/WcuEI1jLmQDoy8Vou/lAYN1110Pnw+jgDdlcCx0r4ntYGQ
         75Rg==
X-Gm-Message-State: AOAM532I+wyG/kA5AIIGho34e81H3JbWD0q2tyjguydmVh3RRB1TOAMG
        xJ84v0+3nSNL7EwFuHYJ7fk=
X-Google-Smtp-Source: ABdhPJxOgWxMSxnjjkz7SXbj50EvcRPZUt+XweL2uy5T0cXO2R6m5nTXeOUH+mbkGZoIghAj7OdLzw==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr364847wmk.63.1614110475669;
        Tue, 23 Feb 2021 12:01:15 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id d23sm3742077wmd.11.2021.02.23.12.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 12:01:14 -0800 (PST)
Date:   Tue, 23 Feb 2021 21:01:13 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: exynos: Remove 'opp-shared' from
 Exynos4412 bus OPP-tables"
Message-ID: <20210223200113.3irrzt2kfnuk3l24@kozik-lap>
References: <CGME20210222095419eucas1p2448e782d7df380425ab9bab5db75008d@eucas1p2.samsung.com>
 <20210222095405.3109-1-m.reichl@fivetechno.de>
 <1ed8fbd7-4aa6-f053-6627-0922420069ab@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ed8fbd7-4aa6-f053-6627-0922420069ab@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 23, 2021 at 10:24:41AM +0100, Marek Szyprowski wrote:
> Hi Markus,
> 
> On 22.02.2021 10:54, Markus Reichl wrote:
> > This reverts commit a23beead41a18c3be3ca409cb52f35bc02e601b9.
> >
> > I'm running an Odroid-X2 as headless 24/7 server.
> > With plain stable 5.10.1 I had 54 up days without problems.
> > With opp-shared removed on kernels before and now on 5.11
> > my system freezes after some days on disk activity to eMMC
> > (rsync, apt upgrade).
> >
> > The spontaneous hangs are not easy to reproduce but testing this
> > for several months now I am quite confident that there is something
> > wrong with this patch.
> >
> > Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> 
> Thanks for the report.
> 
> IMHO a straight revert is a bad idea. I would prefer to keep current opp 
> definitions and disable the affected devfreq devices (probably right bus 
> would be enough) or try to identify which transitions are responsible 
> for that issue. I know that it would take some time to identify them, 
> but that would be the best solution. Reverting leads to incorrect 
> hardware description, what in turn confuses the driver and framework, 
> what in turn hides a real problem.

I agree with this approach. If devfreq is unusable on that platform,
let's try disabling the exynos-bus nodes. It could be enough to help.
The opp-shared does not look like proper fix for this problem, but
rather a incorrect solution which achieves the same result - disabling
frequency/voltage scaling on some buses.

> 
> Another problem related to devfreq on Exynos4412 has been introduced 
> recently by the commit 86ad9a24f21e ("PM / devfreq: Add required OPPs 
> support to passive governor"). You can see lots of the messages like 
> this one:
> 
> devfreq soc:bus-acp: failed to update devfreq using passive governor
> 
> I didn't have time to check what's wrong there, but I consider devfreq 
> on Exynos a little bit broken, so another solution would be just to 
> disable it in the exynos_defconfig.

Yes, I saw it as well. However defconfig is only defconfig, so customers
still would be affected and still might report bugs for it. Maybe better
to disable all exynos-bus nodes?

Best regards,
Krzysztof
