Return-Path: <SRS0=ufbU=D3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0463DC433E7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 05:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B092222E8
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Oct 2020 05:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uPEeeX/D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391347AbgJTFGE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Oct 2020 01:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391337AbgJTFGD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Oct 2020 01:06:03 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BD5C0613CE
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2020 22:06:03 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h6so366399pgk.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2020 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BzDvCT5g2ND13ShvMBrA2tEQLZj9RI4ctTQKR5Kpfuc=;
        b=uPEeeX/DkYsg9UWKSh0+FRdUxTreGbPlkgnEhDxaInY8nddcQU3qyV1wfRBNMpqWjN
         9rF5Q56o1pwGUjrzDvlAirLfrFoFOxzxO0jlWQjkX1RkxArCXT7DQ4utHJCGrbmskRpn
         A347sF/7AzVP8ltjvo2yc7ixP+LpN7wbq5cLyPz3xPj8cH2Fsuj8CHz/tsZ7yj7v0t9o
         YqP/+7SxWRHjDG8fiQE7hgucXSQmUa9aD3DTe4g3iL2ZDwaWWURVdsLYhBJyZwIyyHbX
         XqAvtI5wfYvuzsmdXehkIxSqMqI00c5Ci+RcMIuC1iSr7y++pZhcip11evlQ1nC0XX4+
         qZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BzDvCT5g2ND13ShvMBrA2tEQLZj9RI4ctTQKR5Kpfuc=;
        b=bxhazBV23ulvRuwX2WGEVYI6XGJ0cLN9VwsUU2kzK00ODnqTqD5hYkrxfyyhsgFBwI
         RcpIvb/Sm73TCOkYx1zUkP3E8QMDxvZcVNsWEJSsRipNH/3zEVJ0fizF/pTMDih5lJ1t
         PRP6Il/PinvCnlnnABqeRh9AuWWWRVHUbSo6X7KmjVrFjAV3TyZOcZTosD0VRWr0HD+K
         9oW3c+r0E7CzgXfVxnhji9O4DvC36TBI/7s9krYplynKzwuWdENalbWOG+vwWpDro6z6
         rWZUeM3hPmMAA5qqH7aQ88jmX0TONPXv/gSl5VtRwZm9BneMpe5aCQ/WoLsJ517MqHOP
         urPw==
X-Gm-Message-State: AOAM530anumViszpsyPDd/X5i4LGRwAKGXyH4btOVVvY4ldNXZi8ger9
        3c3rWg6D1KJeQGtP3BgyXJ4ytQ==
X-Google-Smtp-Source: ABdhPJyntUjcVPO+MPmgw2P4aUUdPM5qJP0EIygPQXWlro3nbJAxdzYw/V2F3UVp/3OBcrgNnw2YHw==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr1226500pgl.305.1603170363147;
        Mon, 19 Oct 2020 22:06:03 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id a4sm496798pgl.51.2020.10.19.22.06.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 22:06:02 -0700 (PDT)
Date:   Tue, 20 Oct 2020 10:35:57 +0530
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
Message-ID: <20201020050557.a3b2nk33eeyxnvl2@vireshk-i7>
References: <20201015180555.gacdzkofpibkdn2e@bogus>
 <20201016042434.org6ibdqsqbzcdww@vireshk-i7>
 <20201016060021.sotk72u4hioctg7o@bogus>
 <20201016111222.lvakbmjhlrocpogt@bogus>
 <20201019045827.kl6qnx6gidhzjkrs@vireshk-i7>
 <20201019091723.GA12087@bogus>
 <20201019092411.b3znjxebay3puq2j@vireshk-i7>
 <20201019101241.GB12908@bogus>
 <20201019103535.ksp5ackoihamam4g@vireshk-i7>
 <20201019141007.GA6358@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019141007.GA6358@bogus>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19-10-20, 15:10, Sudeep Holla wrote:
> On Mon, Oct 19, 2020 at 04:05:35PM +0530, Viresh Kumar wrote:
> > On 19-10-20, 11:12, Sudeep Holla wrote:
> > > Yes it has clocks property but used by SCMI(for CPUFreq/DevFreq) and not
> > > by any clock provider driver. E.g. the issue you will see if "clocks"
> > > property is used instead of "qcom,freq-domain" on Qcom parts.
> > 
> > Okay, I understand. But what I still don't understand is why it fails
> > for you. You have a clocks property in DT for the CPU, the OPP core
> > tries to get it and will get deferred-probed, which will try probing
> > at a later point of time and it shall work then. Isn't it ?
> >
> 
> Nope unfortunately. We don't have clock provider, so clk_get will
> never succeed and always return -EPROBE_DEFER.

Now this is really bad, you have a fake clocks property, how is the
OPP core supposed to know it ? Damn.

-- 
viresh
