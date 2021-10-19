Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2490C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C64D60EE3
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbhJSQG5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 12:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbhJSQGv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 12:06:51 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14C4C06176C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:04:35 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id e10so904444uab.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5J1xMt/vQlR8SVOww8V/YvYALhrphrCuVMa2HeQBAzE=;
        b=fX3bi6ey8uPD0A0n8+0h4il+uzx946plN1BAtTJ7rzpPI8ZO0JJs5fcCkR9GNNqoRZ
         H7kOZInq9pMr2LJkJt8p3rPUVlx++EIJJBWllI8UI9V4xDk705FU+8a5Rsr1G7vVts6n
         UNQM1r1jr5QNY+uFxnN+s4zFfuBlH4qrFQ8s4jNP1TmjszCeNhWvZk4CO5d/SwLY+TGe
         6Teyju4FQq1SUW8ZOWAeCabVBQHPjZ0eb12z+MZcHCAnCRtIY/oR5gV6748faOcR4Fk8
         yFGEOaxrVpKJhTk72O2aASsNtG++CCTj6ufiSGBMvMuIyyQLyRO7eEzyRpJiBB7ungIE
         zLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5J1xMt/vQlR8SVOww8V/YvYALhrphrCuVMa2HeQBAzE=;
        b=EroRJd2FhEqjZvwWXzqEQfV5Tr1QoBjpalHmFOSzoUzFdPDjDw4LFAdEcHfiRdwo32
         sOA6NmpWMvx2988VMBFPDbERmRe9kTyqHcnZIlLYoXmuIP76baqmESidbqTn46qw5CQR
         vOFzgIzu01o46ydj/KLCssLsrYDstz9Itqqc3l6dynrq3Pb8SJiLU37lBpVR7+7xu2YN
         RJv7oNQ2odAqCpI9aJ3Z20dB1dqfuhjF1Kozur8F2AD093DfFYf16D7Ubgvqlqr9Svf0
         ezuQg9q+LT0uboyb8k0ZNAz2NKdX1YX8rPeSAyuOFKXoO7KM9H1bqhm5J3FYP/8ND8IU
         JYzA==
X-Gm-Message-State: AOAM530cMdESipE+TChYalnPyLEr0Szyv6VBF1ABjzj/JwWg31mYPmkH
        3wTCj+/d4haeSL2fNj8tSXONW37yxtb2/MNZfcjnKg==
X-Google-Smtp-Source: ABdhPJzZW4kzXnWUOel+r2WYqoC8xUG5yq1/s97vHaMsOsIrV0HzQMthfnw6sLSunx0sYYquowj98x8EayKuljfFfxE=
X-Received: by 2002:ab0:3303:: with SMTP id r3mr872053uao.17.1634659474630;
 Tue, 19 Oct 2021 09:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-5-semen.protsenko@linaro.org> <YW7o4iVhJNmv/ea6@piout.net>
In-Reply-To: <YW7o4iVhJNmv/ea6@piout.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 19 Oct 2021 19:04:23 +0300
Message-ID: <CAPLW+4nWvMWfz32WmcDZ=X78jVREMUAOD1Z7SefxH--p8F+NXA@mail.gmail.com>
Subject: Re: [PATCH 4/4] rtc: s3c: Fix RTC read on first boot
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 19 Oct 2021 at 18:48, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 19/10/2021 16:17:24+0300, Sam Protsenko wrote:
> > On first RTC boot it has the month register value set to 0.
> > Unconditional subtracting of 1 subsequently in s3c_rtc_gettime() leads
> > to the next error message in kernel log:
> >
> >     hctosys: unable to read the hardware clock
> >
> > That happens in s3c_rtc_probe() when trying to register the RTC, which
> > in turn tries to read and validate the time. Initialize RTC date/time
> > registers to valid values in probe function on the first boot to prevent
> > such errors.
> >
>
> No, never ever do that, the time is bogus and it has to stay this way,
> else userspace can't know whether the time on the RTC is the actual wall
> time or just some random value that you have set from the driver.
>

Thought about that, but that error message looked distracting and not
very helpful in understanding what's actually going on. Anyway, can
you please drop this patch from series (and maybe [PATCH 3/4] too) and
apply the rest?

> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/rtc/rtc-s3c.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> > index 238928e29fbc..c7e763bcf61f 100644
> > --- a/drivers/rtc/rtc-s3c.c
> > +++ b/drivers/rtc/rtc-s3c.c
> > @@ -403,6 +403,28 @@ static int s3c_rtc_remove(struct platform_device *pdev)
> >       return 0;
> >  }
> >
> > +/* Set RTC with valid date/time values on first boot */
> > +static int s3c_rtc_init_time(struct s3c_rtc *info)
> > +{
> > +     struct rtc_time tm;
> > +     int ret;
> > +
> > +     ret = s3c_rtc_read_time(info, &tm);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Only init RTC date/time on first boot */
> > +     if (tm.tm_mday > 0)
> > +             return 0;
> > +
> > +     /* Init date/time: 1 Jan 2000 00:00:00 */
> > +     memset(&tm, 0, sizeof(struct rtc_time));
> > +     tm.tm_mday = 1; /* tm_mday min valid value is 1 */
> > +     tm.tm_mon = 1;  /* January in internal representation */
> > +
> > +     return s3c_rtc_write_time(info, &tm);
> > +}
> > +
> >  static int s3c_rtc_probe(struct platform_device *pdev)
> >  {
> >       struct s3c_rtc *info = NULL;
> > @@ -471,6 +493,10 @@ static int s3c_rtc_probe(struct platform_device *pdev)
> >
> >       device_init_wakeup(&pdev->dev, 1);
> >
> > +     ret = s3c_rtc_init_time(info);
> > +     if (ret)
> > +             goto err_nortc;
> > +
> >       info->rtc = devm_rtc_allocate_device(&pdev->dev);
> >       if (IS_ERR(info->rtc)) {
> >               ret = PTR_ERR(info->rtc);
> > --
> > 2.30.2
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
