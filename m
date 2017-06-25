From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: Exynos5422 Odroid-XU* incomplete
 thermal-zones definition
Date: Sun, 25 Jun 2017 18:53:24 +0530
Message-ID: <CANAwSgSN5zi72m1td-NAaCPGLUZybSdefrKAo2t9v-gOXn3tGA@mail.gmail.com>
References: <20170623210913.ugutgop7ratwolfy@inc028000032.lancs.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170623210913.ugutgop7ratwolfy-rWMjSxWZCqnBaesvAyKWX0V1nY9/fDo3@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willy Wolff <willy.mh.wolff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Willy,

On 24 June 2017 at 02:39, Willy Wolff <willy.mh.wolff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Odroid XU*-familly boards has thermal sensors per A15 cores, but the actual
>  thermal-zones define only cooling-maps action for cpu0.
>
> If the application is running on all cores but core4 (first core of the A15
>  cluster), the CPU can reach high temperature without any proper cooling
>  action.
>
> As already discus in prior mail, and on IRC, it's a quit big code
> duplication, but I don't found the write way to express that in a better
>  way.
>
> The situation for this board is that we have multiple sensors, but
>  matching cooling devices for these sensors act for the same physical
>  device (FAN and A15 cluster, as each core of the cluster share the same
>  frequency).
> In fact, of-thermal.c:473:thermal_zone_of_sensor_register() can't use
> multiple sensors for one single thermal zone.
> This patch follow the path taken in arch/arm/boot/dts/qcom-apq8084.dtsi:97
>
> I'm interested to extending the thermal driver, but it will takes time.
>  So this is a workaround before refactoring the driver.
> If somebody knows how to write it better, any advice and suggestions
> are more than welcome.
>
> Also, the comment for cpu_alert4 in cooling-maps definition is not
> accurate, 11 steps for A15 correspond to 700MHz, not 600MHz.
>

[snip]

Few point to from my side.

1: We should also increase the trip points temperature so that it can
throttle at high temperature.
2: We should also increase the tips from 4 to 8 to support different
cluster of cpu's.
3: To avoid duplication of cooling-maps we can make tmu sensor work
differently for cluster of cpu's
      tmu_cpu0: handle pwm-fan control.
      tmu_cpu1: handle cpu[0-3] cpufreq mapping.
      tmu_cpu2: handle cpu[4-7] cpufreq mapping.
      tmu_gpu: handle gpu (mali) cpu throttle.

Please share your thought on this new approach.

I generally test using linaro's pm-qa and most of the time the test case fails
      # git clone git://git.linaro.org/tools/pm-qa.git
      # make -C thermal check

-Best Regards
-Anand Moon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
