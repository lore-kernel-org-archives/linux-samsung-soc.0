Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26640C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 21:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6E6260F70
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 21:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhJaWCU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 18:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhJaWCU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 18:02:20 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FB0C061714;
        Sun, 31 Oct 2021 14:59:47 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z20so58525818edc.13;
        Sun, 31 Oct 2021 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=09tEUv5Pi4zmLS18Hb1uKDpyMm0U+qPl49dllrip6RQ=;
        b=NCaENn9MM8pVshKjZ3XkwgH1nJLaF7wVaIqe83GIw3IcBzaTo8QlodYGYjzCO/H66K
         JcuLMmPQteF2Tgs79MnSAefh7nRqHgSXdcdVIeuVmlNNMNyqTV71RrXRct9cJBL2Pu6K
         ERORJIn3gsuWRezs/1AJPeu0T4GW7VwhUU6pNKdmXgs/ixMScmml9QuRH+Ex2rZ3kO8y
         1TR4T+O+jjO7j1gu/y+W6EV5cY/YnA0qnsJdV8NVguDTOC3FfjGaKAJqXAB8KzCCJH9G
         kiXVedYmkdKHk9h0pcJH1GS3bjYA4ADsmANSeiwslzLfjqCyIE8/vx29j5cZ+Lk+DyG3
         KoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=09tEUv5Pi4zmLS18Hb1uKDpyMm0U+qPl49dllrip6RQ=;
        b=hTnODSperS5iNk+sP1izSvrvXfD9fLikHN1u9o2kfJiGIpjmJf+Voyk19Skp9ODRWm
         qiKFHidkWt2bvzdaO8dKM23+xdMNZWHUACmJQAywOilY2EPXB0MVVDYbYL3PvvYl+I8U
         MtvzI+R4igkEsLtH1xwKLMm5C0ruliAuQWwtFJ3Wgl01b4kmOBNPghOnBQjEIouzfXV4
         nQjhNP7GXPGt12l7Kzh9gjJkIYORCVOnakkdnrN9+qr6sq9XgKII4dv+nabPhf9H4AO7
         Vz8pYs+42GhERKZDMVPLUG3FZyWftc0u9todP+cvFB6zZxMgZQRNQHvixGOVoV3wopF2
         ADNQ==
X-Gm-Message-State: AOAM533Bocc2fEBPrkK+Yrh+fm3zKexYrYnlm+5OO5t5r6lX7r9eWXdL
        O7GFY6xs2o1IXjVa+VjurEc=
X-Google-Smtp-Source: ABdhPJyxGAZwDuU/sGXUZ7wuLLoOLXRibhHMwUNBUNeuP/UMhvIcym3JFe6v0ISzHeTRSn1i1iJSJg==
X-Received: by 2002:aa7:df8f:: with SMTP id b15mr23157253edy.202.1635717586307;
        Sun, 31 Oct 2021 14:59:46 -0700 (PDT)
Received: from ArchLaptop ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.gmail.com with ESMTPSA id lb12sm6038887ejc.28.2021.10.31.14.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 14:59:45 -0700 (PDT)
Date:   Sun, 31 Oct 2021 22:59:46 +0100
From:   David Virag <virag.david003@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samsung: exynos-chipid: add Exynos7885 SoC support
Message-ID: <YX8R0t66PC5h3jiF@ArchLaptop>
References: <20211031175329.27843-1-virag.david003@gmail.com>
 <e1555f6c-63e2-60c8-9a7d-808545de01e0@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1555f6c-63e2-60c8-9a7d-808545de01e0@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Oct 31, 2021 at 09:56:01PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2021 18:53, David Virag wrote:
> > Exynos 7885 has product id "0xE7885000". Add this id to the ids with
> > the name.
> > 
> 
> Thanks for the patch!
> 
> > The downstream driver sets sub_rev to 2 if we are on Exynos 7885, we
> > detected sub_rev 1 and the 27th bit of the revision register is set.
> 
> There is no revision register in older Exynos boards, so it seems you
> speak about new version, but please mention it explicitly.
> 

Yes, the 7885 has the new version with seperate registers, that can be
used with the 850 compatible.

> > This is presumably because Samsung might have set the wrong bits on
> > rev2 of the SoC in the chipid, but we may never know as we have no
> > manual.
> > 
> > Both the SM-A530F/jackpotlte with Exynos7885 and the SM-M305/m30lte
> > with Exynos7904 (rebranded Exynos7885 with lower clock speeds) seem
> > to have this bit set to 1 and have a sub_rev of 1 otherwise, but the
> > downstream driver corrects it to 2.
> > Let's replicate this behaviour in upstream too!
> 
> No, let's don't replicate weird vendor behavior without understanding
> it, unless there is reason to. Please describe the reason or drop it.
> 

Fair enough, I included it because as I understand Samsung made a
mistake in this revision's chipid regs and set a wrong bit, so if that
bit is set we should report revision 2 as it is actually rev2 just with
a broken chipid. At least this is what I think has happened but we'll
probably never know. Will remove in v2 then.

> > 
> > Signed-off-by: David Virag <virag.david003@gmail.com>
> > ---
> >  drivers/soc/samsung/exynos-chipid.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> > index a28053ec7e6a..ec8c76275aec 100644
> > --- a/drivers/soc/samsung/exynos-chipid.c
> > +++ b/drivers/soc/samsung/exynos-chipid.c
> > @@ -55,6 +55,7 @@ static const struct exynos_soc_id {
> >  	{ "EXYNOS5440", 0xE5440000 },
> >  	{ "EXYNOS5800", 0xE5422000 },
> >  	{ "EXYNOS7420", 0xE7420000 },
> > +	{ "EXYNOS7885", 0xE7885000 },
> 
> This looks good, but please rebase on:
> https://lore.kernel.org/linux-samsung-soc/20211031205212.59505-1-krzysztof.kozlowski@canonical.com/T/#u
> because we use one compatible for entire family and I would like to have
> it documented which family is this here.
> 

Sure.

> >  	{ "EXYNOS850", 0xE3830000 },
> >  	{ "EXYNOSAUTOV9", 0xAAA80000 },
> >  };
> > @@ -88,6 +89,14 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
> >  	}
> >  	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> >  	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> > +
> > +	//Exynos 7885 revision 2 apparently has the 27th bit set instead of having
> > +	//a sub_rev of 2. Correct for this!
> 
> Not a Linux kernel comment. This will go away anyway, but please read
> the coding style and use scripts/checkpatch.pl for future patches.
> 

I did run checkpatch on it and it said nothing but yeah I forgot about
that. My bad!

> > +	if (soc_info->product_id == 0xE7885000) {
> > +		if ((sub_rev == 1) && (val & 0x04000000))
> > +			sub_rev = 2;
> > +	}
> > +
> >  	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
> >  
> >  	return 0;
> > 
> 
> 
> Best regards,
> Krzysztof

Best regards,
David
