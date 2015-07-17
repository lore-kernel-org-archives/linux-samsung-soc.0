From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 2/4] mfd: max77686: Use a generic name for the PMIC
 node in the example
Date: Fri, 17 Jul 2015 11:19:26 +0200
Message-ID: <55A8C89E.8010606@osg.samsung.com>
References: <1437114567-17629-1-git-send-email-javier@osg.samsung.com>
 <1437114567-17629-3-git-send-email-javier@osg.samsung.com>
 <55A8C6B2.5020109@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53382 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756717AbbGQJTc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jul 2015 05:19:32 -0400
In-Reply-To: <55A8C6B2.5020109@cogentembedded.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org

Hello Sergei,

On 07/17/2015 11:11 AM, Sergei Shtylyov wrote:
> Hello.
> 
> On 7/17/2015 9:29 AM, Javier Martinez Canillas wrote:
> 
>> The ePAR standard says that: "the name of a node should be somewhat
> 
>    ePAPR.
>

Thanks for pointing it out. I guess that Lee can fix the typo when applying?

>> generic, reflecting the function of the device and not its precise
>> programming model."
> 
>> So, change the max77686 binding document example to use a generic
>> node name instead of using the chip's name.
> 
>> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> MBR, Sergei
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
