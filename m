Return-Path: <SRS0=CwGy=23=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A94C32771
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jan 2020 06:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E68D521775
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jan 2020 06:55:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbiZz4bf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgAFGzH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Jan 2020 01:55:07 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33016 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgAFGzH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jan 2020 01:55:07 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so26436634pgk.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jan 2020 22:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kMjWw4ObQXa5tU7/4BC/Kf0fTl6f93HTAnRhQj6fbYQ=;
        b=rbiZz4bfFgf1jTPa3LFYJTALJqVunQJkyqIBz6qTTRJ6IXYmBRVMVnbtv89C27cCMK
         GbnyT86UTVdO5nGt2TPC3Yd7V5jLEErJRNJKZa9DG/UBSMW3BqhhyY78sxr0Mogby9cO
         EMZ2mEw5bnYmr8GbTYEPl5KDiQOfgOBdoLrsZOrDrM4rIpIRlxcDX1uLdxRCId7WIQle
         UGdj1rzTvzVdEwVSNUy8QcUmnfLjoBUZ0q5fo4bfYF/JhyVJR8Qi37DnKQCifiytQ7gI
         L7L1jnfWUoEIkd1cmkhZM1QLeVS7IWAcn218pivk4ZSk4LyFAefJe1aMUFfiGWRtlXOr
         1ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kMjWw4ObQXa5tU7/4BC/Kf0fTl6f93HTAnRhQj6fbYQ=;
        b=U8KzMKsXUaB6fSAXl/rbxn6RhU5l/rIE63wu3cmyHUOt47oBECAN0KvqOS5G0V+UC/
         0YW5Duq1K2bDxvSiFRVjC6mR4mRS1+sEGkcozt5kbZfT2BXbT+fo56qjbXh0YtQI4OAS
         yeWXBB8wGahuRMlfeaYc7uX8QvYyAGMMsQfqowFm6KwPy1ZnJd2zIXKEmt6guqxi75Ar
         Tz113ILACGEUKK6KtZ4AGGAi8DIHHcYfYeMLeciZG58uQuAB6+8/uB/+Dd12HpUH3DLw
         zFjaVLRvRe3OCxblCBe0m8t/3ExxYjRdSAHkAdP/Gv02LDLX8kabZ0ZYD571IiSLjk0G
         8gMw==
X-Gm-Message-State: APjAAAVyQVfPuc0h3r+o+2nUW0Yykqk3kHV5Um/pZzXAOULGBO8FeL84
        qRBKrjl0/flCvhBbWJJ+PnwWwA==
X-Google-Smtp-Source: APXvYqzDrb4T5b5fxDDS/CxIRlUlD59ItmCXmCwsdQJKzsrikz4XhCQmY7mMb4+ZrEIymAreV3RhQA==
X-Received: by 2002:a65:56c9:: with SMTP id w9mr105330256pgs.296.1578293705329;
        Sun, 05 Jan 2020 22:55:05 -0800 (PST)
Received: from localhost ([122.172.26.121])
        by smtp.gmail.com with ESMTPSA id l8sm22852583pjy.24.2020.01.05.22.55.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jan 2020 22:55:04 -0800 (PST)
Date:   Mon, 6 Jan 2020 12:25:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     chenqiwu <qiwuchen55@gmail.com>
Cc:     kgene@kernel.org, krzk@kernel.org, rjw@rjwysocki.net,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: s3c: avoid use after free issue in
 xxx_cpufreq_reboot_notifier_evt()
Message-ID: <20200106065502.bimpddvrvmfm2f5f@vireshk-i7>
References: <1577515439-14477-1-git-send-email-qiwuchen55@gmail.com>
 <20200106054811.uduf2qdn5ecvbwrc@vireshk-i7>
 <20200106065249.GA16392@cqw-OptiPlex-7050>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106065249.GA16392@cqw-OptiPlex-7050>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06-01-20, 14:52, chenqiwu wrote:
