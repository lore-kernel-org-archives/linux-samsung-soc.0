From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH v2 0/6] usb: host: Cleanup for ioremap'ing hcd memory
Date: Sun, 11 May 2014 20:15:50 +0530
Message-ID: <CAFp+6iFoc5bx5EEJMXZT1021JyN_fx9AouNCuETS127rFkbb2w@mail.gmail.com>
References: <1399723210-21569-1-git-send-email-gautam.vivek@samsung.com>
	<1399731956.962771892@f256.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f44.google.com ([209.85.216.44]:42407 "EHLO
	mail-qa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752105AbaEKOpv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 May 2014 10:45:51 -0400
In-Reply-To: <1399731956.962771892@f256.i.mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Greg KH <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, linux-tegra <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>

Hi,


On Sat, May 10, 2014 at 7:55 PM, Alexander Shiyan <shc_work@mail.ru> wr=
ote:
> Sat, 10 May 2014 17:30:04 +0530 =D0=BE=D1=82 Vivek Gautam <gautam.viv=
ek@samsung.com>:
>> Based on 'usb-next' branch of Greg's usb tree.
>>
>> devm_ioremap_resource() API is advantageous over devm_ioremap()
>> and should therefore be preferred to request any ioremap'ed address
>> for hcd.
>>
>> Changes from v1:
>>  - Changed the way returned pointer is checked for error value
>>    as pointed out in the review comment in the mailing list.
>
> hcd->rsrc_len field can be removed entirely, since I cannot find any =
reason
> how this filed can be used in the drivers now.
> This is of course should be in an another series. This one looks good=
=2E

True, even i noticed the same, since after grep'ing for rsrc_len. i
could not find any mention in the
USB layer.
Will send that as a separate patch-series.



--=20
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
