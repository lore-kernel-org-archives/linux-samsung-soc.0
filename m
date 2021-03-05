Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5BFC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Mar 2021 08:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 192DB64FEA
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  5 Mar 2021 08:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhCEIHj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 5 Mar 2021 03:07:39 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:42201 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhCEIH1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 03:07:27 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N2E9Y-1lm63n2Iuc-013cng; Fri, 05 Mar 2021 09:07:25 +0100
Received: by mail-ot1-f51.google.com with SMTP id a17so1005485oto.5;
        Fri, 05 Mar 2021 00:07:25 -0800 (PST)
X-Gm-Message-State: AOAM533vRXAxoUPaBgl0HS7R4QeB7HkjE4SSbsD5JQGn+Ai7Q32FV/Jr
        VTKktjB1597AN30P4meFPhnnclGiSeaf6scfXj8=
X-Google-Smtp-Source: ABdhPJxqYuCXgKHG79cARIlIIknf25ifduq2VjGAMPfck87tlTFpc5wPGypB2miMGioSDWeCxnxnQNvQKnonMZbh/Ag=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr7135133otq.251.1614931644090;
 Fri, 05 Mar 2021 00:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20210305034927.3232386-1-weiyongjun1@huawei.com>
In-Reply-To: <20210305034927.3232386-1-weiyongjun1@huawei.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 5 Mar 2021 09:07:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a23Ww39hxmhTCwgZUr1LWO1trj_Dijq1YXGyg0Z1mOCcQ@mail.gmail.com>
Message-ID: <CAK8P3a23Ww39hxmhTCwgZUr1LWO1trj_Dijq1YXGyg0Z1mOCcQ@mail.gmail.com>
Subject: Re: [PATCH -next] USB: gadget: udc: s3c2410_udc: fix return value
 check in s3c2410_udc_probe()
To:     "'Wei Yongjun" <weiyongjun1@huawei.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CHaEdIqKwG3T/zUOLoGwZ+zqo2NWAkLmBho1rTOPqdisV4PiNP+
 p2BGL6Q3j4YElrJqtgJ0o+1tGRMu8oUgm/3q2ZwfdvGNdm1Je991tSuA6vtAXxLadkSn3+n
 TDeIbKI8GghsJ8E+CASotghhBdxVV5DNk25IdsXCY0Gy7eMWszfT/87jIszIV5Q4ddxxJfr
 Of4cRQmKPi1MOkGbYkZ+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7k9th40rb8E=:MQtw6gUY57uOyLuH0qWkNF
 dPl9Agm9R6lbXDEFuWukb4gGg2zYEOJCSJe4cNKq/9oB9N0y8i/o1OZi0TK+4sZT2al0ka9my
 /nfWdxpRpiclWz/usb14gkbBtKnsqezHe1W44tMlE7a48LPokBpWeQz2Upr2pLslsujrWEEgz
 AOJMqvujkTBkOluSxrVLw1Cu6IDTTAJq5wgFaY6b0+jOHs2gu0ZXzy/6JrCkWHYZWuOnOT8J+
 8KbfLEwdoy/9XaC//8J6RkWlqYTsSJwkDUduksZn0oX+C1AaXmgzq/dOl85KjEpiXLdb/3kWL
 unlMUMg/TZKp9LCsVoqxxc6BtGOZXlT/G+zdhTa3o8/1zPaFV6xPodN8O8o4pCcAmXmOQGGsg
 fKM21bYLumKTLw2F1tPcn3obW2HlES2Qay5peToR1P3NbZ4kOwCbk4Kg/tmrKTAYuxA7/CuXT
 ynRj/JyD1Hh5oize37vVhh4m4LVla0yiomQwL1GyK1udOn2P5+YCHqaIQQLran5SDafm76VyV
 M5Vjcp06TwEaplNVrcI8SgAfP1cFkgM6NwUTBBxrRQi
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Mar 5, 2021 at 4:49 AM 'Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
>
> Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Nice find, thanks for fixing it!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
