From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC v2 PATCH v2 06/14] drm/exynos: support MIPI DSI command mode
Date: Wed, 23 Apr 2014 10:18:13 +0900
Message-ID: <535714D5.6050609@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-7-git-send-email-yj44.cho@samsung.com>
 <20140422073442.GC11766@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140422073442.GC11766@ulmo>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, sachin.kamat@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Thierry

Thank you for the comments.

On 04/22/2014 04:34 PM, Thierry Reding wrote:
> On Mon, Apr 21, 2014 at 09:28:33PM +0900, YoungJun Cho wrote:
> [...]
>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> index 7209df1..244d197 100644
>> --- a/include/drm/drm_mipi_dsi.h
>> +++ b/include/drm/drm_mipi_dsi.h
>> @@ -49,6 +49,7 @@ struct mipi_dsi_msg {
>>    * @detach: detach DSI device from DSI host
>>    * @transfer: send and/or receive DSI packet, return number of received bytes,
>>    * 	      or error
>> + * @te_handler: call CRTC TE handler callback from DSI host
>
> Perhaps you can explain some more what this means or why it would be
> necessary.

I'll enhance the explanation.

For your information, the panel generates Tearing Effect signal
to synchronize between the MCU and Frame Memory Writing when displays
video images.
The display controller requires this signal to trigger video images,
and there is no way to receive this signal directly.
So the panel receive this signal as an IRQ and calls te_handler() chain
for the display controller to trigger video image at that time.

>
>> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
>> index c2ab77a..0ad64ed 100644
>> --- a/include/drm/drm_panel.h
>> +++ b/include/drm/drm_panel.h
>> @@ -46,6 +46,13 @@ struct drm_panel {
>>   	struct list_head list;
>>   };
>>
>> +struct drm_panel_cpu_timings {
>> +	unsigned int cs_setup;
>> +	unsigned int wr_setup;
>> +	unsigned int wr_act;
>> +	unsigned int wr_hold;
>> +};
>
> Similarily here. What's this?

I'll enhance the explanation also.
In panel DT bindings, I already explained them.

Thank you.
Best regards YJ

>
> Thierry
>
