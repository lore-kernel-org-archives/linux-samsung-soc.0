From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Thu, 16 Jun 2011 21:56:45 +0900
Message-ID: <BANLkTimqi=NcQ8jVjYpe4zo1-nPazV=HOg@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
	<BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
	<BANLkTimjWNf3PxHXj3o5qubH5g7gMHjhFg@mail.gmail.com>
	<20110607081527.GB20929@n2100.arm.linux.org.uk>
	<BANLkTin66PhYGmVSOJcuZr8wDH_iNgjhZQ@mail.gmail.com>
	<20110607182923.GA28451@n2100.arm.linux.org.uk>
	<BANLkTikLFCyzU3UApjjwfX0Vjujo9WAFZA@mail.gmail.com>
	<20110607223614.GC28451@n2100.arm.linux.org.uk>
	<4DF10FC1.9030406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:56938 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751551Ab1FPM4q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2011 08:56:46 -0400
Received: by gyh3 with SMTP id 3so62836gyh.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jun 2011 05:56:46 -0700 (PDT)
In-Reply-To: <4DF10FC1.9030406@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, root <alim.akhtar@samsung.com>

2011/6/10 Kukjin Kim <kgene.kim@samsung.com>:
> On 06/07/11 15:36, Russell King - ARM Linux wrote:
>> I see no effort from the Samsung folk to even start considering movi=
ng
>> to common APIs - I see precisely the opposite. =A0They seem to have =
a
>> strong desire to invent their own new APIs all the time rather than
>> look at existing APIs and discuss how they can be used or adapted so
>> they work for Samsung.
>>
>> That is not sustainable, and if it continues, it will probably resul=
t
>> in Samsung stuff being chucked out of mainline. =A0We are most defin=
itely
>> at the point where custom APIs are no longer permissible, especially
>> for any new SoCs.
>
> Hi Russell and everyone,
>
> Sorry for late participation on this :(
> I'm out of my office for biz. trip so it was hard to check my e-mail
> and will be back to my country this weekend.
>
> Anyway, I and my colleagues know what we have to do for Linux world.
> And as I know, we are preparing some stuff for it so please don't
> expect the worst :)
>
> I should be back on this after discussing with my colleagues.
Any updates? still need more time?
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
