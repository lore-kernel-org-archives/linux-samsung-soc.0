Return-Path: <SRS0=sBhj=24=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA7EC33C99
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jan 2020 08:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D58A32077B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jan 2020 08:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlBCC1hi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbgAGIBx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jan 2020 03:01:53 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38465 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgAGIBx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 03:01:53 -0500
Received: by mail-pf1-f195.google.com with SMTP id x185so28209527pfc.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2020 00:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1umg53pWWYl/6QRnWmVkxLsY3gucZgYzRZz/LWAqWXY=;
        b=BlBCC1hiGJuDUOHYeGFUhTU+3bqykxr60JA6uoCkj+4HY3eTrNi4NvoLxplc/UKcqU
         ped4ttm0ekXaCxOUhJMVJvGhGpZoLmklcLuq3MK9lBeUaal74NLtlj5AIxWKbC98uUKX
         1hnFr8c8mZISKLpHrBY99PcmiscsjGLsjM2sgayj15VZdXSfqrzTvE3RTdXvurGoB7OS
         lfGcZKxmJC1dT5gWFdALnMOiqK8vNi1FNLQsc8zNqaeAzYmVmCOW1rnQ88xcK5AWJeGd
         Cglhy5Il1zp9ZQID4qS8cO7jxEN8f7BesDZn378gxeH+aD37tsUB0NEBbuu091ko3yAH
         U4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1umg53pWWYl/6QRnWmVkxLsY3gucZgYzRZz/LWAqWXY=;
        b=iJEWXRyYvDrjvNiwJA9KjMM0pn2om4rnPcbpOU9JkYMQkUqgTepYmtHsdZnoaAmkom
         GnZvz+5nRWUKu81vEGcNUYgSYL6A8Qfku0jcq19Hmdkn8u4UkbpZ0CqUAAWEzk74WXLo
         er+s9STdtdlHh07WLuur1eZl3M6v08PvZPd0zaDpUgtVNztCVoRFRXb1uNC8jWjRsl/O
         oeefhMkRE1MWrMI5YfVgu2YdaRpUXLwO+upjKbQgPm1DSzaZao1NUPG5d3IYrTMgI49o
         UmsqU30VAZITAQF5rfrU9RafFPZ4YQDx6Ygr/2e9uS23iqwA0R9ge4Zr1JIYWb4aO2uE
         0+Zw==
X-Gm-Message-State: APjAAAXgvnN8AG7Y9iZrEMiss/d0TsXCANXnwCw45TFax3Y+JZse97CU
        3N1f4TCK7UMpR3E0+i6U41lb+Q==
X-Google-Smtp-Source: APXvYqxVE2VEnVPb0aAGxiZJ/oIQEyVvSKjAKPvgVOOZNl4CcAjr60FWxaJEKvnLnoSswGARFg69Rg==
X-Received: by 2002:a63:5924:: with SMTP id n36mr115765526pgb.43.1578384112408;
        Tue, 07 Jan 2020 00:01:52 -0800 (PST)
Received: from localhost ([122.172.26.121])
        by smtp.gmail.com with ESMTPSA id w11sm79495860pfn.4.2020.01.07.00.01.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 00:01:51 -0800 (PST)
Date:   Tue, 7 Jan 2020 13:31:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     qiwuchen55@gmail.com
Cc:     kgene@kernel.org, krzk@kernel.org, rjw@rjwysocki.net,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        chenqiwu <chenqiwu@xiaomi.com>
Subject: Re: [PATCH v3] cpufreq: s3c: fix unbalances of cpufreq policy
 refcount
Message-ID: <20200107080145.7c4gxilnjjxjfqpc@vireshk-i7>
References: <1578383599-11207-1-git-send-email-qiwuchen55@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578383599-11207-1-git-send-email-qiwuchen55@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07-01-20, 15:53, qiwuchen55@gmail.com wrote:
> From: chenqiwu <chenqiwu@xiaomi.com>
> 
> The cpufreq_reboot_notifier_evt() call cpufreq_cpu_get() to get the
> cpufreq policy of cpu0, meanwhile, it also increments the kobject
> reference count to mark it busy. However, a corresponding call of
> cpufreq_cpu_put() is ignored to decrement the kobject reference count
> back, which may lead to a potential stuck risk that the cpuhp thread
> deadly waits for dropping of kobject refcount when cpufreq policy free.
> 
> With this patch, the cpuhp thread can be easily exercised by attempting
> to force an unbind of the CPUfreq driver.
> 
> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> ---
> changes in v3:
>  - Rewrite title and commit message.
> ---
>  drivers/cpufreq/s3c2416-cpufreq.c | 12 +++++++++++-
>  drivers/cpufreq/s5pv210-cpufreq.c | 11 ++++++++++-
>  2 files changed, 21 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh
