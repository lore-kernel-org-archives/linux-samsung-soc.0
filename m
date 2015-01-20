From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv8 2/9] devfreq: event: Add resource-managed function for
 devfreq-event device
Date: Tue, 20 Jan 2015 13:47:41 +0900
Message-ID: <54BDDDED.7050009@samsung.com>
References: <900879710.1308121421729191415.JavaMail.weblogic@epmlwas04a>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50464 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752115AbbATErn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jan 2015 23:47:43 -0500
In-reply-to: <900879710.1308121421729191415.JavaMail.weblogic@epmlwas04a>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@samsung.com
Cc: "kgene@kernel.org" <kgene@kernel.org>, =?UTF-8?B?67CV6rK966+8?= <kyungmin.park@samsung.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, ABHILASH KESAVAN <a.kesavan@samsung.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 01/20/2015 01:46 PM, MyungJoo Ham wrote:
>>   
>>  This patch add the resource-managed function for devfreq-event device as
>> following functions. The devm_devfreq_event_add_edev() manages automatically
>> the memory of devfreq-event device using resource management.
>> - devm_devfreq_event_add_edev()
>> - devm_devfreq_event_remove_edev()
>>
>> Cc: Myungjoo Ham <myungjoo.ham@samsung.com>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.comA
> 
> Reviewed-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> 
> You may merge this patch with 1/9 as well.
> I don't think this is a major change the requires a seperated patch.

OK. I'll merge it. on patch1.

Best Regards,
Chanwoo Choi
