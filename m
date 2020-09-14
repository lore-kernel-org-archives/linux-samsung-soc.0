Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MALFORMED_FREEMAIL,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7692CC43461
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 07:08:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3621421BE5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 07:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWzwor+b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgINHIm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 03:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgINHIj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 03:08:39 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C020C06174A;
        Mon, 14 Sep 2020 00:08:36 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z23so21604102ejr.13;
        Mon, 14 Sep 2020 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=3BwV3eqQxR2q+pjhckPY9e2FGa7fDKgyPbhSIosiRac=;
        b=RWzwor+bVqWYRQlIlKtz9Im9rt+ctVgfNYz/qvojMqE5WP3pVKL8rNSceBnNmu89no
         ik6VpaY1n6IWLNSGepwca8jQgNv/iEYcNQDqhqpDzaI+EhTCnZ1D0UuMmuXeBc+DoQpb
         8bBIa/65W8UqBXTVZY1NdjldRuZgRHGMZA1/X9sbY6rk/EakGdDpzBsF0C/iHolVtU3k
         sTKQ5AJZcaa2a5Li8Ph/FL2Wu/miW5+//3nS6ngwF5oCGk0Gwx/84Q8BwJpkL1xAaFkO
         RFGl5VKKtXzeDlAB0yTZtR98s8so0zW+DloncaKcdM68bogbLyRExtUomWjT1gwvULzR
         bilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=3BwV3eqQxR2q+pjhckPY9e2FGa7fDKgyPbhSIosiRac=;
        b=JV3hSPZ4qCgTPPTWGiG6/LI7QQKUbrokyNKFbktR+P4fMyTvzjH9z658P8nPT0ArHj
         sqZxm0NgHqiWLxr0OihbLjmygsh/RiIYyuMdaH3x/WSYbxZluOP7fjJBAXpX8TYnTnVl
         HhbSDrNvWfLWjtyZ40YJc70kS3OHaleRetIF/btr7r3KvwcKVUmyiBfWGold9vj2I0Uv
         DQRldsEGr8O/NlU1O3QWDmEh8NWTTHBHkaS7X6nocI+QKMu+uVclU4krdY4Z8VLPVveK
         Xbybz2t8O4PF62RmPP6mQsn1TGL5djNwQlTdph56QYACKqkQLRhEiXI+Ue/XozJxljvQ
         l4SA==
X-Gm-Message-State: AOAM531OycZz5XcEw4h7Q1vD6JFkK1GexanFgIYR8Z8Ang2LiIUUmMw/
        gytgfopzjG8F38oRbVDLzJ1qq0jfxmmls7Ef
X-Google-Smtp-Source: ABdhPJzyF0wH7O+BzLyXZXC7DAnv404JgSq4TUAfNNmUQx2qdz7opyv/dSEdSQhJN0ddtOAWkab1Sg==
X-Received: by 2002:a17:906:4154:: with SMTP id l20mr14138366ejk.68.1600067314823;
        Mon, 14 Sep 2020 00:08:34 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
        by smtp.gmail.com with ESMTPSA id i3sm8745206edn.55.2020.09.14.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 00:08:34 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Mon, 14 Sep 2020 09:08:32 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Joe Perches <joe@perches.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: make linux-usb list remarks consistent
In-Reply-To: <da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2009140834010.17999@felia>
References: <20200912121346.2796-1-lukas.bulwahn@gmail.com> <alpine.DEB.2.21.2009121416500.3770@felia> <20200912124025.GA174230@kroah.com> <da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On Sat, 12 Sep 2020, Joe Perches wrote:

> On Sat, 2020-09-12 at 14:40 +0200, Greg Kroah-Hartman wrote:
> > On Sat, Sep 12, 2020 at 02:19:02PM +0200, Lukas Bulwahn wrote:
> > > 
> > > On Sat, 12 Sep 2020, Lukas Bulwahn wrote:
> > > 
> > > > This patch submission will also show me if linux-usb is moderated or not.
> > > > I have not subscribed to linux-usb and if it shows up quickly in the
> > > > archive, the list is probably not moderated, and hence, validating the
> > > > patch.
> > > > 
> > > 
> > > The patch showed up in the archives within seconds:
> > > 
> > > https://lore.kernel.org/linux-usb/20200912121346.2796-1-lukas.bulwahn@gmail.com/
> > > 
> > > So, the linux-usb list is most likely not moderated. Patch validated.
> > 
> > Yes, it is not moderated, and never has been, no idea where that idea came from.
> 
> There's also linux-samsung-soc@vger.kernel.org
> that is listed as moderated
> 
> Are any of the vger lists actually moderated?
>  


Joe, I found these five list entries with inconsistent remarks:

- linux-usb@vger.kernel.org:
  - Patch: https://lore.kernel.org/lkml/20200912121346.2796-1-lukas.bulwahn@gmail.com/  (the patch here)

- linux-aspeed@lists.ozlabs.org:
  - Patch: https://lore.kernel.org/lkml/20200912183334.22683-1-lukas.bulwahn@gmail.com/

- linux-mediatek@lists.infradead.org:
  - Patch: https://lore.kernel.org/lkml/20200914053110.23286-1-lukas.bulwahn@gmail.com/
    - initial patch here was wrong.
    - waiting for somebody to confirm that it is not moderated to then 
send the correct patch.

- linux-samsung-soc@vger.kernel.org:
  - Patch: https://lore.kernel.org/lkml/20200914061353.17535-1-lukas.bulwahn@gmail.com/

- linux-arm-kernel@lists.infradead.org:
  - by 'majority vote' (131 vs. 27), it is probably moderated.
  - no patch sent yet; patch will follow once the others are accepted.

Then, more patches on adding 'exploders for non-subscribers' remarks will 
follow.


Lukas
