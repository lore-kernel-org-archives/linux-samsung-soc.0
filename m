From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4 v3] Add a new board TOPEET iTOP for exynos 4412
Date: Tue, 30 Aug 2016 09:04:52 +0200
Message-ID: <babd37da-371a-3530-0ac5-502f3297239d@kernel.org>
References: <CAL_JsqKY=VEZ+U11kY+XbMWuXhaFDr6GpnR3AXKd1U=9_=8fgA@mail.gmail.com>
 <1472383269-3126-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1472383269-3126-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/28/2016 01:21 PM, Randy Li wrote:
> The added the audio codec seems work now, but the audio sounds
> still a little different to the original. But I didn't hear the sound
> in the Android, I don't know whether it is qualified.
> 
> Also it lacks of full pinctrl for the sleep state.
> 
> Changelog:
>  - v3:
>    - fixing the rtc clock, using clock source from PMIC
>    - enable the tmu
>    - enable the fimc for elite board
>    - suuport the audio codec at elite board
>    - fixing minor bugs in the last commit
>  - v2:
>    - removing rtc node
>      the clock source driver is not done yet.
>    - adding exynos-bus
>    - fixing the MFC

The way you send emails is really messed up.
1. The v3 in "PATCH v3" should be present in all patches. Use -v3 for
format-patch.

2. Don't reply-in-to old thread. All your new patches are now under old
ones. They have same subject so this is highly confusing. I don't have a
clue which is a new one.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