> On Mon, Jan 06, 2020 at 11:18:11AM +0530, Viresh Kumar wrote:
> > On 28-12-19, 14:43, qiwuchen55@gmail.com wrote:
> > > From: chenqiwu <chenqiwu@xiaomi.com>
> > > 
> > > There is a potential UAF issue in xxx_cpufreq_reboot_notifier_evt() that
> > > the cpufreq policy of cpu0 has been released before using it. So we should
> > > make a judgement to avoid it.
> > 
> > There is no UAF problem here, but that we do cpufreq_cpu_get() with a
> > corresponding cpufreq_cpu_put().
> > 
> > > Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> > > ---
> > >  drivers/cpufreq/s3c2416-cpufreq.c | 11 ++++++++++-
> > >  drivers/cpufreq/s5pv210-cpufreq.c | 10 +++++++++-
> > >  2 files changed, 19 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/cpufreq/s3c2416-cpufreq.c b/drivers/cpufreq/s3c2416-cpufreq.c
> > > index 1069103..0f576ba 100644
> > > --- a/drivers/cpufreq/s3c2416-cpufreq.c
> > > +++ b/drivers/cpufreq/s3c2416-cpufreq.c
> > > @@ -304,6 +304,7 @@ static int s3c2416_cpufreq_reboot_notifier_evt(struct notifier_block *this,
> > >  {
> > >  	struct s3c2416_data *s3c_freq = &s3c2416_cpufreq;
> > >  	int ret;
> > > +	struct cpufreq_policy policy;
> > >  
> > >  	mutex_lock(&cpufreq_lock);
> > >  
> > > @@ -318,7 +319,15 @@ static int s3c2416_cpufreq_reboot_notifier_evt(struct notifier_block *this,
> > >  	 */
> > >  	if (s3c_freq->is_dvs) {
> > >  		pr_debug("cpufreq: leave dvs on reboot\n");
> > > -		ret = cpufreq_driver_target(cpufreq_cpu_get(0), FREQ_SLEEP, 0);
> > > +
> > > +		memset(&policy, 0, sizeof(policy));
> > > +		ret = cpufreq_get_policy(&policy, 0);
> > > +		if (ret < 0) {
> > > +			pr_debug("cpufreq: get no policy for cpu0\n");
> > > +			return NOTIFY_BAD;
> > > +		}
> > > +
> > 
> > This doesn't make sense to me, why don't you do cpufreq_cpu_get() and
> > put() instead ?
> >
> Hi viresh,
> I can't explain which approach is better, but I think both approaches are
> effective for the situation.

The second one is better as it doesn't make copy of the policy, but
rather just increments the counter.

> By the way, there is a possibility that the cpu0 hotplug thread will call
> cpufreq_policy_free() to free cpufreq policy if cpu0 hotplug failed.
> I think there should be a judgement to avoid this UAF risk if necessary,
> or we just do panic if cpu0's cpufreq policy is free.

I think there are enough locks in place to avoid such issues and they
shouldn't happen.

> > > +		ret = cpufreq_driver_target(&policy, FREQ_SLEEP, 0);
> > >  		if (ret < 0)
> > >  			return NOTIFY_BAD;
> > >  	}
> > > diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> > > index 5d10030..d99b4b1 100644
> > > --- a/drivers/cpufreq/s5pv210-cpufreq.c
> > > +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> > > @@ -555,8 +555,16 @@ static int s5pv210_cpufreq_reboot_notifier_event(struct notifier_block *this,
> > >  						 unsigned long event, void *ptr)
> > >  {
> > >  	int ret;
> > > +	struct cpufreq_policy *policy;
> > >  
> > > -	ret = cpufreq_driver_target(cpufreq_cpu_get(0), SLEEP_FREQ, 0);
> > > +	policy = cpufreq_cpu_get(0);
> > > +	if (!policy) {
> > > +		pr_debug("cpufreq: get no policy for cpu0\n");
> > > +		return NOTIFY_BAD;
> > > +	}
> > > +
> > > +	ret = cpufreq_driver_target(policy, SLEEP_FREQ, 0);
> > > +	cpufreq_cpu_put(policy);
> > 
> > Like what is done here.
> > 
> > Also add a blank line here.
> > 
> > >  	if (ret < 0)
> > >  		return NOTIFY_BAD;
> > >  
> > > -- 
> > > 1.9.1
> > 
> > -- 
> > viresh
> 
> Thanks for your review!
> Qiwu

-- 
viresh
