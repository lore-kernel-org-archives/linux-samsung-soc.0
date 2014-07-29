From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Tue, 29 Jul 2014 22:08:47 +0900
Message-ID: <53D79CDF.1030005@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-11-git-send-email-yj44.cho@samsung.com>
 <20140717103645.GD17877@ulmo> <53C87D2F.9000906@samsung.com>
 <20140721093549.GL8843@ulmo> <53CDE0D4.7060105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14030 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461AbaG2NIu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 09:08:50 -0400
In-reply-to: <53CDE0D4.7060105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com

Hi Thierry,

Sorry for late reply.

I implemented common DSI helper functions and tested in s6e3fa0 panel
(I should test with other panels).

The helper function prototypes are like below:

int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
						u16 size);

int mipi_dcs_enter_sleep_mode(struct mipi_dsi_device *dsi);
int mipi_dcs_exit_sleep_mode(struct mipi_dsi_device *dsi);
int mipi_dcs_set_display_off(struct mipi_dsi_device *dsi);
int mipi_dcs_set_display_on(struct mipi_dsi_device *dsi);
int mipi_dcs_set_tear_off(struct mipi_dsi_device *dsi);

enum mipi_dcs_tear_mode {
	MIPI_DCS_TEAR_MODE_VBLANK,
	MIPI_DCS_TEAR_MODE_HVBLANK,
};

int mipi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
				enum mipi_dcs_tear_mode mode);

Last time you recommended to implement mipi_dcs_set_tear_on() unrelated 
with mipi_dsi_dcs_write().
As you know, the only difference between mipi_dcs_xxx() except 
mipi_dcs_set_tear_on() is data(dcs command).
So I think it's better to use mipi_dsi_dcs_write() instead.
Do you agree?

And one more thing.
 From my point of view there is no initialization sequence in simple 
panel driver, so this and s6e8aa0 panel couldn't use that interface.
The s6e3fa0 and s6e8aa0 are very similar so I think it is possible to 
combine together like simple panel driver.
I want to ask you for advice on this.

Thank you.
Best regards YJ

On 07/22/2014 12:56 PM, YoungJun Cho wrote:
> Hi Thierry,
>
> Now I understand what you mean.
>
> I'll implement common DSI helper functions.
>
> Thank you.
> Best regards YJ
>
> On 07/21/2014 06:35 PM, Thierry Reding wrote:
>> On Fri, Jul 18, 2014 at 10:49:35AM +0900, YoungJun Cho wrote:
>>> Hi Thierry,
>>>
>>> Thank you a lot for kind comments.
>>>
>>> On 07/17/2014 07:36 PM, Thierry Reding wrote:
>>>> On Thu, Jul 17, 2014 at 06:01:25PM +0900, YoungJun Cho wrote:
>> [...]
>>>>> diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c
>>>>> b/drivers/gpu/drm/panel/panel-s6e3fa0.c
>> [...]
>>>>> +static void s6e3fa0_set_maximum_return_packet_size(struct s6e3fa0
>>>>> *ctx,
>>>>> +                            unsigned int size)
>>>>> +{
>>>>> +    struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>>>>> +    const struct mipi_dsi_host_ops *ops = dsi->host->ops;
>>>>> +
>>>>> +    if (ops && ops->transfer) {
>>>>> +        unsigned char buf[] = {size, 0};
>>>>> +        struct mipi_dsi_msg msg = {
>>>>> +            .channel = dsi->channel,
>>>>> +            .type = MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
>>>>> +            .tx_len = sizeof(buf),
>>>>> +            .tx_buf = buf
>>>>> +        };
>>>>> +
>>>>> +        ops->transfer(dsi->host, &msg);
>>>>> +    }
>>>>> +}
>>>>
>>>> The Set Maximum Return Packet Size command is a standard command, so
>>>> please turn that into a generic function exposed by the DSI core.
>>>>
>>>
>>> For this and below standard DCS commands, you want to use generic
>>> functions,
>>> but I have no idea for that.
>>> Could you explain more detail?
>>
>> The goal should be to make these standard DCS commands available to all
>> DSI peripherals, so the implementation should look something like this:
>>
>> static int mipi_dsi_set_maximum_return_packet_size(struct
>> mipi_dsi_device *dsi,
>>                            u16 size)
>> {
>>     struct mipi_dsi_msg msg;
>>
>>     if (!dsi->ops || !dsi->ops->transfer)
>>         return -ENOSYS;
>>
>>     memset(&msg, 0, sizeof(msg));
>>     msg.channel = dsi->channel;
>>     msg.type = MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE;
>>     msg.tx_len = sizeof(size);
>>     msg.tx_buf = &size;
>>
>>     return dsi->ops->transfer(dsi->host, &msg);
>> }
>>
>> The above is somewhat special, since it isn't DCS. For DCS I'd suggest a
>> common prefix, like so:
>>
>> enum mipi_dcs_tear_mode {
>>     MIPI_DCS_TEAR_VBLANK,
>>     MIPI_DCS_TEAR_BLANK,
>> };
>>
>> static int mipi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
>>                 enum mipi_dcs_tear_mode mode)
>> {
>>     u8 data[2] = { MIPI_DSI_DCS_SET_TEAR_ON, mode };
>>     struct mipi_dsi_msg msg;
>>
>>     if (!dsi->ops || !dsi->ops->transfer)
>>         return -ENOSYS;
>>
>>     memset(&msg, 0, sizeof(msg));
>>     msg.channel = dsi->channel;
>>     msg.type = MIPI_DSI_DCS_SHORT_WRITE_PARAM;
>>     msg.tx_len = sizeof(data);
>>     msg.tx_buf = data;
>>
>>     return dsi->ops->transfer(dsi->host, &msg);
>> }
>>
>> Thierry
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
