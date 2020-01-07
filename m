Return-Path: <SRS0=sBhj=24=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A09C33C99
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jan 2020 05:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AD5820678
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jan 2020 05:29:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPsxNlkR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgAGF3Y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jan 2020 00:29:24 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44433 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgAGF3X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 00:29:23 -0500
Received: by mail-pg1-f194.google.com with SMTP id x7so27929844pgl.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2020 21:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DYRnJmKFkVOVyvhkzjG6wHR7cwBj4cNmdmKT5d4qt48=;
        b=JPsxNlkRHXmb+wEpvUDCFBj1A7EnkN0QhLo5R4UrciwTBhUlcwf8eX3rW8qY9dxWJs
         oAqsJ2p9L1akFqwWTcCy5pDQDTut2tkB6g4CsbjYnmXqf06jkoF6cs6WqM3iNCwKvIam
         OWATqgWzOkPIGQ9CoHSB9RuaKWDQN1GQXfaHaQNxsrUHsHTR0+xoKtmk8NOIWCtMEcvf
         KgiVZ403FQpxVOXV8zX2PYsPMoDGKHhTOXvw0at8FTZBGeh8rdeUUSYu7PRsd4zZoLP3
         JyZwL/uGHGWULyb/K0e0bUzmXPGpQaUMUOYDYSawrX3R5eGWV15Q2FJ0zTlA5EhQqc0G
         KaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DYRnJmKFkVOVyvhkzjG6wHR7cwBj4cNmdmKT5d4qt48=;
        b=g6UWMbbkEGycokvnRsyCBdk9U5eKJVgXyqOP35y1VYH8g3/6tYhmFFNrt1JoUHAs5m
         1o+vgfLGuyUXulSuIEe3+rGEA5hPW9V4TKdJBkVglBSlpRAMKBv2ZMQllsf1jfZnxW1u
         wGOkwwBOr3Ha5vL5l2tSDr3U+S6H3vyEHvDeIVRZfo4a8mn4vsr6S2VgLPjp+MBuVP4K
         ExdxsJY5hvpBQwwjp1jpqdpXY6rm8mG4IbZlF9z4La7+WBIzuYPNsW5aznw18EWHWpXi
         PF9DhP6L4J9tmgP5NwVqv61unS+AbxwmietTgDXykgnPEcCfZ/j2FZkOUPr+kc8mtyWX
         gfZA==
X-Gm-Message-State: APjAAAVOnbFOOTK2gBvAHBYj7sng/4QC/vgyWkmxZqBvPDmnaU6hySl0
        YKQsx33IEnpPpftX66HxVrUBdA==
X-Google-Smtp-Source: APXvYqyIaMp0yaWxzLjhjdNyyh4j10tjUv2GlWlLB0HPrp35coQ6cktZUh8z1CCi0GdoSyfDSh7T8Q==
X-Received: by 2002:a63:8041:: with SMTP id j62mr115019328pgd.41.1578374963100;
        Mon, 06 Jan 2020 21:29:23 -0800 (PST)
Received: from localhost ([122.172.26.121])
        by smtp.gmail.com with ESMTPSA id n14sm58159378pff.188.2020.01.06.21.29.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 21:29:22 -0800 (PST)
Date:   Tue, 7 Jan 2020 10:59:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     chenqiwu <qiwuchen55@gmail.com>
Cc:     kgene@kernel.org, krzk@kernel.org, rjw@rjwysocki.net,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: s3c: avoid use after free issue in
 xxx_cpufreq_reboot_notifier_evt()
Message-ID: <20200107052920.biwi2cdmz46antm7@vireshk-i7>
References: <1577515439-14477-1-git-send-email-qiwuchen55@gmail.com>
 <20200106054811.uduf2qdn5ecvbwrc@vireshk-i7>
 <20200106065249.GA16392@cqw-OptiPlex-7050>
 <20200106065502.bimpddvrvmfm2f5f@vireshk-i7>
 <20200106083018.GA19697@cqw-OptiPlex-7050>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106083018.GA19697@cqw-OptiPlex-7050>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06-01-20, 16:30, chenqiwu wrote:
> Hhh..I don't agree this, since the cpufreq policy of cpu0 may have
> been released before such UAF issue happenning.

That won't happen if you do cpufreq_cpu_get(), isn't it ?

> By the way, why not get invaild cpufreq policy of another cpu but
> only cpu0 here?

Probably because this platform has a single cpufreq policy which covers all the
CPUs and so it doesn't really matter which CPU you use to get the policy.

-- 
viresh
