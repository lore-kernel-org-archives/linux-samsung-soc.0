Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553CDC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 17:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15ED3221ED
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 17:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599844064;
	bh=yuRr3Tcaig0mI/EZNz5/o4kpMAv1u8FNHeBFUveQ68E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=plhcHwqbiA33jLeMpMX+u12XM/c/5AL+fobAHXB9N0sBr9vHHfgacqz2P94dgjmut
	 GaYUdw7ZJaLcmlLPOYVO2G/X9Sjpx9lTRpNpw5BKSwoEZxutvXUCQK5gvn8j6u7chY
	 2knG6D+nfZjXi/Y1yoUr7Y7SMRzKJsaJ5HxZkx3U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgIKRHn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 13:07:43 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38773 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgIKPCG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:02:06 -0400
Received: by mail-lf1-f67.google.com with SMTP id y11so6161492lfl.5;
        Fri, 11 Sep 2020 08:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aOEss69u0HOf22P48MgZ3tBTFDKG/yZuI7WmzKdffDM=;
        b=DNcECUgfGuvRnKAAT1SPl3ifhHqGMNkQ1zOQWBks2P0vaq2OnzqGak2l9S0+Q7af7J
         D3j0ETChrd9Z69axjsOe/EAtwMNQGG1b+KneacHejfUK06l3Lug17O7NRy2fn5qMr41A
         Lh/yL6KJXJslWGvReasIGTT1YgFm5mZZTqPqIRNSX9raZrvwkhvwIAPhEO+3ivJvLUyd
         616thY4zTDHisw33u5oOPeo4bx+ux418oSYrPji8TcbD7vFWTFthstBSX5vrRojCUkBr
         5d0Rvc7kclNctLQbgS5giKsMPsaS/SFvtY/+GLaA9mYSlJdANw6tbRgaHGGyQ5eHbzfJ
         czXA==
X-Gm-Message-State: AOAM532aTmZ0unzscYH5xi9UdaZGz6HUvphQT7Za1Ot/Af7GX9rRVqr0
        YQjxR3QNrukPJ9LZOMe8y8IU+T0o6KB9EA==
X-Google-Smtp-Source: ABdhPJwuI4pGTArYk3AIoPmW73BVQfttNnu3/IOhNJnwaeSyTKJzti6CLpR1dy2frjoSivz3v0G8TQ==
X-Received: by 2002:a17:906:4993:: with SMTP id p19mr2504434eju.277.1599836063629;
        Fri, 11 Sep 2020 07:54:23 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id e15sm1851929eds.5.2020.09.11.07.54.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 07:54:22 -0700 (PDT)
Date:   Fri, 11 Sep 2020 16:54:20 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: exynos: Add clocks sound node in
 Exynos5422 Odroid XU4
Message-ID: <20200911145420.GD15290@kozik-lap>
References: <20200906142146.21266-1-krzk@kernel.org>
 <20200906142146.21266-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200906142146.21266-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Sep 06, 2020 at 04:21:46PM +0200, Krzysztof Kozlowski wrote:
> The dtschema expects "clocks" property if "assigned-clocks" are used.
> Add reference to all parent clocks to silence the dtbs_check warnings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Move clock properties to i2s, just like Sylwester Nawrocki did for
>    Odroid XU3.
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts | 60 ++++++++++------------

Applied with reworked commit msg.

Best regards,
Krzysztof

