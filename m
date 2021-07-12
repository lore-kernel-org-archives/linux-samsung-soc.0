Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65E5C07E9B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Jul 2021 09:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93A3E610CA
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Jul 2021 09:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbhGLJum (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Jul 2021 05:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54914 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348899AbhGLJuK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 05:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626083242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OsAxr7I5wY3GHXnm0dzu227J/w3T3hi+AUx2iyLrph4=;
        b=BKiR0KwAVB60uBT+Nvxff+VpBN1jQvvQ0//ri02GVUt1+WsvpP+5QqwwWrRBHp/JnXBmJe
        z8qIJDSw+zUrvGtJEue/ZEA6YOeHCmtWoZWYrmVpZ0Ur2tgUCnNbNIiwvoeSlHDRkNfu4a
        yriHFrk9ZKc2oFYrveV8p4TpUWenA5g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-DLYKiNVcOTq-5QRqw2ukBQ-1; Mon, 12 Jul 2021 05:47:20 -0400
X-MC-Unique: DLYKiNVcOTq-5QRqw2ukBQ-1
Received: by mail-wr1-f72.google.com with SMTP id u13-20020a5d6dad0000b029012e76845945so6895937wrs.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jul 2021 02:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OsAxr7I5wY3GHXnm0dzu227J/w3T3hi+AUx2iyLrph4=;
        b=fQHDBJLGvaYsgLuLiBzkjO8mA2qXb/FMczQ4u2iNSdrvOik6DxWhHRDYqbxsMdsxzN
         XMA1sCUNEcGX6NuXrBtoQ4kvAb5qYnjqEM52aIpP3i8FyEyz7hcA5wOzL8ikxkAxiUer
         wfX/fqqkuEJc3NA3ujp2KUen5DDmA4cxDw0HmQaWq7TP8EiWOcUsYdRMCPypZ24a1Ef+
         JW7iz600WaxlY/RkbzTpjpmeYhV/Tkphxfs7vgxczSyOSwMsiMkyY66jzh4+5fcs65sW
         LGuyqQ1vyU6UTAoimArLZzvH8QTOdSGwNNttxSDKRPSJ89PujvieWKartfwiNgLqWkp/
         h70g==
X-Gm-Message-State: AOAM533m8NlKvjfWrU5hPRa+VD6ZHo4dJBmeLjpBOdefAjKO7dhUIR2I
        /riejuW/AS6NcY4tNQXBWFOkFSKSojfas4dJmfEer7k6d+t1EzRKaWi+F4xw6z5nECZkDmJbsmF
        yVMr+RLt9XmVyW+i+ipXHHU2jRhMOaR7rpCd6C7A3r54rIs0=
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr23662123wrn.113.1626083239347;
        Mon, 12 Jul 2021 02:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3sW8UYSOM/Q6qgJACh2S4VICMKyF4ZwsV6v+fR4fftaOEQT2tUBbmhmNCwT2qSaSR3qFgvPBKqWkCA/b7Jp8=
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr23662105wrn.113.1626083239204;
 Mon, 12 Jul 2021 02:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210703072502.646239-1-gushengxian507419@gmail.com> <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
In-Reply-To: <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Mon, 12 Jul 2021 11:47:08 +0200
Message-ID: <CACO55tvmvcrAHjFjJ9fMgcFspyfMLE2gR7f3Fxe0_cxxrfwaUg@mail.gmail.com>
Subject: Re: [PATCH] include/uapi/drm: fix spelling mistakes in header files
To:     Simon Ser <contact@emersion.fr>
Cc:     gushengxian <gushengxian507419@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-samsung-soc@vger.kernel.org, tzimmermann@suse.de,
        lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        nouveau <nouveau@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, Qiang Yu <yuq825@gmail.com>,
        gushengxian <gushengxian@yulong.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Jul 3, 2021 at 11:00 AM Simon Ser <contact@emersion.fr> wrote:
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>
> But this this touches a lot of different drivers, not sure we can just
> merge this via drm-misc-next?
>
> In any case, please ping me again in a week if this hasn't been merged
> by then.
>

As long as it doesn't touch code I don't see why not. Just in case:
Reviewed-by: Karol Herbst <kherbst@redhat.com>

