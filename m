From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: disable MDMA1 node for smdk5420 board
Date: Tue, 22 Apr 2014 13:53:59 +0530
Message-ID: <CAHbNUh0caDOxVt2gjti5Jyv04d7=EbE_z5X7cZWv_VevcRNofg@mail.gmail.com>
References: <001a01cf5b0c$5ddc7d60$19957820$%jun@samsung.com>
	<021301cf5dd1$1d0ec910$572c5b30$@samsung.com>
	<CAHbNUh3G1NUUfAwh=B+rDwVkfsAetUpDspiPS-JbK3oYuxSd_A@mail.gmail.com>
	<000001cf5df8$bdc6f900$3954eb00$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:51484 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752750AbaDVIYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 04:24:00 -0400
Received: by mail-ie0-f177.google.com with SMTP id rl12so4674705iec.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 01:24:00 -0700 (PDT)
In-Reply-To: <000001cf5df8$bdc6f900$3954eb00$%jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Javi Merino <javi.merino@arm.com>

On 22 April 2014 12:31, Seungwon Jeon <tgih.jun@samsung.com> wrote:
> On Tue, April 22, 2014, Tushar Behera wrote:
>> On 22 April 2014 07:48, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > Seungwon Jeon wrote:
>> >>
>> >
>> > + Javi Merino and Tushar Behera
>> >
>> >> This change is similar to commit 3da355c(ARM: dts: Disable MDMA1 node
>> >> for arndale-octa board). If MDMA1 region is configured with secure mode,
>> >> it makes the boot failure with the following.
>> >>
>> >> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
>> >>
>> > If so, how about adding the 'disabled' status in 5420 dtsi file? Then if 'enabling' is required, we
>> can enable in each board dt file...
>> >
>>
>> That should be okay. While at it, we can remove the node disabling
>> code from Arndale-Octa board DTS file.
>
> OK, I'll consider both.
>
Seungwon,

Please move the comments for MDMA1 from Arndale-Octa dts file too.

Thanks.


-- 
Tushar Behera
