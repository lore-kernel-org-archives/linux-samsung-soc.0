From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC] Sort out S5P SoCs support in mainline
Date: Wed, 28 May 2014 13:09:00 +0200
Message-ID: <5385C3CC.6010509@gmail.com>
References: <021f01cf7a61$69853e30$3c8fba90$@samsung.com> <13875033.1X6R9lksgc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:54605 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830AbaE1LJH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 07:09:07 -0400
Received: by mail-wi0-f171.google.com with SMTP id cc10so3486951wib.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 May 2014 04:09:03 -0700 (PDT)
In-Reply-To: <13875033.1X6R9lksgc@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olof@lixom.net>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

On 28.05.2014 13:04, Arnd Bergmann wrote:
> On Wednesday 28 May 2014 19:41:41 Kukjin Kim wrote:
>> Hi all,
>>
>> I'm wondering who need to support following SoCs/boards in mainline.
>>
>> * S5P64X0/SMDK6440 and SMDK6450
>> * S5PC100/SMDKC100
>>
>> If nobody is using them, how about to remove them from mainline?
> 
> I talked about this with Tomasz Figa before, he also thinks they can be removed.
> I don't see any reason to keep them myself, and will apply a patch to remove
> them. Of course, if later somebody comes around who does need them, we can
> revert the patch to bring them back.

Or better, if later somebody comes around who does need them, we can add
them properly, using Device Tree and existing generic code.

Anyway, for removal of both s5p64x0 and s5pc100:

Acked-by: Tomasz Figa <t.figa@samsung.com>

Actually I have played a bit with the code to see how much can be
removed and ended up with following branch:

https://github.com/tom3q/linux.git v3.17-cleanup

Feel free to do _whatever_ you want with patches there.

Best regards,
Tomasz
