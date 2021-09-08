Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBCCC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Sep 2021 14:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A8E660724
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Sep 2021 14:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349326AbhIHOzX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Sep 2021 10:55:23 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56790
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348854AbhIHOzX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Sep 2021 10:55:23 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CF3383F334
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Sep 2021 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631112847;
        bh=PPEH7eqQppzchji3H/CDxGtbZIPHBFWweQotyEYpChs=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Ds9Ue7ZYKz8CGM0PC1IL0GdVCDbxw9qOBa1P+/XvOL5FaqejDp3sUtaPFtOTcT/7q
         RI4Ej+Txq1bPq7XNboJvJW6wg4CwCO373jaPHLbLrBdo89anZE4j/xlJD4oJWzfflc
         38ZZc5UJfa/O1rZuzNnZmyDvTSfLeLPHtqLCka5Vg2jDZuwahYFRIJJ1gohiHROwvA
         rYSK17TttupEsvN7DQPmNyD1e0x/I+XOczDDYD/tqY4Lw0hiGmf5Rcf7ZC0V9+eHrC
         nxjKpGXV1kMnJf2LIDTKgzCy3g/6AhaZoREf2LXGXh72S0juMCQ1fIeHGa6veqT+u2
         A1c95rOVRiHtQ==
Received: by mail-wr1-f70.google.com with SMTP id v6-20020adfe4c6000000b001574f9d8336so576988wrm.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Sep 2021 07:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PPEH7eqQppzchji3H/CDxGtbZIPHBFWweQotyEYpChs=;
        b=2XALxPuX1mvK54Xnc7ErrgR9dtUv3E6XgsSLHNhlY9mS89QIEjy36f8EUcEKfxrB2P
         LnbHqZts5lebg3eggrAVRzhaxP3y472vzEiB6lzhpFCDKtVdagNS/zjmtklEIkalneV0
         n8CY8zIbwHoEbeXfVIEI2IF18hinf2Me4vH1mHTySPoQORx1TgYIF1p2wZWs4whO8Puq
         ixjKLgrC9fQN2CvWDICvoSaX5LtHokjq5AdQkCDbg/S0VtNMRUVe1sqHLOmC9PgDJN4W
         6LB7S5QbmQMhPwG0yrNgfv/eADY/vFM/J8QDuiP6yPBJyhe+nlY96WA3Z3BqSFNumQih
         EI7w==
X-Gm-Message-State: AOAM5314cdLwRnzPOmQBCh4Do3j+niYrtUmGjStvzNQoC53g0aaE28yS
        pdi445SEpN+O4j0nCFWdNQibgIrkhiKRI+jwfG83fASfipSIlm2S5s3igsSvduihLLx35Sfok4H
        k1ckNNB1lPIOaVUxkQJVAbhcgg5yIPLLOm0umbxd6BJXbWOkU
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr4053983wmc.195.1631112846837;
        Wed, 08 Sep 2021 07:54:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8uHAI2kpSEQ7KV+8Ioobvjgq3WtjS4Yt3m49QKkDkaLq1kN95/M3vwIzAoxOGdwafenUd0A==
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr4053960wmc.195.1631112846647;
        Wed, 08 Sep 2021 07:54:06 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.74])
        by smtp.gmail.com with ESMTPSA id d7sm2413103wrs.39.2021.09.08.07.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 07:54:06 -0700 (PDT)
Subject: Re: [PATCH] pwm: pwm-samsung: Trigger manual update when disabling
 PWM
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
        kernel@axis.com
References: <20210908142708.14145-1-marten.lindahl@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fc40e31d-16a2-33f3-1eb0-4af81fc27065@canonical.com>
Date:   Wed, 8 Sep 2021 16:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908142708.14145-1-marten.lindahl@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/09/2021 16:27, Mårten Lindahl wrote:
> When duty-cycle is at full level (100%), the TCNTn and TCMPn registers
> needs to be flushed in order to disable the signal. The PWM manual does
> not say anything about this, but states that only clearing the TCON
> auto-reload bit should be needed, and this seems to be true when the PWM
> duty-cycle is not at full level. This can be observed on an Axis
> ARTPEC-8, by running:
> 
>   echo <period> > pwm/period
>   echo <period> > pwm/duty_cycle
>   echo 1 > pwm/enable
>   echo 0 > pwm/enable
> 
> Since the TCNTn and TCMPn registers are activated when enabling the PWM
> (setting TCON auto-reload bit), and are not touched when disabling the
> PWM, the double buffered auto-reload function seems to be still active.
> Lowering duty-cycle, and restoring it again in between the enabling and
> disabling, makes the disable work since it triggers a reload of the
> TCNTn and TCMPn registers.
> 
> Fix this by securing a reload of the TCNTn and TCMPn registers when
> disabling the PWM and having a full duty-cycle.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>  drivers/pwm/pwm-samsung.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
> index f6c528f02d43..7d90652402a0 100644
> --- a/drivers/pwm/pwm-samsung.c
> +++ b/drivers/pwm/pwm-samsung.c
> @@ -105,6 +105,9 @@ struct samsung_pwm_chip {
>  static DEFINE_SPINLOCK(samsung_pwm_lock);
>  #endif
>  
> +static void __pwm_samsung_manual_update(struct samsung_pwm_chip *chip,
> +				      struct pwm_device *pwm);
> +
>  static inline
>  struct samsung_pwm_chip *to_samsung_pwm_chip(struct pwm_chip *chip)
>  {
> @@ -278,17 +281,21 @@ static void pwm_samsung_disable(struct pwm_chip *chip, struct pwm_device *pwm)
>  
>  	our_chip->disabled_mask |= BIT(pwm->hwpwm);
>  
> +	/*
> +	 * In case the PWM is at 100% duty cycle, force a manual
> +	 * update to prevent the signal from staying high.
> +	 */
> +	if (readl(our_chip->base + REG_TCMPB(pwm->hwpwm)) == (u32)-1U)
> +		__pwm_samsung_manual_update(our_chip, pwm);

I did not test it but looks reasonable. Just please move it above
setting "our_chip->disabled_mask", so the code will be close to
pwm_samsung_enable.


Best regards,
Krzysztof
