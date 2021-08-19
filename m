Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1815FC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Aug 2021 21:41:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBB53610FA
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Aug 2021 21:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhHSVlw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Aug 2021 17:41:52 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:51293 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235590AbhHSVlw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Aug 2021 17:41:52 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MFslN-1mHh7G37Tr-00HQpe; Thu, 19 Aug 2021 23:41:13 +0200
Received: by mail-wr1-f51.google.com with SMTP id r7so11196513wrs.0;
        Thu, 19 Aug 2021 14:41:13 -0700 (PDT)
X-Gm-Message-State: AOAM533PX7IfCIPzuu2+ndlyzxRIsWqO1LFsJAwAylEqRvOXMk+qDYcw
        UjOM5Sw44hL19y40DfdfLRWkUK9tWbbHo+g2M5k=
X-Google-Smtp-Source: ABdhPJwgQXlZtd9aQGhUETRO3j8EuerYQ1TH+GOAUcV1c6qR7kBSbBDaUf/YOR2NNp44khyUSHmTwZDd2CaItxBz1bo=
X-Received: by 2002:adf:e107:: with SMTP id t7mr6159638wrz.165.1629409273404;
 Thu, 19 Aug 2021 14:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com> <162938788185.467628.13192922419725983504.b4-ty@arndb.de>
In-Reply-To: <162938788185.467628.13192922419725983504.b4-ty@arndb.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 19 Aug 2021 23:40:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1RO=PWUGi_aFA2rzn2119W-kX2kTOycEG6hoTqPBj7=Q@mail.gmail.com>
Message-ID: <CAK8P3a1RO=PWUGi_aFA2rzn2119W-kX2kTOycEG6hoTqPBj7=Q@mail.gmail.com>
Subject: Re: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable "delay"
List-Id: <soc.lore.kernel.org>
To:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Olof Johansson <olof@lixom.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Wang <wangborong@cdjrlc.com>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0vT6dseaUcsOGtTqyWdZmC6b2O04kgyQU4MKi+LCi4PmOYTeMOS
 r1jPrJ/zG8g79OgbMiRiaghmDOZgaREkBA+HZa5AabxQf9Ip7/C6/UyQazLAyk8h0rBKRC0
 uEvcaIrQyC7rRRLOqnCvxKhY8MBrvdsrCMhnitZ6NnDZlLOI0081PLpAcUCHIhfPJWiuZ3H
 sqasqn2cJlA2x6s14SiBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Anqf7xfA9IE=:v8krgduiMfWBTbniyZcQsq
 r1dkbTuKKQ3ozTpWJTX2Cj1C1k0lopA+6QHGNmGYbgH3Qic9eIHVzY80hD9UNvqhghszcqteD
 qL8PrdrRf2jB5uhWItpEGJI4Npf9wya0CXmsXNWG5fjOHd4U2xTnqi0+VjCMMqQ763uhccR11
 NEaLeBkV//KV+Gm32kp9MzXYxFpoo2TRfnk9TJD2c/6EZocLwBvjyQ+cNb2feWD5c0a/46uWw
 xLQTWuQWzmMrWgAc0pzFy2dDaMh8euLJH3wE6EcMIiU6yCZa7OcrpamgdpaktvOMmKrzD7oL+
 J0srzODd8BGjYO2dY0CGdL/XPaoftUTbnUNdXtrAc8eVq3ctupZYwJYenm76bcZSijXr+WVsa
 PZ34G8vzy+oC9gGcSxbKyEGwNZ/eJ+mPHyWV2oU178x4acxptDTo44btH/a2AteHqS8VsTcE1
 fYS9sFgNiJ6rr2GGYMT/Y+bxmH9SNimrXn4YFaJZ5485btAyUGMCX1lOq+dgxOBcqhurSD6XS
 f0ax3RmbC94loqO+64kw/2ncDO4u9+TfjkoNgprEFNbgwemwGRjy1dqgr8hxpGmioPE8nJHfd
 Fhbgcqu2gMHc9R13hpO5AeyG5hSd0rDbqVqBnuuCxWb9Zw2o6ngnvB8pv8NZKY0ST/REkoJ/g
 IXjzrfqONGLhAydCG4/PykC7yHXTiQ3AhTtiRJ/Qn65fXT7qXVRxFHrzJX3AEk2Ev6dnrTfY8
 zr6XlK0LT0TwVOsiA5dW2PrjTPoS1TQW3wbMfjy0HD6yyv3fZ2dR3MTBHeP5BEz62GVYwdmxb
 CRooNERi4/7gWp/Tq8fBOB9I7Q4g+0QhNit+y1bKh2MydFOkzSAZAww8mXHF6ggd0jUp8dziw
 z4gZoWpBe7ZQw2XN9HQN6XJwPTakv6aSQJFGgHuuNR0fUKmQSbVXwTePCAiTISyL8R8BKgYuk
 6Rp5ndni+th8LT1ez94E4GXVoGH/buQtdbyB2WxiZMUAP/uWwI4vD
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Aug 19, 2021 at 5:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> On Wed, 18 Aug 2021 22:44:22 +0200, Krzysztof Kozlowski wrote:
> > "delay" variable on line 79 can be deleted by returning "0" on line 88.
>
> Applied to for-next, thanks!
>
> [1/1] ARM: s3c: delete unneed local variable "delay"
>       commit: 319a1b58f6c7432345f13383b26c8c10e7eb1dda

I had accidentally added this to the arm/fixes branch at first, but corrected
that now and applied it to arm/soc instead, as you intended.

          Arnd
