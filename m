From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH] rtc: s3c: Document required clocks in the DT
 binding
Date: Mon, 15 Feb 2016 09:49:34 -0300
Message-ID: <56C1C95E.7030002@osg.samsung.com>
References: <1455038632-14545-1-git-send-email-javier@osg.samsung.com>
 <56C01FDD.9050204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C01FDD.9050204-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

Thanks a lot for your feedback.

On 02/14/2016 03:34 AM, Krzysztof Kozlowski wrote:
> W dniu 10.02.2016 o 02:23, Javier Martinez Canillas pisze:
>> The S3C Real Time Clock driver requires the clock and source clock to
>> be defined in the device node but that requirement is not documented.
>
> +Cc: Alessandro Zummo
>

I didn't add Alessandro to cc deliberately since Alexandre is the one
maintaining the RTC subsystem lately and before that, the RTC patches
were picked by Andrew Morton since Alessandro didn't even answer the
emails.
  
> No, not entirely. The samsung,s3c6410-rtc needs rtc and rtc_src clocks
> but rest of compatible devices need only rtc clock.
>

Right, sorry for missing that. I noticed that this patch has already
been picked by Rob Herring (I thought it would be picked by Alexandre
though) so I will post a follow up patch explaining that rtc_src is
only for the s3c6410-rtc compatible.

> Best regards,
> Krzysztof
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
