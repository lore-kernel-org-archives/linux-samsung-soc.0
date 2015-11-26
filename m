From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Thu, 26 Nov 2015 08:58:20 -0300
Message-ID: <5656F3DC.8050308@osg.samsung.com>
References: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
 <56428F34.7060003@samsung.com> <56531B1F.9050502@osg.samsung.com>
 <5653DEA2.6060802@samsung.com> <5653E851.4070608@osg.samsung.com>
 <56568140.3060302@samsung.com> <5656F1D6.2070409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:59068 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750840AbbKZL60 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 06:58:26 -0500
In-Reply-To: <5656F1D6.2070409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, j.anaszewski@samsung.com

Hello Andrzej,

On 11/26/2015 08:49 AM, Andrzej Hajda wrote:
> Hi Javier, Krzysztof,
> 
> On 11/26/2015 04:49 AM, Krzysztof Kozlowski wrote:
> ...
>> Do you have some test cases for MFC? I know that Gstreamer has support
>> for it but I don't know what Gst pipelines I can use to test if all is
>> working correctly.
>> Yes, I think we have. I think Jacek Anaszewski or Andrzej Hajda (both
>> Cc-ed) were developing MFC drivers and testing it.
>>
>> Jacek, Andrzej, Marek,
>>
>> Do you have test cases for Exynos MFC drivers? Is it possible to share them?
> 
> There are test apps at:
> http://git.linuxtv.org/cgit.cgi/snawrocki/samsung-utils.git/
> v4l2-mfc-example - MFC decoder,
> v4l2-mfc-encoder - MFC encoder,
>

Great, thanks a lot for the information.
 
> 
> Regards
> Andrzej
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
