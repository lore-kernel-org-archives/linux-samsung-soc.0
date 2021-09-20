Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA5AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 01:59:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6579561177
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 01:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbhIUCAt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Sep 2021 22:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbhIUBlc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 21:41:32 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F40C04CD1C
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 13:58:13 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id v5so65085390edc.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PC43tSgvhG7E0sEr+EdWjU4dUcDPCSX0FiAfZowtiZg=;
        b=nIMzEFRDbWw1z1g6+GhQbUl4DUvtylQpDP+jTHJoTenS8HI5r6M2ar3tFGhFvpuB9F
         QKXYIBNORPCzuiHLY0Ld/nyW4dWGSehFCuhVm4/g8RmFM5FHXd2YbKZ0ZWsZ6cjTQAAd
         rAeadVgIdfLtKpLv6nlbwU3BXfVWapw1JmfSgEVRKGbtNH3n+9mOlsTSffV7gW6rR8vl
         xqgtFQ70JnuH6tJCFZeN5B4s4aEyaXppka2q2ezEQUu6yee/X+ppufw0EYuEuEeXLtql
         9Fu+/Ttw3V4LZ+4ainPQa1WcvPUqJwVQdxIVp8zEDKfgATa9jJTmhHMY7ds0Fs4pA4f5
         h7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PC43tSgvhG7E0sEr+EdWjU4dUcDPCSX0FiAfZowtiZg=;
        b=JPgO6RB8Ao6KlBZRpkbFlDJ58ZUEZUWbl//YqD2f+TU4s/WSyfoVvQE3lvBkor58HQ
         08PmrVXcswUlpFBtDqFEB5GThpQ+kwRU5wsVHEXMmQXgnMEb3i2Ume85H6WVQsvafnQT
         6weeltZ2Fy8lRE2cQmO9NfLFo3xYdGIfkC+a6V53KKVLFX8DUW0a46NJnw3zzFxsCIUD
         AOp0IblcrrZCs0gZA75AO5eRB9xTu6du15I8mJplOIHDzoIB8y3+ZDAYcv4ZqGoUehEj
         BE5AeKk2JvssRlS+ntZgcKNmcI9pwQdxgUlCb8PZwR+pJ/q2Pd97pZNrtZexWoj+zXpE
         +RnA==
X-Gm-Message-State: AOAM531KVeA7Jf93qm2C4QGqYCS4e8MGP8md6jR9NculbqLEEAyuJ3lj
        98aXYQV7bk+J5vlzU47rs2yJh+b8C260WHptR937aw==
X-Google-Smtp-Source: ABdhPJx5e1g4BROAxqXoTN8Q7cw00CNUSRPKmEtwEG/MNdxn3PAjt/9c1I+re1VC08Eb6LibgwFMTXauNkekkW2yQRk=
X-Received: by 2002:a17:906:3a58:: with SMTP id a24mr17992046ejf.67.1632171491324;
 Mon, 20 Sep 2021 13:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com> <20210920190350.3860821-3-willmcvicker@google.com>
In-Reply-To: <20210920190350.3860821-3-willmcvicker@google.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Mon, 20 Sep 2021 13:57:55 -0700
Message-ID: <CABYd82YhCzLL8Bs0bMtC9cTFETtbKn8S1NXnP_254vHwzi4E3g@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] soc: samsung: change SOC_SAMSUNG default config logic
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Sep 20, 2021 at 12:04 PM Will McVicker <willmcvicker@google.com> wrote:
>
> Switch the default logic to enable SOC_SAMSUNG and it's sub-configs to
> be enabled by default via "default y if ARCH_EXYNOS" versus being
> selected by the ARCH_EXYNOS config directly. This allows vendors to
> disable these configs if they wish and provides additional flexibility
> to modularize them in the presence of a generic kernel.
>
> There are no .config differences with this change. The configs
> SOC_SAMSUNG, EXYNOS_CHIPID, EXYNOS_PM_DOMAINS, and EXYNOS_PMU still
> remain enabled by default.
>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/Kconfig.platforms | 4 ----
>  drivers/soc/samsung/Kconfig  | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 3a66ed43088d..6a006490c9b9 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -91,14 +91,10 @@ config ARCH_BRCMSTB
>
>  config ARCH_EXYNOS
>         bool "ARMv8 based Samsung Exynos SoC family"
> -       select EXYNOS_CHIPID
> -       select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
> -       select EXYNOS_PMU
>         select HAVE_S3C_RTC if RTC_CLASS
>         select PINCTRL
>         select PINCTRL_EXYNOS
>         select PM_GENERIC_DOMAINS if PM
> -       select SOC_SAMSUNG
>         help
>           This enables support for ARMv8 based Samsung Exynos SoC family.
>
> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> index 5745d7e5908e..9402c02bc9de 100644
> --- a/drivers/soc/samsung/Kconfig
> +++ b/drivers/soc/samsung/Kconfig
> @@ -4,6 +4,7 @@
>  #
>  menuconfig SOC_SAMSUNG
>         bool "Samsung SoC driver support" if COMPILE_TEST
> +       default y if ARCH_EXYNOS
>
>  if SOC_SAMSUNG
>
> @@ -15,6 +16,7 @@ config EXYNOS_ASV_ARM
>  config EXYNOS_CHIPID
>         bool "Exynos ChipID controller and ASV driver" if COMPILE_TEST
>         depends on ARCH_EXYNOS || COMPILE_TEST
> +       default y if ARCH_EXYNOS
>         select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
>         select MFD_SYSCON
>         select SOC_BUS
> @@ -24,6 +26,7 @@ config EXYNOS_CHIPID
>  config EXYNOS_PMU
>         bool "Exynos PMU controller driver" if COMPILE_TEST
>         depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
> +       default y if ARCH_EXYNOS
>         select EXYNOS_PMU_ARM_DRIVERS if ARM && ARCH_EXYNOS
>
>  # There is no need to enable these drivers for ARMv8
> @@ -34,6 +37,7 @@ config EXYNOS_PMU_ARM_DRIVERS
>  config EXYNOS_PM_DOMAINS
>         bool "Exynos PM domains" if COMPILE_TEST
>         depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
> +       default y if (ARCH_EXYNOS && PM_GENERIC_DOMAINS)
>
>  config SAMSUNG_PM_DEBUG
>         bool "Samsung PM Suspend debug"
> --
> 2.33.0.464.g1972c5931b-goog
>

Sorry I didn't see this patch sent yesterday:
https://lore.kernel.org/lkml/CAGOxZ50i6URzUQ7o7V4m7MR=2TqSeD6qx5fQaQDs+5nEq4fa2A@mail.gmail.com/

Looks like Krzysztof's patch covers my portion of the patch related to
EXYNOS_CHIPID. I'll keep an eye on his patch as it goes through and
will modify mine as needed since it's likely to come in after.

Thanks,
Will
