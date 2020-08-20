Return-Path: <SRS0=tRmH=B6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1835C433E1
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Aug 2020 15:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFF272075E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Aug 2020 15:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597937970;
	bh=a8KWFHmaznQxVVEK96TRVb0wBudonUCe7NqL/ksUCuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=U84PeP2G4vB8xuKiDDvhoAmboFhYCGFt+IqNlY7BTGPbgUUQx8R4oWPIi8AubYlZW
	 JVB4GcweEwEfqpGlhQr6g4w7SKRFVs8tZ+d5dXeZ8jrKpxvkDqbbYPuK7gQShaTZib
	 lFv20/ONFIvXRq5jMyvC+9C3MPNv9VZhPPW6VwHY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgHTPja (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Aug 2020 11:39:30 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55459 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgHTPj3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 11:39:29 -0400
Received: by mail-wm1-f68.google.com with SMTP id 9so2002424wmj.5;
        Thu, 20 Aug 2020 08:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MhLvoz6dN7urYtcgesShmUyNKBoosukHj2muJjGd/2U=;
        b=gy2U09aGJEazJVOCpHS3qkYYfdh19dVaApI2uadzd/0Uoh3gYdj5FYHzV2D3FuZGoX
         8ZQBK5w513MX7SAH3NvNXI96eCvcV7UjTwW2AokRxW+pcpq69Mf7nbY3C8zFqlwt9vE2
         WDZVri+DBBe8ip0YDkEvN00t0UHXTa1CkcWe412D43kkooYT0KyGERwllWSrGXrSmnI2
         7pKmzniUKStufBdS2yEcWlEdjk+NOp9C6HYpGekwfov2SRiSXEcmXLdpcs/JZToePATU
         9hg9CyYRuD0T1SN14xnPBbCmfai0jtxwioW/16jgNqoFVnrgu3+lxI1wlGBzRqdcpZw7
         UvXg==
X-Gm-Message-State: AOAM530S3e6NIioP3ZlGldq0H7Y9F6ZCsePtogxrBnmIIR1P9c3NbXXz
        txT1vBT2BUaViop9WBBc8EPr2FIgYBM=
X-Google-Smtp-Source: ABdhPJxAr5SjwRUJhKexQUTUi0ZBWPwxg3/wvl0ag4Ol1A286zSvpoLoAailuRwcb3/C7oxhjJmTew==
X-Received: by 2002:a7b:c845:: with SMTP id c5mr4151981wml.180.1597937967176;
        Thu, 20 Aug 2020 08:39:27 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id z207sm5029545wmc.2.2020.08.20.08.39.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 08:39:26 -0700 (PDT)
Date:   Thu, 20 Aug 2020 17:39:23 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 01/41] ARM: s3c: Remove unneeded machine header
 includes
Message-ID: <20200820153923.GA17410@kozik-lap>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200806182059.2431-1-krzk@kernel.org>
 <159783932455.55025.7979458249415199743.b4-ty@kernel.org>
 <20200819190232.GA18183@kozik-lap>
 <20200819191722.GA38371@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200819191722.GA38371@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 19, 2020 at 08:17:22PM +0100, Mark Brown wrote:
> On Wed, Aug 19, 2020 at 09:02:32PM +0200, Krzysztof Kozlowski wrote:
> 
> > Thanks Mark.  Could you provide me with a tag/branch with these to pull
> > into samsung-soc?
> 
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
> 
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/samsung-platdrv-boards
> 
> for you to fetch changes up to dcacbc0f9bb89ac48d5b602d27a8630e641294cc:
> 
>   ASoC: samsung: s3c2412-i2s: avoid hardcoded S3C2410_PA_IIS (2020-08-19 20:15:45 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Convert Samsung drivers to platform drivers

Thanks, merged into samsung-soc.

Best regards,
Krzysztof

