From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: no more support non-DT for EXYNOS
 SoCs
Date: Wed, 10 Apr 2013 23:05:48 +0900
Message-ID: <516571BC.9030909@samsung.com>
References: <51642dab.e844440a.0ad1.ffffc13f@mx.google.com> <201304101459.07263.arnd@arndb.de> <51656D2D.7060004@samsung.com> <201304101555.27984.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:45174 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759722Ab3DJOFy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 10:05:54 -0400
Received: by mail-pd0-f179.google.com with SMTP id x11so286357pdj.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Apr 2013 07:05:54 -0700 (PDT)
In-Reply-To: <201304101555.27984.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Olof Johansson' <olof@lixom.net>

On 04/10/13 22:55, Arnd Bergmann wrote:
> On Wednesday 10 April 2013, Sylwester Nawrocki wrote:
>> Hmm, it turns out we are still actively using some boards based on
>> Exynos4210 EVT0 SoCs. And since it seems unlikely the patches from
>> Tomasz [1] adding basic DT support for those will get merged for
>> 3.10, it would be a bit inconvenient to remove the ATAGS support
>> now, leaving Exynos4210 Rev. 0 not supported at all.
>
> I still have hope to get those included.
>
I agree and I asked Tomasz to re-send universal dt patch.

>> Not sure what's others opinion on that, and what would be an advantage
>> of removing non-dt support for Exynos now, rather than in 3.11, vs. any
>> possible inconvenience and regressions this could cause.
>
> A multiplatform kernel will not work on an ATAGS based Exynos platform,
> but I think we can have it both ways and allow either multiplatform
> DT-only or single-platform with both DT and ATAGS in 3.10.
>
I think, if possible, keeping both way would be nice to us.

Thanks.

- Kukjin
