From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: Add tmu node for exynos7
Date: Mon, 07 Mar 2016 13:14:26 +0900
Message-ID: <56DD0022.20800@samsung.com>
References: <1456477590-4530-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1456477590-4530-1-git-send-email-alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 26.02.2016 18:06, Alim Akhtar wrote:
> This patch adds tmu node, related temprature sensor and triping
> point data for Atlas cpu core found on exynos7 SoC.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v1:
> * Addressed krzysztof's review comments.
> 
>  .../boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi   |   25 +++++++++
>  .../arm64/boot/dts/exynos/exynos7-trip-points.dtsi |   54 ++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7.dtsi            |   20 ++++++++
>  3 files changed, 99 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7-tmu-sensor-conf.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7-trip-points.dtsi
>

Looks good to me.
Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

I don't have anything in DTS queue for v4.6 and it is late so I'll apply
this for v4.7 after upcoming merge window.

Best regards,
Krzysztof


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
