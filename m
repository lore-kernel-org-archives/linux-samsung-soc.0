Return-Path: <SRS0=QOl6=3J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA79C33CA1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jan 2020 05:28:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4D192087F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jan 2020 05:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmffSu1E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgATF20 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jan 2020 00:28:26 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46833 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgATF2Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 00:28:25 -0500
Received: by mail-pl1-f195.google.com with SMTP id y8so12658517pll.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Jan 2020 21:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CTBoug2POge5IUv+BODbtuxgixi9XfhzZTWyFSqFGs8=;
        b=EmffSu1Ekm1BEOdjUqNZPrbufY1BxZZsbLp0EIIgqSsKbdU1Y/QhUZ0CFI6Jvu8BAb
         aok3M/fFGKuzC7xOkaqjTyJ2mnCTYKXjxBgMKJN1PHe2JLiCUC3LkFQKpPyICcRCYMYR
         3MOBr5YIQpCU5NoJfe5Vmq3J0JJZ4PKyXmfZ+Jjf45sTPc+aKaAB1ML3RIgJ9eD31lKy
         HfDLgUPMH4Ijh0iCSDeykSExAV84SAE31vOPmFRLDXvY3G+YoIln8ZIEkAJ14UWx0GlM
         nVJdWNi/G1VfDywJqHu9EmCRwykzlARFuq2gaR0z8/mgJEy9xl/uXpoDjdTV9ZIRKRBr
         bNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CTBoug2POge5IUv+BODbtuxgixi9XfhzZTWyFSqFGs8=;
        b=gBl+yqx2zCSxapXaJkbpewk6hKl8JgeqmSU8niwtoWzPDiDBnKIwHNj+WMXJiWzwTM
         o1O5kLmmz6tOraa6oTvcDFBxVkIHfda8FlTPOVDsekarB4ZouXk2WSOawzDINs0XEYbf
         3Eq5ulu12zqbLwn6DkEIXH/Wj2uzNh3O0BqSunsH2T31/STqLpYB8Pd+ezStji92QHv0
         sGD0QmV5gfXbsERGyxUZZoENZJ4gLITl68VWca+c2pU/iewsARIu01D59oKSMpE9VoS+
         J2RrF7K7+k1Kq7rLPy8e0m7H5PPHRNvkJXkIqUGUNSBtTFf5yCHrQg5qIkU8hA2mQheU
         RrVQ==
X-Gm-Message-State: APjAAAW6Qq53xoPOfyT9fIGkxgZJ3iuEquVK/FrYu7YpSoGwiEVlfHrB
        fJf4rv/tj9UoBfTzUAJDKEGTfw==
X-Google-Smtp-Source: APXvYqyPVXId1vEjcr+tOT7Z4v8U9ypwhS2c/1vLrgL2t0SNuRIJzHadRuOhZQXz3K1rsfAmRcv2nw==
X-Received: by 2002:a17:902:b48e:: with SMTP id y14mr13300276plr.260.1579498104970;
        Sun, 19 Jan 2020 21:28:24 -0800 (PST)
Received: from localhost ([122.172.71.156])
        by smtp.gmail.com with ESMTPSA id s26sm37402702pfe.166.2020.01.19.21.28.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 21:28:23 -0800 (PST)
Date:   Mon, 20 Jan 2020 10:58:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     qiwu chen <qiwuchen55@gmail.com>
Cc:     kgene@kernel.org, krzk@kernel.org, rjw@rjwysocki.net,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        chenqiwu <chenqiwu@xiaomi.com>
Subject: Re: [PATCH v3] cpufreq: s3c: fix unbalances of cpufreq policy
 refcount
Message-ID: <20200120052821.tvijbt3bzkn76yz6@vireshk-i7>
References: <1578383599-11207-1-git-send-email-qiwuchen55@gmail.com>
 <20200107080145.7c4gxilnjjxjfqpc@vireshk-i7>
 <CAD1-QrohtJFLWDMCYmVs2G5WDcDN_E8xcsNZqJ428cEkohcB0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD1-QrohtJFLWDMCYmVs2G5WDcDN_E8xcsNZqJ428cEkohcB0Q@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19-01-20, 10:25, qiwu chen wrote:
> Hi
> Any progress about this patch?

I already applied it in my tree, it will be part for v5.5-rc1.

-- 
viresh
