From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: Exynos: Add basic dts file for Samsung Trats board
Date: Sat, 08 Sep 2012 10:21:35 +0200
Message-ID: <7700294.NPoOn06yTZ@flatron>
References: <1346748609-11115-1-git-send-email-t.figa@samsung.com> <3039444.Ol4zGlGWJ2@flatron> <24dd01cd8d6c$41586970$c4093c50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:52928 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751478Ab2IHIVl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Sep 2012 04:21:41 -0400
Received: by wibhi8 with SMTP id hi8so310117wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Sep 2012 01:21:40 -0700 (PDT)
In-Reply-To: <24dd01cd8d6c$41586970$c4093c50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, jy0922.shim@samsung.com

Hi Kgene,

On Saturday 08 of September 2012 11:47:15 Kukjin Kim wrote:
> > > > +       memory {
> > > > +               reg =  <0x40000000 0x20000000
> > > > +                       0x60000000 0x20000000>;
> > > > +       };
> > > 
> > > Why does this have to be split. Why not have a single entry with the
> > > size as 0x40000000?
> > 
> > The memory node corresponds to struct meminfo and each entry (with two
> > values) makes one struct membank defining a memory bank.
> 
> Well...
> 
> > I've been talking with Kyungmin about this. Originally bootloaders used
> > to report 4 banks of 256 MiB, but it turned out that real bank
> > configuration on Trats is 2 banks of 512 MiB.
> 
> I think, following should ok here.
> 
> memory {
> 	reg = <0x40000000 0x40000000>;
> };

This will not boot with CONFIG_SPARSEMEM, unless maximum section size is 
increased to 1024MiB.

> > > Probably, the interrupts can be listed when we have pinctrl driver
> > > merged in Samsung tree.
> > 
> > Right.
> 
> Note, you can do it on top of samsung tree :-)

OK.

--
Best regards,
Tomasz Figa
