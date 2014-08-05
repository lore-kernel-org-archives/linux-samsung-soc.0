From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Tue, 05 Aug 2014 10:12:02 +0200
Message-ID: <53E091D2.5020706@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com> <53D6F189.3060004@samsung.com>
 <53D7760F.3060200@samsung.com>
 <CAAQKjZMaOsiThMgu+b_u7WCN+aakq7nAfomFVwQSvNrmWOgKjQ@mail.gmail.com>
 <CAAQKjZM=WR_R=4uiEOUKOXovcXg8wutFceXKvk=zbLUF-QcO3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56612 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757031AbaHEIMN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Aug 2014 04:12:13 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9T001DCQRRNO50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Aug 2014 09:11:51 +0100 (BST)
In-reply-to: <CAAQKjZM=WR_R=4uiEOUKOXovcXg8wutFceXKvk=zbLUF-QcO3A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: YoungJun Cho <yj44.cho@samsung.com>, dri-devel@lists.freedesktop.org, treding@nvidia.com, linux-samsung-soc@vger.kernel.org

On 08/03/2014 09:16 AM, Inki Dae wrote:
> 2014-08-03 16:03 GMT+09:00 Inki Dae <inki.dae@samsung.com>:
>> 2014-07-29 19:23 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>>> On 07/29/2014 02:57 AM, YoungJun Cho wrote:
>>>> Hi Andrzej,
>>>>
>>>> On 07/29/2014 01:09 AM, Andrzej Hajda wrote:
>>>>> On 07/28/2014 04:00 AM, Inki Dae wrote:
>>>>>> This patch adds below two flags for LPM transfer, and it attaches LPM flags
>>>>>> to a msg in accordance with master's mode_flags set by LCD Panel driver.
>>>>>>
>>>>>> MIPI_DSI_MODE_CMD_LPM
>>>>>> - If this flag is set by Panel driver, MIPI-DSI controller will tranfer
>>>>>> command data to Panel device in Low Power Mode.
>>>>> What do you mean by command data? It could be:
>>>>> - all transfer in command mode of operations,
>>>>> - transfer initialized by the driver by writing to DSIM registers.
>>>> The 2nd one.
>>>>
>>>>>> MIPI_DSI_MODE_VIDEO_LPM
>>>>>> - If this flag is set by Panel driver, MIPI-DSI controller will tranfer
>>>>>> image data to Panel device in Low Power Mode.
>>>>> What is the meaning of this flag in case of command mode of operation?
>>>> I'm also not sure that there is a case to transfer image data in Low
>>>> Power Mode, but this flag is not related with 'command mode' only.
>>>> Inki may consider generic condition.
>>>>
>>>>> Maybe it would be better to create flags based on source of data/FIFOs:
>>>>> - commands send by SFR registers,
>>>>> - commands generated from data sent from Display Controller.
>>>>>
>>>>>
>>>>>> And above two flags can be combined together to transfer command and video
>>>>>> data to Panel device.
>>>>>>
>>>>>> MIPI DSI spec says,
>>>>>>       "the host processor controls the desired mode of clock operation.
>>>>>>        Host protocol and applications control Clock Lane operating mode
>>>>>>        (High Speed or Low Power mode). System designers are responsible
>>>>>>        for understanding the clock requirements for peripherals attached
>>>>>>        to DSI and controlling clock behavior in accordance with those
>>>>>>        requirements."
>>>>>>
>>>>>> Some LCD Panel devices, nt35502a, would need LPM transfer support
>>>>>> because they should receive some initial commands with LPM by default
>>>>>> hardware setting.
>>>>> Is this requirement for initial commands, or for all commands.
>>>>> Btw what is the mode of operation of nt35502a? What flags do you need
>>>>> for it?
>>>>>
>>>> The nt35502a panel is video(RGB) mode panel and it requires low power
>>>> mode for initial commands, which means to initialize nt35502a panel, the
>>>> initial commands are transferred by LP mode(Not HS mode).
>>>> And after initialization, its other features like gamma control or etc
>>>> could be controlled in HS mode.
>>> It sounds similar to my tc358764 bridge driver [1]. The difference is that
>>> it uses only MIPI_DSI_GENERIC_LONG_(WRITE|READ) in LPM.
>>>
>>> As I understand nt35502a requires also different driving of
>>> TxRequestHSClk signal
>>> and this seems to me unrelated to LPM. As LPM is not related at all with
>>> HS clock, AFAIK.
>>>
>> + Tomi Valkeinen
>>
>> At private talks before, I think we reached the following consensus,
>>
>> 1. D-PHY could disable HS clock of MIPI-DSI controller in case that
>> D-PHY detectsTransition to Stop state (LP=11) and TxRequestHSClk bit
>> of MIPI-DSI controller is set, which means that Panel driver set
>> MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
>>
>> 2. Lower Power Mode means that the state of HS clock is low, Positive
>> and Negative lane are all low,  LP-11 state.
>>
>> However, it seems some misunderstanding each other.
>>
>> I guess that non-contiguous clock mode - TxRequestHSCllk bit is set or
>> maybe unset - would mean that HS clock is high while MIPI-DSI
>> controller transmits data to Panel  until D-PHY detects LP-11 state.
> Or with non-contiguous clock mode, data may be transmistted to Panel
> in LPM (HS clock is low and LP-11) after D-PHY detects LP-11 state. To
> make sure this, I will try to test that Panel - requiring LPM transfer
> for initial commands as default hw setting - works well with
> non-contiguous clock mode. In this cae, it seems that we need to
> consider HW that supports non-continuous clock mode.

