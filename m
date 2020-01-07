Return-Path: <SRS0=sBhj=24=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC2C33C99
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jan 2020 05:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1331F2070E
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jan 2020 05:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5ANRPnN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725267AbgAGFbu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jan 2020 00:31:50 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33742 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgAGFbu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 00:31:50 -0500
Received: by mail-pl1-f194.google.com with SMTP id c13so22744890pls.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2020 21:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0YHUU0Ivx/NHSzvA+8JE0/KSXoBNp97yyXmGvrm2014=;
        b=v5ANRPnNl2ct7jBumu6xMfcn0oB6+pE4UzYLjpgkTXJUHYlOeQy22xib2+2QZKXBxy
         Rz1g5Iy4XFd5rfQQsW6FpkD/kizYYNlKxt4s8NdRYucmZVLuQaoR0UrJo0BF9bFyQACC
         zuLOuT2vnN+pLg37BAloXbPVSi80y+BA+dy1/B1CTkA+GxPdon524WSf/mg6s4gP8Sx7
         kfj8fazRkTRHnI65Gpbc+eiICpcvJYvMVv+8DAkBMGQCnjVxHRP1PyXk/MyCGeSoNM38
         XQDGkosqV23yvEYBzOwziVNLZkUV1z7R6Ren3W0fDc+budS9I18wEj3DcqJAuChdymEa
         HqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0YHUU0Ivx/NHSzvA+8JE0/KSXoBNp97yyXmGvrm2014=;
        b=DTU40bSN9SpiUT40Erm5LGbszK/BQgdKfEqpcN0Um3jxZub+rwRcYjTRPGu3e6pwFi
         fLcL/PTFNaj/TO/jMFumzeyMkN23Lz2yk9nb6jufGUi5uWHFUe7afI5JoRaM4eojXXqU
         ls348BwOPzGboiQs3kZH1ZfqdA0anO9CPt28vgsquk6i0JQX0iI+tHWlcu8ZWY9bmr9Q
         VqLEeFH6HK1DFnzfBvg1bYUgdcMQANnz8UFq/N1YsqjeVHEN4e+wtbaPd8aOiAZDQr3g
         M68wAUQg/hNs9BpgYtJ0NribBI1h9n5p2Pbyu6M2xKb3/E20/Y1JHokFkflFQzjI7CgT
         RpyQ==
X-Gm-Message-State: APjAAAWiZ3RTFRtgiolwC6WCKCh+ctpcmk++e3iFNo4vBqgjR9kJOO6G
        b0KRY0LWG9bx+O9wyMje0Hj/OcZbNmU=
X-Google-Smtp-Source: APXvYqw44TryZr313hZhrJbhpK95tgknorsfpCrqBBv/Hv0p/mkGQqkZVJlLD6zaK8WcvskkV6QIAw==
X-Received: by 2002:a17:90a:cb8c:: with SMTP id a12mr48084076pju.71.1578375109757;
        Mon, 06 Jan 2020 21:31:49 -0800 (PST)
Received: from localhost ([122.172.26.121])
        by smtp.gmail.com with ESMTPSA id x132sm78621373pfc.148.2020.01.06.21.31.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 21:31:48 -0800 (PST)
Date:   Tue, 7 Jan 2020 11:01:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     qiwuchen55@gmail.com
Cc:     kgene@kernel.org, krzk@kernel.org, rjw@rjwysocki.net,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        chenqiwu <chenqiwu@xiaomi.com>
Subject: Re: [PATCH v2] cpufreq: s3c: avoid use after free issue in
 xxx_cpufreq_reboot_notifier_evt()
Message-ID: <20200107053147.v5ooeeshknlqyc3l@vireshk-i7>
References: <1578303861-7217-1-git-send-email-qiwuchen55@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578303861-7217-1-git-send-email-qiwuchen55@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06-01-20, 17:44, qiwuchen55@gmail.com wrote:
> From: chenqiwu <chenqiwu@xiaomi.com>
> 
> There is a potential UAF issue in xxx_cpufreq_reboot_notifier_evt() that
> the cpufreq policy of cpu0 has been released before using it. So we should
> make a judgement to avoid it.

Again, the subject and description are incorrect here. This isn't a user after
free problem as we were already calling cpufreq_cpu_get(). The problem was that
the balancing of refcount wasn't done properly.


> Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> ---
> changes in v2:
>  - use the combination of cpufreq_cpu_get() and cpufreq_cpu_put()
>    instead of cpufreq_get_policy() in s3c2416-cpufreq.c
> ---
>  drivers/cpufreq/s3c2416-cpufreq.c | 12 +++++++++++-
>  drivers/cpufreq/s5pv210-cpufreq.c | 11 ++++++++++-
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/s3c2416-cpufreq.c b/drivers/cpufreq/s3c2416-cpufreq.c
> index 1069103..f07c5d1 100644
> --- a/drivers/cpufreq/s3c2416-cpufreq.c
> +++ b/drivers/cpufreq/s3c2416-cpufreq.c
> @@ -304,6 +304,7 @@ static int s3c2416_cpufreq_reboot_notifier_evt(struct notifier_block *this,
>  {
>  	struct s3c2416_data *s3c_freq = &s3c2416_cpufreq;
>  	int ret;
> +	struct cpufreq_policy *policy;
>  
>  	mutex_lock(&cpufreq_lock);
>  
> @@ -318,7 +319,16 @@ static int s3c2416_cpufreq_reboot_notifier_evt(struct notifier_block *this,
>  	 */
>  	if (s3c_freq->is_dvs) {
>  		pr_debug("cpufreq: leave dvs on reboot\n");
> -		ret = cpufreq_driver_target(cpufreq_cpu_get(0), FREQ_SLEEP, 0);
> +
> +		policy = cpufreq_cpu_get(0);
> +		if (!policy) {
> +			pr_debug("cpufreq: get no policy for cpu0\n");
> +			return NOTIFY_BAD;
> +		}
> +
> +		ret = cpufreq_driver_target(&policy, FREQ_SLEEP, 0);
> +		cpufreq_cpu_put(policy);
> +
>  		if (ret < 0)
>  			return NOTIFY_BAD;
>  	}
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index 5d10030..e84281e 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -555,8 +555,17 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
>  						 unsigned long event, void *ptr)
>  {
>  	int ret;
> +	struct cpufreq_policy *policy;
> +
> +	policy = cpufreq_cpu_get(0);
> +	if (!policy) {
> +		pr_debug("cpufreq: get no policy for cpu0\n");
> +		return NOTIFY_BAD;
> +	}
> +
> +	ret = cpufreq_driver_target(policy, SLEEP_FREQ, 0);
> +	cpufreq_cpu_put(policy);
>  
> -	ret = cpufreq_driver_target(cpufreq_cpu_get(0), SLEEP_FREQ, 0);
>  	if (ret < 0)
>  		return NOTIFY_BAD;
>  
> -- 
> 1.9.1

-- 
viresh
