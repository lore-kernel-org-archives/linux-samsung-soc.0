From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFT PATCH 0/3] usb: misc: usb3503: Fix missing device when TFTP
 booting
Date: Sun, 1 May 2016 18:42:52 +0200
Message-ID: <20160501164252.GA3581@kozik-lap>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
 <57247E50.1020000@xs4all.nl>
 <20160501131746.GA16766@kozik-lap>
 <57260E1E.70205@xs4all.nl>
 <57262844.7060809@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34273 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751483AbcEAQm6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 May 2016 12:42:58 -0400
Content-Disposition: inline
In-Reply-To: <57262844.7060809@xs4all.nl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux.amoon@gmail.com, tjakobi@math.uni-bielefeld.de, m.szyprowski@samsung.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Sun, May 01, 2016 at 06:01:08PM +0200, Hans Verkuil wrote:
> > Sorry, I meant the hanging issue I got in 4.6, not the ethernet issue.
> > I get the same problem with linux-next. Can you mail me the .config you are using?
> 
> Never mind.
> 
> > After some more testing I don't think it is hanging, instead it seems that the mmc
> > isn't enabled/found and so it just sits waiting for the root partition to appear.
> 
> That was fun. There are two problems that both caused the boot to end at the same
> place: first of all the root partition is now called mmcblk1p1 instead of mmcblk0p1
> in 4.6, so it was just waiting for the root partition to appear. Nothing to do with
> your patch series, just unexpected.

Yes, annoying issue and unfortunately this is known... recommended
solution is to use root=PARTUUID=xxxx (you can get the PARTUUID with
blkid)... or replace the mmc device.

> The second is that enabling CONFIG_VIDEO_S5P_FIMC causes the boot to hang at that
> same place. I suspect there is a deadlock somewhere. I'm digging deeper into that
> but again, unrelated to your patch series.
> 
> Anyway, after disabling that config option I was finally able to test your patch
> series:
> 
> Tested-by: Hans Verkuil <hans.verkuil@cisco.com>

Thanks!

Best regards,
Krzysztof
