Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DD7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Sep 2021 13:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74A8360F13
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Sep 2021 13:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242959AbhIFN6w (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Sep 2021 09:58:52 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36410
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242826AbhIFN6v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 09:58:51 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1C3324019A
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Sep 2021 13:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630936666;
        bh=J8YbYX9rObxi/+dAj0p29flv/Pb6qwtzNhWxLnF5+5k=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=EYmuHhoCurZtRGtUsVd/PPRZQp4QsT421ABpIXah25aBKrX+D9K9OgnM/dpVl011h
         n/XdL/okJWwscZ3Qvg5YVilRRkmtDBcC7jba/NcNNEbgNZFUr/wpZeNJqhgFTqltwt
         kUH0UgTpsxfz1jIcvXLBbzF2iNYyobsnloTzFZSNgdiGC6qOsuilXcWAMCv438bvMB
         b0LWyhLSlyp3PGUTet/0epcHuMB3HF25RYtX9Wk4CFm8EOIjVOPFAh1qLeaBGNM8bA
         9vIo6UJyCXAznBlTPFHL5xYFrW92VH0tsBE406/mog/QbEfg1Ix+mxf8nhx+l22Bj/
         Ob2qtOjdek42A==
Received: by mail-wr1-f71.google.com with SMTP id n1-20020a5d4c41000000b00159305d19baso1224327wrt.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Sep 2021 06:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J8YbYX9rObxi/+dAj0p29flv/Pb6qwtzNhWxLnF5+5k=;
        b=rObdJ/gMkDriIM9jEKfjxjcQBYCKsYJ9mQFLvHOH1dUix82juXhiUKJgyvPqTE3HO7
         pM5IPryQht10MSZL57wrhzW8dMbCszWuNTm2nlnN2d12eOEVnJh3UZc4GN8hpKcKonAC
         H/c0fGb5cVnPRsG9B10x9225UnvXfGnVUOXxPOaiW7PNplnmaeGuh62ML7ZyS+FvPLQt
         hPHE/mDWKD7cNF7h4Mf9LUleMeaPHmXuMyOy+50OfyHgJkStIRtnAGJUApYrMUVM15Bt
         B9rC3jd57dUVXohhD0rP8gVBR/daJdlXpsojvlx4sFqACvl3kS8rn1Tv3fy/2NfC8t0r
         h9Bw==
X-Gm-Message-State: AOAM533m7TMewf3OZGDbYjawbY9/Zl+Z6aUSQ6mRdtH3t17ck3eVbI6m
        GfsimzXrsTj9l6msPSAZVHc8JhyXPgb4dl8QK0XkNABroCMa+MtbetndMVtMELkiAgj645iQnzg
        fjtW02+e2zPEPPcOAuua4VK/QWZvyUVkVPVwPiGi/oTtzgjPn
X-Received: by 2002:a05:600c:2295:: with SMTP id 21mr11497243wmf.84.1630936665323;
        Mon, 06 Sep 2021 06:57:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfKIgSTWWuKIqTodWd4lKtj/JI/NVBFOzbRNEQLz76HjYJektmsLbR+IXiCrH1QFEpjoH4Jw==
X-Received: by 2002:a05:600c:2295:: with SMTP id 21mr11497232wmf.84.1630936665170;
        Mon, 06 Sep 2021 06:57:45 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.217])
        by smtp.gmail.com with ESMTPSA id o10sm8422907wrc.16.2021.09.06.06.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 06:57:44 -0700 (PDT)
Subject: Re: [PATCH] ARM: s3c: Use strscpy to replace strlcpy
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210906134656.101088-1-wangborong@cdjrlc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6ca0d3e1-b895-e6c8-e075-786f24c19696@canonical.com>
Date:   Mon, 6 Sep 2021 15:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210906134656.101088-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/09/2021 15:46, Jason Wang wrote:
> The strlcpy should not be used because it doesn't limit the source
> length. As linus says, it's a completely useless function if you
> can't implicitly trust the source string - but that is almost always
> why people think they should use it! All in all the BSD function
> will lead some potential bugs.
> 
> But the strscpy doesn't require reading memory from the src string
> beyond the specified "count" bytes, and since the return value is
> easier to error-check than strlcpy()'s. In addition, the implementation
> is robust to the string changing out from underneath it, unlike the
> current strlcpy() implementation.
> 
> Thus, We prefer using strscpy instead of strlcpy.

Don't copy-paste kernel documentation into commits. It's enough to say
that strlcpy is preferred, according to the kernel coding style (see
strlcpy()).

If you want to add more sentences, make them relevant, e.g. describe
possible effect of bugs depending on the source.




Best regards,
Krzysztof
