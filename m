Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1E8C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 03:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13FB864DD8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 03:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhCODTS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 14 Mar 2021 23:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhCODSp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 14 Mar 2021 23:18:45 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7407BC06175F
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Mar 2021 20:18:34 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id r16so4381308pfh.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Mar 2021 20:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NspATENrOmFGj2RGWYRZs8AOESm5x2Ll245LWQboYD4=;
        b=vVSbOGEZM6+lY89PH6AD/+r2vwev4+GrGPJfaucmL+CKQhZSC/Z+xSD6fwceLgvA+z
         o5rxrsiTjvDHAoscewztuD+bs43QCWBp8jrQ1aJ7lCBlAYWnKaVWwiy+jjzfPRHJGM3c
         iTYujaPmjpQGup+Zb26+jzkwzzMCwztBezg4gW6c3BYZw+SuO10KLX45P/0+v8DJXIbo
         g2PnPuB2SkAJGf1bQ3pl/4SrkoAtB51yyJutpDNLrn2yLTwGaKb3dLi8pujlR/Ixm0Gt
         oRzeFYTow/eJGG4iT3zYd2fhNvn4n+m49RpdatilunQrSp2djJBZjLjzjil1q++1WYqY
         ejNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NspATENrOmFGj2RGWYRZs8AOESm5x2Ll245LWQboYD4=;
        b=MHnOtdQ6geIs/OvhHsVm4Ux9UN7o/lGsliNP/Cpx2+f5/itFCxubk3ElxRSlz320MY
         JluhPW7hJ6ZLEoY6Ssg1IoxexczWh82aTOyP8D8TFAD3PUXSv3xSEGAa9K4+L9gbyQEg
         XUqXUc1Raom9v13dQTCENSXrBSXYD0CAVApXmjrMUIsSaUpo8UuKTjZPSa3QZP7cYuOG
         R+/Si+qp7zr7Ru0zSRZ2bAY99OywKvqPhfm50OvCWJg1FEwEZKLdn5BOm3qWDI40U0AE
         hX+6gj+DedgQSI9DlIb50sLvtakz6oj8t939f+d0m0SZqI+TV5F/LEBVZhFja5gJke9r
         bmRA==
X-Gm-Message-State: AOAM530GILuJK7pEZmiIrHsZl2iTSTBQD2OpaFB+TTqksvHbQWi0v7b5
        ad3r+Py2l9CKA1T/9zm3Kcfpng==
X-Google-Smtp-Source: ABdhPJzf+pPBkSh435zuJv+zfo4KPBtQGNpvnEArBnO2YbupAuH29+18xHUwb3Vljye/UwziHjJpuA==
X-Received: by 2002:a63:ee4b:: with SMTP id n11mr21505433pgk.265.1615778314002;
        Sun, 14 Mar 2021 20:18:34 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id k3sm11092692pgq.21.2021.03.14.20.18.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Mar 2021 20:18:33 -0700 (PDT)
Date:   Mon, 15 Mar 2021 08:48:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     rjw@rjwysocki.net, krzk@kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
Subject: Re: [PATCH V3] cpufreq: Rudimentary typos fix in the file
 s5pv210-cpufreq.c
Message-ID: <20210315031831.h7oojymaexfigxxw@vireshk-i7>
References: <20210313034951.13269-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313034951.13269-1-unixbhaskar@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13-03-21, 09:19, Bhaskar Chowdhury wrote:
> 
> Trivial spelling fixes throughout the file.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Changes from V2:
>   Incoporated the findings of Tom Saeger <tom.saeger@oracle.com>
> 
>  drivers/cpufreq/s5pv210-cpufreq.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied with this change.

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index 73110b005716..ad7d4f272ddc 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -91,7 +91,7 @@ static DEFINE_MUTEX(set_freq_lock);
 /* Use 800MHz when entering sleep mode */
 #define SLEEP_FREQ     (800 * 1000)
 
-/* Tracks if cpu frequency can be updated anymore */
+/* Tracks if CPU frequency can be updated anymore */
 static bool no_cpufreq_access;
 
 /*
@@ -439,8 +439,8 @@ static int s5pv210_target(struct cpufreq_policy *policy, unsigned int index)
        }
 
        /*
-        * L4 level needs to change memory bus speed, hence onedram clock divider
-        * and memory refresh parameter should be changed
+        * L4 level needs to change memory bus speed, hence ONEDRAM clock
+        * divider and memory refresh parameter should be changed
         */
        if (bus_speed_changing) {
                reg = readl_relaxed(S5P_CLK_DIV6);

-- 
viresh
