Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD9BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 03:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA5CB6103B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 02:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238699AbhJ0DCX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 23:02:23 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:40702 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237816AbhJ0DCX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 23:02:23 -0400
Received: by mail-ot1-f43.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so1621691otr.7;
        Tue, 26 Oct 2021 19:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XeMB8+UkBEMxXaft/WjizoBKvUlz9bR0K2KbnVOPBOw=;
        b=RvrulXdhn5jwOSsbE8cDl+m9bZy4QN8ggZdx28uAR5UzJ7pyqne5Qf62maR3RGy1Ad
         6cDc9hFSFLJY0j+eZMQMc7FoXph4Ks5pMRyJAogI5Y/a7tyFQOCHItCwNg4cX0O60rqQ
         g5rMjgJLUT1QbazCSKrGZhmU71h0Eyf+XODNtnbOnKIH9lJeyz0bTFW/rgaLUPO9VFNc
         BVUQpunRa4E+xU/c44vBJq7sV/9vtAAbkzY3M2PSxarY9f04oV5s8U0Xjyr+zB0jioyA
         gzadDXUHVPl5JdtxuC48XIwMjgY7ydweOzrhcG1SnAZ9lxfHZuTeJQWiU81zZ7Onmr7N
         2CXQ==
X-Gm-Message-State: AOAM530S9EIYXWLavslXr62jo8NTjnJggF671pIgonKsSJFyjPV2eXh1
        rs8z/7gKjt2lZZ70OUc8TQ==
X-Google-Smtp-Source: ABdhPJxgSANB4B3sT0zR1/ob6F382N+PtlEIBypB1GdoM8FG0l15ngWS6pMsHb7BHpsoU9oeeMBEQQ==
X-Received: by 2002:a05:6830:154:: with SMTP id j20mr5162090otp.249.1635303598020;
        Tue, 26 Oct 2021 19:59:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x5sm5163726otk.28.2021.10.26.19.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 19:59:57 -0700 (PDT)
Received: (nullmailer pid 3898810 invoked by uid 1000);
        Wed, 27 Oct 2021 02:59:56 -0000
Date:   Tue, 26 Oct 2021 21:59:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 21/23] regulator: dt-bindings: update
 samsung,s2mpa01.yaml reference
Message-ID: <YXjArKJ1nw3rkx97@robh.at.kernel.org>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <9acc235dc4af794d18e1267371944a3955e1fb21.1634630486.git.mchehab+huawei@kernel.org>
 <YW60a8z0JNDnTLV/@sirena.org.uk>
 <20211020073013.6d144c0d@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020073013.6d144c0d@sal.lan>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 20, 2021 at 07:30:13AM +0100, Mauro Carvalho Chehab wrote:
> Em Tue, 19 Oct 2021 13:04:59 +0100
> Mark Brown <broonie@kernel.org> escreveu:
> 
> > On Tue, Oct 19, 2021 at 09:04:20AM +0100, Mauro Carvalho Chehab wrote:
> > 
> > > To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > > See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/  
> > 
> > It'd be a bit easier to put a note in here about what the dependencies
> > are rather than forcing people to go out to a link to figure out what's
> > going on unless it's complicated. 
> >
> > For a case like this where there's no
> > dependencies or real relationship between the patches it's probably
> > better to just not thread everything and send the patches separately to
> > everyone, the threading is just adding noise and confusion.
> 
> It is not that easy, unfortunately. On some cases (specially due to
> DT binding renames) some patches change the context of a hunk, affecting
> a subsequent patch.

Those should be reduced now. I've been checking the renames since early 
August. July really, but MAINTAINERS was not getting checked initially.


> I tried a couple of times in the past to send the patches individually,
> but that was messier, as there was harder for people to apply them,
> as, instead of running b4 just once to get everything, maintainers
> would need to apply each patch individually. Also, there were cases
> where the patch order would be relevant, due to context changes.

Just spliting between in Linus' tree and only in next would help me. The 
former I know I can just apply.

> Btw, talking about what it would be easier, the best procedure to
> adopt is to run:
> 
> 	./scripts/documentation-file-ref-check 
> 
> Before sending/applying patches touching documents.

Good luck with that. :(

> That would avoid the need of such fixup patches ;-)
> 
> Unfortunately, in the specific case of dt-bindings, things are not
> that easy, as doc changes usually go via one tree, while references 
> to them come from other places.
> 
> Regards,
> Mauro
> 
