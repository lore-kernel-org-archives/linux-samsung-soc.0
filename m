From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: exynos-artik5: add support for wlan
Date: Mon, 12 Feb 2018 19:49:47 +0100
Message-ID: <20180212184947.zeloekwy4o4yih7u@kozik-lap>
References: <20180201211656.11829-1-mlyle@lyle.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180201211656.11829-1-mlyle-dTEscH1tG2Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Lyle <mlyle-dTEscH1tG2Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, CHANHO PARK <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Feb 01, 2018 at 01:16:56PM -0800, Michael Lyle wrote:
> On the Artik520 module, there's a bcm4354 attached to mshc_1.  Enable
> it, and turn on the regulator used for it, so that both wifi & bluetooth
> work.
> 
> Verified to work on the Artik 520 evaluation board.
> 
> v2: accidentally sent out v1
> v3: non-removable instead of broken-cd, alphabetical order, formatting
> 
> Signed-off-by: Michael Lyle <mlyle-dTEscH1tG2Q@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 36 ++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
