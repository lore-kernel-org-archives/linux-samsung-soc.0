From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: Enable S3C RTC on Trats2, Odroid-U3 and
 Arndale Octa
Date: Thu, 02 Apr 2015 14:18:34 +0200
Message-ID: <551D339A.5000808@collabora.co.uk>
References: <1427972588-6573-1-git-send-email-k.kozlowski@samsung.com> <1427972588-6573-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427972588-6573-2-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 04/02/2015 01:03 PM, Krzysztof Kozlowski wrote:
> Extend the S3C RTC node with rtc_src clock so it could be operational.
> The rtc_src clock is provided by MAX77686 (Trats2 and Odroid-U3) or
> S2MPS11 (Arndale Octa).
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

Best regards,
Javier

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
