From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Switch to kernel.org account for Krzysztof
 Kozlowski
Date: Mon, 15 Aug 2016 19:59:30 +0200
Message-ID: <20160815175930.GA8804@kozik-lap>
References: <1471281469-5847-1-git-send-email-krzk@kernel.org>
 <1471282605.4075.70.camel@perches.com>
 <20160815174612.GA8059@kozik-lap>
 <1471283467.4075.73.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34203 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753077AbcHOR7f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 13:59:35 -0400
Content-Disposition: inline
In-Reply-To: <1471283467.4075.73.camel@perches.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>

On Mon, Aug 15, 2016 at 10:51:07AM -0700, Joe Perches wrote:
> On Mon, 2016-08-15 at 19:46 +0200, Krzysztof Kozlowski wrote:
> > On Mon, Aug 15, 2016 at 10:36:45AM -0700, Joe Perches wrote:
> > > 
> > > On Mon, 2016-08-15 at 19:17 +0200, Krzysztof Kozlowski wrote:
> > > > 
> > > > Change my email address to kernel.org account instead of Samsung one.
> > > > Also switch Maxim MUIC charger drivers from supported to maintained
> > > > mode.
> > > You should probably add a .mailmap entry too
> > > 
> > > Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
> > I wasn't sure about this. When is mailmap used? For shortlog and
> > "get_maintainers --git"?
> 
> git shortlog with option -e and always with get_maintainer.pl

Indeed "shortlog -e" splits my humble person. I'll change also mailmap,
thanks for hint!

Best regards,
Krzysztof
