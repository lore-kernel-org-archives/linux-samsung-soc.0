Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CDEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 20 Feb 2022 15:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240010AbiBTPdg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Feb 2022 10:33:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240029AbiBTPdf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Feb 2022 10:33:35 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76773369D9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 07:33:14 -0800 (PST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F05383F1A1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 15:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645371191;
        bh=AIbRyeLNfvFJg7VRCeqPL8tDv5fvQyhxI4o53shpmgE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=JnVOcFQGXl0uHF05zYFja0a22VaygreL71FZsAkgKA1sRNZZ6TFfPMNkRGyKaJu62
         /lZZ2YjsH5er7UrMB2PN9LHC68+2g5tvRe4jm2sWt5D881Gc+efLHAam07jxxhIzUi
         2zTuKhl7dpplH5LkgZQX5p5suQ81qYRdQAxmnc1bQtbqyIntpk8LayCPaQR+bAxQXj
         8th+dzfSXl4bcYE4giBIwDJqGbiMmeQ+qdSrKHh8fjURzj8HIUAnXnq+Zh8Tg0KXLu
         Fb7W23csfbBjuRUOxXbaMg0WWdQeGGleWDvbYmFxYCcSH22jKR8GbpWOqeMctX70gU
         w72HDxSuumjkQ==
Received: by mail-wr1-f71.google.com with SMTP id y8-20020adfc7c8000000b001e755c08b91so6031488wrg.15
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 07:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AIbRyeLNfvFJg7VRCeqPL8tDv5fvQyhxI4o53shpmgE=;
        b=GgUmF4W9UnzYvLbYfxljX8PwuUf29EPVFT2YfxYk37HF42beS5fh4RclgYJenskdjr
         QAjlOBPVXvo6tYll14ttYbXKAMBmqRkYpV5LqF4Kg4TpGsnygj1l5PF51+3ecIjvj4Ba
         3Y1iPNos1ad3dvU01akqtHxinw8JOJUs/vU7GrT8Hnuw0JQyIK26sFQefQoP0OGboGwP
         zZm5phTOD7GX8+782xgpkTQRVlxuePQrvanlA9k1BhmxjI/qLsOMi6QL6xD/AdSXdyiO
         auaGRexl5brLmmU/WeEgjLlzWLlM3ECguVZ20YK3NKxkGmCY3ZmxsucqyKfOTvPzcIxp
         rcJw==
X-Gm-Message-State: AOAM532sxdjJssU6ko8z5ByyrSL2Nfk3W0Q9JDTrUJf5FR/Rif8/HrnG
        L6QiYmXW8VQpm2zfTKe1G3m9VS+2dpPNJTVod5OBoYcqPR3c/g8x+uWrtaZiEUMrGv/ad3dxYmP
        f9ThqYrCcejEjI9Rmt+QJofZsLhtHr/3jDqHFqS+2WCLamUyf
X-Received: by 2002:a05:600c:3d13:b0:37b:b8e5:ed80 with SMTP id bh19-20020a05600c3d1300b0037bb8e5ed80mr17813265wmb.183.1645371191712;
        Sun, 20 Feb 2022 07:33:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCtRKlz0JOjn2Q3UB31SmB1c1DuPa7CzF/yZujcaVE0jtuArXWTGSPrQnG/QGaa9mTDvdfNw==
X-Received: by 2002:a05:600c:3d13:b0:37b:b8e5:ed80 with SMTP id bh19-20020a05600c3d1300b0037bb8e5ed80mr17813249wmb.183.1645371191472;
        Sun, 20 Feb 2022 07:33:11 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c300700b0037bf8c6ee5bsm5748991wmh.45.2022.02.20.07.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 07:33:11 -0800 (PST)
Message-ID: <fc8f6c95-e37f-0dc8-c50d-48cadffcaa98@canonical.com>
Date:   Sun, 20 Feb 2022 16:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] clocksource/drivers/exynos_mct: bump up number of
 local timer
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, pankaj.dubey@samsung.com,
        m.szyprowski@samsung.com
References: <20220220133824.33837-1-alim.akhtar@samsung.com>
 <CGME20220220132643epcas5p39d48a27bb3fcde2ea3a01a260b46e1a0@epcas5p3.samsung.com>
 <20220220133824.33837-3-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220133824.33837-3-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/02/2022 14:38, Alim Akhtar wrote:
> As per the dt binding, maximum number of local timer can be
> up to 16. Increase the array size of the _name_ variable
> which holds the number of local timer name per CPU to
> reflect the binding. While at it, change the magic number to a
> meaningful macro.

This still does not make sense. Let's say you have 16 local timers, so
why the name of clock event device should be maximum 16? How are these
related?

> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 0c7931f7f99a..8d63a9376701 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -66,6 +66,8 @@
>  #define MCT_L0_IRQ	4
>  /* Max number of IRQ as per DT binding document */
>  #define MCT_NR_IRQS	20
> +/* Max number of local timers */
> +#define MCT_NR_LOCAL_TIMERS	16
>  
>  enum {
>  	MCT_INT_SPI,
> @@ -80,7 +82,7 @@ static int mct_irqs[MCT_NR_IRQS];
>  struct mct_clock_event_device {
>  	struct clock_event_device evt;
>  	unsigned long base;
> -	char name[10];
> +	char name[MCT_NR_LOCAL_TIMERS];
>  };
>  
>  static void exynos4_mct_write(unsigned int value, unsigned long offset)


Best regards,
Krzysztof
