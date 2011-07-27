From: Banajit Goswami <banajit.goswami@gmail.com>
Subject: Re: [PATCH 0/8] ARM: SAMSUNG: Add common PWM Backlight support
Date: Wed, 27 Jul 2011 14:26:02 +0530
Message-ID: <CABK8_vRJG16jkSXOmQuDycSb6gZMHwX9vzTccaWS1-JCH1q4_Q@mail.gmail.com>
References: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
	<j0logn$1bn$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:38332 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752178Ab1G0I4E convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 04:56:04 -0400
Received: by fxd18 with SMTP id 18so127185fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2011 01:56:02 -0700 (PDT)
In-Reply-To: <j0logn$1bn$1@dough.gmane.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Dmitry,

On Tue, Jul 26, 2011 at 12:27 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Hello,
>
> On Fri, 15 Jul 2011 20:12:40 +0530, Banajit Goswami wrote:
>
>> The patches are created against "for-next" branch of Kukjin Kim's tr=
ee
>> at:
>> =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-sams=
ung.git
>>
>> =C2=A0Patch [1/8]
>> =C2=A0 -- add a common infrastructure to support PWM backlight for v=
arious
>> =C2=A0 =C2=A0 =C2=A0Samsung boards.
>
> Why can't you use the drivers/video/backlight/pwm-bl.c ?
These patches indeed use the drivers/video/backlight/pwm-bl.c driver (d=
o not
replace it), and provide board specific data from a common place.
The patches are meant to avoid any duplicate code which might be needed
for different Samsung boards.
>
> --
> With best wishes
> Dmitry
>
Thanks and Regards,
Banajit
