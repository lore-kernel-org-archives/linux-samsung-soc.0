From: Banajit Goswami <banajit.goswami@gmail.com>
Subject: Re: [PATCH] ARM: S3C64XX: Remove un-used code
Date: Fri, 19 Aug 2011 12:29:51 +0530
Message-ID: <CABK8_vTSrcAc8Un-z_uDZkJWKeiVP9tPR2YPgkuQybG5gvqMgA@mail.gmail.com>
References: <1313498488-4296-1-git-send-email-banajit.g@samsung.com>
	<20110819015955.GA1212@sirena.org.uk>
	<CABK8_vR6bB_0TfQtbA7F9+w9dSXajMdd1SS5o+LscMrDcCY1tg@mail.gmail.com>
	<20110819045346.GA26979@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:56395 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751467Ab1HSG7x convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 02:59:53 -0400
Received: by fxh19 with SMTP id 19so1757631fxh.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Aug 2011 23:59:51 -0700 (PDT)
In-Reply-To: <20110819045346.GA26979@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Banajit Goswami <banajit.g@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Hi Mark,

On Fri, Aug 19, 2011 at 10:23 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Aug 19, 2011 at 09:40:29AM +0530, Banajit Goswami wrote:
>> On Fri, Aug 19, 2011 at 7:29 AM, Mark Brown
>> <broonie@opensource.wolfsonmicro.com> wrote:
>> > On Tue, Aug 16, 2011 at 06:11:28PM +0530, Banajit Goswami wrote:
>> >> Remove un-used backlight code for SMDK6410 board
>
>> > Is the data actually wrong? =C2=A0If not it'd seem better to finis=
h hooking
>> > it up properly than to remove it.
>
>> No, this code is no longer needed, as we are having a common backlig=
ht
>> infrastructure , which serves the same purpose.
>
> Ideally your commit log should make this clear - it looks like you're
> just deleting unreferenced code.
Thanks.
Will add more description now on.

Thanks and Regards,
Banajit Goswami
