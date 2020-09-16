Return-Path: <SRS0=Wlns=CZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CC7C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 07:59:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AC9C2080C
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600243155;
	bh=VB+iul707xQHJB3MPFHg18/n/MFhXSGhTa9PlCiNdNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HeIFJ8rmNDeq8pBMxaUGr7xQ2o0nBYKnFYKEhsPZqp4Ikc+SnnhiVxOUqjwzGqI2R
	 5ddxDnGfiDhJD56RCpAcnSVleuF2Wl6PEuoqi5OvZKk+K0sJKwpm/PKlG0JnDaJjzm
	 b2FdBnyprjCRIn/WcfDh8EZCqmOIfxN9tQvcDT8k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgIPH7P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Sep 2020 03:59:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33514 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgIPH7N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 03:59:13 -0400
Received: by mail-wm1-f68.google.com with SMTP id e11so1643363wme.0;
        Wed, 16 Sep 2020 00:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f9vR3Ti7HGJjlVupS35gCwKRPU2ouBmpdxOZm0a6pHg=;
        b=BmuQBVVSUC2pe7DhJ4tbxn9qCGs3gOOhWAmdEuzUuHsjCRvEBEq6Q9jwU/k25KWu5Z
         mSRa2w8K5yQ3LQ0ackCIfxI0TzdKrzTqvfGBhl7luuEAnvaF7Jr/YtOTr/7L+m043xku
         aPgV/0A13JtZ3RsznqMLNoGNCGTSblJJl22ePdGFx4rDd3ySJSr+X7moEfvvVmvREZye
         Wg7w3ry9w1XNBKWX2SrIZnFW7T8FpHILeOqfoFPUqFYJywOQMAemgqY2JDNFLwqz/iO2
         jqRdGun0DIuA4F215lMgAPw9P+pzB2EYBoDT1sl/czYOZ5UWWtzJKMov9CWBFs/+EyLT
         bdcQ==
X-Gm-Message-State: AOAM532E4cHjIWXC/Y4UdPy8EdJMdmjvf022S1rXiVMkRNONKJYiCkrW
        UoGzBk8pquPlKmn2mwR5TC4=
X-Google-Smtp-Source: ABdhPJxvAiLHTzMl+wXAqNoAvB4Yv/BV83AUKMAclJ4hQWRQUQ98jocoP+WC+dpkBraRRwrLGVhbrg==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr3467656wmc.112.1600243151114;
        Wed, 16 Sep 2020 00:59:11 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
        by smtp.googlemail.com with ESMTPSA id a81sm4022587wmf.32.2020.09.16.00.59.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 00:59:09 -0700 (PDT)
Date:   Wed, 16 Sep 2020 09:59:07 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lee Jones <lee.jones@linaro.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFT 09/10] arm64: dts: exynos: Correct port of USB-C connector
 node on Exynos5433 TM2
Message-ID: <20200916075907.GA10270@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142602eucas1p1ce457a8fddc6b1fba4bf8c08992fa0b3@eucas1p1.samsung.com>
 <20200829142501.31478-9-krzk@kernel.org>
 <4eb7d0d9-29e2-9162-4521-10e4422f9c71@samsung.com>
 <021495a9-7a00-eb91-ddfa-885cc2fb5462@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <021495a9-7a00-eb91-ddfa-885cc2fb5462@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 02, 2020 at 01:23:50PM +0200, Andrzej Hajda wrote:
> 
> On 31.08.2020 14:50, Marek Szyprowski wrote:
> > Hi Krzysztof,
> >
> > On 29.08.2020 16:25, Krzysztof Kozlowski wrote:
> >> The USB-C connector bindings require port@0.  Such port was already
> >> described in DTS but outside of the connector itself.  Put it into
> >> proper place to fix dtbs_check warnings like:
> >>
> >>     arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: musb_connector: ports: 'port@0' is a required property
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > I'm not sure if topic should be about USB-C, I will call it simply USB
> > connector node. TM2(e) uses Samsung's 11-pin micro USB 2.0 connector,
> > which has nothing in common with USB Type-C.
> >
> > Anyway, this patch breaks DWC3 (tested in Device mode) driver operation,
> > so something has to be somehow adjusted or fixed. Added CC Andrzej
> > Hajda, who actually worked on this.
> >
> >> ---
> >>
> >> Not tested on HQ. Please kindly review and test.
> >>
> >> Best regards,
> >> Krzysztof
> >> ---
> >>    .../boot/dts/exynos/exynos5433-tm2-common.dtsi    | 15 +++++++--------
> >>    1 file changed, 7 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> index 6246cce2a15e..bab6c1addd5f 100644
> >> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> @@ -871,6 +871,13 @@
> >>    					#address-cells = <1>;
> >>    					#size-cells = <0>;
> >>    
> >> +					port@0 {
> >> +						reg = <0>;
> >> +						muic_to_usb: endpoint {
> >> +							remote-endpoint = <&usb_to_muic>;
> >> +						};
> >> +					};
> >> +
> 
> 
> According to not-yet-yaml documentation of dt-bindings (patch 05/10):
> > -Required nodes:
> > -- any data bus to the connector should be modeled using the OF graph bindings
> > -  specified in bindings/graph.txt, unless the bus is between parent node and
> > -  the connector.
> 
> This is 'unless' case - muic is parent of the connector, so the port 0 is not necessary.
> 
> 
> >>    					port@3 {
> >>    						reg = <3>;
> >>    						musb_con_to_mhl: endpoint {
> >> @@ -879,14 +886,6 @@
> >>    					};
> >>    				};
> >>    			};
> >> -
> >> -			ports {
> >> -				port {
> >> -					muic_to_usb: endpoint {
> >> -						remote-endpoint = <&usb_to_muic>;
> >> -					};
> >> -				};
> 
> 
> And this port belongs to MUIC - it describes connection between USB-HOST 
> and MUIC, it has nothing to do with the connector, and is necessary.

Thanks for checking this. It's really appreciated!

I'll work on v2 later to address the schema warning, hopefully without
breaking things...

Best regards,
Krzysztof

