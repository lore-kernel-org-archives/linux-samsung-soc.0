Return-Path: <SRS0=7hfY=2C=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E852DC43603
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Dec 2019 18:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFDEB206DA
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Dec 2019 18:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGZeFuek"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730177AbfLLSFq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Dec 2019 13:05:46 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34268 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730159AbfLLSFq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 13:05:46 -0500
Received: by mail-io1-f67.google.com with SMTP id z193so3788972iof.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2019 10:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1PVTShbmTWPWoLzVKljKHRYw3rcqIPLwvlis0wSDhc=;
        b=uGZeFuekrv7Zc4MOO091PIYsKXyeF/FwZfUf/VmtefCFnn3KJuevQ9b60DYdCvVANm
         YBcNPL8S18NsVx5OehjETWmnBCr9ClopD0+tYCggVhw8nb5V/aDb9hTxM2FGbaI/8EZa
         YVt1Lsdqbw8s8P8O9f+owG//TiP/QV8bqIl1MIu/BbdJi7vFA8tZCGDu1tZ26OZs5PQm
         ipJRSK7FQGpgqpAIpMdteIJFpm0yMC8nXzV4V8+JBoLubSmQvU74ibd69tlx2GsfMxxs
         rg2dremhaK3wWiRDM0WvEBj4Ew10byui7WDibVI5AF3QfeRZ6MD/RDo4J9kysPzbDFAn
         D/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1PVTShbmTWPWoLzVKljKHRYw3rcqIPLwvlis0wSDhc=;
        b=FDR3H54ExjWcD972NH7UAolY5E/WpW3n7EMUiZwAuDsK8PPMb50SaH8HHnaFmU5mPt
         8Zx4N+mGVZlBjKao34G/IXwPQE698zbwk1aH0xuyJqS3OgOCNT3/QohnPB/LIA2r2Lzq
         qtBc2UT18HBMAaV3k6NXqLczG4enhElWhl0NhWA4aQl2gUEKYlx4UItyIxlMTfF++Yri
         Ynv1L9cPk+Axt3qIDcUIOoVUjOdf/csv+5avPDcacOrbP2UpXLCX5HKpM1jv4NmJnOEB
         icaLgGJj0Xp/hHL1YhFTtwoi15LN7odJf0ZhwUEu+nvrdFEaK/rPKRh4gg+e6pmlpsbi
         Ar0Q==
X-Gm-Message-State: APjAAAWxVzGDjKlVnz3bZLe83HpqxAstupRidreKlVtxasviw6pnwlA9
        hfD8n+9zxlf5GVzx8LbCYr6o+pkQX6lmbmlAxO2yrQ==
X-Google-Smtp-Source: APXvYqwk0AUqlLisz5L1ubxtjt4aBWDgQPfRFolNYD7szCHBfjyDpPgFqHnAhng0q0VqeOrf2zrZi/b9oaSoCMmcH0M=
X-Received: by 2002:a5d:9953:: with SMTP id v19mr4153981ios.118.1576173945200;
 Thu, 12 Dec 2019 10:05:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com> <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
In-Reply-To: <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 13 Dec 2019 02:05:32 +0800
Message-ID: <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Mark Brown <broonie@kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Dec 12, 2019 at 10:09 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> -> #1 (&card->controls_rwsem){++++}:
>         snd_ctl_add_replace+0x3c/0x84
>         dapm_create_or_share_kcontrol+0x24c/0x2e0
>         snd_soc_dapm_new_widgets+0x308/0x594
>         snd_soc_bind_card+0x80c/0xac8
>         devm_snd_soc_register_card+0x34/0x6c
>         asoc_simple_probe+0x244/0x4a0
>         platform_drv_probe+0x6c/0xa4
>         really_probe+0x200/0x490
>         driver_probe_device+0x78/0x1f8
>         bus_for_each_drv+0x74/0xb8
>         __device_attach+0xd4/0x16c
>         bus_probe_device+0x88/0x90
>         deferred_probe_work_func+0x3c/0xd0
>         process_one_work+0x22c/0x7c4
>         worker_thread+0x44/0x524
>         kthread+0x130/0x164
>         ret_from_fork+0x14/0x20
>         0x0
A key observation here is: the card registration got deferred.

>
> -> #0 (&card->dapm_mutex){+.+.}:
>         lock_acquire+0xe8/0x270
>         __mutex_lock+0x9c/0xb18
>         mutex_lock_nested+0x1c/0x24
>         max98090_shdn_save+0x1c/0x28
>         max98090_put_enum_double+0x20/0x40
>         snd_ctl_ioctl+0x190/0xbb8
>         do_vfs_ioctl+0xb0/0xab0
>         ksys_ioctl+0x34/0x5c
>         ret_fast_syscall+0x0/0x28
>         0xbe9094dc
And this is an ioctl( ) on a control (e.g. controlC0).

I have no enough resources to test and trace the code temporarily.
But is it possible:
- snd_card_new( ) succeed in snd_soc_bind_card( ), so that userspace
can see the control
- code in later snd_soc_bind_card( ) decided to defer the probe
- soc_cleanup_card_resources( ) may forget to clean the control?  (not
sure about this)
Then, when the card is instantiating next time, some userspace program
tries to ioctl( ) to get the deadlock possibility and the NULL
dereference.
