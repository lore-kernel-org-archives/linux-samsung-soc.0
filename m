Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC32C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 15:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06E0622460
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599836629;
	bh=mAWvTS9Z57SKl5oMEX8BpOhbySCxKhHdqd8NMCs+ltQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Q3Q1QhddbcDG4QGelwzIls0KO1xPqVWo0qz3BsG8Ghjj8dTEJCGCxrCN89gktE/zX
	 eoc6m+1oVMkOgiKlb0cSLGO7RNivQ4w/nsCBX/tcHMqwla2YavxgLDOItg3kDwoUKQ
	 y+yUO5QY80Er3a8VZCpEVrBkjOZEmvi7poMn/L4I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgIKPDj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 11:03:39 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43364 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgIKPCf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:02:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id y2so6136291lfy.10;
        Fri, 11 Sep 2020 08:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GcoUTofUB6qhy7035EI6To3ibgdlCiURiNUbUNXaw6I=;
        b=Syy4/u1KbtqXRRsHA2mIqfYgc9ZzQwMsqS7Eq8k46qEu25aXFwJGTv6dgPvXLGJm1W
         XZLzpAJ5VScds66eVmc7+F3o7HD46yf/60SGmgYR8kQCYGYYkVeo8hDFZT08NmVRnuVR
         8/Fx14GRO39jXk8Oa5cNkEC7iOOzeTJANR0GY7J14gP+Vz+6N6yWITkYuwtw72aHfeMT
         +XPna2FOwBk4XQlN2SL4bEO7rtc8YojdB20FK90ro2GB6epo7lNiVZDzBSFRrZnB++Eo
         sE7+aIfFGx8k3/Mk7RdKVCKCbXUdsI4RrklFZmdny/rGtMMTqFvcsdaz3FqPVQJ374UO
         OdRQ==
X-Gm-Message-State: AOAM530KxnON+23iLkpY91HEmT97ltWbT8mVk5jwjYk8EcYPRw/gPqKK
        SwF2DvhMisdSH1GK/tp3s7fQFN2+HYyJVg==
X-Google-Smtp-Source: ABdhPJzTUj3zbI6elwZd3zIOb6pE2NGdWHdYR6xDJ6mTwv+rDxUE1HtD9YCd1R9SYENLPKkAK2+leQ==
X-Received: by 2002:a50:fe82:: with SMTP id d2mr2360474edt.86.1599836047108;
        Fri, 11 Sep 2020 07:54:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id gh21sm1743686ejb.32.2020.09.11.07.54.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 07:54:05 -0700 (PDT)
Date:   Fri, 11 Sep 2020 16:54:03 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH v3 2/3] ARM: dts: exynos: Add assigned clock parent to
 CMU in Exynos4412 Odroid
Message-ID: <20200911145403.GC15290@kozik-lap>
References: <20200906142146.21266-1-krzk@kernel.org>
 <20200906142146.21266-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200906142146.21266-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Sep 06, 2020 at 04:21:45PM +0200, Krzysztof Kozlowski wrote:
> Commit 68605101460e ("ARM: dts: exynos: Add support for audio over HDMI
> for Odroid X/X2/U3") added assigned clocks under Clock Management Unit.
> 
> However the dtschema expects "clocks" property if "assigned-clocks" are
> used.  Add reference to input clock, the parent used in
> "assigned-clock-parents" to silence the dtschema warnings:
> 
>   arch/arm/boot/dts/exynos4412-odroidu3.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'
> 

Applied.

Best regards,
Krzysztof

