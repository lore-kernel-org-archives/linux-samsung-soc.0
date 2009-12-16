From: Barry Song <21cnbao@gmail.com>
Subject: Re: 2.6.28 and newest linux kernel for samsung
Date: Wed, 16 Dec 2009 10:39:09 +0800
Message-ID: <3c17e3570912151839g605880e3y8d543d4b9f0e3b68@mail.gmail.com>
References: <3c17e3570912102244w21418964y8fb3f0e01ef0e39a@mail.gmail.com>
	<005201ca7a31$ea3ef0a0$bebcd1e0$%yang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.211.182]:34184 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934568AbZLPCjd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Dec 2009 21:39:33 -0500
Received: by ywh12 with SMTP id 12so644023ywh.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Dec 2009 18:39:32 -0800 (PST)
In-Reply-To: <005201ca7a31$ea3ef0a0$bebcd1e0$%yang@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jinsung Yang <jsgood.yang@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Jinsung,
Thanks for your reply. Another question is whether there is a release
for multimedia applications in 2.6.28. I noticed there were releases
for 2.6.21 and 2.6.24, but 2.6.28 has changed much in MFC, post
processor etc.,  old codes are not usable. I'd like to play multimedia
in 2.6.28, and hope to get some reference codes for applications. Hope
to hear from you soon. Thanks a lot again.
Barry

On Fri, Dec 11, 2009 at 3:16 PM, Jinsung Yang <jsgood.yang@samsung.com>=
 wrote:
>> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-=
soc-
>> owner@vger.kernel.org] On Behalf Of Barry Song
>> Sent: Friday, December 11, 2009 3:45 PM
>> To: linux-samsung-soc@vger.kernel.org
>> Subject: 2.6.28 and newest linux kernel for samsung
>>
>> Hi,
>> I found there are many drivers which have existed in samsung 2.6.28
>> tree. For example, s3c6410 jpeg/multi functions codecs/2D/3D, audio
>> board drivers, framebuffer and so on. But they are not in 2.6.31 or
>> newest tree.
>> Is there any plan about that? And is there any way to use those
>> drivers in new kernel since some are using old kernel or subsystem
>> API?
>
> We have plan to submit some drivers of s3c6410 to 2.6.33 stable targe=
t.
> Regarding this, we are picking the devices which are possible to be s=
ubmitted or not.
> We hope that this work is getting started from next week, but it depe=
nds on the release of 2.6.33-rc1.
>
> Best Regards
> --
> Jinsung, Yang <jsgood.yang@samsung.com>
> AP Development Team
> System LSI, Semiconductor Business
> SAMSUNG Electronics Co., LTD
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
