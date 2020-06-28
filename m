Return-Path: <SRS0=268o=AJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC024C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 28 Jun 2020 08:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC81020724
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 28 Jun 2020 08:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tpsgCAR/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgF1I0r (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 28 Jun 2020 04:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgF1I0r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 28 Jun 2020 04:26:47 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922E4C061794;
        Sun, 28 Jun 2020 01:26:46 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id k6so11918347ili.6;
        Sun, 28 Jun 2020 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DqJvpWtoW3nprtuXq3za3QJaWyFLFS+jchbivX5kaZU=;
        b=tpsgCAR/SgPl6McvVbqNy7VIgj+BnjvStz+RhrfIsVn9xvbQlEWaQA2v9cO69JVmnw
         imFp/cSZ06Rmwv4uFu+6ldkTi/YWkds+7iQv0CyxlErJ8WoerhWffx1esMCwO+xnUHWJ
         hy2w1PuBHZvF861BvnOJrooVWVC1lulbjIOqs/1i078RgG9ptWtvMISlUPyutzadIgDO
         WLVX3HKlxbKWKOSP+cgQn2Y4KYFKOH8WUHbniBeZc6z3iyRFaf+sy9bVmcBTexvxda54
         OvtcAdcIPABXzVv4jSDNy+wymhytJuGtD9IrxBwV3kdxlOPE0F/CAjYjSEduhN5wMNvH
         sR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DqJvpWtoW3nprtuXq3za3QJaWyFLFS+jchbivX5kaZU=;
        b=QphJTg88AwNlhce53/8lRKguWubzyfG0YTOwtDyO8H8E3fqiqdy6PUQI2HplNbSGmJ
         MY9J/xFnGwJFZh1A3FbVzxB4bgO3fU48Pk1Tn0yR6j8jaXjMmCIUh7tMEsD0A7RkywP8
         NRxhB825Jfnpv+21Ft6ww5flAZj0DaMS6pRJtwo84a3NvEbS+t67NyiKekUA5qsTbBAR
         3XDePywxXb99pBFaEjzKMoRKiXluJRlSQuLiaIRKM0prp7iNqnOMMcTbMDqXcdnfFLpe
         c9OZO3zKHbojbPQ7m+20qf5Xg0Tb/LA16Qq2s86D0buZIR056j7MKNY8Rhgx7BTlIvIp
         IPSg==
X-Gm-Message-State: AOAM531vAvjswO/O68Sek+SQvqcnnzYZU731xWXM90/ugSPMNdx+hUFh
        wygYSF5Kn9fvOwelmLUOHiK5cHvYZrBd3FCckHI=
X-Google-Smtp-Source: ABdhPJxnTyakU+Sg3pkShLsRTkg2XeY+E4SJSzfAqYRjRpVbIBvKNKwd/cqjokKUyTVrffgHyPFviaOPtyOQ7rry2iA=
X-Received: by 2002:a92:98c2:: with SMTP id a63mr10580054ill.246.1593332805848;
 Sun, 28 Jun 2020 01:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200624110435.1150-1-linux.amoon@gmail.com> <20200626071358.GA21250@kozik-lap>
In-Reply-To: <20200626071358.GA21250@kozik-lap>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Sun, 28 Jun 2020 13:56:36 +0530
Message-ID: <CANAwSgT2-nKmm-8njsEDu9P-qjE5cS2ksVJqhuAnoX3-WzRpYA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: Fix L2 cache-controller nodename
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Fri, 26 Jun 2020 at 12:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Jun 24, 2020 at 11:04:35AM +0000, Anand Moon wrote:
> > Fix warning message by changing nodename to 'cache-controller'.
> >
> > make ARCH=arm dtbs_check
> > DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/l2c2x0.yaml
> > arch/arm/boot/dts/exynos4210-i9100.dt.yaml: l2-cache-controller@10502000:
> >       $nodename:0: 'l2-cache-controller@10502000' does not match '
> >       ^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> > arch/arm/boot/dts/exynos4412-i9300.dt.yaml: l2-cache-controller@10502000:
> >         $nodename:0: 'l2-cache-controller@10502000' does not match '
> >         ^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> >
> > Fixes: 56b60b8bce4a ("ARM: 8265/1: dts: exynos4: Add nodes for L2 cache controller")
>
> It is just naming convention introduced with dtschema so there is no
> error to fix.  Applied with modified commit msg.
>
> Best regards,
> Krzysztof
>

Thanks & Regards
-Anand
