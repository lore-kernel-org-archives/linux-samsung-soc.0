Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6101C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 09:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjGEJyK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 05:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbjGEJyJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 05:54:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCD91719
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688550802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DRNRYYR3em1ug3SJuQFxKqDHhttEDU94J84H5e4z6eY=;
        b=DbCMNgBqUuPGYVWaNkP6yTrkxq4OBOT135lr3urH0bzLn6dip8ttFY+dt0pdnVVffH+DYI
        rRzFQfxhythU+d0vIrRKGnuRpyyXSXPJJFJsAAg0SOCfZgc6aG42liaq27/2xl83E+f510
        ViU7HFeS5SaDvUkhD03m6THTG4L4Dd8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-nYKe40VwNoqeWFiApZxcxQ-1; Wed, 05 Jul 2023 05:53:19 -0400
X-MC-Unique: nYKe40VwNoqeWFiApZxcxQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4fb9c4b7020so5547325e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 02:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550798; x=1691142798;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRNRYYR3em1ug3SJuQFxKqDHhttEDU94J84H5e4z6eY=;
        b=RaZqnnvNkU6zcGYHjvn0f7iyo6f94P6vvK5eS1/RGgND9kGz/XvTMXxh2bPzdEy/4H
         DcKK2IyX/DTtv1td/bzPLvlsP55gVnwUHLK7YJ1rBwwm6OcNiifh6bviP0d62FLyR4Q7
         ZltvLRWui25LMzvhuo9abYQZSY1jbWuzqEtwZVzkmr4Bpbk+XS4Jt+IOg4SJnbjEyp57
         MiolfunC+W/8ZZn8vZ5FyOjSrJYhtO/O6oDBYqd87Ua0z7/0R77oIkvBB8vaW+hecTBF
         HZAG0S6dFLXuoIgFqjj9lYJJBS1aat4ukq3rUHslAQctfY6W80V7y0wUuMoHLqUEaDoK
         xciQ==
X-Gm-Message-State: ABy/qLZR0Jz2k+IaPdgsl4GbFuzGcx7z6zNvMiCwkco2tSDKO5BxfY9i
        cN+kL2l8tfJ3UPQnMxSNc/CfU1gFnAfH78VmbUbnCxw3tDtgxQPwDKi5JuG8W7wH3C6urYuJgAG
        YBA0SC2GyBJVjz1O16Y3n+8btN3GeIpI=
X-Received: by 2002:a05:6512:68c:b0:4fb:897e:21cc with SMTP id t12-20020a056512068c00b004fb897e21ccmr16115763lfe.67.1688550798482;
        Wed, 05 Jul 2023 02:53:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfRPzFk83Dq4TRvBUdnBTYWW72Dkqa6fZSxS4fGVLTYvFLeND2XwmxN1ZysjO2uVZDU0mefw==
X-Received: by 2002:a05:6512:68c:b0:4fb:897e:21cc with SMTP id t12-20020a056512068c00b004fb897e21ccmr16115751lfe.67.1688550798187;
        Wed, 05 Jul 2023 02:53:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c220900b003fbdf8292a7sm1606487wml.46.2023.07.05.02.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:53:17 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 06/10] drm/exynos: Set fbdev flags
In-Reply-To: <a69f00d6-d6f9-377a-a4a6-fc6cc4bd6b7f@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-7-tzimmermann@suse.de>
 <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>
 <a69f00d6-d6f9-377a-a4a6-fc6cc4bd6b7f@suse.de>
Date:   Wed, 05 Jul 2023 11:53:17 +0200
Message-ID: <877crer8fm.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 05.07.23 um 10:49 schrieb Javier Martinez Canillas:

[...]

>> 
>> The #define FBINFO_FLAG_DEFAULT	FBINFO_DEFAULT seems to be there since the
>> original v2.6.12-rc2 git import in commit 1da177e4c3f4, so is hard to know
>> why was introduced. FBINFO_DEFAULT is more used, I will just stick to that:
>
> Thanks for commenting on this issue. I didn't notice that.
>
> I think I'll just remove these _DEFAULT assignments from the patchset.
>
> And I think we should nuke them entirely everywhere. The _DEFAULT values 
> are just 0 after commit 376b3ff54c9a1. So there's no value in assigning 
> them at all.
>

Agreed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