I think the situation is quite simple:
1. HS clock is provided via clock line and according to DSI specs it can
be used for two things:
  a) HS transfers,
  b) Application clock - "to support active circuitry at the peripheral"
[1]. Some peripherals does not need
  it so in such case DSI-Master can disable the HS clock between HS
transfer - it is called "non-continuous clock behavior".
  All DSI-Masters shall support "continuous clock behavior" and can
optionally support "non-continuous clock behavior".
  "non-continuous clock behavior" can be enabled in case peripheral have
such capability.
  In case of drm_mipi_dsi bus the capability is signaled by recently
introduced MIPI_DSI_CLOCK_NON_CONTINUOUS flag.

2. Low-Power Transmissions does not use/depend on clock line, so it has
nothing to do with HS clock. It uses so-caled
Spaced-One-Hot coding which roughly means the clock is embedded in data
signal. In case of drm_mipi_dsi if we want to transfer
data using LPM (or more precisely escape mode) we can use
MIPI_DSI_MSG_USE_LPM flag.

3. There is question if and how TxRequestHSClk bit in Exynos-DSI is
connected with "continuous clock behavior", it should be tested or consulted
with Exynos HW guys but it is just a problem of this specific chipset
and should be quite easy to solve.

4. I guess it could be good to have more control what and when shall be
transmitted in LP or HS mode. But for this we first need to separate
LPM issues from HS clock issues.

[1]: MIPI DSI specs, especially "Clock Management" chapter.
 
Regards
Andrzej

>
> Thanks,
> Inki Dae
>
>> Therefore, I think LPM is different from non-contiguous clock mode,
>> and I think with LPM flag, host driver - for MIPI-DSI device - should
>> disable HS clock to transmit data to Panel. So I think HS clock is
>> related to LPM.
>>
>> Anyway, we all are not sure how D-PHY handles HS clock of MIPI-DSI
>> controller. So we would need more comments from HW guy or
>> specitialists of MIPI-DSI to make sure. I think Tomi Valkeinen would
>> be one of the specitialists.
>>
>> Hi Tomi,
>> Could you give us some comments about this? Is HS clock unrelated to
>> Low Power Mode at all? And do you know D-PHY handle HS clock of
>> MIPI-DSI controller with non-contigous clock mode?
>>
>> Thanks,
>> Inki Dae
>>
>>> Regards
>>> Andrzej
>>>
>>> [1]: http://permalink.gmane.org/gmane.linux.drivers.devicetree/61559
>>>
>>>
>>>> Thank you.
>>>> Best regards YJ
>>>>
>>>>>> Changelog v2: just add more descriptions.
>>>>>>
>>>>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>>>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_mipi_dsi.c |    3 +++
>>>>>>   include/drm/drm_mipi_dsi.h     |    4 ++++
>>>>>>   2 files changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
>>>>>> index e633df2..6b2bbda 100644
>>>>>> --- a/drivers/gpu/drm/drm_mipi_dsi.c
>>>>>> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
>>>>>> @@ -232,6 +232,9 @@ int mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, unsigned int channel,
>>>>>>             break;
>>>>>>     }
>>>>>>
>>>>>> +   if (dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM)
>>>>>> +           msg.flags = MIPI_DSI_MSG_USE_LPM;
>>>>>> +
>>>>>>     return ops->transfer(dsi->host, &msg);
>>>>>>   }
>>>>> Shouldn't this be also the same for dcs read?
>>>>>
>>>>> Anyway I think check in the DSIM should be used instead, as panel driver
>>>>> can issue other dsi transfers without MIPI_DSI_MSG_USE_LPM flag set.
>>>>>
>>>>> Regards
>>>>> Andrzej
>>>>>
>>>>>
>>>>>>   EXPORT_SYMBOL(mipi_dsi_dcs_write);
>>>>>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>>>>>> index 944f33f..1c41e49 100644
>>>>>> --- a/include/drm/drm_mipi_dsi.h
>>>>>> +++ b/include/drm/drm_mipi_dsi.h
>>>>>> @@ -94,6 +94,10 @@ void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
>>>>>>   #define MIPI_DSI_MODE_VSYNC_FLUSH BIT(8)
>>>>>>   /* disable EoT packets in HS mode */
>>>>>>   #define MIPI_DSI_MODE_EOT_PACKET  BIT(9)
>>>>>> +/* command low power mode */
>>>>>> +#define MIPI_DSI_MODE_CMD_LPM              BIT(10)
>>>>>> +/* video low power mode */
>>>>>> +#define MIPI_DSI_MODE_VIDEO_LPM            BIT(11)
>>>>>>
>>>>>>   enum mipi_dsi_pixel_format {
>>>>>>     MIPI_DSI_FMT_RGB888,
>>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
