Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E95C3F2CD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 17:45:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CE872084E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 17:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582911948;
	bh=TixKQq1AikWyPhXT9YHpbKFgI7V4TetvvUmIjcUCpPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=ed3ikWwciA9MHlOl7uZNvCcJSu4Smi3RoLvBpK9w/SIGvE7xdNIPYBj+sJIQGrXdW
	 hQ1V0vccwiGX904XN3z/Ug1UI/YPvxIq/R9cIrfsYGCVfk/i1JNywnHMzKVhokqbhE
	 3J5bj4oYAaRhWhYPDIwoCanfw38uVMj6f+BeDSlk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgB1Rps (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 12:45:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:52436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgB1Rpr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 12:45:47 -0500
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DC9E2084E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582911947;
        bh=TixKQq1AikWyPhXT9YHpbKFgI7V4TetvvUmIjcUCpPs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=I9phToTQsJpykSKcAfH4GE1MlEPcDh9ALUrH471gXGPTKkN0wWGPEzfFaH/uUk4Kb
         Pmk0o/uDZc3YQuoS7r0oiV2ulpBWlGO8KoPGjCyuz0Kgo6uOx7cPp+0QQucClPzek+
         e7jNtDwCmsOrStr6YdJSY/DDivxfkPiGJd6UIdf8=
Received: by mail-lj1-f178.google.com with SMTP id x7so4270676ljc.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 09:45:46 -0800 (PST)
X-Gm-Message-State: ANhLgQ2i1Aih3Z1I5OE0MdgwuPj5VOOADfHKkyj50hQqDkJWLvQ140x5
        DLT+MIbgLZ6D8xHGDZlPQurMh9aqaMa90u97b60=
X-Google-Smtp-Source: ADFU+vv5P7XBJ/Je+JbkoAnG9TjcRV6eyOW2OAzpsysHhynlOfi2t1apO7kCZmslnnvv8slmzCJXjuBPIQRruRUwBbA=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr1760343ljc.256.1582911944821;
 Fri, 28 Feb 2020 09:45:44 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
 <20200228101120.28819-1-m.szyprowski@samsung.com> <20200228161220.GB4956@sirena.org.uk>
In-Reply-To: <20200228161220.GB4956@sirena.org.uk>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 28 Feb 2020 18:45:33 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdVRCtJcUS-jkAGoeOB5C8mBWPoZxmFNmg2On0STd6mkg@mail.gmail.com>
Message-ID: <CAJKOXPdVRCtJcUS-jkAGoeOB5C8mBWPoZxmFNmg2On0STd6mkg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
To:     Mark Brown <broonie@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        alsa-devel@alsa-project.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 28 Feb 2020 at 17:12, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 28, 2020 at 11:11:20AM +0100, Marek Szyprowski wrote:
>
> > Don't confuse user with meaningless warning about the failure in getting
> > resources and registering card in case of deferred probe.
>
> >       if (ret) {
> > -             dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
> > +             if (ret != -EPROBE_DEFER)
> > +                     dev_err(&pdev->dev,
> > +                             "snd_soc_register_card() failed: %d\n", ret);
>
> This is completely removing the diagnostics so if things do get stuck
> the user will generally not have any hint as to what's going wrong -
> it's better with this sort of change to lower to dev_dbg() for deferral
> rather than completely removing the error message so the user has some
> ability to figure out what was missing.  However in this case it's also
> the case that snd_soc_register_card() is fairly noisy.

This dev_dbg could be achieved with ftrace for probe() as well. I
think it is quite common to skip all messages for deferred probes.

Best regards,
Krzysztof
