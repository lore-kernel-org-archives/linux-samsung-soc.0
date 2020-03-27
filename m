Return-Path: <SRS0=2lPF=5M=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759CAC43331
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 12:37:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 400C52082E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585312677;
	bh=FWJFIsCp7vCD1dD53kBz3Y1oaeIXvopd3RBwqnuionI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jOkybOnhXW54xqg4CVfinuaUu66ohL/32RgvaV7pPAIG4Ts0kBup7JnMoabTdcZK0
	 BPp4yNnmhe5G/rTvf1E7WFWBLHr7BgkTXMugEZXXbqrkd7vjmvMLMrJqVjrGgFamtw
	 gjX9HlSRLYMV/Ss3jALi/4gIAGp39p3foCSa4tUc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgC0Mh4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 08:37:56 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44280 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0Mh4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:37:56 -0400
Received: by mail-ed1-f67.google.com with SMTP id i16so9933739edy.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rjUG5QS7Q5XJGTeXi+4o1Jgi1Y7D6gGHRNHscgc6o6U=;
        b=nWSGvkxvWC4xWK1hLPmje1phPrgLqT4ChoISEQB5sPjaar45V6cQ/oI4W9ZQgBmXoI
         iWUh0TsTmAHqfMxtfqx+d4XooeZjES9og49RL4GTWy4wUAGdYaLrQOofr12gRwcji6s/
         mnQqVy/9s2z5jBy/LsjeKWU4oRowf7Jn4DdGvWH4yPjpeOym9NqBGtM/JlQTGWrcVLMv
         tUBTsBcxLeWUP+bZI639amvBFNWOYAlo4CyOyGwt6WFv2cZ9VDY4zQsxdTdnxtVmcln9
         RNBb1eyJixiyb+L3MU6Uf/fWNTScc5znU5+J3Y9isiJCD7XJnf93cZQ9qqhDEqT2g0Uv
         0puw==
X-Gm-Message-State: ANhLgQ1b4NvXDS8UE6voGh/JID6i9OK8biseKrNbrNz57rkxnlx+4ZKw
        YIH9JPFZNiQHXNugtSndVKY=
X-Google-Smtp-Source: ADFU+vvWR3cdazmBFeHw/DLkCJPPSuuQlm2wxjIuy40QW47xKw6l2vdkJ0HMQvzY86RR2RJAU1Ai9w==
X-Received: by 2002:a50:a6d8:: with SMTP id f24mr13514048edc.125.1585312675291;
        Fri, 27 Mar 2020 05:37:55 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id oy25sm219899ejb.53.2020.03.27.05.37.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:37:54 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:37:51 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove useless address/size cells for
 mshc_0 on Rinato
Message-ID: <20200327123751.GJ7233@kozik-lap>
References: <CGME20200326150955eucas1p16b8baa528a4d8e845accd67fc77d5807@eucas1p1.samsung.com>
 <20200326150946.27336-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326150946.27336-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 04:09:46PM +0100, Marek Szyprowski wrote:
> mshc_0 node doesn't have any children, so there is no need for address
> and size-cells properties.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 2 --

Thanks, applied.

Best regards,
Krzysztof

