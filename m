From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: add support GPIO for EXYNOS5250
Date: Sat, 04 Feb 2012 14:46:53 +0100
Message-ID: <4F2D36CD.3070204@gmail.com>
References: <1328025040-4751-1-git-send-email-kgene.kim@samsung.com> <1328025040-4751-2-git-send-email-kgene.kim@samsung.com> <4F2817FA.5020407@samsung.com> <20120202182214.GN15343@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:46090 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752375Ab2BDNr2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 4 Feb 2012 08:47:28 -0500
Received: by eekc14 with SMTP id c14so1508250eek.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Feb 2012 05:47:27 -0800 (PST)
In-Reply-To: <20120202182214.GN15343@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sangsu Park <sangsu4u.park@samsung.com>

On 02/02/2012 07:22 PM, Grant Likely wrote:
>>>   /* the end of the EXYNOS4 specific gpios */
>>>   #define EXYNOS4_GPIO_END	(EXYNOS4_GPZ(EXYNOS4_GPIO_Z_NR) + 1)
>>> -#define S3C_GPIO_END		EXYNOS4_GPIO_END
>>>
>>> -/* define the number of gpios we need to the one after the GPZ() range */
>>> -#define ARCH_NR_GPIOS		(EXYNOS4_GPZ(EXYNOS4_GPIO_Z_NR) +	\
>>> -				 CONFIG_SAMSUNG_GPIO_EXTRA + 1)
>>> +/* EXYNOS5 serise */
>>> +/* GPIO bank sizes */
>>> +#define EXYNOS5_GPIO_A0_NR	(8)
>>
>> nit: It's been always a mystery to me, what are the parentheses around the
>> numbers helpful for ? IMHO even if there is more things like this in
>> the file it might be better to skip extra parentheses here.
> 
> It protects against the preprocessor combining a macro with other code in
> unpredictable ways.  For example:
> 
> #define SIZE  10 + 20
> int i = SIZE * 5;
> 
> Without the parenthesis the result of i is 110, when the programmer would
> expect 150.

Right, I guess it's a fundamental requirement most people are aware about. 
Nevertheless my point were only single integers.

> For single integers like these, the parenthesis aren't actually necessary, but
> I given that for every other #define it is good practice, I don't object to
> seeing them on single integers also.

I respect that but I have a different opinion. :-) Those parentheses have 
always been bugging me, they decrease readability for virtually no benefit. 
They're more an aesthetic issue though so I wouldn't argue more about it. 
Just will try to get used, and I'll avoid them where possible. :-)

--
Regards,
Sylwester
