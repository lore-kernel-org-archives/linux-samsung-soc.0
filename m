From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/18] Final Samsung PWM support cleanup
Date: Fri, 21 Jun 2013 16:04:38 +0200
Message-ID: <201306211604.38443.arnd@arndb.de>
References: <1371766383-29077-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1371766383-29077-1-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olof@lixom.net>, Thierry Reding <thierry.reding@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 21 June 2013, Tomasz Figa wrote:
> Since we now have a proper Samsung PWM clocksource driver in place,
> we can proceed with further cleanup of PWM timers support on Samsung SoCs.
> 
> This series attempts to achieve this goal by:
>  1) moving remaining Samsung platforms to the new clocksource driver
>  2) removing old clocksource driver
>  3) adding new multiplatform- and DT-aware PWM driver
>  4) moving all Samsung platforms to use the new PWM driver
>  5) removing old PWM driver
>  6) removing all PWM-related code that is not used anymore
> 
> Cleaning up the PWM driver is a bit tricky, because the design of current
> driver makes it completely unsuitable for DT and multiplatform and would
> require a heavy rework to make it usable, breaking any existing Samsung PWM
> users by the way. To avoid any breakage I decided to keep the old driver,
> add new one, move all platforms to it and then remove the old one.
> 
> See particular patches for more detailed descriptions.
> 
> On S3C6410-based Tiny6410 (Mini6410-compatible), after enabling pwm-beeper
> and Exynos4210-based Origen board (with PWM0 attached to a scope):
> 
> Tested-by: Tomasz Figa <tomasz.figa@gmail.com>
> 

Looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

Two small comments:

* always use 'git format-patch -M' to detect renames (patch 10)

* for new code, don't use __raw_readl and similar functions but
  use readl_relaxed or plain readl.

	Arnd
