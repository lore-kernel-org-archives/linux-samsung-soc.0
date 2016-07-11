From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/3] making rtc cores from s3c6410 and
 exynos3250 both work
Date: Mon, 11 Jul 2016 07:46:40 +0200
Message-ID: <578332C0.4010601@samsung.com>
References: <1468056226-19128-1-git-send-email-ayaka@soulik.info>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDKZNNNLXAHBBR7FRS6AKGQEKKV7TVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-reply-to: <1468056226-19128-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/09/2016 11:23 AM, Randy Li wrote:
> The 8792f7772f4f40ffc68bad5f28311205584b734d would just make those
> platform using rtc core from exynos3250 work but have a huge 
> effect on those platforms using the rtc core from s3c6410.
> These patches would fix this problem.
> 

Which problem? What huge effect? On which platforms? You didn't describe
it...

Your change breaks the ABI and is not compatible with current bindings
documentation.

Best regards,
Krzysztof

> Randy Li (3):
>   Revert "drivers/rtc/rtc-s3c.c: add .needs_src_clk to s3c6410 RTC data"
>   rtc: s3c: add device data for samsung,exynos3250-rtc
>   ARM: dts: exynos: correct the rtc compatible value for exynos5
> 
>  arch/arm/boot/dts/exynos3250.dtsi |  2 +-
>  arch/arm/boot/dts/exynos5.dtsi    |  2 +-
>  drivers/rtc/rtc-s3c.c             | 15 +++++++++++++--
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
