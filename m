From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 2/2] ARM: dts: add TOPEET itop elite based board
Date: Wed, 19 Oct 2016 08:51:24 +0300
Message-ID: <CAJKOXPd4xWab2esbELgses+bG=PkJbc_Q_YzQcmeiCdKNaFvzg@mail.gmail.com>
References: <devicetree@vger.kernel.org> <1476811129-4450-1-git-send-email-ayaka@soulik.info>
 <1476811129-4450-3-git-send-email-ayaka@soulik.info> <20161018173748.GB30003@kozik-lap>
 <58DB0A67-6C74-409B-80B2-9F02492D3A55@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58DB0A67-6C74-409B-80B2-9F02492D3A55-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 19, 2016 at 4:15 AM, Ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org> wrote:
>
>
> 從我的 iPad 傳送
>
>> Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 於 2016年10月19日 上午1:37 寫道：
>>
>>> On Wed, Oct 19, 2016 at 01:18:49AM +0800, Randy Li wrote:
>>> The TOPEET itop exynos 4412 have three versions base board. The
>>> Elite version is the cheap one without too much peripheral devices
>>> on it.
>>>
>>> Currently supported are serial console, wired networking(USB),
>>> USB OTG in peripheral mode, USB host, SD storage, GPIO buttons,
>>> PWM beeper, ADC and LEDs. The WM8960 analog audio codec is also
>>> enabled.
>>>
>>> The FIMC is not used for camera currently, I enabled it just for a
>>> colorspace converter.
>>>
>>> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
>>> Reviewed-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Thanks, applied, with missing Rob's ack, minor changes in commit msg and
>> fix in pin function (you used macro for pull up/down instead of
>> function).
> The last time I saw the other dts have applied that, but they are not now. A header file is also missed reported by kbuild, but I didn't meet that.

I wonder why I didn't encounter the build error on my machine... This
needs a follow up fix.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
