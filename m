Return-Path: <SRS0=nJnZ=YO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F6BCA9EB0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Oct 2019 12:01:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDAAB20700
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Oct 2019 12:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZayBbwz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbfJUMBJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Oct 2019 08:01:09 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40075 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfJUMBJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 08:01:09 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so13646271wro.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2019 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWEB9osAQee35AyhlgRxJbWS6irJ5cvGkHpX55XRn1E=;
        b=DZayBbwzidagHXfjzo+vzE7AoicDQbfH28tq6Q3lvonVDXLWmKQFdudte2p5G1rCYp
         RVCcVYLiRDHe1rxz+iGD1bJ19a2LoAC5z0miBg8I788Def1js93fq7drRVXZdNS26R13
         UnnRmVsYQpkMOQqyFLSt6RoynkjorxsG76w0WY9nzHxR3eknHms4r6T1PRRybxDGFUz7
         X6O82uWSVvSR5YTRhUvqJeUZihX/r7KOV478vNKXthZopVovLmhUu5PLjXBG8sTKgQ9m
         amHtltZ0/s0L/DU1nqWZ3iNpJkbb7B6kjHoNQTSeFULE+WdU31YltZ0C/osAUTntiGEl
         l4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWEB9osAQee35AyhlgRxJbWS6irJ5cvGkHpX55XRn1E=;
        b=CxViOqk6I+7zZ+AkhiEPb3pePNU3eQwHj2xxtSs+sxyDF623ma0A8e0Ul20ZsRAQJL
         b/mHnrIQcaqS5JlvvE9fxOKfIkM+o2cYRw0hTFGAAapRiCrq3CwPhNEDKqORSFMO6vDD
         HDqodZy4GucNH3tGC3GM3f29MEVuz0SUZgNXusQ7VaQtEV8Z76SfEPTTlyRKOf+3veHK
         UwO4P2t0bjd1q4jH8hzP7eBD4VnpuSetSdORz+i6FsoFf7iPLoyfldXsCTMtJmyRN6DF
         VbFVXKDmvbYJMtr9dnl3/LrEvMPsxwobqlNzEEIa7ELLZaTVmFmvUi9ColfyTUuIZG+T
         c37g==
X-Gm-Message-State: APjAAAXV3WhfROzxYbcaxAEKV3Cx8akx4wcJNxDH72XKgfxRraSAb/VB
        Bsrw29O748p8J9AEGEh+NHRoxVUCtzgvtiO8tnITFA==
X-Google-Smtp-Source: APXvYqyi04G4z3qmQczX0PrqdoD0ePmtzfbw4P+sB+JZvmXhdomvbxqXJ3pHKBiLdD/c9bC+H9OTsi2VKUlpDUvwjCE=
X-Received: by 2002:adf:f685:: with SMTP id v5mr16542105wrp.246.1571659265641;
 Mon, 21 Oct 2019 05:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191014121910.7264-1-ard.biesheuvel@linaro.org>
 <20191014121910.7264-8-ard.biesheuvel@linaro.org> <20191021100517.GA1780@pi3>
In-Reply-To: <20191021100517.GA1780@pi3>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Mon, 21 Oct 2019 14:00:59 +0200
Message-ID: <CAKv+Gu8AK+oTRw5Q1NMWkxmycAD+tkqeiqBM-kV_oeebu2sYug@mail.gmail.com>
Subject: Re: [PATCH 07/25] crypto: s5p - switch to skcipher API
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 21 Oct 2019 at 12:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Oct 14, 2019 at 02:18:52PM +0200, Ard Biesheuvel wrote:
> > Commit 7a7ffe65c8c5 ("crypto: skcipher - Add top-level skcipher interface")
> > dated 20 august 2015 introduced the new skcipher API which is supposed to
> > replace both blkcipher and ablkcipher. While all consumers of the API have
> > been converted long ago, some producers of the ablkcipher remain, forcing
> > us to keep the ablkcipher support routines alive, along with the matching
> > code to expose [a]blkciphers via the skcipher API.
> >
> > So switch this driver to the skcipher API, allowing us to finally drop the
> > blkcipher code in the near future.
> >
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > ---
> >  drivers/crypto/s5p-sss.c | 191 ++++++++++----------
> >  1 file changed, 91 insertions(+), 100 deletions(-)
> >
> > diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
> > index 010f1bb20dad..e6f1d4d5186c 100644
> > --- a/drivers/crypto/s5p-sss.c
> > +++ b/drivers/crypto/s5p-sss.c
> > @@ -303,7 +303,7 @@ struct s5p_aes_dev {
> >       void __iomem                    *aes_ioaddr;
> >       int                             irq_fc;
> >
> > -     struct ablkcipher_request       *req;
> > +     struct skcipher_request *req;
>
> You mix here indentation.
>

Will fix

> Beside that:
>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>

Thanks!
