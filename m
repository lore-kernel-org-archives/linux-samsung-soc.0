From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung fixes-1 for v3.10
Date: Sun, 28 Apr 2013 15:34:46 +0900
Message-ID: <517CC306.6030508@samsung.com>
References: <51795C62.8070500@samsung.com> <20130427010137.GD2350@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:41363 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423Ab3D1Gew (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Apr 2013 02:34:52 -0400
Received: by mail-pd0-f169.google.com with SMTP id 10so3135119pdc.14
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Apr 2013 23:34:52 -0700 (PDT)
In-Reply-To: <20130427010137.GD2350@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 04/27/13 10:01, Olof Johansson wrote:
> On Fri, Apr 26, 2013 at 01:40:02AM +0900, Kukjin Kim wrote:
>> The following changes since commit 58a7bbf75442ea439a4d3b7993ad87023e406063:
>>
>>    ARM: dts: add PDMA0 changes for exynos5440 (2013-04-09 01:39:27 +0900)
>
> So these are fixes based on code that's already staged. We normally
> don't do that -- if you have a fix for a specific branch that introduced
> something, send a fresh pull request for that branch.
>
OK.

> Looks like Doug's fix is for the common clock framework branch, so I'll apply
> it to next/drivers. Thomas' is for the dt branch. I'll cherry-pick it onto
> next/dt2.
>
I'm fine. Thanks.

- Kukjin
