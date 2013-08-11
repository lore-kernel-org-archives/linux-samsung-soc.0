From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung PWM support cleanup
Date: Sun, 11 Aug 2013 16:15:52 -0700
Message-ID: <20130811231552.GE26757@quad.lixom.net>
References: <3573853.gDiLaTfgOu@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:51506 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752910Ab3HKXQg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Aug 2013 19:16:36 -0400
Received: by mail-pa0-f47.google.com with SMTP id kl13so6742439pab.20
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2013 16:16:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <3573853.gDiLaTfgOu@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, Aug 06, 2013 at 01:32:25AM +0200, Tomasz Figa wrote:
> Hi Olof, Arnd,
> 
> Here is the Samsung PWM cleanup series for you. Particular patches of the
> series involve following modifications:
>  1) fixing up few things in samsung_pwm_timer clocksource driver,
>  2) moving remaining Samsung platforms to the new clocksource driver,
>  3) removing old clocksource driver,
>  4) adding new multiplatform- and DT-aware PWM driver,
>  5) moving all Samsung platforms to use the new PWM driver,
>  6) removing old PWM driver,
>  7) removing all PWM-related code that is not used anymore.
> 
> This is my first pull request ever, so I hope I haven't screwed up anything. ;)

Hi,

If you're using github, then please provide signed tags instead of branches to
pull from, and get your key signed by people. Once it's signed by enough of the
right people, you can sign up for a kernel.org account.

So, I'll be happy to pull this but please provide a tag.


-Olof
