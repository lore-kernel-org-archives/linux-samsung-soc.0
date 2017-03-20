From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: Use devres version of
 gpiochip_add_data
Date: Mon, 20 Mar 2017 20:44:47 +0200
Message-ID: <20170320184447.mmof2ksaz4ajz7bk@kozik-lap>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170217133504.5poemeadyunc4pyh@kozik-lap>
 <20170217135214.GG30007@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36810 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932246AbdCTSoy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 14:44:54 -0400
Content-Disposition: inline
In-Reply-To: <20170217135214.GG30007@localhost.localdomain>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Fri, Feb 17, 2017 at 01:52:14PM +0000, Charles Keepax wrote:
> On Fri, Feb 17, 2017 at 03:35:04PM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Feb 16, 2017 at 01:27:16PM +0000, Charles Keepax wrote:
> > > Use devm_gpiochip_add_data to simplify the error path in
> > > samsung_gpiolib_register. Additionally this would also fix a leak if
> > > the pinctrl driver was unbound, although admittedly I can't see any
> > > good use-case for doing so, but the driver does currently allow it.
> > 
> > Driver does not allow unbinding (.suppress_bind_attrs = true)...
> > 
> 
> Oops... sorry missed that.

Can you resend with updated commit msg? I think it was not picked up by
Linus yet.

Best regards,
Krzysztof
