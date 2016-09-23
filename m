From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 2/2] ARM: dts: add TOPEET itop elite based board
Date: Fri, 23 Sep 2016 12:55:43 -0500
Message-ID: <20160923175543.GA4471@rob-hp-laptop>
References: <1474300103-26659-1-git-send-email-ayaka@soulik.info>
 <1474300103-26659-3-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474300103-26659-3-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 19, 2016 at 11:48:23PM +0800, Randy Li wrote:
> The TOPEET itop exynos 4412 have three versions base board. The
> Elite version is the cheap one without too much peripheral devices
> on it.
> 
> Currently supported are serial console, wired networking(USB),
> USB OTG in peripheral mode, USB host, SD storage, GPIO buttons,
> PWM beeper, ADC and LEDs. The WM8960 analog audio codec is also
> enabled.
> 
> The FIMC is not used for camera currently, I enabled it just for a
> colorspace convertor.
> 
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> Reviewed-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/arm/samsung/samsung-boards.txt        |   3 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/exynos4412-itop-elite.dts        | 240 +++++++++++++++++++++
>  3 files changed, 244 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos4412-itop-elite.dts

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
