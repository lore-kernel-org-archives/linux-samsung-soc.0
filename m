Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7963C19F2D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Aug 2022 15:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244553AbiHIPeD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Aug 2022 11:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244511AbiHIPeA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 11:34:00 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7185D1181D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 08:33:59 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id z17so14731891wrq.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Qocc64Wb5/O8/orgwNBw6Vi4FkCmBNARdItSYBBLDN8=;
        b=XazVcvTGujYrw69IcTk0y7Fp1Wlu6Arm+7Uqsi3T0aawniRbiW0DoCAn164ru1H8Xv
         j0jEb7R/rRrNObgY7h84BTn0O80m+HTmxB6u8y4xliQ0HEjkehtbA7agrtUd9SmEyKts
         CVl5SMbpfGt/1KTFfis4Koa8x97PvVJaP+BgRo5pn3UpH4msUMIUHZ6IOw09/a/nqqpz
         MY2F4pu65PMqbAEw5Dw1EE6dsH163SRnTn0pUp87LJqPuoqRsLk9GW/ZvyumInMCOjHE
         UfuPNawkIz1cqKu7JoVRSZt6zb8KwPiE4yz7Qox8eW2yvs5p480LSVgs+ZwnWdsNF/2w
         NlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Qocc64Wb5/O8/orgwNBw6Vi4FkCmBNARdItSYBBLDN8=;
        b=KCyGsbKQEtKWaWK5gbIDUTW5bwBdGjc4il9RxbTLLC4sgcxDdX8x0rt+x3QfESKVmL
         S7OjURgYID0tjKzaolSjL4HIKc71C3G82i+6O5/997JL3gcN4y7X5BKapX7NiEVAsgjb
         3+pGgxPYR6VCP08hV5LqKWbMMsRSMR2E3JIANTq2jJfOyR6VB+TCc6yHhGWUQlhFI35p
         GuyfNtHup3esYjtwSjtNNfyDIuGMm2NwDfoV+rXUvu196fbeLaq0weamYwRGvXCJmLU+
         +SP/EFdyzQu0azNrOvOhJRNT8vGOJRTGKL/ZEXep+yBSiAgQmZB/92Q4eF+QgXLYeryl
         v8oA==
X-Gm-Message-State: ACgBeo1541ch708WU2cUhyvJDcuIrbohHvuFrfNk2pV1afwXg2onkGAg
        xmtRZCasgXZkx/3DvVfRYF07Xw==
X-Google-Smtp-Source: AA6agR4iubbuMFbilh/betNJVGxs80lnm0wdSvpuXbctRYbzkpTm0+peYz/pbQqd7ZcxX995aTp54A==
X-Received: by 2002:a5d:5f06:0:b0:220:5a9b:578f with SMTP id cl6-20020a5d5f06000000b002205a9b578fmr13788873wrb.545.1660059237960;
        Tue, 09 Aug 2022 08:33:57 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id o15-20020adfcf0f000000b0021d6a520ce9sm13809467wrj.47.2022.08.09.08.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 08:33:54 -0700 (PDT)
Date:   Tue, 9 Aug 2022 16:33:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 13/28] mfd: sec: Remove #ifdef guards for PM related
 functions
Message-ID: <YvJ+YPAynhFKj5DR@google.com>
References: <20220807145247.46107-1-paul@crapouillou.net>
 <20220807145247.46107-14-paul@crapouillou.net>
 <a625a1b4-6ecd-79d9-3d13-f42fd5b8275c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a625a1b4-6ecd-79d9-3d13-f42fd5b8275c@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 08 Aug 2022, Krzysztof Kozlowski wrote:

> On 07/08/2022 17:52, Paul Cercueil wrote:
> > Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros
> > to handle the .suspend/.resume callbacks.
> > 
> > These macros allow the suspend and resume functions to be automatically
> > dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> > to use #ifdef guards.
> > 
> > The advantage is then that these functions are now always compiled
> > independently of any Kconfig option, and thanks to that bugs and
> > regressions are easier to catch.
> > 
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> The address does not work. Please don't add it to commit log.
> 
> > Cc: linux-samsung-soc@vger.kernel.org
> 
> This is also not really needed in commit log... it's just a mailing list...
> 
> I actually never understood why people want to add to commit log, so to
> something which will last 10 years, Cc-ing other folks, instead of
> adding such tags after '---'. Imagine 10 years from now:
> 
> 1. What's the point to be cced on this patch after 10 years instead of
> using maintainers file (the one in 10 years)? Why Cc-ing me in 10 years?
> If I am a maintainer of this driver in that time, I will be C-ced based
> on maintainers file. If I am not a maintainer in 10 years, why the heck
> cc-ing me based on some 10-year old commit? Just because I was a
> maintainer once, like 10 years ago?

Why would that happen?

These tags are only used during initial submission.

> 2. Or why cc-ing such people when backporting to stable?

That doesn't happen either.

> It's quite a lot of unnecessary emails which many of us won't actually
> handle later...
> 
> I sincerely admit I was once also adding such Cc-tags. But that time my
> employer was counting lines-of-patch (including commit log)... crazy, right?

Nothing wrong with adding these tags IMHO.  It's what they're for.

I use them when I'm maintaining a large amount of out-of-tree, but
to-be-upstreamed patches over several versions.  Re-applying the
recipients list can become pretty labour-some after several
iterations.

Adding them under the '---' doesn't work when the purpose of them is
to keep the recipients list in Git history.

-- 
DEPRECATED: Please use lee@kernel.org
