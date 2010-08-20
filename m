From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH] MAX8952 PMIC Driver Initial Release
Date: Fri, 20 Aug 2010 14:24:22 +0900
Message-ID: <AANLkTimO7u1846M_D8E+GLvyRqyrcQh_G0TJ9mx5vu2f@mail.gmail.com>
References: <1282201515-11385-1-git-send-email-myungjoo.ham@samsung.com>
	<20100819104654.GA23404@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:60803 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751016Ab0HTFYX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Aug 2010 01:24:23 -0400
Received: by iwn5 with SMTP id 5so427260iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Aug 2010 22:24:22 -0700 (PDT)
In-Reply-To: <20100819104654.GA23404@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, lrg@slimlogic.co.uk

Thank you for the comments. They will be applied to the next patch
revision releasing soon.

On Thu, Aug 19, 2010 at 7:46 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, Aug 19, 2010 at 04:05:15PM +0900, MyungJoo Ham wrote:
>
(snip)
>
>> + =C2=A0 =C2=A0 max8952_write_reg(max8952, MAX8952_REG_SYNC,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (max8952_read_reg(max8952, MAX8952_REG_SYNC) & 0x3F) |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ((pdata->sync_freq & 0x3) << 6));
>> + =C2=A0 =C2=A0 max8952_write_reg(max8952, MAX8952_REG_RAMP,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (max8952_read_reg(max8952, MAX8952_REG_RAMP) & 0x1F) |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ((pdata->ramp_speed & 0x7) << 5));
>
> This looks like it should be platform data.

However, could you please clarify more about this? They are already
from platform data (pdata->ramp_speed and pdata->sync_freq).

--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
