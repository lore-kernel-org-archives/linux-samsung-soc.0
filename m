From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] MAINTAINERS: Switch to kernel.org account for Krzysztof
 Kozlowski
Date: Mon, 15 Aug 2016 10:51:07 -0700
Message-ID: <1471283467.4075.73.camel@perches.com>
References: <1471281469-5847-1-git-send-email-krzk@kernel.org>
	 <1471282605.4075.70.camel@perches.com> <20160815174612.GA8059@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay0016.hostedemail.com ([216.40.44.16]:52340 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753022AbcHORvM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 13:51:12 -0400
In-Reply-To: <20160815174612.GA8059@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>

On Mon, 2016-08-15 at 19:46 +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 15, 2016 at 10:36:45AM -0700, Joe Perches wrote:
> > 
> > On Mon, 2016-08-15 at 19:17 +0200, Krzysztof Kozlowski wrote:
> > > 
> > > Change my email address to kernel.org account instead of Samsung one.
> > > Also switch Maxim MUIC charger drivers from supported to maintained
> > > mode.
> > You should probably add a .mailmap entry too
> > 
> > Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
> I wasn't sure about this. When is mailmap used? For shortlog and
> "get_maintainers --git"?

git shortlog with option -e and always with get_maintainer.pl
