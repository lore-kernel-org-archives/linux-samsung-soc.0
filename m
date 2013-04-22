From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: no more support non-DT for EXYNOS
 SoCs
Date: Tue, 23 Apr 2013 02:08:40 +0900
Message-ID: <51756E98.9040606@samsung.com>
References: <51642dab.e844440a.0ad1.ffffc13f@mx.google.com> <201304101459.07263.arnd@arndb.de> <51656D2D.7060004@samsung.com> <201304101555.27984.arnd@arndb.de> <516571BC.9030909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:63515 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753076Ab3DVRIp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 13:08:45 -0400
Received: by mail-pa0-f42.google.com with SMTP id kl13so24424pab.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Apr 2013 10:08:44 -0700 (PDT)
In-Reply-To: <516571BC.9030909@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Olof Johansson' <olof@lixom.net>

On 04/10/13 23:05, Kukjin Kim wrote:
> On 04/10/13 22:55, Arnd Bergmann wrote:
>> On Wednesday 10 April 2013, Sylwester Nawrocki wrote:
>>> Hmm, it turns out we are still actively using some boards based on
>>> Exynos4210 EVT0 SoCs. And since it seems unlikely the patches from
>>> Tomasz [1] adding basic DT support for those will get merged for
>>> 3.10, it would be a bit inconvenient to remove the ATAGS support
>>> now, leaving Exynos4210 Rev. 0 not supported at all.
>>
>> I still have hope to get those included.
>>
> I agree and I asked Tomasz to re-send universal dt patch.
>
Hi Arnd and Olof,

Is it possible to send one more pull-request for this and something like 
dt patches for exynos?

- Kukjin
