From: Pankaj Jangra <jangra.pankaj9@gmail.com>
Subject: Re: [PATCH 6/7] ARM: SAMSUNG: use clk_prepare_enable in samsung-time
Date: Wed, 13 Mar 2013 22:29:04 +0530
Message-ID: <CADTbHxq-gxoN9HKkjPsZ5uBt7PhrvO8XdQdmAyscOA+xPy9Z7A@mail.gmail.com>
References: <201303120141.31262.heiko@sntech.de>
 <201303120145.21072.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201303120145.21072.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, t.figa@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Mar 12, 2013 at 6:15 AM, Heiko St=FCbner <heiko@sntech.de> wrote:
> The common clock framework expects clocks to be prepared
> before they are enabled.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/plat-samsung/samsung-time.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/samsung-time.c b/arch/arm/plat-samsung=
/samsung-time.c
> index f899cbc..6ebb851 100644
> --- a/arch/arm/plat-samsung/samsung-time.c
> +++ b/arch/arm/plat-samsung/samsung-time.c
> @@ -355,7 +355,7 @@ static void __init samsung_timer_resources(void)
>         if (IS_ERR(timerclk))
>                 panic("failed to get timers clock for timer");
>
Also how about calling the clk_prepare_enable() only if the clk_get()
call is a sucess? Though clk framework will take care of it. Just
thinking even to avoid that call if clk_get() fails since you are
modifying the code.

> -       clk_enable(timerclk);
> +       clk_prepare_enable(timerclk);
>
>         sprintf(devname, "s3c24xx-pwm.%lu", event_id);
>         s3c_device_timer[event_id].id =3D event_id;
> @@ -369,7 +369,7 @@ static void __init samsung_timer_resources(void)
>         if (IS_ERR(tdiv_event))
>                 panic("failed to get pwm-tdiv clock for event timer");
>
Same here...
> -       clk_enable(tin_event);
> +       clk_prepare_enable(tin_event);
>
>         sprintf(devname, "s3c24xx-pwm.%lu", source_id);

Regards,
Pankaj Jangra
