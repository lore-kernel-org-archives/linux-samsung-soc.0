From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 00/15] Final Samsung PWM support cleanup
Date: Wed, 12 Jun 2013 16:00:23 -0700
Message-ID: <20130612230023.GA9016@quad.lixom.net>
References: <1370467100-10820-1-git-send-email-tomasz.figa@gmail.com>
 <1444953.LmSrOvSyJG@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:56167 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756927Ab3FLXAT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 19:00:19 -0400
Received: by mail-pb0-f48.google.com with SMTP id ma3so4180538pbc.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 16:00:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1444953.LmSrOvSyJG@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, thierry.reding@gmail.com, Arnd Bergmann <arnd@arndb.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>

On Wed, Jun 12, 2013 at 11:48:56PM +0200, Tomasz Figa wrote:

> > Needs testing on other platforms as I could only compile test for them.

How/who can help here? WHo has and still cares for other affected platforms?

> > 66 files changed, 627 insertions(+), 1580 deletions(-)

Nice cleanup.

> Any comments for this series?

Yes, above. :) In general looks good -- testing coverage is a bit of a concern.


-Olof
