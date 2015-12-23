From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v9 0/4] Exynos SROMc configuration and Ethernet support
 for SMDK5410
Date: Wed, 23 Dec 2015 21:15:53 +0900
Message-ID: <567A9079.9030400@samsung.com>
References: <cover.1447659546.git.p.fedin@samsung.com>
 <56724519.80108@samsung.com> <019e01d13974$c432fb00$4c98f100$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <019e01d13974$c432fb00$4c98f100$@samsung.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Kukjin Kim' <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 18.12.2015 o 18:16, Pavel Fedin pisze:
>  Hello!
> 
>> 4. This branch is not pushed to linux-next. I will sort it out if my
>> previous pull requests get in. I will be out of office for Christmas so
>> depending on the timing of {arm-soc,Christmas,Kukjin} this may or may
>> not go into v4.5 (yay...).
>>
>> 5. If it does not get into v4.5, I will rebase it and proceed further
>> for v4.6.
>>
>> If you have any questions, please let me know.
> 
>  Thank you very much. No, i don't have any questions, i'm glad that my work is picked up and not lost, i'm just keeping an eye on it
> until it goes to stable.
> 
>  P.S. Not related to these sets directly, just to note... When i was writing the doc for SROMc bindings, i noticed that we have two
> directories for Exynos in Documentation/devicetree/bindings/arm:
> 1. Documentation/devicetree/bindings/arm/exynos
> 2. Documentation/devicetree/bindings/arm/Samsung
> 
>  In (1) we have only a single old file, shouldn't this be cleaned up and shouldn't this file be moved to (2)?

Thanks for hind but I already cleaned it up:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=068812ed108acbfe070b893faba9845fe2ea3fd9

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
