From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: Use devres version of gpiochip_add_data
Date: Thu, 23 Mar 2017 13:34:10 +0200
Message-ID: <CAJKOXPdqTmv02+WC2Nh5zWiiotJ094dQV8ywBx_1-oupCkVTXQ@mail.gmail.com>
References: <1487251636-2480-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1487251636-2480-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170217133504.5poemeadyunc4pyh@kozik-lap> <20170217135214.GG30007@localhost.localdomain>
 <20170320184447.mmof2ksaz4ajz7bk@kozik-lap> <CACRpkdbm8zA8-p3nWc8-wiwLXRH8FDUdE=2L4QQc79TOT-fdaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbm8zA8-p3nWc8-wiwLXRH8FDUdE=2L4QQc79TOT-fdaQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Mar 23, 2017 at 11:47 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Mon, Mar 20, 2017 at 7:44 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Fri, Feb 17, 2017 at 01:52:14PM +0000, Charles Keepax wrote:
> >> On Fri, Feb 17, 2017 at 03:35:04PM +0200, Krzysztof Kozlowski wrote:
> >> > On Thu, Feb 16, 2017 at 01:27:16PM +0000, Charles Keepax wrote:
> >> > > Use devm_gpiochip_add_data to simplify the error path in
> >> > > samsung_gpiolib_register. Additionally this would also fix a leak if
> >> > > the pinctrl driver was unbound, although admittedly I can't see any
> >> > > good use-case for doing so, but the driver does currently allow it.
> >> >
> >> > Driver does not allow unbinding (.suppress_bind_attrs = true)...
> >> >
> >>
> >> Oops... sorry missed that.
> >
> > Can you resend with updated commit msg? I think it was not picked up by
> > Linus yet.
>
> I'm expecting you to pick it up and send to me by pull request now I guess,
> or did we agree that a Samsung patches wouldn't be too voluminous this
> cycle?
>
> If you're OK with it, can we proceed to use you as Samsung patch
> collection point for this kernel cycle from this moment on?

I will take it, especially that more things are coming. I already
applied patch from Chanwoo which should go to fixes (initially I put
it on wrong branch).

Best regards,
Krzysztof
