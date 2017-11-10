From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos: Add sound support for Odroid XU4
Date: Fri, 10 Nov 2017 18:15:56 +0100
Message-ID: <20171110171556.7ecu4cd4u7vnwhop@kozik-lap>
References: <20171103165446.15438-1-s.nawrocki@samsung.com>
 <CGME20171103165612epcas2p38df1787630b2dfbf1d0d0e3ef1b93a49@epcas2p3.samsung.com>
 <20171103165446.15438-3-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171103165446.15438-3-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mihailescu2m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Nov 03, 2017 at 05:54:46PM +0100, Sylwester Nawrocki wrote:
> This patch adds support for Odroid XU4 audio. The main difference
> comparing to Odroid XU3 is a missing on-board audio CODEC, only
> HDMI output is supported on Odroid XU4. External CODEC could be
> optionally connected to the I2S port connector.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts | 52 ++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>

Looks good, I will take it after merge window. For my own reference:
Reviewed-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
