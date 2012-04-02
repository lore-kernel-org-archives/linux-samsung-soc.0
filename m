From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/6] S3C24XX: Add support for HSSPI on S3C2416/S3C2443
Date: Mon, 02 Apr 2012 14:00:04 -0700
Message-ID: <4F7A1354.5050904@samsung.com>
References: <201203121959.32966.heiko@sntech.de> <201204022125.33629.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49030 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752467Ab2DBVAE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 17:00:04 -0400
Received: by pbcun15 with SMTP id un15so4829930pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Apr 2012 14:00:04 -0700 (PDT)
In-Reply-To: <201204022125.33629.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
> Am Montag 12 M=E4rz 2012, 19:59:32 schrieb Heiko St=FCbner:
>> The S3C2416/S3C2443/S3C2450 SoCs contain HSSPI controllers compatibl=
e
>> with the ones in the S3C64xx and later.
>>
>> The second patch modifying the dma selection depends on the series
>> enabling the dma support on the S3C2416, but as the whole s3c64xx-sp=
i
>> driver needs dma support this should be ok.
>>
>> Tested on an Asus DR-900 ebook reader with a Marvell MR8686 using th=
e
>> libertas driver.
>>
>>
>> This is a repost of the series adapted to changes resulting from the
>> other cleanup series.
>
> ping :-)
>
Thanks for your reminder ;)
Let me review it soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
