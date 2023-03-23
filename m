Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9501C6FD1C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Mar 2023 18:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjCWSAu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Mar 2023 14:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjCWSAt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Mar 2023 14:00:49 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8389BE3B0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Mar 2023 11:00:48 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id l18so3179573oic.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Mar 2023 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679594446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCmJViR7AnJ87OgVngdPbSTlcpqdG4CS9e3iERkcMLs=;
        b=DIFW9o6IWATgiYe4QK7xhiWn3xuVkh+l1JTwF0NFaxhX/XYmaJlv3zC+f6dOa0cb9z
         uNl/FVxq/ZBBLcb/XnSzw3B6QEX3m2JgfA+hxaVZeHsZ1mRG3ouHCZvqcAQmCSS+M9/E
         oizrYYK5M3JK4EO91bmagPnpErOvGHlxICOhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679594446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCmJViR7AnJ87OgVngdPbSTlcpqdG4CS9e3iERkcMLs=;
        b=nealPbBqC3OFLMPa+5lUPfwkLRZxwTcz2PYIi8oY9uh/8XNred4x1jp+MPDdTiO/Cf
         WsiHd2Pa+m9qEo/u0ItKOHtgmMqkLLfNQMJ5BDx/b7I/AyP+Qg/JEU+ds3cN3Q3ZZWO+
         ahVDBS0ZBzBqFB2g1pmt9wGZyT7Y5jkK/A1oo5Y6CcH3P6cGt5ZhImnw69uMBLZAwBx2
         L73dkergEeVoBDktqievRAsHleJa6Mx3u10sUiOw8Bqw2MuwfQbw6yhP7PE17LAkEucD
         ImmPyUtoo7c/dvgZupnhnahhw1BjogXpu6zv8NUA3BF3NKPt1jUFgYPfESkrQ+5BfMN8
         6NEw==
X-Gm-Message-State: AO0yUKV/NDA0SwE2TpiN0uWQzn99wPGdc2Wf6wDGxyV08so9BoL24B8R
        rCKRL8A2Ue1c9UNqBUWAQFzRrCDPfQTPWy1taR4=
X-Google-Smtp-Source: AK7set+wHwm9YVP+Jxn+FCRK4Rxj9iqUqLUgCUqKkYq6+3gE1JehaVwnhWiw0WGx/zNL0g9jJfsr6w==
X-Received: by 2002:a05:6808:13c8:b0:386:ca25:9a9 with SMTP id d8-20020a05680813c800b00386ca2509a9mr4393686oiw.7.1679594446196;
        Thu, 23 Mar 2023 11:00:46 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id g2-20020a37b602000000b0071aacb2c76asm13324238qkf.132.2023.03.23.11.00.45
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 11:00:45 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id y5so25882563ybu.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Mar 2023 11:00:45 -0700 (PDT)
X-Received: by 2002:a05:6902:124a:b0:b69:fab9:de60 with SMTP id
 t10-20020a056902124a00b00b69fab9de60mr2829256ybu.0.1679594444864; Thu, 23 Mar
 2023 11:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230323083330eucas1p1f7e3f9beb5ba168c6b13374d74c158f0@eucas1p1.samsung.com>
 <20230323083312.199189-1-m.szyprowski@samsung.com> <20230323114035.GL68926@ediswmail.ad.cirrus.com>
 <CAD=FV=UYO1KaoAZ7o5cA83SC1VHRomvJfaXVWyYPKrEZHyNNjg@mail.gmail.com> <20230323174531.GM68926@ediswmail.ad.cirrus.com>
In-Reply-To: <20230323174531.GM68926@ediswmail.ad.cirrus.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 23 Mar 2023 11:00:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0SAEk_iUGQ=J-PWk_MzVc7ZikBM3N8rrnhGFzcdBNpw@mail.gmail.com>
Message-ID: <CAD=FV=X0SAEk_iUGQ=J-PWk_MzVc7ZikBM3N8rrnhGFzcdBNpw@mail.gmail.com>
Subject: Re: [PATCH] regulator: wm8994: Use PROBE_FORCE_SYNCHRONOUS
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Thu, Mar 23, 2023 at 10:45=E2=80=AFAM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> I think really the best place to look at this would be at the
> regulator level. It is fine if mfd_add_devices passes, the problem
> really is that the regulator core doesn't realise the regulator is
> going to be arriving, and thus returns a dummy regulator, rather
> than returning EPROBE_DEFER. If it did the MFD driver would probe
> defer at the point of requesting the regulator, which would all
> make sense.

I think something like your suggestion could be made to work for the
"microphone" supply in the arizona MFD, but not for the others looked
at here.

The problem is that if the MFD driver gets -EPROBE_DEFER then it will
go through its error handling path and call mfd_remove_devices().
That'll remove the sub-device providing the regulator. If you try
again, you'll just do the same. :-)

Specifically in wm8994 after we've populated the regulator sub-devices
then we turn them on and start talking to the device.

I think the two options I have could both work for wm8994's case:
either add some type of "my children have done probing" to MFD and
move the turning on of regulators / talking to devices there, or add
another stub-device and add it there. ;-)

-Doug
