From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 6/6] ARM: S3C24XX: Convert s3c2416 and s3c2443 to common
 clock framework
Date: Tue, 06 Aug 2013 02:03:39 +0900
Message-ID: <51FFDAEB.60508@samsung.com>
References: <201307100057.06061.heiko@sntech.de> <201307100100.28992.heiko@sntech.de> <02cf01ce81f3$6777e5f0$3667b1d0$%kim@samsung.com> <2236509.stVfXyPhpt@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:45853 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752338Ab3HERDp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Aug 2013 13:03:45 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so3484965pdi.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Aug 2013 10:03:45 -0700 (PDT)
In-Reply-To: <2236509.stVfXyPhpt@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?=27Heiko_St=FCbn?= =?ISO-8859-1?Q?er=27?= <heiko@sntech.de>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene@kernel.org>

On 07/23/13 02:07, Tomasz Figa wrote:
> On Tuesday 16 of July 2013 16:09:24 Kukjin Kim wrote:

[...]

>>> +	timer@51000000 {
>>> +		clocks =<&clocks PCLK_PWM>;
>>
>> +		clocks =<&clock PCLK_PWM>;
>>
>> And I'm not sure using definition PCLK_PWM is better here...
>
> Care to explain your doubts about it? I think this is fine.
>
I mean just would be better to use hard coded number here instead of 
PCLK_PWM like others.

- Kukjin
