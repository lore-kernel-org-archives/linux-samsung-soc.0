From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos: Add support for HDMI audio on
 exynos5433-tm2
Date: Mon, 12 Feb 2018 12:47:45 +0100
Message-ID: <c40f9d95-cf7d-c505-ab56-55b475efe136@samsung.com>
References: <CGME20180208184446epcas2p2a5a59112f29b97dad9deb820699eb741@epcas2p2.samsung.com>
        <20180208184408.24185-1-s.nawrocki@samsung.com>
        <20180208184408.24185-3-s.nawrocki@samsung.com>
        <CAJKOXPfXR3pRcTy_y2jwg7R8Pkg15+VJyOvCaXvQa8ZHS=HeBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPfXR3pRcTy_y2jwg7R8Pkg15+VJyOvCaXvQa8ZHS=HeBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/12/2018 10:28 AM, Krzysztof Kozlowski wrote:
>> +&i2s1 {
>> +       assigned-clocks = <&i2s1 CLK_I2S_RCLK_SRC>;
>> +       assigned-clock-parents = <&cmu_peric CLK_SCLK_I2S1>;
>
> Reorder alphabetically the node (and then you'll see you already add
> one for i2s1).

Oops, my fault, let me correct this again and resend.

-- 
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
