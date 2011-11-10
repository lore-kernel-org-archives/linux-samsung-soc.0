From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCHv4 07/13] ARM: s3c64xx: convert to MULTI_IRQ_HANDLER
Date: Thu, 10 Nov 2011 21:49:08 +0530
Message-ID: <CAJuYYwSxhZG0TH+bFL2_oVXRmhuUNXWDg3o92GK-KyibTsc18A@mail.gmail.com>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
	<1320369010-23428-8-git-send-email-jamie@jamieiles.com>
	<CAJuYYwRPoFDUhtcVLT_rj4c9whJWVXyQ7tcaK3O_G3X9SYf-cw@mail.gmail.com>
	<20111109115406.GB4253@totoro>
	<CAJuYYwQK-V0AYcayUdXy+SCAyTYbH6vJrn=+m5LGy6PSxP0Vzg@mail.gmail.com>
	<20111110145318.GD16018@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:52954 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935652Ab1KJQTK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 11:19:10 -0500
Received: by ywf7 with SMTP id 7so3138122ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2011 08:19:09 -0800 (PST)
In-Reply-To: <20111110145318.GD16018@totoro>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: Rob Herring <robherring2@gmail.com>, linux-arm-kernel@lists.infradead.org, viresh.kumar@st.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rmallon@gmail.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, rubini@unipv.it, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 10 November 2011 20:23, Jamie Iles <jamie@jamieiles.com> wrote:
> On Wed, Nov 09, 2011 at 06:00:20PM +0530, Thomas Abraham wrote:
>> On 9 November 2011 17:24, Jamie Iles <jamie@jamieiles.com> wrote:
>> > On Wed, Nov 09, 2011 at 04:55:06PM +0530, Thomas Abraham wrote:
>> >> Hi Jamie,
>> >>
>> >> On 4 November 2011 06:40, Jamie Iles <jamie@jamieiles.com> wrote:
>> >> > Now that there is a generic IRQ handler for multiple VIC device=
s use it
>> >> > for s3c64xx to help building multi platform kernels.
>> >> >
>> >> > Cc: Ben Dooks <ben-linux@fluff.org>
>> >> > Signed-off-by: Jamie Iles <jamie@jamieiles.com>
>> >> > ---
>> >> > =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> >> > =A0arch/arm/mach-s3c64xx/include/mach/entry-macro.S | =A0 =A07 =
++++---
>> >> > =A0arch/arm/mach-s3c64xx/mach-anw6410.c =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-crag6410.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-hmt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-mini6410.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-ncp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-real6410.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-smartq5.c =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-smartq7.c =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-smdk6400.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
>> >> > =A0arch/arm/mach-s3c64xx/mach-smdk6410.c =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 ++
>> >> > =A012 files changed, 25 insertions(+), 3 deletions(-)
>> >> >
>> >>
>> >> I have tested this patch series on smdk6410 board (s3c64xx) using=
 the
>> >> following repositorty and branch
>> >>
>> >> https://github.com/jamieiles/linux-2.6-ji.git =A0branch: vic-dt
>> >>
>> >> There is a crash while booting. Am I using the right tree and bra=
nch?
>> >> The following is the boot log. Is there any other config option t=
o be
>> >> enabled?
>> >
>> > Hmm, could you please try with the patch below applied?
> [...]
>>
>> This patch solves the issue and both smdk6410 and smdkv210 works fin=
e.
>
> Brilliant, thanks Thomas. =A0Mind if I add a Tested-by from you provi=
ding
> the fixup patch is applied first?

Sure. You can add
Tested-by: Thomas Abraham <thomas.abraham@linaro.org>

for patches 01, 02. 03, 07, 11 and 13 of your patch series.

Regards,
Thomas.

>
> Jamie
>
