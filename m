From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: Use devres version of
 gpiochip_add_data
Date: Fri, 17 Feb 2017 13:52:14 +0000
Message-ID: <20170217135214.GG30007@localhost.localdomain>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170217133504.5poemeadyunc4pyh@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170217133504.5poemeadyunc4pyh@kozik-lap>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 17, 2017 at 03:35:04PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Feb 16, 2017 at 01:27:16PM +0000, Charles Keepax wrote:
> > Use devm_gpiochip_add_data to simplify the error path in
> > samsung_gpiolib_register. Additionally this would also fix a leak if
> > the pinctrl driver was unbound, although admittedly I can't see any
> > good use-case for doing so, but the driver does currently allow it.
> 
> Driver does not allow unbinding (.suppress_bind_attrs = true)...
> 

Oops... sorry missed that.

Thanks,
Charles
