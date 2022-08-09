Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DD0C19F2D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Aug 2022 17:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244711AbiHIR0i (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Aug 2022 13:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245136AbiHIR0h (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 13:26:37 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928C5205D6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 10:26:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id a18-20020a05600c349200b003a30de68697so941319wmq.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=c1LX0kRW2rGw625YIyZsUXEnFx6QgDKnPaeP6gRj2t0=;
        b=Q9ZD0xRyxDV8Asm+Lai68lIYb1xUxMY+JzfZItQUgIhIv8zMi6BX11LCWSYGCh+VqJ
         0LHinifMfDC/EZYeeWTT6Hp1SNSeOVCrCQ+kRy9koGe/s5+1k/uJia7mLC3qNETe6p3n
         mnrRKYWkb3cD6MTO/9r/eZpHZTEPBLrntYiR3zZAWj84KeJr/A4BsEiukyNwdYZkDXbG
         kAtkzfCdOILaE0Sqcl/hq3LRqCoMPZBXrgxVQ/gFdk2MlzXFxevIoogruGxICwEv5uFc
         P8ZHUquR02+uGcZVyuf6YGIFZ22gV4dwGpohLZRsix6s8b+KstWdvRJ5pmBZc0BqFr7c
         pS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=c1LX0kRW2rGw625YIyZsUXEnFx6QgDKnPaeP6gRj2t0=;
        b=CDHrOiZ1EpkHBpMPyHMh5OBOeU1JwmftnavxUb+u9AM387y9ENzJQ+2bm4BramBrk4
         rzZ+ucEGgHlfidObLy3jddSgau0aQXNV1pZv8xVExa3fAcsBQOB0c1K21mR0x5dmL+w2
         Eqcg8pHVgKXLlJ66ZIsUmtwZnJq/FoMGu6/a0/Dk1laf5Dhr9fsAwKyYepbrJN9ezSWH
         mt4uNiJBYvb7C01Ariax0u6tY25uIfrXK8C0v8woD+hxmaEelo6R2cglT2dTt97ZS10y
         Q39vhcx9Czm1/m5m5eAGYp8OABsPu3S31aNGicCDZimYgMWaftcx/Y+0cdvQjU3HqZbu
         cFRA==
X-Gm-Message-State: ACgBeo25/xpavhzQMg0dW/Z69oAGWamStEf0dPAxJnHKnMGcv9f/1u6D
        VhMIbq3qSXVDZcOC1tmx7cQwu4LJTY/kHw==
X-Google-Smtp-Source: AA6agR6l9qTHMbyBrtdyXwd2EANDfAnSOxG6iuXb+2WiDhpeY4rlrV5Gz0cjWgVG0fQXXJgx3GbZsQ==
X-Received: by 2002:a05:600c:5120:b0:3a3:2ae4:fb20 with SMTP id o32-20020a05600c512000b003a32ae4fb20mr16132398wms.81.1660065994066;
        Tue, 09 Aug 2022 10:26:34 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6dc2000000b002235eb9d200sm3725017wrz.10.2022.08.09.10.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 10:26:33 -0700 (PDT)
Date:   Tue, 9 Aug 2022 18:26:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 13/28] mfd: sec: Remove #ifdef guards for PM related
 functions
Message-ID: <YvKYxxrOO04bAskw@google.com>
References: <20220807145247.46107-1-paul@crapouillou.net>
 <20220807145247.46107-14-paul@crapouillou.net>
 <a625a1b4-6ecd-79d9-3d13-f42fd5b8275c@linaro.org>
 <YvJ+YPAynhFKj5DR@google.com>
 <21b84f49-67af-6217-a662-f890db5525a8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21b84f49-67af-6217-a662-f890db5525a8@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 09 Aug 2022, Krzysztof Kozlowski wrote:

> On 09/08/2022 18:33, Lee Jones wrote:
> > On Mon, 08 Aug 2022, Krzysztof Kozlowski wrote:
> > 
> >> On 07/08/2022 17:52, Paul Cercueil wrote:
> >>> Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros
> >>> to handle the .suspend/.resume callbacks.
> >>>
> >>> These macros allow the suspend and resume functions to be automatically
> >>> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> >>> to use #ifdef guards.
> >>>
> >>> The advantage is then that these functions are now always compiled
> >>> independently of any Kconfig option, and thanks to that bugs and
> >>> regressions are easier to catch.
> >>>
> >>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >>
> >> The address does not work. Please don't add it to commit log.
> >>
> >>> Cc: linux-samsung-soc@vger.kernel.org
> >>
> >> This is also not really needed in commit log... it's just a mailing list...
> >>
> >> I actually never understood why people want to add to commit log, so to
> >> something which will last 10 years, Cc-ing other folks, instead of
> >> adding such tags after '---'. Imagine 10 years from now:
> >>
> >> 1. What's the point to be cced on this patch after 10 years instead of
> >> using maintainers file (the one in 10 years)? Why Cc-ing me in 10 years?
> >> If I am a maintainer of this driver in that time, I will be C-ced based
> >> on maintainers file. If I am not a maintainer in 10 years, why the heck
> >> cc-ing me based on some 10-year old commit? Just because I was a
> >> maintainer once, like 10 years ago?
> > 
> > Why would that happen?
> > 
> > These tags are only used during initial submission.
> 
> No, the tags are used in any other resends, backports etc while
> traveling through different trees. I think only stable-backports do not
> use them, but all other gfp+git-send will follow the tags.
> 
> > 
> >> 2. Or why cc-ing such people when backporting to stable?
> > 
> > That doesn't happen either.
> 
> Indeed, stable does not use these Cc.
> 
> >> It's quite a lot of unnecessary emails which many of us won't actually
> >> handle later...
> >>
> >> I sincerely admit I was once also adding such Cc-tags. But that time my
> >> employer was counting lines-of-patch (including commit log)... crazy, right?
> > 
> > Nothing wrong with adding these tags IMHO.  It's what they're for.
> > 
> > I use them when I'm maintaining a large amount of out-of-tree, but
> > to-be-upstreamed patches over several versions.  Re-applying the
> > recipients list can become pretty labour-some after several
> > iterations.
> 
> You can do it still while keeping the tags after ---. Only patch-related
> workflows strip such tags. If you cherry-pick, rebase, merge, you always
> get the content of ---.
> 
> The same as typical changelog (not cover letter but one in the patch) -
> you keep it after --- and it does not disappear.

I'll have to try this next time.

> > Adding them under the '---' doesn't work when the purpose of them is
> > to keep the recipients list in Git history.
> 
> This I understand, what I did not understand (and you did not explain)
> is what would be the purpose to keep them in Git history. What is the
> point to have them in commit log of 10 year old commit?

Here is a documented use for the tags:

 "If a person has had the opportunity to comment on a patch, but has not
  provided such comments, you may optionally add a ``Cc:`` tag to the patch."

Thus, when a recipient replies with a *-by tag, I strip out the
corresponding Cc: line.

Obviously this does not apply to mailing lists.

-- 
DEPRECATED: Please use lee@kernel.org
