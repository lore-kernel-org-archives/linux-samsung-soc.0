From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 1/3 v6] spi: s3c64xx: fix broken "cs_gpios" usage in the driver
Date: Tue, 15 Jul 2014 09:33:21 +0530
Message-ID: <CAHfPSqAgCbfL2nkrfSYNJZitT-nGw7+5fpR9FMaabmwVJM6jUQ@mail.gmail.com>
References: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
 <1405316506-27855-2-git-send-email-ch.naveen@samsung.com> <20140714172524.GH6800@sirena.org.uk>
 <CAHfPSqAzab931yurSs+3zj=uoFj93FuAdd24AQKm1fZm07Nq8Q@mail.gmail.com> <20140714191533.GH6800@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:60479 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750980AbaGOEDm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 00:03:42 -0400
In-Reply-To: <20140714191533.GH6800@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>

Hello Mark,

On 15 July 2014 00:45, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Jul 15, 2014 at 12:31:32AM +0530, Naveen Krishna Ch wrote:
>
>> in this case spi-s3c64xx.c will continue to ignore the generic SPI "cs-gpios"
>> implementation.
>
>> I'm willing to implement any suggestion to fix this issue.
>
> The problem isn't what you're trying to do, the problem is verifying
> that it has been done correctly - making sure that everything has been
> accounted for in the change itself.

Understand your concern. I will try to get it tested on as many platforms.

-- 
Thanks for your review.
(: Naveen :)
