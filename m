From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [rtc-linux] Re: [PATCH 1/2] drivers/rtc/rtc-s3c.c: Integrate
 Exynos3250 into S3C6410
Date: Tue, 31 Mar 2015 11:00:31 +0200
Message-ID: <CAJKOXPemefBOfOUV_azuJbiOMGurZLTGtFKBx7rW6NCgu+sjvQ@mail.gmail.com>
References: <1427728773-29065-1-git-send-email-k.kozlowski@samsung.com>
	<1427728773-29065-2-git-send-email-k.kozlowski@samsung.com>
	<20150331002709.GF3849@piout.net>
	<CABxcv==+h8R-tL9D5OXmYsuYfs_cLATViZ3N1veZwZBZF=fu0Q@mail.gmail.com>
	<20150331082052.GI3849@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150331082052.GI3849-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

2015-03-31 10:20 GMT+02:00 Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi,
>
> On 31/03/2015 at 08:49:39 +0200, Javier Martinez Canillas wrote :
>> Hello Alexandre,
>>
>> On Tue, Mar 31, 2015 at 2:27 AM, Alexandre Belloni
>> <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > nitpick: I would prefer rtc: rtc-s3c instead of drivers/rtc/rtc-s3c.c
>> >
>>
>> Yes but Krzysztof is following the convention used in drivers/rtc/
>> which I think is the correct thing to do even when it's different from
>> what is used all over the kernel.
>>
>
> Having a look at the git history, the first and most used prefix is
> actually 'rtc:' at some point, this started to change to 'drivers/rtc/'.
> We should probably start to get back to 'rtc:', like most subsystems.

Yes, I used "rtc: driver_name:" before but I saw that Andrew changes
them to full path when he picks the patch. So this time I wanted to
reduce the overhead for him... Anyway I'll stick to one format ("rtc:
rtc-s3c:") as you proposed.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
