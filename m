Return-Path: <SRS0=DrGz=Z2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B19C43603
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Dec 2019 07:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 634EA20640
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Dec 2019 07:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575443148;
	bh=S6YXY0WSGd40GdEaNS2ZuBBJrr6gttgFTL/R8NsDtj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=y+Cy+1eFMJYqewJgY6r9mmYBKtiemZ/0KJCdAVlzM4+BfNARbdn5InO7SN/R+PC4N
	 ZetcMOwXiCQ7vhDKHYE6ma0XdoxupMeuRTUi7+HZ0uH83pmYYHyq/sTVAoOjg7PGOy
	 8SqZAPIKV5ViWNexg3xl66W98VXnUtf/qohrClHg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbfLDHFs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Dec 2019 02:05:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:35714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727195AbfLDHFs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 02:05:48 -0500
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E97C20640;
        Wed,  4 Dec 2019 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575443147;
        bh=S6YXY0WSGd40GdEaNS2ZuBBJrr6gttgFTL/R8NsDtj0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oPQhtVT6DXaj/yFVSSehxU12rdGiiY2EW3oHDV3cNfOND2cxeIo9d0ygr0ouEQwRO
         5poye7OWzkmKepdangoL/gKDAfiHtY/HIN+0W4xnLmygGO0Tw56raoYHvHBvOgXjbc
         3vqrZjwqLoL3PfDMkKNRZ/Ewl9VxeCmS8ih4+3zo=
Received: by mail-lj1-f179.google.com with SMTP id e10so6772149ljj.6;
        Tue, 03 Dec 2019 23:05:46 -0800 (PST)
X-Gm-Message-State: APjAAAXaNgMf9uF+Y+mPS9JeYcWPElf3P51l7lo7i6aerRLn4eavOf0y
        dQqxzUD+ctmAt4935KSnGlGfYTUonf9eOHDK8fA=
X-Google-Smtp-Source: APXvYqwmL/CgrLwkzf1hlZYxR/WYkN2neDMd1x0s3IQW70j+RMiyMWx9RmGC7qai42FYwmWcxLrrjlMhD8JwCd2wdw4=
X-Received: by 2002:a2e:b0db:: with SMTP id g27mr983748ljl.74.1575443145285;
 Tue, 03 Dec 2019 23:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20191203214838.9680-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191203214838.9680-1-christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 4 Dec 2019 15:05:33 +0800
X-Gmail-Original-Message-ID: <CAJKOXPdfdWYELkxh0HO4GhoinG55Uk7G9o6-q+A4+pPn3f+-jA@mail.gmail.com>
Message-ID: <CAJKOXPdfdWYELkxh0HO4GhoinG55Uk7G9o6-q+A4+pPn3f+-jA@mail.gmail.com>
Subject: Re: [PATCH] regulator: s5m8767: Fix a warning message
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     sbkim73@samsung.com,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>, lgirdwood@gmail.com,
        broonie@kernel.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 4 Dec 2019 at 10:45, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Axe a duplicated word ("property") in a warning message.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/regulator/s5m8767.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
