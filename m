From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V6 2/2] video: drm: exynos: Add device tree support
Date: Wed, 26 Sep 2012 13:32:10 +0900
Message-ID: <CAAQKjZNRJHuA4+B-tP5vTaDfmMMxC+VKLDJU4gtpvtu=srzgAg@mail.gmail.com>
References: <1348226536-22899-1-git-send-email-l.krishna@samsung.com>
	<505C9072.2010204@wwwdotorg.org>
	<CAAQKjZMZBDpKinZkDUX7CU4yTXmu9GrP1+OiZJKW4Gx1BTno3Q@mail.gmail.com>
	<2368486.hLKA5vLF0M@avalon>
	<CAAQKjZN++zZ9cfNCB21TeQwPZgFVU-Cmo9ZhVwaaMz+HO2vHig@mail.gmail.com>
	<20120925153109.GA8834@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:60607 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750772Ab2IZEcK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Sep 2012 00:32:10 -0400
Received: by padhz1 with SMTP id hz1so140005pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Sep 2012 21:32:10 -0700 (PDT)
In-Reply-To: <20120925153109.GA8834@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Leela Krishna Amudala <l.krishna@samsung.com>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org

2012/9/26 Mark Brown <broonie@opensource.wolfsonmicro.com>:
> On Wed, Sep 26, 2012 at 12:03:44AM +0900, Inki Dae wrote:
>> 2012/9/25 Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
>
>> > Aren't DT bindings considered as an ABI, and required to be supported more or
>> > less forever ? If you merge this DT binding you'll have to keep supporting it.
>> > That's why DT bindings should not be rushed in.
>
>> is ABI required for DT binding?  I know DT binding parses just lcd
>> timing data from device tree file so ABI isn't needed. but when it
>> comes to DT, I'm novice yet so there may be my missing point. could
>> you tell me why DT bindings are considered as an ABI? if there is my
>> missing point, will consider it again.
>
> It's supposed to be possible to ship a DT with a board and then boot any
> OS or OS version on the board.  If the meaning of the DT keeps changing
> then this becomes impossible, you need to keep changing the DT when you
> change the thing that parses it (rendering the whole exercise pointless).
>

thank you for your comments. got it. DT is built as an binary(dtb) and
the dtb file should be re-used without any modifications. will keep
this patch until the videomode helper will be merged to mainline so
that this could be modified based on videomode helper later.

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
