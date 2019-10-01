Return-Path: <SRS0=5wrF=X2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7D4ECE587
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 19:32:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53CB021855
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Oct 2019 19:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569958363;
	bh=xHOQAR2EN/rWQ24FFJkuUQoUC/7ga20TE+gudo3uAFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xaiHBo4Dv+OwgzZLCOj0Q7cLKiT6Q0+D9IJT0oOqf6/oFddBc+VleDievsYAo0uSp
	 HBUijvYrp89gvI+kKjhP1YBQ4oJ2G3GMOLPg3L6dL+OKwWzbRmRgXNUQ8IY4t1ligP
	 XILdDw+gFgf5ECdW+SBOhVfwGJ9W7OxIjfllnwL4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfJATcn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 15:32:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44712 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfJATcm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 15:32:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so3767946wrl.11;
        Tue, 01 Oct 2019 12:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ayUbWJsxkqD+mo0+GTLk1QtdaMyIPMQiVn/aJA6TKg8=;
        b=aG16SI8+yP/uMVk4R/RE2X/uZ3hTAvchJDTvLuIt1HL+7l300TZw1JtQbomGG2DvWW
         Yna4S2abLYPXX3xAt30NxkyvgWSZZd/fHH68WAXMHrKPyyjnYfCIUTI7Vm5t48dD72m9
         JCMlamy3hNS3txsulO06zBYo63i370I//bnQlOld6JSRZ+8Rh9xTEs8wa8UOZQloym5d
         fVZsecM11/mBtVPhRtFzU0rRQCCd/dMnv/1wu8pnwBKMy7W0SunmqR63mZ+oges9NyJc
         79QyazIqV72iHH+8tbh/hzeKbJoIa/xVPjFylzdb8RIE2/PKvBmEmY+D/zwVPFhtRNjW
         Rlqg==
X-Gm-Message-State: APjAAAXSHGgtRDlxcN63ATYwHCoAsKDExT4tBqj8/vdYGgT9eeDew/m+
        hv/eGDpk3ZURvdyo9K3Q22Y=
X-Google-Smtp-Source: APXvYqwGswH3573Oay8QhO1I8alNz0mzREZr4xpskZM5gCgbs1QivesTORhlknY68JOJMjfr7TIqUA==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr7835261wru.274.1569958360403;
        Tue, 01 Oct 2019 12:32:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id f8sm2516442wmb.37.2019.10.01.12.32.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 12:32:39 -0700 (PDT)
Date:   Tue, 1 Oct 2019 21:32:37 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, kgene@kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: exynos: Add of_node_put() before return
Message-ID: <20191001193237.GB1815@kozik-lap>
References: <20190804160200.5139-1-nishkadg.linux@gmail.com>
 <20190805162154.GA24769@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190805162154.GA24769@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20191001193237.mBL5sL06W7nVNo5sCZ0jd4yXVfHh0D09vXsNpCcLIVM@z>

On Mon, Aug 05, 2019 at 06:21:54PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 04, 2019 at 09:32:00PM +0530, Nishka Dasgupta wrote:
> > Each iteration of for_each_child_of_node puts the previous node, but in
> > the case of a return from the middle of the loop, there is no put, thus
> > causing a memory leak. Hence add an of_node_put before the return.
> > Issue found with Coccinelle.
> > 
> > Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos.c | 4 +++-
> 
> Thanks, applied.
>

Hi Nishka,

I am sorry but I missed the v5.4 merge window and did not push this to
Linus. It's my fault. I'll push it this time, for v5.5 (no need for
action from your side).

Best regards,
Krzysztof
