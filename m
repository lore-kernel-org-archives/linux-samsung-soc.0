From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/7] drm/exynos: move hdmiphy related code to hdmiphy driver
Date: Mon, 30 Sep 2013 01:13:09 +0200
Message-ID: <3343111.VLAUx0FRXN@flatron>
References: <1377845974-28373-1-git-send-email-rahul.sharma@samsung.com> <CAAQKjZPtxLAJOz6573+hEPZokEnvGF8BTMXoxcYUQ8zySAn-OA@mail.gmail.com> <5248A4EE.9000708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:38090 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752709Ab3I2XNO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Sep 2013 19:13:14 -0400
In-Reply-To: <5248A4EE.9000708@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "sw0312.kim" <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>, Shirish S <shirish@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Mark Rutland <Mark.Rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <Pawel.Moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Sean Paul <seanpaul@chromium.org>

On Monday 30 of September 2013 00:08:46 Sylwester Nawrocki wrote:
> On 09/28/2013 06:10 PM, Inki Dae wrote:
> >> Any opinion from Device-Tree folks?
> >> 
> >> IMO, we should have same consensus on Shirish patches before
> >> proceeding.> 
> > Rahul, it seems that DT people have no interest in this issue. So
> > let's
> > have a consensus about this issue internally.
> > 
> > To Mr. Kyungmin, Sylwester, Kukjin Kim, and Tomasz,
> > How about keeping hdmiphy config data in each board dts file?
> 
> Please don't use HTML and quote only relevant part of e-mails. Otherwise
> there are good chances your messages end up in people's spam box.
> 
> It often helps to Cc a DT binding maintainer directly.
> 
> Then, you consider moving the HDMI phy configuration to the device tree.
> As Sean suggested in this thread:
> 
> ">> +static struct hdmiphy_config hdmiphy_4210_configs[] = {

I'd like to only add that patches introducing or modifying a device tree 
binding need to be acked by at least one DT binding maintainer to be 
merged.

> >> +       {
> >> +               .pixel_clock = 27000000,
> >> +               .conf = {
> >> +                       0x01, 0x05, 0x00, 0xD8, 0x10, 0x1C, 0x30,
> >> 0x40,
> >> +                       0x6B, 0x10, 0x02, 0x51, 0xDF, 0xF2, 0x54,
> >> 0x87,
> >> +                       0x84, 0x00, 0x30, 0x38, 0x00, 0x08, 0x10,
> >> 0xE0,
> >> +                       0x22, 0x40, 0xE3, 0x26, 0x00, 0x00, 0x00,
> >> 0x00,
> >> +               },
> >> +       },
> 
> [trimmed couple more entries]
> 
> >> +};
> > 
> > Are you aware of the effort to move these to dt? Since these are
> > board-specific values, it seems incorrect to apply them universally.
> > Shirish has uploaded a patch to the chromium review site to push these
> > into dt (https://chromium-review.googlesource.com/#/c/65581). Maybe
> > you can work that into your patch set?"
> 
> The configuration data is 64 bytes of the register values IIUC. Would it
> be possible to figure out exact meaning of each byte ?

This is definitely something that I would go for. Then for board specific 
data appropriate device tree properties could be defined, not just a 
binary blob.

Best regards,
Tomasz
