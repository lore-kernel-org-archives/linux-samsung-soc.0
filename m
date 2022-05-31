Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524ECC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 May 2022 05:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241072AbiEaFMQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 May 2022 01:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237638AbiEaFMP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 May 2022 01:12:15 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F3F3F88F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 May 2022 22:12:14 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id a63so5634204pge.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 May 2022 22:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BHbBJRECyPgh46jtwSSDCOchSe8qX/uOE02uqThL2Tw=;
        b=A+XjEHLcTv2Hfn8Flpuqo9aHdHzzmJVVgoTBVF2ZbrJwtoEi9tVSChdqm9oajpP2lb
         xej+sz/ANolcoa5I9+cb/rtCt730+8O3mRAD6lAjEXfNKnfejRI9DHwfSbcLI4iH3sLT
         wC89I1t5MAIVaPcJB5qL+hJqP4/I1n9smdNVzNRax18mWA+z0vtd6c3dOwa1G1amW/M3
         WbpFd85si+yPADySiehf24uYseZrxedcJ8k5Ni+y62tIHvb5b5eFG19zQqT6bhbY5t8W
         OXhTrAeY/3G3XPC9gPoN/KwRmLZvwlu38fJo197HUxbtCNBruwS0MZKx3hrkQtbbEa2Z
         Alkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BHbBJRECyPgh46jtwSSDCOchSe8qX/uOE02uqThL2Tw=;
        b=7vR7jVUY71M3l7eJec4V5Pe9WHRK3dIBd9V3aHIOqH1gEK7dH/gvrQqgS1Fh7kMLyo
         T8X0DdWAxtF2nd7Llx0ZHlS7ueX/Xw5/+y1nlAtGN0vGIDywaD3vOyAQEk8YzVwN1gZ6
         I5mvbbxzc3s5/aNO86b66oN3mIAVDAL2gSlS/3EUtzh15qOzopK8ydHZttDJyOB4BH8+
         BC5w2FheCnZOU37Yqx05PU4aFtoXzTtVqKFfm8KE25NtpjjSCa2ileJH8QUw/kmd/05z
         HSqKQ43r+RgnH0YveL5aOyseXDV6jAdtRpajguEWBR8TWFa8JH1Hz9isvDmkUVhoYiup
         IJKA==
X-Gm-Message-State: AOAM531YXoHbDX6KRKf4FTd7OPsrtdUAV0sckCkWCsXuquBpglqBsrwm
        6COM4Nm4XLfF/6LXCRahaLB9rg==
X-Google-Smtp-Source: ABdhPJxEr3SHGqIRjWodzYvSHcaEoqwNZtRG9L8C1V4mVRamue/pTxPM/b5+bUzZZVhlu/Ts+UJ/1A==
X-Received: by 2002:aa7:92d2:0:b0:51b:4d60:6475 with SMTP id k18-20020aa792d2000000b0051b4d606475mr8412567pfa.73.1653973933774;
        Mon, 30 May 2022 22:12:13 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id r187-20020a632bc4000000b003fc4894c270sm787171pgr.69.2022.05.30.22.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 22:12:13 -0700 (PDT)
Date:   Tue, 31 May 2022 10:42:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/31] devfreq: exynos: Migrate to dev_pm_opp_set_config()
Message-ID: <20220531051211.peaybfvzc2vae2um@vireshk-i7>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
 <CGME20220526114410epcas1p27ad1ed594737423fb967f92529a1abd5@epcas1p2.samsung.com>
 <052c4937ce408a01de5cd7d7e359d333f9b11e57.1653564321.git.viresh.kumar@linaro.org>
 <9d492494-4a0a-f690-6a80-2bba5d8633b9@samsung.com>
 <d9a96812-fd4e-cf46-cbe5-63f0e1d373a1@samsung.com>
 <20220531041505.egfe2kpi3bgb6l55@vireshk-i7>
 <20220531043809.xfpzz6c7x6utyjb3@vireshk-i7>
 <d2be76c9-46c6-451b-48f1-4925e0e60584@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2be76c9-46c6-451b-48f1-4925e0e60584@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31-05-22, 14:05, Chanwoo Choi wrote:
> > diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> > index 780e525eb92a..8fca24565e7d 100644
> > --- a/drivers/devfreq/exynos-bus.c
> > +++ b/drivers/devfreq/exynos-bus.c
> > @@ -161,8 +161,11 @@ static void exynos_bus_exit(struct device *dev)
> > 
> >         dev_pm_opp_of_remove_table(dev);
> >         clk_disable_unprepare(bus->clk);
> > -       dev_pm_opp_clear_config(bus->opp_table);
> > -       bus->opp_table = NULL;
> > +
> > +       if (bus->opp_table) {
> > +               dev_pm_opp_clear_config(bus->opp_table);
> > +               bus->opp_table = NULL;
> > +       }
> >  }
> > 
> >  static void exynos_bus_passive_exit(struct device *dev)
> > @@ -463,8 +466,10 @@ static int exynos_bus_probe(struct platform_device *pdev)
> >         dev_pm_opp_of_remove_table(dev);
> >         clk_disable_unprepare(bus->clk);
> >  err_reg:
> > -       dev_pm_opp_clear_config(bus->opp_table);
> > -       bus->opp_table = NULL;
> > +       if (bus->opp_table) {
> > +               dev_pm_opp_clear_config(bus->opp_table);
> > +               bus->opp_table = NULL;
> > +       }
> > 
> >         return ret;
> >  }
> > 
> 
> This change is enough to remove the null pointer error. Thanks.

Pushed this and WARN_ON() in OPP core. Thanks.

-- 
viresh
