Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76051C6FD1C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Mar 2023 16:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjCWQxg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Mar 2023 12:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjCWQxf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Mar 2023 12:53:35 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C0FDF
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Mar 2023 09:53:34 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id l7so3827431qvh.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Mar 2023 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679590412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mV4JGejoE5XOnzyuiZjt16uJsH9qtIL7c03y2ALtMI=;
        b=cH4WGQSdAPzvRuWJYIKogXYHuGO3hdFI3a4OtKWeO0Pwf6AnDrkDGRfO3U4Kk7ZkCx
         OVyhq50Cd5vHfNRdsnvW8QW+ieZiz3SAdzko1clGTu4x3rB3d323iEgTAFTSv/EPS49V
         epBF93dxNZ1D9rDMPxjWmX+8a3bKRUJSpNnLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679590412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mV4JGejoE5XOnzyuiZjt16uJsH9qtIL7c03y2ALtMI=;
        b=23p7tfiIKhGmnK0Qy0NZoBJ05dbNZBGWlu1v55nvA/B9ZTOphaO2I9QkoGQznrj35r
         +XqaY+oPjfptjpK9WNUfjqhW7T8qEZLjfoAzn20LOjfsy5GJc2fKZR5BTHc0fHNFynnn
         QWM0CV62+ocxg2iZPLPV2E8z8yMMk/H0XUUbOmLMY51vJSVmXZcK+xdIXKRu9e3uvIr9
         ZSXSlId9e+py79tSXSciU8C5I6kxdVtSQb+GN8c1EM5ZeKC3JT91QeJ0tqi8WvWxfs9U
         6McxZXCJYOqz5CRLMDNDAM8516GRoy73DSMZtfTkkcS5jmd0yWbpLNoiMpKKuILC0VYb
         eOYg==
X-Gm-Message-State: AO0yUKW3FW7DWpBkReSoq4lCKPy8C7x92uC0KgQd2Vz6Orr1u1D521gn
        ozEpanmjRhWeS3WmedellLpAs958zGqbi+K5JzE=
X-Google-Smtp-Source: AK7set/07fCGT3yy4aoN6617wNqpchmkjFFbYLRugYibb1sqPuWRU452qf/d3FYWXlnMN7BGB+PQlQ==
X-Received: by 2002:a05:6214:1c4c:b0:5aa:8e3e:496e with SMTP id if12-20020a0562141c4c00b005aa8e3e496emr13199551qvb.34.1679590411518;
        Thu, 23 Mar 2023 09:53:31 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id z9-20020a376509000000b0074283b87a4esm6288459qkb.90.2023.03.23.09.53.30
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 09:53:30 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-53d277c1834so405254177b3.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Mar 2023 09:53:30 -0700 (PDT)
X-Received: by 2002:a05:690c:78b:b0:544:bbd2:74be with SMTP id
 bw11-20020a05690c078b00b00544bbd274bemr2559449ywb.4.1679590410383; Thu, 23
 Mar 2023 09:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230323083330eucas1p1f7e3f9beb5ba168c6b13374d74c158f0@eucas1p1.samsung.com>
 <20230323083312.199189-1-m.szyprowski@samsung.com> <20230323114035.GL68926@ediswmail.ad.cirrus.com>
In-Reply-To: <20230323114035.GL68926@ediswmail.ad.cirrus.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 23 Mar 2023 09:53:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UYO1KaoAZ7o5cA83SC1VHRomvJfaXVWyYPKrEZHyNNjg@mail.gmail.com>
Message-ID: <CAD=FV=UYO1KaoAZ7o5cA83SC1VHRomvJfaXVWyYPKrEZHyNNjg@mail.gmail.com>
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

On Thu, Mar 23, 2023 at 4:40=E2=80=AFAM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Thu, Mar 23, 2023 at 09:33:12AM +0100, Marek Szyprowski wrote:
> > Restore synchronous probing for wm8994 regulators because otherwise the
> > sound device is never initialized on Exynos5250-based Arndale board.
> >
> > Fixes: 259b93b21a9f ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for driv=
ers that existed in 4.14")
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  drivers/regulator/wm8994-regulator.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/regulator/wm8994-regulator.c b/drivers/regulator/w=
m8994-regulator.c
> > index 8921051a00e9..2946db448aec 100644
> > --- a/drivers/regulator/wm8994-regulator.c
> > +++ b/drivers/regulator/wm8994-regulator.c
> > @@ -227,7 +227,7 @@ static struct platform_driver wm8994_ldo_driver =3D=
 {
> >       .probe =3D wm8994_ldo_probe,
> >       .driver         =3D {
> >               .name   =3D "wm8994-ldo",
> > -             .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +             .probe_type =3D PROBE_FORCE_SYNCHRONOUS,
> >       },
> >  };
>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>
> Yes, these seems to be a wider problem with these complex CODECs
> that have an internal LDO. Changing to async probe, means the
> internal LDO driver doesn't probe before the code in the main MFD
> carries on, which means the regulator framework finds no driver
> and swaps in the dummy. Which means the CODEC never powers up.
>
> I think these basically have to be forced sync, I will do a patch
> to update the other devices working like this.

Sorry for the breakage and thank you for the fix.

No question that a quick switch back to PROBE_FORCE_SYNCHRONOUS is the
right first step here, but I'm wondering if there are any further
steps we want to take.

If my analysis is correct, there's still potential to run into similar
problems even with PROBE_FORCE_SYNCHRONOUS. I don't think that
mfd_add_devices() is _guaranteed_ to finish probing all the
sub-devices by the time it returns. Specifically, imagine that
wm8994_ldo_probe() tries to get a GPIO that that system hasn't made
available yet. Potentially the system could return -EPROBE_DEFER there
and that would put the LDO on the deferred probe list. Doing so won't
cause mfd_add_devices() to fail. Now we'll end up with a dummy
regulator again. Admittedly most cases GPIO providers probe really
early and so this argument is a bit of a stretch, but I guess the
point is that there's no official guarantee that mfd_add_devices()
will finish probing all sub-devices so it's not ideal to rely on.
Also, other drivers with a similar pattern might have other reasons to
-EPROBE_DEFER.

These types of issues are the same ones I faced with DP AUX bus and
the solutions were never super amazing...

One solution we ended up with for the DP AUX bus was to add a
"done_probing" callback argument to devm_of_dp_aux_populate_bus().
This allowed the parent to be called back when all the children were
done probing. This implementation is easier for DP AUX bus than it
would be in the generic MFD case, but conceivably it would be possible
there too?

Another possible solution is to somehow break the driver up into more
sub-drivers. Essentially, you have a top-level "wm8994" that's not
much more than a container. Then you create a new-sub-device and
relegate anything that needs the regulators to the new sub-device. The
new sub-device can just -EPROBE_DEFER until it detects that the
regulators have finished probing. I ended up doing stuff like this for
"ti-sn65dsi86.c" using the Linux aux bus (not to be confused with the
DP Aux bus) and it was a bit odd but worked OK.

-Doug
