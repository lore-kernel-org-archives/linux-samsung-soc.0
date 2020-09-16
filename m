Return-Path: <SRS0=Wlns=CZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900B9C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 20:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EFBD20770
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 20:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aADs+wA7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728403AbgIPUsE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgIPRBO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:01:14 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E626AC0D941D;
        Wed, 16 Sep 2020 09:54:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z9so3782141wmk.1;
        Wed, 16 Sep 2020 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zX0LITDdTRuuCUge/vQRwE/mjMWdK4VvHcKMoxIg+PM=;
        b=aADs+wA7Plzzsr9mINUP5TmmQYKvZ662dmq2plN2cCpo5awBVMFzy/lFDfCyFsTyxa
         7JSJxNl8H4X8yEyPwkwpAsRmhC9Iac/1/wWVlbVvZIouPZ5SnmZEZT8fN5JJ5ZyvTUZB
         PTka1oj0qXKGyFYkNcHHG1WTYqFQ8ciqqlvo3l7Ib3Pg/G9ef+l6tz8cPPTt7iB0t//f
         icbBjMBpW2b1o1zg8ih2Kv/fNBbrH5WfL9l5UsIOPXUDLxTekbpyNuYp0UXJx0xoA8jY
         RxEzbW3/xVYpP9g8uW5jJRhCYAHw1ussrb8BT0TUTSFKjTKdiNHwOP4HbuJtwiLKxR3a
         Pwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zX0LITDdTRuuCUge/vQRwE/mjMWdK4VvHcKMoxIg+PM=;
        b=uI/jSXPvWpJawMrwL+fKrzpnzigQ/bkGbbqO3RRK6bcXxqbpKWr/OI/MslSHBNgCke
         dFPxh3ktleJ8W7IKwRkNHdo5bC63ioMGcXyQ2SapKX3WdWlZFyHc4MdpeAgu2z0nXFmZ
         bgZ+HcGTan9oQhw38Cbz+WmQcvKGYdHzvIaLMmoRtNRwJnU0q2aOg+9Q3/vBkUUUJ0za
         H3GJ3AQaPyyB63Ux6H8vEGRdB3WkSziAKENHXzzRAJP7rzmjj3Hu8UPXAy2g6zdz3rP6
         r4szSfLHVuETMM95rQu/F4MsjsKEuAivKl279c3lXvD+aBiIUARhxMW7RbF/UtdwQsT8
         +JQQ==
X-Gm-Message-State: AOAM530Mtf/zE6k52tPvIyV3hWVZALwhQa6/0/av0hyCced3T44U7vVb
        S84rnaGOVdCP0/KVRy9MeDo=
X-Google-Smtp-Source: ABdhPJzdve2S5+ojtGAs6QR7XcI+4lN6whbTHWSGnFkjuxZ5CBL0MKIrnOCDXAV6/8zWm00ogW6uOg==
X-Received: by 2002:a7b:cd8b:: with SMTP id y11mr5813023wmj.172.1600275240202;
        Wed, 16 Sep 2020 09:54:00 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id o15sm6107022wmh.29.2020.09.16.09.53.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 09:53:59 -0700 (PDT)
Date:   Wed, 16 Sep 2020 18:53:57 +0200
From:   Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: mark linux-samsung-soc list non-moderated
Message-ID: <20200916165357.GA18287@kozik-lap>
References: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Sep 14, 2020 at 08:13:53AM +0200, Lukas Bulwahn wrote:
> In fifteen entries mentioning linux-samsung-soc@vger.kernel.org in
> MAINTAINERS, seven entries mention the list being moderated for
> non-subscribers and eight entries do not. Clearly only one can be right,
> though.
> 
> Joe Perches suggested that all vger.kernel.org are not moderated for
> non-subscribers.
> 
> Remove all the remarks from the entries following Joe's suggestion.
> 
> Link: https://lore.kernel.org/lkml/da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com/
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on v5.9-rc5 and next-20200911
> 
> Krzysztof, please pick this minor non-urgent cleanup patch.
> 
> This patch submission will also show me if linux-samsung-soc is moderated
> or not. I have not subscribed to linux-samsung-soc and if it shows up
> quickly in the archive, the list is probably not moderated, and hence,
> validating the patch.

Please use scripts/get_maintainers.pl (for example on files in modified
maintainers section) to get the addresses of people.  This mail missed
all my filters and got archived immediately because you sent it to
unusual address (how did you get this address, BTW? It does not appear
in the sources since few years).

Thanks, applied.

Best regards,
Krzysztof

