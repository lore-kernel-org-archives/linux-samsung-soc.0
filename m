From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/5] ARM: S5PV210: Add support CPUFREQ for S5PV210/S5PC110
Date: Fri, 17 Sep 2010 13:30:03 +0900
Message-ID: <AANLkTimT6eWpZrbiW3Segt5XSAa=V5rnsYYHkv1Awz0V@mail.gmail.com>
References: <1284537162-3129-1-git-send-email-jc.lee@samsung.com>
	<AANLkTikB288=Y8_jMXCwfsEBqwRdOTKyjMJag=SCKYdP@mail.gmail.com>
	<03ca01cb5620$42a51b50$c7ef51f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:63674 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750724Ab0IQEaF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Sep 2010 00:30:05 -0400
Received: by wyf22 with SMTP id 22so2029572wyf.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2010 21:30:04 -0700 (PDT)
In-Reply-To: <03ca01cb5620$42a51b50$c7ef51f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jaecheol Lee <jc.lee@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, =?EUC-KR?B?x9S47cHW?= <myungjoo.ham@samsung.com>, Andrew Morton <akpm@linux-foundation.org>

2010/9/17 Kukjin Kim <kgene.kim@samsung.com>:
> Kyungmin Park wrote:
>>
>> First thank you for posting the patches.
>> but I'm worry about sending the same feature patches from different
> divisions.
>>
> It doesn't matter which division it is from.
> What matters is the quality of the patch.
> Any patches can be submitted anytime anywhere.
>
>> I'm not sure you're talking with kgene. but there are some codes
>> posted by Mr. Ham and get feedback and reviewed with kgene.
>> http://git.infradead.org/users/kmpark/linux-2.6-
>> samsung/shortlog/refs/heads/cpufreq
>>
>> To kgene,
>> One code from DMC(me), another code from System LSI(you). then which
>> codes do you pick up and apply to mainline?
>
> As I said, it is not important where it is from.
> I will apply the best patch.
>
>> and what's rules or principles?
>>
> The best patch will get merged.
> And I think that's the purpose of mailing lists
> - to put all ideas together and find the best solution.

But no need to do same things. Look at the patches. do the same
mistake, e.g., hard-corded values. but Mr. Ham's patch already fixed
it and support full features.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
