Return-Path: <SRS0=j9wW=XY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA169C4360C
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Sep 2019 18:22:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8834D21D7A
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Sep 2019 18:22:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="tIYVkbVQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbfI2SW1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Sep 2019 14:22:27 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45782 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729109AbfI2SW1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Sep 2019 14:22:27 -0400
Received: by mail-lf1-f68.google.com with SMTP id r134so5313633lff.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Sep 2019 11:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I2oOR5tvCS97CthrHouvMSqg5pOQDzVvDjebg3lF4eM=;
        b=tIYVkbVQOZCJMPpJ0sLuPNRCxg4cehWVsLNJuRCbXOw0B5uzh6+q5cRrJHRzVTX1oY
         a1+/RSOmlVhyZ4vsLMGp55DUYlMuzii6M9Zn6glgxrVC5aoytx8VI1mbu9iI7jFf11bE
         CK1dsllj2ogxETE2uYTWK4dw1aSgEizTjKhYH7uBpiG4dz+QdYVheodqMk7F7yTmldqn
         xytIQQ2JfklxD1ZOmaGA9c0gA0LgqHwXimUHrFHQGpsuISXKkMhjpMwcAK5u/9N8EBJT
         q+aqVpwRztj35nMZzukQLm1TVeezBR3kkc6cqsKlmxdIC/pjspeizZBffSrAa2qWE/Ok
         cwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I2oOR5tvCS97CthrHouvMSqg5pOQDzVvDjebg3lF4eM=;
        b=Fnafg9HwGZSSZ+izIVVEUqNc+sJK/sOg3aci5ADz/R/ndcKkOikwmgjBWG3zX7NdqC
         0SVcC53jOhu7tbg9K3s3gNl3ojVUqPJAPIx0/J0mphmqFXybiXw4N514z99P/J9E0vG+
         22mTl1wejz5+aNPLy7rao0pM8UXVQF9AWmAtJXn44Hz3kxHCUM0FP2+xeZvhTnkA4eRQ
         JbO61wtYIzvZdT/+So855shJgWNfc09XXuWVZVtUpWI39Pbh33w125dLUs/AbLhBl/i6
         pB6l0qOzUGHY8bCr+LaLvY74UQ8xGdp4/n0ETFOoNDKUcug/8fAkje6koo9yZ6b869g0
         TlQg==
X-Gm-Message-State: APjAAAU8S2K0jUk04j3lYthRNn9HVNqrMSUqae/z56Y9l6njfZtOxWL5
        qhs73qPfDxvbunMeUkAmVLWIyA==
X-Google-Smtp-Source: APXvYqyNAiN5/diZRd39+iCMS5W2kHJDnF2GMM0abR1vMgUrxxMRPqXHBdEW+qUBiJnvzJdG1SpQXw==
X-Received: by 2002:a19:8a0b:: with SMTP id m11mr9035909lfd.4.1569781343744;
        Sun, 29 Sep 2019 11:22:23 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id p3sm2520051ljn.78.2019.09.29.11.22.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Sep 2019 11:22:22 -0700 (PDT)
Date:   Sun, 29 Sep 2019 10:51:34 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Subject: Re: [GIT PULL 1/2] arm64: dts: exynos: Pull for v5.4
Message-ID: <20190929175134.fsieffurfdiqhpj2@localhost>
References: <20190911183632.4317-1-krzk@kernel.org>
 <CAK8P3a2pBV+fh0rHitZ30Zz61QNRLfNSD-nhnzq4ZtxSh66F1Q@mail.gmail.com>
 <CAJKOXPcOSvc2DfoN+7Tca=t5dSm3RcKqmm06AfR0PAVBeY=GvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <CAJKOXPcOSvc2DfoN+7Tca=t5dSm3RcKqmm06AfR0PAVBeY=GvQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Message-ID: <20190929175134.WqN3yjASQoIbzlbFsAfMbhhjT8AqqwhAvDlmv2KtqzE@z>

Hi,

On Thu, Sep 12, 2019 at 08:32:47AM +0200, Krzysztof Kozlowski wrote:
> On Wed, 11 Sep 2019 at 23:07, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Sep 11, 2019 at 8:36 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > Unfortunately the patches were applied right after closing the linux-next.
> >
> > Hi Krzysztof,
> >
> > I took a look at these and am not convinced this is right:
> >
> > > 1. Fix boot of Exynos7 due to wrong address/size of memory node,
> >
> > The current state is clearly broken and a fix is needed, but
> > I'm not sure this is the right fix. Why do you have 32-bit physical
> > addressing on a 64-bit chip? I looked at commit ef72171b3621
> > that introduced it, and it seems it would be better to just
> > revert back to 64-bit addresses.
> 
> We discussed with Marek Szyprowski that either we can go back to
> 64-bit addressing or stick to 32. There are not known boards with more
> than 4 GB of RAM so from this point of view the choice was irrelevant.
> At the end of discussion I mentioned to stick with other arm64 boards
> (although not all), so revert to have 64 bit address... but Marek
> chosen differently. Since you ask, let's go back with revert.
> 
> >
> > > 2. Move GPU under /soc node,
> >
> > No problem
> >
> > > 3. Minor cleanup of #address-cells.
> >
> > IIRC, an interrupt-controller is required to have a #address-cells
> > property, even if that is normally zero. I don't remember the
> > details, but the gic binding lists it as mandatory, and I think
> > the PCI interrupt-map relies on it. I would just drop this patch.
> 
> Indeed, binding requires both address and size cells. I'll drop it.

Looking through the history of pending material, I didn't see a new pull for
this material. Just checking in to see if there's something we missed?


Thanks,


-Olof
