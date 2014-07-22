From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Tue, 22 Jul 2014 19:20:14 +0900
Message-ID: <53CE3ADE.9050905@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-11-git-send-email-yj44.cho@samsung.com>
 <20140717103645.GD17877@ulmo> <53C87D2F.9000906@samsung.com>
 <53CCD5A8.6090406@samsung.com> <20140721091917.GK8843@ulmo>
 <53CCF70A.5010403@samsung.com> <53CDDD61.6000005@samsung.com>
 <20140722074935.GC18258@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140722074935.GC18258@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Tomi Valkeinen <tomi.valkeinen@ti.com>, Paul Mundt <paul.mundt@gmail.com>, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry,

On 07/22/2014 04:49 PM, Thierry Reding wrote:
> On Tue, Jul 22, 2014 at 12:41:21PM +0900, YoungJun Cho wrote:
>> On 07/21/2014 08:18 PM, Andrzej Hajda wrote:
>>> On 07/21/2014 11:19 AM, Thierry Reding wrote:
>>>> On Mon, Jul 21, 2014 at 10:56:08AM +0200, Andrzej Hajda wrote:
>>>>> On 07/18/2014 03:49 AM, YoungJun Cho wrote:
>>>>>> On 07/17/2014 07:36 PM, Thierry Reding wrote:
>>>>>>> On Thu, Jul 17, 2014 at 06:01:25PM +0900, YoungJun Cho wrote:
> [...]
>>>>>>>> +static void s6e3fa0_read_mtp_id(struct s6e3fa0 *ctx)
>>>>>>>> +{
>>>>>>>> +	unsigned char id[MTP_ID_LEN];
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	s6e3fa0_set_maximum_return_packet_size(ctx, MTP_ID_LEN);
>>>>>>>> +	ret = s6e3fa0_dcs_read(ctx, MIPI_DCS_GET_DISPLAY_ID, id, MTP_ID_LEN);
>>>>>>> This also looks like a standard DCS command. I can't find it in either
>>>>>>> v1.01 nor v1.02 of the specification, though. Do you know where it's
>>>>>>> specified?
>>>>>>>
>>>>>> Yes, I also can't find it in DCS specification and there is no special
>>>>>> description in panel datasheet.
>>>>>> But as it is declared in "include/video/mipi_display.h", so I think it
>>>>>> is a standard one.
>>>>>
>>>>> On page 9 of the "Introduction of MIPI by Renesas" [2] there is info
>>>>> it is a part of "Nokia I/F command list", I guess it is kind of alpha
>>>>> version of MIPI DCS.
>>>>>
>>>>> [2]: http://wenku.baidu.com/view/658fab68af1ffc4ffe47acbe.html
>>>>
>>>> That link is the only one which contains "Nokia I/F command list" on the
>>>> internet (that is, according to Google). But since this is already part
>>>> of the mipi_display.h header file we may as well use it.
>>>>
>>>> I wonder if perhaps the READ_DDB_START and READ_DDB_CONTINUE commands
>>>> could be used as a replacement for this display ID.
>>>>
>>
>> There is a simple description for "Read DDB Start(A1H)" like below.
>> - This command returns supplier identification and display module model /
>> revision information.
>> - NOTE: This information is not the same what Read IDs(04H) command is
>> returning.
>>
>> For reference, Read IDs(04H) description is like below.
>> - This read command returns 24-bit display identification information.
>> - The first read byte identifies the OLED module's manufacturer.
>> - The Second read byte is used to track the OLED module/driver version.
>> - The third read byte identifies the OLED module/driver.
>
> Okay, that explains things a little better. Can you point me to the
> document that this is from?

Sorry, I forgot to write specification name.
This specification is s6e3fa0 data sheet and it is confidential.
So I quoted only that portion.

>
> But what I was trying to say is that if the Read IDs command isn't an
> official DCS command, maybe it would be a better idea to use the DDB
> instead. I assume that even if it isn't the same information it would
> at least be a superset and therefore a suitable replacement.

This panel has several versions and each should set specific tuning 
value especially for AID, ELVSS and etc.
(Current is suitable for id[2] == 0x23).

I'll check READ_DDB_START & READ_DDB_CONTINUE result and try to use them 
if it is possible.

Thank you.
Best regards YJ

>
> Thierry
>
