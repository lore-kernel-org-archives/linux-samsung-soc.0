Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B639C76196
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Apr 2023 17:52:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjDJRwr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Apr 2023 13:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjDJRwq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 13:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AC01722
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Apr 2023 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681149119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NsEZPRD1SyjWNRhaxq9j9ZvGo8ldXQeNCZy0vKLfK20=;
        b=Le8djm22zwdblMH98i4QQgaRRZ6O7F90vmArZBXp3in5DJrW+QXGGQVPSSCzLmrYbGnp6C
        +euWvIR6QJG78If0Yoyd3rZL9MAQCSUsWh8nqFDxyR353kxtdLBME5uCsIx6DW6oYNo6zX
        s87e8S3CnEf8mnyMOFshPMjXqmgt2K0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-3tO2MOz7Nma-GjbXr7lSFA-1; Mon, 10 Apr 2023 13:51:58 -0400
X-MC-Unique: 3tO2MOz7Nma-GjbXr7lSFA-1
Received: by mail-wm1-f72.google.com with SMTP id g6-20020a05600c310600b003ee69edec16so4229831wmo.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Apr 2023 10:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681149117;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsEZPRD1SyjWNRhaxq9j9ZvGo8ldXQeNCZy0vKLfK20=;
        b=aJuPt2Ty7K14yQkhhiCoeoBXDhYZkQ6g1kU0f0HamdC3awi3s0EANmFem6s/UK5P3t
         FGhf92snkuSvX9F5WqU9L/xUZ0/8Ff86O9d4kQ5wwliBrcyLjTEOHUarxoaGP1/ZGD03
         +vGatF/thy7t37jX+3Qp5/HYIt0Z6PEnUYJL1GkgzZFWrJAQuW5qNFyagYuc8UG727cI
         Ya+jGVnqeybLMFqj8RXf0l1vLc0BnahNHRbklv/9HHv/5UXfZerU4J7ZaitTdkre6wqt
         UOFZ8ZI+z8qjE3pJjH4ELN50TeKHV+pC/WjjoYOIT0+yeRsejMxXO6WpjIEg7+ThGqjr
         S2tg==
X-Gm-Message-State: AAQBX9dbvloD6h8h7M2sIxkWTFG5Kkce9NrkGRh1tC8dAAlynOVtujCF
        GQSTp/pROXTXbAT9ctmhzR0W/Eceydr8MGkrdZKV6IaZOwqbtq3B1qdlfJ83Y1+1dBNdSrH0YMm
        W3ZSXNDFOaw3wAfjvD4nnM2+8cAneT20=
X-Received: by 2002:a05:600c:21c4:b0:3f0:4428:9444 with SMTP id x4-20020a05600c21c400b003f044289444mr7589303wmj.10.1681149117250;
        Mon, 10 Apr 2023 10:51:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350YkVl61QDf4F33omnQMkXe1J97GDyi79Tyfj2/VYdv4fEgJtXt+QN1ytsfqGu7fKw8/+soYtA==
X-Received: by 2002:a05:600c:21c4:b0:3f0:4428:9444 with SMTP id x4-20020a05600c21c400b003f044289444mr7589291wmj.10.1681149116982;
        Mon, 10 Apr 2023 10:51:56 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h18-20020a05600c315200b003ef6708bc1esm18619115wmo.43.2023.04.10.10.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 10:51:56 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Robert Elliott <elliott@hpe.com>,
        Russell King <linux@armlinux.org.uk>,
        Stefan Hansson <newbie13xd@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable zram as loadable modules
In-Reply-To: <fe1e74a2-e933-7cd9-f740-86d871076191@linaro.org>
References: <20230410124907.3293869-1-javierm@redhat.com>
 <fe1e74a2-e933-7cd9-f740-86d871076191@linaro.org>
Date:   Mon, 10 Apr 2023 19:51:55 +0200
Message-ID: <87sfd7sk04.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 10/04/2023 14:49, Javier Martinez Canillas wrote:
>> Enable zram and dependencies as loadable modules. This allows to use the
>> /dev/zramX virtual block devices as swap stored in system memory.
>> 
>> Options were taken from commit 5c824e8be64d ("ARM: omap2plus_defconfig:
>> Enable zram as loadable modules") that does the same for OMAP2+ platforms.
>
> Neither this commit msg nor above omap commit explain why do we want it.
> I know what zram is, I know its purpose, but the commit should answer
> why we want it in defconfig.
>
> To me it is not a matching defconfig at all:
> 1. Not a feature related to Exynos hardware,
> 2. Not needed for basic boot (systemd) or debug.
>

It's needed for basic boot on distros that use swap on zram (i.e: Fedora).

I just had this as a local change to boot an ODROID XU4. But have a custom
defconfig for other boards anyways, so I'll just do the same for this one.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

