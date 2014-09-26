From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5] mfd: syscon: Decouple syscon interface from platform devices
Date: Fri, 26 Sep 2014 09:16:29 +0200
Message-ID: <2553182.6YgvmDLuEA@wuerfel>
References: <1411360807-7750-1-git-send-email-pankaj.dubey@samsung.com> <000d01cfd946$521304f0$f6390ed0$@samsung.com> <CAGhQ9VxwTS9=biwp0nCKu2bVU2aNe679aKR=HU5rd_Uaw99sUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGhQ9VxwTS9=biwp0nCKu2bVU2aNe679aKR=HU5rd_Uaw99sUw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Joachim Eastwood <manabian@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, dianders@chromium.org, kgene.kim@samsung.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, naushad@samsung.com, Li.Xiubo@freescale.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, vikas.sajjan@samsung.com, chow.kim@samsung.com, Lee Jones <lee.jones@linaro.org>, sunil joshi <joshi@samsung.com>, b29396@freescale.com
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 26 September 2014 07:34:12 Joachim Eastwood wrote:
> I am working on Cortex-M4 no-MMU platform that isn't upstream yet, btw.
> 

Sorry for drifting off-topic, but this is very interesting to me. Can you
say which one you are working on and what your timeline is for submitting
it upstream?

I generally like to know about new platforms early, and sometimes we get
multiple people working on the same one.

	Arnd
