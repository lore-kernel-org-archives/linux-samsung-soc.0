Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55717C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Sep 2021 10:40:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D5F061051
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Sep 2021 10:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbhIIKl3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Sep 2021 06:41:29 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33352
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234412AbhIIKl2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 06:41:28 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A039F3FE05
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Sep 2021 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631184016;
        bh=u9tf9lWYC4h6G9JS5FJzkFQD/K1+DZwunF+xwPVPhxE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=CkFry2yIrCBOsCMPlasc7sOYvqHYEkwVT1Z3MZAw07A6401b9Z3jI/Z+6vf95sj+y
         sAIjTrS3x1V8LGJMLpZ4IVs13o3GHtuD/QjBM7ayrT+k0bA6TlbUX4LqVOdlXPSzOM
         aJgtK0CxfoMCE6xes3mdyzKS3KdrcAzJAjOmWO4z/e2ydUfJzNvAsj7rYwEAFkUFm6
         jL66QIzJIPCNu3tlEEa0mOpQMyDgOanAsUqkRytiCwcx5lPnltDMhE24bfUHHNJKi4
         WP8B1s1BKGr8QsZOhkI/IwRnp98dVmebbqvJheYoTrxEhdvK1P6OjWbhIB6WUwKCJ+
         5WF4Wp89DVtrQ==
Received: by mail-wm1-f72.google.com with SMTP id r3-20020a05600c35c300b002fbb0888a42so582154wmq.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Sep 2021 03:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u9tf9lWYC4h6G9JS5FJzkFQD/K1+DZwunF+xwPVPhxE=;
        b=cdj90n96t/FeyHFajIbvle+HpOpi+8QqZtulO14mL1QFlYiyhByLjENfl1rxwQh2bm
         I/fpiGHUtrnhDyL2QOMZH5RYPtDSPuqMsDHoBDb6rBbQkqC3uPVB0/N6H0hmm3Xosith
         uURzrqb6hsDnhsqbQEK6Qrox4D8Q37ZdnGrgzkE46jki0ymeRJKHoFI1srUHovcsNVXz
         yPjN/pqIcbXDTvsaQn4nlQoEZooyL2ZJbE+tQk1gLfGOP/RwtBfWKhXdkGsm6vfOHyHX
         YmVpyXlbOhvpMEZ99xfG1mz3uRpV3iR9u1AyMb3MCUYKt4uHuSE6bcn3ATyCe1z8bh2D
         uG/g==
X-Gm-Message-State: AOAM531xGzyitk6h2Wnw4VmDyI6F2iSpkGtuscn6loL/mtN9gzvgSdk+
        a5YXjObu4rNnULZ1o3X1xwQmBIOis3eQqz/0fInscvvyqq7Elo1ej90j1MhGEYyYaQPR+N/+LBi
        Dp/802++v0gCupKC9jNWdtreZMIifvXSqufx53fOyJyaOp+Gq
X-Received: by 2002:a1c:7c12:: with SMTP id x18mr2274812wmc.114.1631184016302;
        Thu, 09 Sep 2021 03:40:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyboc9owUJBZr05lyAXwLSzcntMddCWmyAchxWKxFnje29uDHmXs0v8wcM46KReQqY9NhT9sA==
X-Received: by 2002:a1c:7c12:: with SMTP id x18mr2274782wmc.114.1631184016105;
        Thu, 09 Sep 2021 03:40:16 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.90])
        by smtp.gmail.com with ESMTPSA id a6sm1231247wmb.7.2021.09.09.03.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 03:40:15 -0700 (PDT)
Subject: Re: [PATCH v3] pwm: pwm-samsung: Trigger manual update when disabling
 PWM
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
        kernel@axis.com
References: <20210909101042.17431-1-marten.lindahl@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ded88ef3-d408-8bba-7c1d-bbd160c2de9a@canonical.com>
Date:   Thu, 9 Sep 2021 12:40:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909101042.17431-1-marten.lindahl@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/09/2021 12:10, Mårten Lindahl wrote:
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
> 
> v2:
>  - Move fix above setting of disabled_mask
> 
> v3:
>  - Move up definition of __pwm_samsung_manual_update to avoid
>    declaration of the same
> 
>  drivers/pwm/pwm-samsung.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
