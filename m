From: Banajit Goswami <banajit.goswami@gmail.com>
Subject: Re: [PATCH] ARM: S3C64XX: Remove un-used code
Date: Fri, 19 Aug 2011 11:09:14 +0530
Message-ID: <CABK8_vTt+9LSTpoGieYRdC07+O9CRYuzi3E0NHpi8DuNkiPY3g@mail.gmail.com>
References: <1313498488-4296-1-git-send-email-banajit.g@samsung.com>
	<20110819015955.GA1212@sirena.org.uk>
	<CABK8_vR6bB_0TfQtbA7F9+w9dSXajMdd1SS5o+LscMrDcCY1tg@mail.gmail.com>
	<20110819045346.GA26979@opensource.wolfsonmicro.com>
	<001d01cc5e31$00c9dee0$025d9ca0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:59893 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755Ab1HSFjP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 01:39:15 -0400
Received: by fxh19 with SMTP id 19so1728464fxh.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Aug 2011 22:39:14 -0700 (PDT)
In-Reply-To: <001d01cc5e31$00c9dee0$025d9ca0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Banajit Goswami <banajit.g@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Hi Mr. Kim,

On Fri, Aug 19, 2011 at 10:59 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Mark Brown wrote:
>>
>> On Fri, Aug 19, 2011 at 09:40:29AM +0530, Banajit Goswami wrote:
>> > On Fri, Aug 19, 2011 at 7:29 AM, Mark Brown
>> > <broonie@opensource.wolfsonmicro.com> wrote:
>> > > On Tue, Aug 16, 2011 at 06:11:28PM +0530, Banajit Goswami wrote:
>> > >> Remove un-used backlight code for SMDK6410 board
>>
>> > > Is the data actually wrong? =C2=A0If not it'd seem better to fin=
ish hooking
>> > > it up properly than to remove it.
>>
>> > No, this code is no longer needed, as we are having a common backl=
ight
>> > infrastructure , which serves the same purpose.
>>
>> Ideally your commit log should make this clear - it looks like you'r=
e
>> just deleting unreferenced code.
>
> Yes, I agree with your opinion...It was difficult to know why it is u=
n-used
> code when I applied that.
>
Yes, I will explain more in comments in future!

> OK, I will amend its commit log in my tree to clear.
Thank you!


Thanks and Regards,
Banajit Goswami
