From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v5] mfd: syscon: Decouple syscon interface from platform devices
Date: Fri, 26 Sep 2014 07:34:12 +0200
Message-ID: <CAGhQ9VxwTS9=biwp0nCKu2bVU2aNe679aKR=HU5rd_Uaw99sUw@mail.gmail.com>
References: <1411360807-7750-1-git-send-email-pankaj.dubey@samsung.com>
	<CAGhQ9VzZ8LadDT5RWUSX89q0WP3fGiQ8f=bWbRVfEz5Vy_zZKw@mail.gmail.com>
	<13449286.k3JCbR2ABy@phil>
	<4389453.TP96FZcCbx@phil>
	<000d01cfd946$521304f0$f6390ed0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:64577 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752170AbaIZFeO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Sep 2014 01:34:14 -0400
In-Reply-To: <000d01cfd946$521304f0$f6390ed0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kgene.kim@samsung.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, naushad@samsung.com, b29396@freescale.com, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, thomas.ab@samsung.com, Li.Xiubo@freescale.com, vikas.sajjan@samsung.com, chow.kim@samsung.com, Lee Jones <lee.jones@linaro.org>, dianders@chromium.org

On 26 September 2014 06:56, Pankaj Dubey <pankaj.dubey@samsung.com> wro=
te:
> Hi Heiko and Joachim,
>
>> -----Original Message-----
>> From: Heiko St=C3=BCbner [mailto:heiko@sntech.de]
>> Sent: Thursday, September 25, 2014 5:52 PM
>> To: Pankaj Dubey
>> Cc: Joachim Eastwood; linux-arm-kernel@lists.infradead.org; linux-sa=
msung-
>> soc@vger.kernel.org; linux-kernel@vger.kernel.org; kgene.kim@samsung=
=2Ecom;
>> Russell King - ARM Linux; Arnd Bergmann; naushad@samsung.com;
>> b29396@freescale.com; tomasz.figa@gmail.com; joshi@samsung.com;
>> thomas.ab@samsung.com; Li.Xiubo@freescale.com; vikas.sajjan@samsung.=
com;
>> chow.kim@samsung.com; lee.jones@linaro.org; dianders@chromium.org
>> Subject: Re: [PATCH v5] mfd: syscon: Decouple syscon interface from
> platform
>> devices
>>
>> Am Mittwoch, 24. September 2014, 20:35:10 schrieb Heiko St=C3=BCbner=
:
>> > Hi Pankaj, Joachim,
>> >
>> > Am Dienstag, 23. September 2014, 20:12:50 schrieb Joachim Eastwood=
:
>> > > On 22 September 2014 06:40, Pankaj Dubey <pankaj.dubey@samsung.c=
om>
>> wrote:
>> > > > Currently a syscon entity can be only registered directly thro=
ugh
>> > > > a platform device that binds to a dedicated syscon driver. How=
ever
>> > > > in certain use cases it is desirable to make a device used wit=
h
>> > > > another driver a syscon interface provider.
>> > > >
>> > > > For example, certain SoCs (e.g. Exynos) contain system control=
ler
>> > > > blocks which perform various functions such as power domain
>> > > > control, CPU power management, low power mode control, but in
>> > > > addition contain certain IP integration glue, such as various
>> > > > signal masks, coprocessor power control, etc. In such case, th=
ere
>> > > > is a need to have a dedicated driver for such system controlle=
r
>> > > > but also share registers with other drivers. The latter is whe=
re the
> syscon
>> interface is helpful.
>> > > >
>> > > > In case of DT based platforms, this patch decouples syscon obj=
ect
>> > > > from syscon platform driver, and allows to create syscon objec=
ts
>> > > > first time when it is required by calling of
>> > > > syscon_regmap_lookup_by APIs and keep a list of such syscon
>> > > > objects along with syscon provider device_nodes and regmap han=
dles.
>> > > >
>> > > > For non-DT based platforms, this patch keeps syscon platform
>> > > > driver structure where is can be probed and such non-DT based
>> > > > drivers can use syscon_regmap_lookup_by_pdev API and get acces=
s to
>> regmap handles.
>> > > > Once all users of "syscon_regmap_lookup_by_pdev" migrated to D=
T
>> > > > based, we can completly remove platform driver of syscon, and =
keep
>> > > > only helper functions to get regmap handles.
>> > > >
>> > > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> > > > Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
>> > > > Tested-by: Vivek Gautam <gautam.vivek@samsung.com>
>> > > > Tested-by: Javier Martinez Canillas
>> > > > <javier.martinez@collabora.co.uk>
>> > > > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> > >
>> > > I wrote a clk driver using syscon and your patch. clk driver use=
s
>> > > CLK_OF_DECLARE, btw.
>> > >
>> > > It works but I get a '(null): Failed to create debugfs directory=
'
>> > > message in the boot log.
>> > >
>> > > Tested-by: Joachim Eastwood <manabian@gmail.com>
>> >
>> > on Rockchip platforms this syscon support also helps quite a bit, =
as
>> > the pll lock-status is sitting in an external syscon register, so
>> > setting target pll-rates through assigned-clocks is not easily doa=
ble
> without it.
>> > Therefore I'm very much looking forward to this.
>> >
>> >
>> > Similar to Joachim I get an error about debugfs from regmap, which
>> > seems to be caused by
>> >     name =3D dev_name(map->dev);
>> > returning NULL in regmap_debugfs_init in regmap-debugfs.c for such=
 an
>> > "early" syscon.
>>
>> It looks like of_device_make_bus_id would be able to do the necessar=
y
> steps to
>> populate the dev_name seemingly correctly.
>>
>> With the diff below I now get a syscon that can init clocks and also=
 a
> sane regmap
>> debugfs init:
>>
>> /debug/regmap # ls -la
>> total 0
>> drwxr-xr-x    5 0        0                0 Jan  1  1970 .
>> drwx------   19 0        0                0 Jan  1  1970 ..
>> drwxr-xr-x    2 0        0                0 Jan  1  1970 0-001b
>> drwxr-xr-x    2 0        0                0 Jan  1  1970
> ff730000.power-management
>> drwxr-xr-x    2 0        0                0 Jan  1  1970 ff770000.sy=
scon
>>
>>
>> But of course I don't know enough about device-internals to determin=
e if
> this is an
>> insane solution or not :-)
>>
>
> Thanks Heiko for figuring out issue and proposed solution.
>
> As you and Joachim pointed out that current patch failed to create re=
gmap
> debugfs entry,
> I also investigated and found that it fails to create regmap debugfs =
entry
> either you call it
> early (from init_irq or clk_init function) or you call it in later st=
age
> before actual device is
> populated (from init_machine before of_platform_populate_device).
>
> One point is regmap debugfs code should have handled it gracefully in=
stead
> of kernel panic,
> so looks like it needs some fix in that part of code.

Just for the records. My kernel didn't panic.
Don't know why it behaves different from Heiko's kernel but I was able
to boot into user space with your patch.

I wouldn't have given my 'Tested-by' if didn't boot properly.

I am working on Cortex-M4 no-MMU platform that isn't upstream yet, btw.

regards
Joachim Eastwood
