Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683D4C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Nov 2021 17:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B34C61220
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Nov 2021 17:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbhKERxP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 5 Nov 2021 13:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234498AbhKERxO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Nov 2021 13:53:14 -0400
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE58C061714;
        Fri,  5 Nov 2021 10:50:35 -0700 (PDT)
Received: from [IPv6:2a01:cb1d:6eb:3100:ad4:cff:fee2:7ba1] (unknown [IPv6:2a01:cb1d:6eb:3100:ad4:cff:fee2:7ba1])
        (Authenticated sender: sed@free.fr)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6AEFA19F5AF;
        Fri,  5 Nov 2021 18:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1636134632;
        bh=W6zv3yckLhc8kZyQmigeN64w3oukaC4M2qw/4l8NGuY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=M+q2bDRhe27k86zm661xnTo6xorjx19J32W4ZGmdtx0eP9kd9OQsQ1maIKyvWX7j5
         KkJLeRYjU4+tj41BMmmFmCa6fjt/WeVMdNMhf6ew7HfCj7q7d9iLdgw+R77FwrQXK6
         Z/xjx0eyb9iFqdA6sj168fY46vCzbgFaMaVZtyxMp0c5eiyMRNbPX6LEWiaeq+Wzfk
         nZLks6xhrl0KtKdeHvSqnxlTyW0xWH0jrmlhbeT9S7nqGjNeuYtDtUYKENrZQxcPJg
         yPWU76A1ndyOJki7dH+oN1RuUPPa33dj1TNM536dYGNIVHUEeZEz0DVVSj8AV5aV4w
         3wwuxzkmVhYuA==
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kukjin Kim <kgene@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
From:   Cedric Roux <sed@free.fr>
Message-ID: <c4bcafd0-f614-78c8-4d72-5d2b672f7e32@free.fr>
Date:   Fri, 5 Nov 2021 18:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/2/21 12:05 PM, Krzysztof Kozlowski wrote:
> If there are any users, they might respond and postpone the removal.

Hi Krzysztof,

I use a mini2440 (which is s3c2440) as an http server at home.
I don't have much time but I can do some testing from time to
time, but my setup is very custom so I don't know how helpful
that would be for the community (if there is one).

I would be sad to see official support disappear, but I know
how hard it is to maintain stuff, and I think I can keep going
with the current kernel I use (which is not even 5.xx I think),
so that would not be a big damage for me. And if I have special
needs in the future (very doubtful) I guess I could hack something
on my own.

Anyway, there is at least one s3c2440 server on Earth powered
by the linux kernel. Now you know! :)

Regards,
Cédric.
