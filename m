Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C22CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 31 May 2022 04:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243774AbiEaEPK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 May 2022 00:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbiEaEPK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 May 2022 00:15:10 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85DB91566
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 May 2022 21:15:08 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n18so11815437plg.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 May 2022 21:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E8Ck4/4aVuZ3hawDIoqnmaAvPmgW6JpDltu0Lz2f7+s=;
        b=Kn1TcwXMVVij1nRJGFt3EODd55cBy9+5pBHeIMDR8p/oYQ5AASP5X+vD/xycrewvOJ
         vXC7szXgIQ6uDCQ1AhtwZF5Fbkmxc+jfzvHe/YcTzofCSzZ3ccf9rR+7sOHK1M2defUa
         hDHWYjmyN+7WCxR1rzpYIAAAJwLF5pB7fFfSSMffs7KCwU8vWboKERXQRDg8qlUrRcBR
         0IvSHtwvDyJyeC0y66hvbysj6LFvz9CB104kv0Gpy0ljlq3S0mnPpYhdgKqckAbi/HKh
         NdbZK+5oWzjhOuJTwy6zbb7cJkhu4JqEjU9yOdSURuMv/cKWQkLfITYS4H1SFMZHK9Pe
         QRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E8Ck4/4aVuZ3hawDIoqnmaAvPmgW6JpDltu0Lz2f7+s=;
        b=Mg1EsAPar8Ds3+DeS/ZTsLOw2aTlIS2hAtQmDcuMoqoBT7fOl/IFsnbgkBKBT866cE
         uqWCMwZuVc6KLQkJbC2Tq89aI6yQcWlufVQMWNa/qOst432N8hCTnVd/S2bwC7GTWJ4O
         g4DpYScWdl2cEJROrHpC33dZV9rZMKphAEia1NXvk7xXtnPG4zDCJA4JjQbYONL9z76G
         uzNPNM/Bf71Bf3Uoa96qcwQVt1yqCYMxfss6LaG2pc22k9J1qSMl1SDSeRR1PXNaPA+B
         J6LMjDI8rTl7FxISQG4iiGGoSYMjcDn+UgT2AxEm7tTN7w+pu53yBA+qL1Ten/LBdZXR
         OotQ==
X-Gm-Message-State: AOAM531/gd1yxhVdEx3Ckye914BsBIbtstEJFxMcqNAJegGt2oyFL5bW
        2JzcOC09ZrJGjF2Ux12Ye/QQzg==
X-Google-Smtp-Source: ABdhPJxFIhtQXJ7r6Ak1Dj+5kS499XFfEHegca+7MEBfkXFmygsdJX6jSUbBOh4ufKUWDEzEmEO0Yw==
X-Received: by 2002:a17:902:d504:b0:163:f8e0:94bb with SMTP id b4-20020a170902d50400b00163f8e094bbmr4142634plg.159.1653970508310;
        Mon, 30 May 2022 21:15:08 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id e1-20020aa798c1000000b0050dc76281b8sm9899641pfm.146.2022.05.30.21.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 21:15:07 -0700 (PDT)
Date:   Tue, 31 May 2022 09:45:05 +0530
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
Message-ID: <20220531041505.egfe2kpi3bgb6l55@vireshk-i7>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
 <CGME20220526114410epcas1p27ad1ed594737423fb967f92529a1abd5@epcas1p2.samsung.com>
 <052c4937ce408a01de5cd7d7e359d333f9b11e57.1653564321.git.viresh.kumar@linaro.org>
 <9d492494-4a0a-f690-6a80-2bba5d8633b9@samsung.com>
 <d9a96812-fd4e-cf46-cbe5-63f0e1d373a1@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9a96812-fd4e-cf46-cbe5-63f0e1d373a1@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31-05-22, 13:12, Chanwoo Choi wrote:
> I try to find the cause of this warning.
> I think that dev_pm_opp_clear_config needs to check
> whether 'opp_table' is NULL or not as following:
> 
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index fba6e2b20b8f..cbf8f10b9ff0 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2598,6 +2598,9 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_set_config);
>   */
>  void dev_pm_opp_clear_config(struct opp_table *opp_table)
>  {
> +       if (unlikely(!opp_table))
> +               return;
> +
>         if (opp_table->genpd_virt_devs)
>                 dev_pm_opp_detach_genpd(opp_table);

Does this fixes it for you ?

It isn't allowed to call this routine with opp_table as NULL, I should
rather have a WARN() for the same instead.

Can you check why exynos is passing NULL here as I don't see an
obvious reason currently.

-- 
viresh
