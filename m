From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 17:23:38 -0300
Message-ID: <56E71DCA.7090608@osg.samsung.com>
References: <1457982308-29848-1-git-send-email-javier@osg.samsung.com>
 <1457982675.11972.119.camel@perches.com> <56E7119B.9060900@osg.samsung.com>
 <1457984317.11972.123.camel@perches.com> <56E71825.5070104@osg.samsung.com>
 <1457985791.11972.128.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53814 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753263AbcCNUXq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 16:23:46 -0400
In-Reply-To: <1457985791.11972.128.camel@perches.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

Hello Joe,

On 03/14/2016 05:03 PM, Joe Perches wrote:
> On Mon, 2016-03-14 at 16:59 -0300, Javier Martinez Canillas wrote:
>> I don't think they make little sense now since even a non-native english
>> speaker like me can understand it :)
> 
> That's a non sequitur if ever I read one.
>

I was trying to be funny but it seems that I failed.
 
>> But yes, it's cryptic at the very least. That's the problem with long text
>> and the 80 char limit to make checkpatch.pl happy. I guess I can just move
>> the message a little bit even if that will make to not be properly aligned.
> 
> There's no issue with longer than 80 column lines
> for these messages.  checkpatch wouldn't complain.
> 

Great, I didn't know that checkpatch had an exception for the 80 column
rule. I'll post a v2 then.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
