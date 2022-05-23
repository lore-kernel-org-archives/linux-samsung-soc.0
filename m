Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C701C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 07:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiEWHU3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 03:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiEWHTs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 03:19:48 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9E137A81
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 00:11:41 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 27so11153961ljw.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Gc26+rcVZkyKMkbZyQm/Ic2rBEPkaemn6MN2whuu+68=;
        b=Dvb2vocUO2tRjyqe2xnNFFh330GtVJXAbqh1EPAJtoqLIBwm6FJUavmAMb9RVO/d1R
         HJBDlsBFMi3TyopQWQWRCjCr+hsjSiUU2rKav7Hv2vnXef54dBGn3gyhXIl4MoP2G3ot
         YY0oBaEzKHm0zJfqF09w2sHcJbpM+TN9y2k7C/DYcCWJetUCKznndJOzPobXhYXwdyEu
         fKPrrYefvWMNnrXdEn/5AQwvYFIH1XX0zYDWlg1M8XjfjhkWk1t6/XR1zJanSFA+97/X
         /WY1VsCDBv1x1ufNcsLX6avdzGXk8J84NrPylV4Ih2CECEdJskf1SyECypbFExLbB00O
         sZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Gc26+rcVZkyKMkbZyQm/Ic2rBEPkaemn6MN2whuu+68=;
        b=3rb5zgRbNwiH5SM7WewNpyl6y7OnNhRcrMFWJfrcqQWhTAwE/IySTq5uGFXP7Bb2b6
         o23d0nkYEngQLBUqhCm/y4ZUse01sktLfEXdV7NO6+gN2ZbJztQdrcae25+2hRaPscoE
         tr8Dt3yY8od05YZB6+i3k3TiB4IOfiJXws94sFGUHqrQwUBKa0tEKjQlCCIx5jZXRBO1
         oQoNCpCgVQU6QOpUZY5Sonk6qnrTnfRwizd4P24a+9C6E0aOJRGErcxLPMdyGLxrujXo
         p29q1c6uCRAMcY2or0Rs7m/5HxjYTBzDKs4H3hjT0u1S9wSX9Zk/cpGVyooZ2GiHnCJv
         TylQ==
X-Gm-Message-State: AOAM5327AlJUylYsp4nIUbSSyDEe1+WsbULAkqipXigNVCFpU29p1kSv
        vG1wE3EZUfSZ/RMrVq5auNLOuw==
X-Google-Smtp-Source: ABdhPJwH0ehCNPSgTTmhOE/+2s4KV1XW8o5fwpph2ttS7Bp02Stf/i51tIX1yyAPlAq/zLTvOHqXJQ==
X-Received: by 2002:a05:651c:11c6:b0:253:e817:abc6 with SMTP id z6-20020a05651c11c600b00253e817abc6mr3794822ljo.164.1653289852568;
        Mon, 23 May 2022 00:10:52 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h23-20020a2e9017000000b0024f3d1daec1sm1639751ljg.73.2022.05.23.00.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 00:10:52 -0700 (PDT)
Message-ID: <de01b027-d2ec-683b-290c-86eae5ccc605@linaro.org>
Date:   Mon, 23 May 2022 09:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ARM: s3c: Use strscpy to replace strlcpy
Content-Language: en-US
To:     =?UTF-8?B?6ZmI5a2m5YW1?= <chenxuebing@jari.cn>
Cc:     alim.akhtar@samsung.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <1f4faebf.9e6.180ec52dc40.Coremail.chenxuebing@jari.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1f4faebf.9e6.180ec52dc40.Coremail.chenxuebing@jari.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/05/2022 17:11, 陈学兵 wrote:
> 
> The strlcpy should not be used because it doesn't limit the source
> length.  Preferred is strscpy.
> 
> Signed-off-by: XueBing Chen <chenxuebing@jari.cn>

Your name in From field does not match exactly one used in
Signed-off-by. Name might be actually the same, but different alphabet
is used. Please use the same one - latin transliteration - in both cases.

> ---
>  arch/arm/mach-s3c/mach-mini2440.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c/mach-mini2440.c b/arch/arm/mach-s3c/mach-mini2440.c
> index 551ec660ab59..98cebc06521c 100644
> --- a/arch/arm/mach-s3c/mach-mini2440.c
> +++ b/arch/arm/mach-s3c/mach-mini2440.c
> @@ -624,7 +624,7 @@ static char mini2440_features_str[12] __initdata = "0tb";
>  static int __init mini2440_features_setup(char *str)
>  {
>  	if (str)
> -		strlcpy(mini2440_features_str, str,
> +		strscpy(mini2440_features_str, str,
>  			sizeof(mini2440_features_str));
>  	return 1;
>  }


Best regards,
Krzysztof
