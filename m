From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung cleanup for S5P SoCs for 3.17
Date: Sun, 13 Jul 2014 07:34:30 +0900
Message-ID: <53C1B7F6.7050803@samsung.com>
References: <53BB2658.4050808@samsung.com> <20140712165948.GA10012@quad.lixom.net> <20140712194416.GA6800@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:50186 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892AbaGLWej (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Jul 2014 18:34:39 -0400
Received: by mail-pd0-f174.google.com with SMTP id y10so3200616pdj.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jul 2014 15:34:37 -0700 (PDT)
In-Reply-To: <20140712194416.GA6800@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 07/13/14 04:44, Mark Brown wrote:
> On Sat, Jul 12, 2014 at 09:59:48AM -0700, Olof Johansson wrote:
>
>> I've merged these in. I noticed lack of acked-by from Mark Brown, so I pinged
>> him on IRC about it and the branch is currently at the top so it's easy to drop
>> in case he has objections (cc:d here too).
>
> Don't know if I've seen these changes (though IIRC they might've gone to
> the work account).  I suspect we're going to get some conflicts since
> we've also got other changes going on in ASoC so it is probably going to
> be easier to merge at least that patch via ASoC.

OK.

Olof, I will resend the pull-request after sorting them out so please 
drop this then pull new one.

Mark, please take following ASoC related patches.
- ASoC: samsung: no more support for S5P6440 and S5P6450 SoCs
- ASoC: Samsung: remove s5pc100 related codes

Thanks,
Kukjin
