From: Denis Kuzmenko <linux@solonet.org.ua>
Subject: Re: [PATCH v3 resend2] s3c/s3c24xx: arm: leds: Make s3c24xx LEDS
 driver use gpiolib
Date: Tue, 13 Dec 2011 23:33:33 +0200
Message-ID: <4EE7C4AD.8090805@solonet.org.ua>
References: <4EE7B41C.5080006@solonet.org.ua>	 <1323810417.3837.25.camel@joe2Laptop> <4EE7C1C9.8080000@solonet.org.ua> <1323811732.3837.27.camel@joe2Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:53646 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753692Ab1LMVfL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Dec 2011 16:35:11 -0500
In-Reply-To: <1323811732.3837.27.camel@joe2Laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Richard Purdie <rpurdie@rpsys.net>

On 12/13/2011 11:28 PM, Joe Perches wrote:
> On Tue, 2011-12-13 at 23:21 +0200, Denis Kuzmenko wrote:
>> Hi Joe,
>> Thank you for review.
>>
>> On 12/13/2011 11:06 PM, Joe Perches wrote:
>>> On Tue, 2011-12-13 at 22:22 +0200, Denis Kuzmenko wrote:
>>>> Make s3c24xx LEDS driver use gpiolib. Fix error disabling pull during probe.

> Your choice, but I think consistency is better.
> 
> The LEDF_ACTLOW use is dependent on it being #defined
> to 1 when using ^.  I think that's unintelligible.

Sorry, can't understand. Can you please clarify last two sentences?

-- 
Best regards, Denis Kuzmenko.
