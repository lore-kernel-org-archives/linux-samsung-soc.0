From: Pawel Osciak <p.osciak@samsung.com>
Subject: RE: [PATCH 01/19] s3c-fb: Change to depending on CONFIG_S3C_FB_DEV
Date: Fri, 09 Jul 2010 13:55:38 +0200
Message-ID: <002801cb1f5d$a5c5e2e0$f151a8a0$%osciak@samsung.com>
References: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
 <1278665407-18002-2-git-send-email-p.osciak@samsung.com>
 <028801cb1f5a$8fe5c970$afb15c50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21443 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754063Ab0GIL5H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jul 2010 07:57:07 -0400
In-reply-to: <028801cb1f5a$8fe5c970$afb15c50$%kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, akpm@linux-foundation.org, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>

>Kukjin Kim <kgene.kim@samsung.com>:
>Pawel Osciak wrote:
>>
>> From: Ben Dooks <ben-linux@fluff.org>
>>
>> As suggested by Marek Szyprowski, we should make the driver depend on
>> the configuration currently being used to build the platform device
>> into the kernel.
>>
>> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
>> Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
>
>Actually, already submitted by Ben Dooks.
>http://lists.infradead.org/pipermail/linux-arm-kernel/2010-May/015616.html
>
>So...I'm not sure adding your signedoff and re-submitting are right.
>
>In my opinion, it's enough to add comments which includes information about
>that without re-submitting.
>

Adding signoffs is a normal procedure when submitting somebody else's patches
with their permission. The problem here is that I wasn't aware of them being
already posted, there must've been a miscommunication between me and Ben when
I asked him if it was ok to submit his patches along with mine.
Sorry Ben!

Anyway, thank you for pointing this out.  Of course, my sign-offs can be
removed from the first 7 patches.


Best regards
--
Pawel Osciak
Linux Platform Group
Samsung Poland R&D Center


>> ---
>>  drivers/video/Kconfig |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
>> index 3d94a14..858f1ca 100644
>> --- a/drivers/video/Kconfig
>> +++ b/drivers/video/Kconfig
>> @@ -1930,7 +1930,7 @@ config FB_TMIO_ACCELL
>>
>>  config FB_S3C
>>  	tristate "Samsung S3C framebuffer support"
>> -	depends on FB && ARCH_S3C64XX
>> +	depends on FB && S3C_DEV_FB
>>  	select FB_CFB_FILLRECT
>>  	select FB_CFB_COPYAREA
>>  	select FB_CFB_IMAGEBLIT
>> --
>
>Thanks.
>
>Best regards,
>Kgene.
>--
>Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
>SW Solution Development Team, Samsung Electronics Co., Ltd.
