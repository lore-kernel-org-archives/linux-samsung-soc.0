From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: mainline boot: 64 boots: 62 pass, 2 fail (v3.16-rc1-2-gebe0618)
Date: Wed, 25 Jun 2014 04:07:43 +0200
Message-ID: <53AA2EEF.6090100@suse.de>
References: <539fdd37.e7bc420a.76b9.ffffb583@mx.google.com>	<CAGa+x85nqPbH-sye28ni=gUEdgjGdUDqHhv1+0pV5aO8y1+wHQ@mail.gmail.com>	<53A106F1.10201@gmail.com>	<CAGa+x8527FEPk6fg5kv-fbOzK3MzcFooFGE9Me12b9C_Pv=UzA@mail.gmail.com>	<53A2AE11.2050208@gmail.com>	<53A2BE94.2010308@gmail.com>	<53A7A579.4010702@gmail.com> <CAGa+x85H510fNGTXJHGYfQybRa2FGgg2NyCgJ8rmjJ6TE7GNbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56222 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752322AbaFYCHs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 22:07:48 -0400
In-Reply-To: <CAGa+x85H510fNGTXJHGYfQybRa2FGgg2NyCgJ8rmjJ6TE7GNbA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>, Tushar Behera <trblinux@gmail.com>, Laura Abbott <lauraa@codeaurora.org>
Cc: Sachin Kamat <spk.linux@gmail.com>, kernel-build-reports@lists.linaro.org, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Russell King <linux@arm.linux.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Am 23.06.2014 20:32, schrieb Kevin Hilman:
> On Sun, Jun 22, 2014 at 8:56 PM, Tushar Behera <trblinux@gmail.com> w=
rote:
>> Adding linux-samsung-soc and linux-arm-kernel ML for wider audience.
>>
>> On 06/19/2014 04:12 PM, Tushar Behera wrote:
>>> On 06/19/2014 03:02 PM, Tushar Behera wrote:
>>>> On 06/18/2014 09:22 AM, Kevin Hilman wrote:
>>>>> On Tue, Jun 17, 2014 at 8:26 PM, Tushar Behera <trblinux@gmail.co=
m> wrote:
>>>>>> On 06/17/2014 10:23 PM, Kevin Hilman wrote:
>>>>>>> Sachin,
>>>>>>>
>>>>>>> On Mon, Jun 16, 2014 at 11:16 PM, Kevin's boot bot <khilman@lin=
aro.org> wrote:
>>>>>>>>
>>>>>>>> Tree/Branch: mainline
>>>>>>>> Git describe: v3.16-rc1-2-gebe0618
>>>>>>>> Failed boot tests (console logs at the end)
>>>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>>>      exynos5420-arndale-octa:     FAIL:    arm-exynos_defconfi=
g
>>>>>>>>                 ste-snowball:     FAIL:    arm-u8500_defconfig
>>>>>>>
>>>>>>> FYI... these failures are getting more consistent on my octa bo=
ard,
>>>>>>> but still not failing every time.
>>>>>>>
>>>>>>> Kevin
>>>>>>>
>>>>>>
>>>>>> Hi Kevin,
>>>>>>
>>>>>> Same here.
>>>>>>
>>>>>> Observation: If you soft-reset the board (through the jumpers) a=
fter
>>>>>> getting this problem, the problem keeps repeating. But if you ha=
rd-reset
>>>>>> the board (by removing the power cord), the problem doesn't occu=
r during
>>>>>> next iteration.
>>>>>
>>>>> I don't ever use the soft-reset, I only toggle the wall power.  I
>>>>> don't ever actually remove the power cord though, I'm using a
>>>>> USB-controlled relay to toggle the wall power.
>>>>>
>>>>> Kevin
>>>>>
>>>>
>>>> Laura,
>>>>
>>>> We are getting following kernel panic [1] (not always, but quite
>>>> regularly) while booting Arndale-Octa (based on Samsung's Exynos54=
20)
>>>> board with upstream kernel. I haven't observed this issue with oth=
er
>>>> boards yet.
>>>>
>>>> This issue is observed when I am booting with uImage + dtb (within
>>>> roughly ~10 iterations).
>>>>
>>>
>>> Some more information:
>>>
>>> The boot logs are provided in pastebin, okay[2] and failed[3].
>>>
>>> In case of boot failures, I am getting a higher value for vm_total_=
pages
>>> (684424 in [3]). In case of successful boot on my board, it is alwa=
ys
>>> 521232 [2] on my board.
>=20
> I can confirm that reverting the "Get rid of meminfo" patch gets the
> Octa board booting reliably again for me also.

Confirming that the revert [1] fixes also the issue I was reporting for
my Arndale Octa. I'm using zImage + dtb and had been resetting via J10.

Regards,
Andreas

[1] https://github.com/afaerber/linux/commits/arndale-octa-next

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
