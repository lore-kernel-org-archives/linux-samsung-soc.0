From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/6] S3C24XX: Add support for HSSPI on S3C2416/S3C2443
Date: Tue, 24 Apr 2012 18:37:04 -0700
Message-ID: <4F975540.5080000@samsung.com>
References: <201203121959.32966.heiko@sntech.de> <201204022125.33629.heiko@sntech.de> <4F7A1354.5050904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:37504 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757303Ab2DYBhH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 21:37:07 -0400
Received: by pbbro12 with SMTP id ro12so801940pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 18:37:07 -0700 (PDT)
In-Reply-To: <4F7A1354.5050904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> Heiko St=FCbner wrote:
>> Am Montag 12 M=E4rz 2012, 19:59:32 schrieb Heiko St=FCbner:
>>> The S3C2416/S3C2443/S3C2450 SoCs contain HSSPI controllers compatib=
le
>>> with the ones in the S3C64xx and later.
>>>
>>> The second patch modifying the dma selection depends on the series
>>> enabling the dma support on the S3C2416, but as the whole s3c64xx-s=
pi
>>> driver needs dma support this should be ok.
>>>
>>> Tested on an Asus DR-900 ebook reader with a Marvell MR8686 using t=
he
>>> libertas driver.
>>>
>>>
>>> This is a repost of the series adapted to changes resulting from th=
e
>>> other cleanup series.
>>
>> ping :-)
>>
> Thanks for your reminder ;)
> Let me review it soon.
>
Heiko, sorry for late.
Looks ok to me, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
