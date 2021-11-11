Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2B3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 16:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2941661354
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 16:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbhKKQcB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Nov 2021 11:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbhKKQcB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 11:32:01 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01565C061766;
        Thu, 11 Nov 2021 08:29:12 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id c3so7643004iob.6;
        Thu, 11 Nov 2021 08:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5HYQhTv2wk1Y66cZkSyaFhq3xaOKBxKhZAD9nmuCZN0=;
        b=lLc5LHqijYLKo9pe1ppX2OGkA97sDfqHe5SzPaj+l/vu2BYM2FI4mF7Jaz/MObxg85
         LC05h7vmTH4/dnSztSMehUql/bMAALLU0dVCTfe7jILhW+P8VNhw+aWMg599E2NaLKsA
         kb6rAfZCPkVreLLiLlIiFkEHl/rrrNSMTwx5QFwzwdv090Ijds93ZGBlTBtksVRGjE5c
         ga9oxw901FELoibQM5zDKV4AzYqoB5/02D0ntAiK/3Dp+HVosdW0Wbcr+WSC4J6yZJ5k
         AfG8Idl79gCfAUrbTLjc765kgl0I2ksJyqcUb4vEYFKjpVCEvP4qvFVzhFIfKahXopGo
         rFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5HYQhTv2wk1Y66cZkSyaFhq3xaOKBxKhZAD9nmuCZN0=;
        b=0zlvc3OWt5Amob9wns2IZHIU9Fc5IT2PmH8P1NXBO4DEzAcaTyaIfcT3V/uv+kjcB7
         W0vx/IZ1iO2mh3iWcBVdQ0kcB9EojzCMiz6o+GMKHRE7FXIdLrCnHUfXP/t0RQKoogYG
         OujibB2BNeaMW+YS2i9Mf/ZdfIKzLHzvGhQr/fri88CiPUBQ7MMHy1gmvnlWGXeBcBEL
         BhJCiyrkA7Mec+1qSfkT0INwb9wGXR/UcuaQFdhYrWGpMeA8zzXVLFM5+5Mj3fwGHe70
         m0Tz6UwMka4X7Eln8u1eonsCLZnLxgiXgmtVvKDVA8wpKYa93EGz6o+SC+jY8C5u4S6+
         bMIw==
X-Gm-Message-State: AOAM5321vN4t7aqXl8QV0zZ+hTaVI2h7DR4TzQKSunTOV8u4GvUtcIf4
        CFpFFIynuqS0E6s7r7SUeD6Trckwc6wRpBNbrHI=
X-Google-Smtp-Source: ABdhPJy7Rb8khGU+5gBhv/sj76de0QiEUZvtpCVtXqGFAUpCH6X6GbpTIiQbVL/ObBoN2NXWooZtNeK/0N5rCeIUAu0=
X-Received: by 2002:a6b:b4cc:: with SMTP id d195mr5655174iof.0.1636648151279;
 Thu, 11 Nov 2021 08:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
From:   Alim Akhtar <alim.akhtar@gmail.com>
Date:   Thu, 11 Nov 2021 21:58:35 +0530
Message-ID: <CAGOxZ50Fs1YZcCY+Go-4KqeeqdLRcwJwEHuXdDX8tTL7nWsttA@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: include header for prototype of s3c2410_modify_misccr
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Thu, Nov 11, 2021 at 2:42 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Include the header with prototype of s3c2410_modify_misccr to fix W=3D1
> warning:
>
>   arch/arm/mach-s3c/gpio-samsung.c:1309:14: warning:
>     no previous prototype for =E2=80=98s3c2410_modify_misccr=E2=80=99 [-W=
missing-prototypes]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm/mach-s3c/gpio-samsung.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-sa=
msung.c
> index 76ef415789f2..fda2c01f5a08 100644
> --- a/arch/arm/mach-s3c/gpio-samsung.c
> +++ b/arch/arm/mach-s3c/gpio-samsung.c
> @@ -35,6 +35,7 @@
>  #include "gpio-core.h"
>  #include "gpio-cfg.h"
>  #include "gpio-cfg-helpers.h"
> +#include "hardware-s3c24xx.h"
>  #include "pm.h"
>
>  int samsung_gpio_setpull_updown(struct samsung_gpio_chip *chip,
> --
> 2.32.0
>


--=20
Regards,
Alim
