From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFT PATCH 0/3] usb: misc: usb3503: Fix missing device when TFTP
 booting
Date: Mon, 02 May 2016 15:41:51 +0200
Message-ID: <5727591F.3000100@samsung.com>
References: <1461927591-7864-1-git-send-email-k.kozlowski@samsung.com>
 <57247E50.1020000@xs4all.nl> <20160501131746.GA16766@kozik-lap>
 <57260E1E.70205@xs4all.nl> <57262844.7060809@xs4all.nl>
 <20160501164252.GA3581@kozik-lap> <572758B1.60202@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56261 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714AbcEBNl5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 May 2016 09:41:57 -0400
In-reply-to: <572758B1.60202@xs4all.nl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Kukjin Kim <kgene@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux.amoon@gmail.com, tjakobi@math.uni-bielefeld.de, m.szyprowski@samsung.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 05/02/2016 03:40 PM, Hans Verkuil wrote:
>>> Anyway, after disabling that config option I was finally able to test your patch
>>> series:
>>>
>>> Tested-by: Hans Verkuil <hans.verkuil@cisco.com>
> 
> BTW, one thing I noticed is that to have u-boot detect the network device I
> need to call 'usb reset' twice. This is with u-boot 2016.1 release.
> 
> Not a big deal, but I wondered if you see the same.

Yes, I also have to do it twice.

Best regards,
Krzysztof
