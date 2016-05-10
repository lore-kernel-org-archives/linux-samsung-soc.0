From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 22/22] ARM: dts: exynos: Add initial support for Odroid
 XU board
Date: Tue, 10 May 2016 07:35:47 +0200
Message-ID: <57317333.5010309@kernel.org>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-23-git-send-email-krzk@kernel.org>
 <cbcb5657-8825-83cf-688f-d565ac7ecbab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <cbcb5657-8825-83cf-688f-d565ac7ecbab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/10/2016 12:02 AM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 05/08/2016 03:06 PM, Krzysztof Kozlowski wrote:
>> The Hardkernel's Odroid XU board was first design with big.LITTLE SoC
>> from Samsung: the Exynos5410. Comparing now to more popular Odroid XU3
>> the differences are:
>> 1. Exynos5410 instead of 5422,
>> 2. DisplayPort,
>> 3. Main PMIC: Maxim 77802 instead of S2MPS11,
>> 4. USB3503+LAN9730 instead of integrated LAN9514,
>> 5. eMMC 4.5 instead of eMMC 5.0,
>>
>> This patch adds initial support for the XU board with working basic
>> functions, eMMC/SD and USB (including attached ethernet adapter).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
> 
> This DTS has some TODO's, FIXME's and commented input supplies. Probably
> this patch should had been an RFC? or you should mention about these in
> the commit message to understand why are there.

I have to clean it up or fix these notes. Actually I was quite surprised
that board worked fine with this basic setup.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
