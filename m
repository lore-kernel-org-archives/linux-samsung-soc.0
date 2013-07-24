From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 3/3] ARM: dts: Add WM1811A audio CODEC to Arndale bindings
Date: Wed, 24 Jul 2013 10:50:38 +0900
Message-ID: <0deb01ce8810$3295b790$97c126b0$@org>
References: <1372714599-17588-1-git-send-email-broonie@kernel.org>
 <1372714599-17588-3-git-send-email-broonie@kernel.org>
 <51D26360.2080708@linaro.org> <20130702092507.GV27646@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20660 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833Ab3GXBul (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 21:50:41 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00DK43SFAA20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 10:50:39 +0900 (KST)
In-reply-to: <20130702092507.GV27646@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>, 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> On Tue, Jul 02, 2013 at 10:51:36AM +0530, Tushar Behera wrote:
> 
> > Arndale board also comes with two other audio codec boards - ALC5631Q
> > and AK4678. Different audio codec boards came with different shipments.
> 
> This is the default though and since they didn't bother providing any
> way of identifying the modules we just have to put them all in the
> device tree and hope that the individual CODEC drivers can do runtime
> identification (the WM1811A can but I don't know about the other two,
> nobody supported them upstream).

Basically, I agree with Mark Brown's opinion, at this moment would be better
if upstreamed WM1811A could be supported on Arndale and if further
supporting of two codecs is required, we could discuss again next time. And
they should be identified in the kernel at runtime.

- Kukjin
