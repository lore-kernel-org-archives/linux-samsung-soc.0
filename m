From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Tue, 12 Aug 2014 11:51:02 +0900
Message-ID: <53E98116.3000704@samsung.com>
References: <20140807135500.GA27417@ulmo.nvidia.com>
 <53E42BCB.5090608@samsung.com> <20140808070311.GA5387@ulmo>
 <53E47E23.1050302@samsung.com> <20140808095507.GE15852@ulmo>
 <53E85259.2000204@samsung.com> <20140811072414.GA30762@ulmo>
 <53E87252.60700@samsung.com> <20140811075043.GA31127@ulmo>
 <53E87BA7.2040208@samsung.com> <20140811091151.GA25512@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31460 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754266AbaHLCvE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 22:51:04 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NA600KQCAL3ESB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Aug 2014 11:51:03 +0900 (KST)
In-reply-to: <20140811091151.GA25512@ulmo.nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 2014=EB=85=84 08=EC=9B=94 11=EC=9D=BC 18:11, Thierry Reding wrote:
> On Mon, Aug 11, 2014 at 05:15:35PM +0900, Inki Dae wrote:
>> On 2014=EB=85=84 08=EC=9B=94 11=EC=9D=BC 16:50, Thierry Reding wrote=
:
>>> On Mon, Aug 11, 2014 at 04:35:46PM +0900, Inki Dae wrote:
>>>> On 2014=EB=85=84 08=EC=9B=94 11=EC=9D=BC 16:24, Thierry Reding wro=
te:
>>>>> On Mon, Aug 11, 2014 at 02:19:21PM +0900, Inki Dae wrote:
>>>>>> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 18:55, Thierry Reding w=
rote:
>>> [...]
>>>>>>> The above is actually more like this:
>>>>>>>
>>>>>>> 	if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
>>>>>>> 		clear DSI_HS_CLK_CTRL;
>>>>>>> 	else
>>>>>>> 		set DSI_HS_CLK_CTRL;
>>>>>>>
>>>>>>> 	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
>>>>>>> 		clear DSI_HIGH_SPEED_TRANS;
>>>>>>> 	else
>>>>>>> 		set DSI_HIGH_SPEED_TRANS;
>>>>>>>
>>>>>>> So for peripherals that don't support non-continuous clock mode=
, this
>>>>>>> will result in the following for low-power transmissions:
>>>>>>>
>>>>>>> 	clear DSI_HS_CLK_CTRL; /* HS clock always on */
>>>>>>> 	clear DSI_HIGH_SPEED_TRANS;
>>>>>>
>>>>>> Right, then how host driver should check it if peripheral doesn'=
t
>>>>>> support non-continuous clock mode? Or how the peripheral should =
notify
>>>>>> it to host driver? It would need a new flag instead of
>>>>>> MIPI_DSI_MODE_NON_CONTINUOUS.
>>>>>
>>>>> MIPI_DSI_MODE_NON_CONTINUOUS is exactly the flag that devices nee=
d to
>>>>> set to signal that they support non-continuous mode. If devices d=
on't
>>>>> have that set, then the controller should always provide the HS c=
lock.
>>>>>
>>>>> So, if MIPI_DSI_MODE_NON_CONTINUOUS is *not* set, then the periph=
eral
>>>>> does *not* support non-continuous mode.
>>>>>
>>>>
>>>> Again, assume that there is a peripheral that doesn't support
>>>> non-continuous clock mode but host driver want to transmit data in=
 low
>>>> power. For this, you already mentioned like below,
>>>>
>>>> "So for peripherals that don't support non-continuous clock mode, =
this
>>>> will result in the following for low-power transmissions:
>>>>
>>>>  	clear DSI_HS_CLK_CTRL; /* HS clock always on */
>>>>  	clear DSI_HIGH_SPEED_TRANS;
>>>> "
>>>>
>>>> In this case, how should host driver check it to clear above two f=
lags?
>>>> As you know, this is required to clear two flags same as non-conti=
nuous
>>>> clock mode. Don't you think that we need a new flag to identify th=
em -
>>>> non-continuous clock mode or just for low-power transmission?
>>>
>>> See what I wrote a little further up:
>>>
>>>>>>> 	if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
>>>>>>> 		clear DSI_HS_CLK_CTRL;
>>>>>>> 	else
>>>>>>> 		set DSI_HS_CLK_CTRL;
>>>>>>>
>>>>>>> 	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
>>>>>>> 		clear DSI_HIGH_SPEED_TRANS;
>>>>>>> 	else
>>>>>>> 		set DSI_HIGH_SPEED_TRANS;
>>>>>>>
>>>
>>> MIPI_DSI_MODE_NON_CONTINUOUS specifies that a peripheral supports n=
on-
>>> continuous mode. When set, we clear DSI_HS_CLK_CTRL on Tegra becaus=
e
>>> that tells the controller to turn off the HS clock between high-spe=
ed
>>> transmissions.
>>>
>>> MIPI_DSI_MSG_USE_LPM specifies that a message is to be sent in low-=
power
>>> mode.
>>>
>>> With the above two flags we can cover four cases:
>>>
>>>   1) non-continuous mode with messages transmitted in low-power mod=
e
>>>   2) non-continuous mode with messages transmitted in high-speed mo=
de
>>>   3) continuous mode with messages transmitted in low-power mode
>>
>> In case of 3), it would mean "set DSI_HS_CLK_CTRL" and "clear
>> DSI_HIGH_SPEED_TRANS". However, msg->flags has MIPI_DSI_MSG_USE_LPM =
but
>> dsi->mode_flags has no MIPI_DSI_MODE_NON_CONTINOUS flag..... Ah, rig=
ht.
>> You mean that continuous mode is set by default implicitly?
>=20
> Yes, if the MIPI_DSI_MODE_NON_CONTINUOUS flag is not specified, then =
it
> means the peripheral supports only continuous mode.
>=20

On more thing, in case of non-continuous clock mode, host controller ca=
n
transmit data in low power or high speed.  With
MIPI_DSI_MODE_NON_CONTINUOUS flag, host controller can clear
DSI_HS_CLK_CTRL or set it by default. However, we have no any flag to
select low power or high speed transmission.

Of course, as your patch of other thread, we can set
MIPI_DSI_MSG_USE_LPM by default but I'm not sure that the change incurs
what problem to all other panel devices. So I think it's better to add =
a
new flag which decides host controller should transmit data in high
speed or low power. i.e., MIPI_DSI_MODE_LPM

at mipi dsi framework,
         if ((flags & MIPI_DSI_MODE_LPM) =3D=3D 0)
                msg->flags |=3D MIPI_DSI_MSG_USE_LPM;

at each host driver,
        if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
               clear high speed clock of each SoC
       else
              set high speed clock of each SoC <- by default

       if ((msg->flags =3D MIPI_DSI_MSG_USE_LPM) =3D=3D 0)
               clear high speed transmission of each SoC
      else
               set high speed transmission of each SoC <- by default

Thanks,
Inki Dae

> Thierry
>=20
