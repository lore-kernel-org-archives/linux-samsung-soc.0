From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Tue, 22 Jul 2014 12:41:21 +0900
Message-ID: <53CDDD61.6000005@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-11-git-send-email-yj44.cho@samsung.com>
 <20140717103645.GD17877@ulmo> <53C87D2F.9000906@samsung.com>
 <53CCD5A8.6090406@samsung.com> <20140721091917.GK8843@ulmo>
 <53CCF70A.5010403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10325 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751179AbaGVDl0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 23:41:26 -0400
In-reply-to: <53CCF70A.5010403@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Paul Mundt <paul.mundt@gmail.com>, Imre Deak <imre.deak@intel.com>

Hi,

On 07/21/2014 08:18 PM, Andrzej Hajda wrote:
> On 07/21/2014 11:19 AM, Thierry Reding wrote:
>> On Mon, Jul 21, 2014 at 10:56:08AM +0200, Andrzej Hajda wrote:
>>> On 07/18/2014 03:49 AM, YoungJun Cho wrote:
>>>> Hi Thierry,
>>>>
>>>> Thank you a lot for kind comments.
>>>>
>>>> On 07/17/2014 07:36 PM, Thierry Reding wrote:
>>>>> On Thu, Jul 17, 2014 at 06:01:25PM +0900, YoungJun Cho wrote:
>>>>> [...]
>>>>>> diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c b/drivers/gpu/drm/panel/panel-s6e3fa0.c
>>>>> [...]
>>>>>> +/* Manufacturer Command Set */
>>>>>> +#define MCS_GLOBAL_PARAMETER	0xb0
>>>>>> +#define MCS_AID			0xb2
>>>>>> +#define MCS_ELVSSOPT		0xb6
>>>>>> +#define MCS_TEMPERATURE_SET	0xb8
>>>>>> +#define MCS_PENTILE_CTRL	0xc0
>>>>>> +#define MCS_GAMMA_MODE		0xca
>>>>>> +#define MCS_VDDM		0xd7
>>>>>> +#define MCS_ALS			0xe3
>>>>>> +#define MCS_ERR_FG		0xed
>>>>>> +#define MCS_KEY_LEV1		0xf0
>>>>>> +#define MCS_GAMMA_UPDATE	0xf7
>>>>>> +#define MCS_KEY_LEV2		0xfc
>>>>>> +#define MCS_RE			0xfe
>>>>>> +#define MCS_TOUT2_HSYNC		0xff
>>>>>> +
>>>>>> +/* Content Adaptive Brightness Control */
>>>>>> +#define DCS_WRITE_CABC		0x55
>>>>> Is this not a manufacturer specific command? I couldn't find it in the
>>>>> DSI or DCS specifications, but it sounds like something standard (also
>>>>> indicated by the DCS_ prefix). Can you point out the specification for
>>>>> this?
>>>>>
>>>> Andrzej commented before and decided it as DCS one because if the value
>>>> is less than 0xb0, it is DCS one and the others are MCS one.
>>>> But still I'm not sure it is correct.
>>> I would not say 'decided'. I have just stated that according to DCS
>>> specification
>>> it should be DCS command (below 0xb0), but it is not present in mipi dcs
>>> specs.
>>> On the other side many panels have it [1]:
>>>
>>> [1]:
>>> https://www.google.com/search?q=%22Write+Content+Adaptive+Brightness+Control%22
>>
>> Yeah, my search yielded similar results. I wonder if this is perhaps
>> part of a draft future specification. I'll try to ask around some more
>> if anybody knows what the status of this is.
>>
>>>>>> +static void s6e3fa0_read_mtp_id(struct s6e3fa0 *ctx)
>>>>>> +{
>>>>>> +	unsigned char id[MTP_ID_LEN];
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	s6e3fa0_set_maximum_return_packet_size(ctx, MTP_ID_LEN);
>>>>>> +	ret = s6e3fa0_dcs_read(ctx, MIPI_DCS_GET_DISPLAY_ID, id, MTP_ID_LEN);
>>>>> This also looks like a standard DCS command. I can't find it in either
>>>>> v1.01 nor v1.02 of the specification, though. Do you know where it's
>>>>> specified?
>>>>>
>>>> Yes, I also can't find it in DCS specification and there is no special
>>>> description in panel datasheet.
>>>> But as it is declared in "include/video/mipi_display.h", so I think it
>>>> is a standard one.
>>>
>>> On page 9 of the "Introduction of MIPI by Renesas" [2] there is info
>>> it is a part of "Nokia I/F command list", I guess it is kind of alpha
>>> version of MIPI DCS.
>>>
>>> [2]: http://wenku.baidu.com/view/658fab68af1ffc4ffe47acbe.html
>>
>> That link is the only one which contains "Nokia I/F command list" on the
>> internet (that is, according to Google). But since this is already part
>> of the mipi_display.h header file we may as well use it.
>>
>> I wonder if perhaps the READ_DDB_START and READ_DDB_CONTINUE commands
>> could be used as a replacement for this display ID.
>>

There is a simple description for "Read DDB Start(A1H)" like below.
- This command returns supplier identification and display module model 
/ revision information.
- NOTE: This information is not the same what Read IDs(04H) command is 
returning.

For reference, Read IDs(04H) description is like below.
- This read command returns 24-bit display identification information.
- The first read byte identifies the OLED module's manufacturer.
- The Second read byte is used to track the OLED module/driver version.
- The third read byte identifies the OLED module/driver.

>> Adding Guennadi, Tomi, Paul and Imre on Cc since they were involved with
>> the original patch that added mipi_display.h. Perhaps they remember what
>> the origin of this command is.
>
>
> I guess it was PCF8833 used in Nokia 6100 [1][2].
>
> [1]: http://www.vintagecomputercables.com/datasheet/PCF8833_1.pdf
> [2]:
> http://www.elecfreaks.com/store/download/datasheet/shield/6100_Display_Driver.pdf
>

Yes, this command is related with Nokia.

Last Friday, I met panel vendor guy for some issues.
At the break time, I asked him for about this Read IDs(04H), why it is 
not included in DCS specification.
He said that this command was originated by Nokia.
In feature phone times, most of panel vendors wanted their panels to be 
used by Nokia and Nokia wanted this command, so most of panel vendors 
still provide this command traditionally.

Thank you.
Best regards YJ

> Regards
> Andrzej
>
>>
>> Thierry
>>
>
>
