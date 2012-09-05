From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: Exynos: Add basic dts file for Samsung Trats board
Date: Wed, 05 Sep 2012 07:53:25 +0200
Message-ID: <3039444.Ol4zGlGWJ2@flatron>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com> <1346748609-11115-6-git-send-email-t.figa@samsung.com> <CAJuYYwTV1giNYJ7RTz=DHqK=i6FD2GsV4rNY2p5scVAnQz0kdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:40136 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750903Ab2IEFx3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Sep 2012 01:53:29 -0400
Received: by wgbdr13 with SMTP id dr13so211469wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Sep 2012 22:53:28 -0700 (PDT)
In-Reply-To: <CAJuYYwTV1giNYJ7RTz=DHqK=i6FD2GsV4rNY2p5scVAnQz0kdg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com, kgene.kim@samsung.com

Hi,

Thanks for reviewing the patch.

On Wednesday 05 of September 2012 09:35:49 Thomas Abraham wrote:
> > +
> > +       memory {
> > +               reg =  <0x40000000 0x20000000
> > +                       0x60000000 0x20000000>;
> > +       };
> 
> Why does this have to be split. Why not have a single entry with the
> size as 0x40000000?

The memory node corresponds to struct meminfo and each entry (with two 
values) makes one struct membank defining a memory bank.

I've been talking with Kyungmin about this. Originally bootloaders used to 
report 4 banks of 256 MiB, but it turned out that real bank configuration 
on Trats is 2 banks of 512 MiB.

I'm not into memory management internals, so I don't know if this has any 
significance, but I defined the node to represent the real configuration 
(otherwise I would have probably used 4 banks of 256 MiB and drop the 4th 
patch).

> > +               max8997_pmic@66 {
> > +                       compatible = "maxim,max8997-pmic";
> > +
> > +                       reg = <0x66>;
> 
> Probably, the interrupts can be listed when we have pinctrl driver
> merged in Samsung tree.
> 

Right.

--
Best regards,
Tomasz Figa
