From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Add support for HDMI audio on
 exynos5433-tm2
Date: Wed, 07 Feb 2018 17:48:19 +0100
Message-ID: <24c7afa6-5497-2182-7e4c-cd19dd891230@samsung.com>
References: <CGME20180205172216epcas2p3be603e84df81b28ee4c04c9b1c1c551f@epcas2p3.samsung.com>
        <20180205172110.9897-1-s.nawrocki@samsung.com>
        <20180205172110.9897-2-s.nawrocki@samsung.com>
        <CAJKOXPef+8UvinoK-9j6tPMgNavMw1K1BhLuibD5FomjRC9Sbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPef+8UvinoK-9j6tPMgNavMw1K1BhLuibD5FomjRC9Sbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/06/2018 02:14 PM, Krzysztof Kozlowski wrote:
> Please move it further to i2s1 so all the nodes/labels will be ordered
> alphabetically. As with #1 I understand that there is no explicit
> dependency so please correct me if I am wrong.

Yes, there is no dependency, the only side effect will that the newly introduced 
ALSA PCM device for the HDMI port will not work until this patch is applied.

-- 
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
