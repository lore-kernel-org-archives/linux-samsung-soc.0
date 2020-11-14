Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA7DC5519F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 14 Nov 2020 15:49:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 504A622254
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 14 Nov 2020 15:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgKNPtm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 14 Nov 2020 10:49:42 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46400 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgKNPtl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 14 Nov 2020 10:49:41 -0500
Received: by mail-wr1-f67.google.com with SMTP id d12so13616977wrr.13;
        Sat, 14 Nov 2020 07:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EQ8r5pJttfECMbi7klz393g0n/5XRY+5UKG5qivG/ww=;
        b=sXber1hQ1I+ikfblM9m7n0uIIAA4KRFIvE4nTME14ul0C2v2OS24Etm7DOhyo0h4P/
         sw8PIPvkJZl0KzPlDlqEHcJyUo8VhArg0JXX4fT15u55wE6csvY9yl75xY9s3g86BB2W
         dPGTefgwvhjy821O38gTX4wIfHU7YEOM2fjkGNIolFj9zYh0rbywDatky9wt7I3b1Pop
         gjKGlmaq+m0I9ihw50BF1bkS8BMSYZ7tN43TLNGUYysM4QoeZI4hvyr/J23LjBPkAypT
         vxE7rPnpDAcFiuOPSIBawQrxDAS7lOO7yRJC3R9JZJ0ILl1+EoUU1vHP5vaLR2eSBpin
         v0bw==
X-Gm-Message-State: AOAM532mMKuy0QEs/mi2PnuwP3ilZsp6GxJmSZRJAGp3ycua3kW/N5kU
        pwnXHVkR19xGRTtsTMxznbk=
X-Google-Smtp-Source: ABdhPJxrJddT5J8YjMMsQDwJ9FyUwP9ykncQpw8kMv9gUdf9CRy0f46zk3qwOMdEViRo40kcUlKWqA==
X-Received: by 2002:adf:e607:: with SMTP id p7mr9885500wrm.93.1605368979245;
        Sat, 14 Nov 2020 07:49:39 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id w186sm14037275wmb.26.2020.11.14.07.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 07:49:38 -0800 (PST)
Date:   Sat, 14 Nov 2020 16:49:36 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     xiakaixu1987@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
Subject: Re: [PATCH] ASoC: samsung: remove the unused variable value
 assignment
Message-ID: <20201114154936.GC14208@kozik-lap>
References: <1605279079-6416-1-git-send-email-kaixuxia@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1605279079-6416-1-git-send-email-kaixuxia@tencent.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 13, 2020 at 10:51:19PM +0800, xiakaixu1987@gmail.com wrote:
> From: Kaixu Xia <kaixuxia@tencent.com>
> 
> The value of variable ret is overwritten by the following call
> devm_snd_soc_register_card(), so here the value assignment is useless.
> Remove it.
> 
> Reported-by: Tosk Robot <tencent_os_robot@tencent.com>

Where can we find the report?

> Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
> ---
>  sound/soc/samsung/smdk_wm8994.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
> index 64a1a64..1db5b59 100644
> --- a/sound/soc/samsung/smdk_wm8994.c
> +++ b/sound/soc/samsung/smdk_wm8994.c
> @@ -160,11 +160,9 @@ static int smdk_audio_probe(struct platform_device *pdev)
>  		smdk_dai[0].cpus->dai_name = NULL;
>  		smdk_dai[0].cpus->of_node = of_parse_phandle(np,
>  				"samsung,i2s-controller", 0);
> -		if (!smdk_dai[0].cpus->of_node) {
> +		if (!smdk_dai[0].cpus->of_node)
>  			dev_err(&pdev->dev,
>  			   "Property 'samsung,i2s-controller' missing or invalid\n");
> -			ret = -EINVAL;

This should jump to out/return instead.

Please use script get_maintainers.pl to get the list of people and
mailing lists to Cc. No one would apply this patch otherwise...

Best regards,
Krzysztof
