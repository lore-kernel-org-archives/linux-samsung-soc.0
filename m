From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Use macros for pinctrl
 configuration on Exynos7
Date: Thu, 2 Feb 2017 19:45:58 +0200
Message-ID: <20170202174558.epha55gfhhc5i3tj@kozik-lap>
References: <1484885997-21004-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170120041722epcas5p174400b9943db114afa311f031f5ba81d@epcas5p1.samsung.com>
 <1484885997-21004-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484885997-21004-4-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sanath-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 20, 2017 at 09:49:57AM +0530, Pankaj Dubey wrote:
> Usage of DTS macros instead of hard-coded numbers makes code easier to
> read.  One does not have to remember which value means pull-up/down or
> specific driver strength.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts |   4 +-
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi | 302 ++++++++++++------------
>  2 files changed, 154 insertions(+), 152 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
