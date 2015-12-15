From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 12/19] ARM: dts: exynos: replace legacy *,wakeup property
 with wakeup-source
Date: Wed, 16 Dec 2015 08:32:02 +0900
Message-ID: <5670A2F2.5060009@samsung.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-13-git-send-email-sudeep.holla@arm.com>
 <56704141.8070308@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <56704141.8070308-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 16.12.2015 01:35, Sudeep Holla wrote:
> 
> 
> On 21/10/15 11:10, Sudeep Holla wrote:
>> Though the keyboard and other driver will continue to support the legacy
>> "gpio-key,wakeup", "linux-keypad,wakeup" boolean property to enable the
>> wakeup source, "wakeup-source" is the new standard binding.
>>
>> This patch replaces all the legacy wakeup properties with the unified
>> "wakeup-source" property in order to avoid any futher copy-paste
>> duplication.
>>
>> Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Ping, do you prefer taking via your tree or should I send to armsoc
> directly ?

Usually it depends on the dependencies... but:
1. I just received this patch - 12/19.
2. No cover letter, no other patches, no explanation about any
dependencies or other related changes. Nothing. Just one patch.
3. The patch mentions new standard binding. Was the new binding already
merged? Or is it part of these series? What about backward compatibility?

BR,
Krzysztof


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
