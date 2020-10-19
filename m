Return-Path: <SRS0=F6EI=D2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B021C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Oct 2020 09:24:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05C5522283
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Oct 2020 09:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9O9ia6I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgJSJYP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Oct 2020 05:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgJSJYP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Oct 2020 05:24:15 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46644C0613D0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2020 02:24:15 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id p21so5009154pju.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2020 02:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zDPrPOvZEKInNhwxCz6Kajh6JAVRQjyNuOBoRhsFWd0=;
        b=y9O9ia6I2iPQ99hdVJUQ2A0pW9t0LpBkLFxvcu/z5pJYAUGkH5R5sfnYmsE67S7e6l
         Dx8BUA8fqM/CLgvKo86Rx1heiv+QywLmP27iyfcPNSH4QHOL9U364HxyqdjqFDC67SJ1
         0tfuMNuc/EbuKFlMacDoUfenokJ3tR8WOfcxgRZuAQmFbsjGIdFDY8UttIN5Ybsd7lBO
         2PetuDNeDcKtsnifWV96diusXYxtEa77rcsQAwm8VquzsXbIwlQLUIGS+CNudVLF6cKi
         AHYaBG5TiuWJWNysketU4d+gYR2iQl1ebEtipdB5bfAMl+ChRTfuY5KcxhGdaEwnruPp
         +xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zDPrPOvZEKInNhwxCz6Kajh6JAVRQjyNuOBoRhsFWd0=;
        b=Bnoxx+7bgwmTNsYp3kJV/uv+cbggigVrHtNrRP1qOX/FhfPSuYWr03TCHgdkt3/D0B
         01pMt0EoaGY31Wg0cwLp24UF3+qk8YFGponzgAN/hrZB7V/656XQC6QaCk11PDT6CAji
         iAOczNRAyNDnoHIModwcL/nOPzF1h5Y4624lpMbNyRdDyeZW1eIeI0Alb+zTTg3GsDFI
         /WTuIMf1KEYzAg3/ewszdVXKcXt2l0QZ71uZedYjXSutpmpbUEPOo6shJdcovw6kLVmO
         AhTm4WCg1gYYJNlRTzBl0fQIbBK85p7bUit+qbXz2kJwBkNvMI4C8IqgShSV3KTviuWS
         WlCA==
X-Gm-Message-State: AOAM532Aviea7YSrf4C4iMMuv9YMdmje2ejzb90YXQj2IFWNE2J4PSBq
        q0UjZaPXKnQl2aNmVwmG7KR/mg==
X-Google-Smtp-Source: ABdhPJxQ1Levsqfyr7yBr0kDuJiUWjT2K9EdyHdohTH48iuSU9mm0S6IMTCm2SVo2FfsLAKqWfp/hw==
X-Received: by 2002:a17:90b:1541:: with SMTP id ig1mr17153160pjb.125.1603099454559;
        Mon, 19 Oct 2020 02:24:14 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id r19sm11087364pjo.23.2020.10.19.02.24.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 02:24:13 -0700 (PDT)
Date:   Mon, 19 Oct 2020 14:54:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     ulf.hansson@linaro.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>, nks@flawful.org,
        georgi.djakov@linaro.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH V2 1/2] opp: Allow dev_pm_opp_get_opp_table() to return
 -EPROBE_DEFER
Message-ID: <20201019092411.b3znjxebay3puq2j@vireshk-i7>
References: <24ff92dd1b0ee1b802b45698520f2937418f8094.1598260050.git.viresh.kumar@linaro.org>
 <20201015180555.gacdzkofpibkdn2e@bogus>
 <20201016042434.org6ibdqsqbzcdww@vireshk-i7>
 <20201016060021.sotk72u4hioctg7o@bogus>
 <20201016111222.lvakbmjhlrocpogt@bogus>
 <20201019045827.kl6qnx6gidhzjkrs@vireshk-i7>
 <20201019091723.GA12087@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019091723.GA12087@bogus>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19-10-20, 10:17, Sudeep Holla wrote:
> On Mon, Oct 19, 2020 at 10:28:27AM +0530, Viresh Kumar wrote:
> > On 16-10-20, 12:12, Sudeep Holla wrote:
> > > On Fri, Oct 16, 2020 at 07:00:21AM +0100, Sudeep Holla wrote:
> > > > On Fri, Oct 16, 2020 at 09:54:34AM +0530, Viresh Kumar wrote:
> > > > > On 15-10-20, 19:05, Sudeep Holla wrote:
> > > > > > OK, this breaks with SCMI which doesn't provide clocks but manage OPPs
> > > > > > directly. Before this change clk_get(dev..) was allowed to fail and
> > > > > > --EPROBE_DEFER was not an error.
> > > > >
> > > > > I think the change in itself is fine. We should be returning from
> > > > > there if we get EPROBE_DEFER. The question is rather why are you
> > > > > getting EPROBE_DEFER here ?
> > > > >
> > > >
> > > > Ah OK, I didn't spend too much time, saw -EPROBE_DEFER, just reverted
> > > > this patch and it worked. I need to check it in detail yet.
> > > >
> > > 
> > > You confused me earlier. As I said there will be no clock provider
> > > registered for SCMI CPU/Dev DVFS.
> > > 	opp_table->clk = clk_get(dev, NULL);
> > > will always return -EPROBE_DEFER as there is no clock provider for dev.
> > > But this change now propagates that error to caller of dev_pm_opp_add
> > > which means we can't add opp to a device if there are no clock providers.
> > > This breaks for DVFS which don't operate separately with clocks and
> > > regulators.
> >
> > The CPUs DT node shouldn't have a clock property in such a case and I
> > would expect an error instead of EPROBE_DEFER then. Isn't it ?
> 
> Ideally yes, but for legacy reasons clocks property has been used for
> providing OPP/DVFS handle too. While we can change and add new property
> for that, it will still break old bindings.

I am not sure I understood it all. So does your platform have the
clock-names property or not for the CPUs ? And how will something
break here ?

-- 
viresh
