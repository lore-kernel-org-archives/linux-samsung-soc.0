From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH 0/6] pinctrl: samsung: Convert the driver to use per-bank GPIO and interrupt specifiers
Date: Mon, 24 Sep 2012 23:42:09 +0200
Message-ID: <5294133.e1Q4XgYR6l@flatron>
References: <1348237377-21299-1-git-send-email-t.figa@samsung.com> <CACRpkdaqaaNf=S9CMzYE3zpji0pCK1MLKeBm3uH7-18HHwPV3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:34956 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814Ab2IXVmO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 17:42:14 -0400
Received: by wibhq12 with SMTP id hq12so2489743wib.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Sep 2012 14:42:13 -0700 (PDT)
In-Reply-To: <CACRpkdaqaaNf=S9CMzYE3zpji0pCK1MLKeBm3uH7-18HHwPV3w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com

Hi Linus,

On Monday 24 of September 2012 12:43:23 Linus Walleij wrote:
> On Fri, Sep 21, 2012 at 4:22 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> > This is a continuation of work focused on improving the pinctrl-samsung
> > driver.
> 
> All look good to me, I guess these will go through the Samsung tree?
> Acked-by: Linus Walleij <linus.walleij@linaro.org> for all.

Hmm, these patches are just at RFC stage at the moment and depend on the 
first part which does somewhat heavy reorganization of the driver. So this 
is more like a proof of concept.

After we settle all the things being discussed I will send a ready patch 
series including both of these parts.

Thanks for your ack anyway.

Best regards,
Tomasz Figa
