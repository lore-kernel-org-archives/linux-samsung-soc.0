Return-Path: <SRS0=HOL2=7H=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B75CC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 25 May 2020 12:28:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2689B20812
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 25 May 2020 12:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hnhOWAjq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390598AbgEYM2w (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 25 May 2020 08:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390500AbgEYM2w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 May 2020 08:28:52 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FBDC08C5C0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 May 2020 05:28:51 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id x1so20287327ejd.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 May 2020 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4brhUMvajhqCMbsLZet6vC1Qy3ztqFVBNLV1y3fJ0Ok=;
        b=hnhOWAjqAv1GZGWkwmr90o7yeD20DdB7e42yX7ajg/ZCxiJyFkeAtysH96F8mWj0a5
         qEFDLtEu+h64FvqQnCfWlsaHd7VhN7vI5fg/UDW8ngyxV4/2boMBDLWOkkSzWgBV1vEH
         zAGhmm2uShjKSYCQN2/RgtBN47hewG1wCB47Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4brhUMvajhqCMbsLZet6vC1Qy3ztqFVBNLV1y3fJ0Ok=;
        b=DYpgDo+WN03pPn8PDwWr8l+LYF2+ormtrgfQkIF60VlU7It4ePOM6uENHhiC9SJbJC
         sLQXHPHQvEK1pkjnD9AscSBHcCpzKotFdY28XN2Af/ZIYwjBew5KyuwZFZ/81cF6Vfyg
         wMDJlWptg88qGsq0hSN4fjzXBcYSlb2hOlDAdbNoanBP1v4X55zojuUJteTIdaues7B7
         7vEOqbbLohmuBOEPxsyiEBX/JElRp3aR7s61QIjmidF3ageUlLab61YTtkqTiTCruQJ+
         HWxUOwIR0nlHz9VEdQO6SCB9/+SzBSu4q7mbo36xDhz/3BaB/zrEgmJXft0PfFZwgiwn
         NywA==
X-Gm-Message-State: AOAM533GGen2A81oVf0exXGDp8xHgjpWEtO3Jes09UwbgoKP2YZM2mE4
        YB4foY4cqCTVd0PLllx0sfTuUovOROcjCw==
X-Google-Smtp-Source: ABdhPJzv25uTd98L5nXxiUahduo01wsXrUAokI1Y32NymMoYZeHPqJeBm6rrYCrZ4U7Asz9K7Kf/tw==
X-Received: by 2002:a17:906:d043:: with SMTP id bo3mr17699409ejb.409.1590409730122;
        Mon, 25 May 2020 05:28:50 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id u10sm15763999edb.65.2020.05.25.05.28.49
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 05:28:49 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id c3so12663337wru.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 May 2020 05:28:49 -0700 (PDT)
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr14649696wrw.17.1590409728561;
 Mon, 25 May 2020 05:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7@eucas1p1.samsung.com>
 <20200522101327.13456-1-m.szyprowski@samsung.com> <34736047-3fc8-385b-cdea-79b061deb7b4@samsung.com>
In-Reply-To: <34736047-3fc8-385b-cdea-79b061deb7b4@samsung.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 14:28:36 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DdiKDGsodJF_KW8H6YYwAkeaJLE7CoJ=cEX5KeTzO5mw@mail.gmail.com>
Message-ID: <CAAFQd5DdiKDGsodJF_KW8H6YYwAkeaJLE7CoJ=cEX5KeTzO5mw@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: fix NULL pointer dereference in suspend/resume callbacks
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Fri, May 22, 2020 at 1:15 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi All,
>
> On 22.05.2020 12:13, Marek Szyprowski wrote:
> > Commit 6fe12cdbcfe3 ("i2c: core: support bus regulator controlling in
> > adapter") added generic suspend and resume functions for i2c devices.
> > Those functions unconditionally access an i2c_client structure assigned
> > to the given i2c device. However, there exist i2c devices in the system
> > without a valid i2c_client. Add the needed check before accessing the
> > i2c_client.
>
> Just one more comment. The devices without i2c_client structure are the
> i2c 'devices' associated with the respective i2c bus. They are visible
> in /sys:
>
> ls -l /sys/bus/i2c/devices/i2c-*
>
> I wonder if this patch has been ever tested with system suspend/resume,
> as those devices are always available in the system...

Sorry for the trouble and thanks a lot for the fix. We'll make sure to
do more thorough testing, including suspend/resume before relanding
this change.

Since the patch was reverted, can we squash your fix with the next
revision together with your Co-developed-by and Signed-off-by tags?

Best regards,
Tomasz
