From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 1/2] ARM: CLKDEV: Add Common Macro for clk_lookup
Date: Tue, 4 Oct 2011 10:50:30 +0530
Message-ID: <CAAgF-Bckzj_6U4WjLH6=x1d1Psdc4BHB9hVWy9bQ_o53dDz4vA@mail.gmail.com>
References: <1317381097-2691-1-git-send-email-padma.v@samsung.com>
	<1317381097-2691-2-git-send-email-padma.v@samsung.com>
	<20111001152938.GD11710@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:63745 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733Ab1JDFUc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 01:20:32 -0400
Received: by wyg34 with SMTP id 34so101763wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Oct 2011 22:20:31 -0700 (PDT)
In-Reply-To: <20111001152938.GD11710@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de, hjk@hansjkoch.de

Thank you all for your comments.
Will resend the patches after removing "&" from the clk parameter and
trailing "," at the end of Macro.

Thanks and Regards,
Padmavathi Venna

On Sat, Oct 1, 2011 at 8:59 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Sep 30, 2011 at 04:41:36PM +0530, Padmavathi Venna wrote:
>> +#define CLKDEV_INIT(d, n, c) \
>> + =A0 =A0 { \
>> + =A0 =A0 =A0 =A0 =A0 =A0 .dev_id =3D d, \
>> + =A0 =A0 =A0 =A0 =A0 =A0 .con_id =3D n, \
>> + =A0 =A0 =A0 =A0 =A0 =A0 .clk =3D &c, \
>> + =A0 =A0 },
>> +
>
> As Heartley says, the trailing , and the end should not be there - it
> should be with each use of CLKDEV_INIT(). =A0The reasoning is that it
> makes the use of macros much more conventional and consistent through=
out
> the kernel:
>
> struct cl_lookup foo_lookups[] =3D {
> =A0 =A0 =A0 =A0CLKDEV_INIT(...),
> =A0 =A0 =A0 =A0CLKDEV_INIT(...),
> };
>
> struct cl_lookup bar_lookup =3D CLKDEV_INIT(...);
>
> Could you re-spin with that change please?
>
> Thanks.
>
