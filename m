Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5BFC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 21:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DE8B2087D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 21:40:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+WyQMk/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgJ2Vkf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 17:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJ2Vkf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 17:40:35 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1DBC0613CF;
        Thu, 29 Oct 2020 14:40:34 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t9so4313425wrq.11;
        Thu, 29 Oct 2020 14:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=+keJBJRAq7pthz/W+jLMbHfgW9NWA6JJvdQWqeTv6Qc=;
        b=i+WyQMk/pktuwnQQFgNj5OHFENYzL2stWeu+sE3pi3e7RnFRN3Er7vTtYaHrCQw2IN
         wpvj02Zp4t2TPSyPs7cKavPYx4vikmm81GSFWxnuHaoutDbs4dMeUCjF0MzYgSnC2EZH
         ElQfwzu9/uNKhu7ArlI6uVwocc29pHH46srFnH+jU4CN+boZz97g95ll/YhzhjM4Ori+
         /PxxSYGsXtkI2WKD9yxx3YxLk2zCFa8GRP9Ef325Ykdw39VmOtxthKauDdlERrmvyRes
         qlNjMMghvnTibMV9i57bAAfsBFw1xTxaewK+qzwixIkW3b/D3lCDdiKlsfZckfuI/7Gv
         wWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=+keJBJRAq7pthz/W+jLMbHfgW9NWA6JJvdQWqeTv6Qc=;
        b=tXWOjwBJJCwzjf/+V/SwVUey4ZacVjFbxuKq4VZRvVLKQhL8SNzR+jRfsiohS97cyr
         SXPXV5luW5l6JDTEcj7e3stLKzuhvn+HeL4mr1kiOAqR0zFkWlVdvGjaS+37FQK4Klxc
         jX7ekq9dA9c2npE2QTKqwrMObCk0w8mdVBlKzZVjgfjYrxnqD3ep/IjE5amI4VsX8n0Y
         FtywUh2unIxMC5F4gAWlapoijGDHuKQPA9/gvQ/R6wwjWV5xpB3Kn103GIy7jxybn2kV
         2OUdesr1xYrLLyAkEeQfIr0vdT4PPA2qUg57RH635C+YI/8UoLCaR9vwuMcuHd5TS/ad
         O8YA==
X-Gm-Message-State: AOAM5328FN2wEKJMBvMBOOS2Ow+n0J1Ov1gD6HH52wIOA+mwsgxL0aXm
        pKERx9fgVKyswx9Ewe0CUwY/ycByCQQhAlh/
X-Google-Smtp-Source: ABdhPJwuXxIooY7XR/mTWjOuZiAxcA9sr7nyWiIAAwnslIgc3PFlUBtOmqHStn+qMmnkBYv6g5666w==
X-Received: by 2002:adf:94e3:: with SMTP id 90mr7618051wrr.380.1604007633029;
        Thu, 29 Oct 2020 14:40:33 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id g4sm1885337wmh.13.2020.10.29.14.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 14:40:32 -0700 (PDT)
Date:   Thu, 29 Oct 2020 22:40:30 +0100
From:   Martin Juecker <martin.juecker@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
Message-ID: <20201029214030.GA72802@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027081751.GA4244@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 27, 2020 at 09:17:51AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2020 at 12:27:09AM +0100, Martin Juecker wrote:
> > > > +
> > > > +	max77686: max77686_pmic@9 {
> > > > +		compatible = "maxim,max77686";
> > > > +		interrupt-parent = <&gpx0>;
> > > > +		interrupts = <7 IRQ_TYPE_NONE>;
> > > > +		pinctrl-0 = <&max77686_irq>;
> > > > +		pinctrl-names = "default";
> > > > +		reg = <0x09>;
> > > > +		#clock-cells = <1>;
> > > > +
> > > > +		voltage-regulators {
> > > 
> > > Just "regulators" and no empty line after this.
> > > 
> > > You should define all regulators here. If some are unknown, keep the
> > > min-max the same as in driver.
> > > 
> > 
> > I used the driver to read all the voltages, it also reads values for
> > the LDOs that are not defined in the DT, so I have values for all of
> > them setup by the bootloader. What I don't know is their name and what
> > they are used for. Interestingly apart from two LDOs, the voltages did
> > match exactly with those from the midas DT, so it could be very
> > similar. The two non-matching were only off by 0.1V. How should I go
> > about this?
> 
> Actually, let's skip the constraints (min-max) for unknown regulators.
> Just add the entries with generic names, like:
> arch/arm/boot/dts/exynos5410-odroidxu.dts
> 
> I would not put here min-max constraints from bootloader because pretty
> often it has only an initial setup for specific frequency - just to make
> it booting.
> 
> If you have the constraints (min-max, always on) from vendor sources,
> you could add them.
> 
> Best regards,
> Krzysztof

As all the missing regulators are not defined in the vendor sources, I
have no constraints to work with.

What I noticed when all the LDOs are defined, the device reboot
behaviour is different. Instead of the usual 1-2 seconds for screen off
and on again, it's now more like 10 seconds.

Cheers
Martin
