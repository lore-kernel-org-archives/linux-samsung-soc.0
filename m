From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/10] ARM: s3c64xx multiplatform
Date: Wed, 25 Nov 2015 17:33:32 +0100
Message-ID: <61393304.ojuUBpDrS2@wuerfel>
References: <1448467615-447097-1-git-send-email-arnd@arndb.de> <20151125163114.GV1929@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:55853 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753846AbbKYQeW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 11:34:22 -0500
In-Reply-To: <20151125163114.GV1929@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vasily Khoruzhick <anarsoul@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Tomasz Figa <tfiga@chromium.org>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org

On Wednesday 25 November 2015 16:31:14 Mark Brown wrote:
> On Wed, Nov 25, 2015 at 05:06:45PM +0100, Arnd Bergmann wrote:
> > I've posted the series before and we got a few people to test it
> > the last time, though I think the touchscreen portion is still
> > untested.
> > 
> > I'd really like to get this merged for 4.5 and would put it into
> > a next/multiplatform branch unless there are any objections
> > or concerns.
> 
> Is this a series with interdependencies or just a set of separate fixes?
> 

Patch 9/10 depends on the first eight patches, the last one depends on
that.

	Arnd
