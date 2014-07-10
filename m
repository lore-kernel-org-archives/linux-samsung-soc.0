From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH v5 05/14] drm/exynos: dsi: add pass TE host ops to support
 LCD I80 interface
Date: Thu, 10 Jul 2014 10:06:07 +0900
Message-ID: <53BDE6FF.1000600@samsung.com>
References: <1404779987-5337-1-git-send-email-yj44.cho@samsung.com>
 <1404779987-5337-6-git-send-email-yj44.cho@samsung.com>
 <20140709152207.GA17359@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140709152207.GA17359@ulmo>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/10/2014 12:22 AM, Thierry Reding wrote:
> On Tue, Jul 08, 2014 at 09:39:38AM +0900, YoungJun Cho wrote:
>> To support LCD I80 interface, the DSI host calls this function
>> to notify the panel tearing effect synchronization signal to
>> the CRTC device manager to trigger to transfer video image.
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 11 +++++++++++
>>   include/drm/drm_mipi_dsi.h              |  7 +++++++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index dad543a..76e34ca 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -24,6 +24,7 @@
>>   #include <video/mipi_display.h>
>>   #include <video/videomode.h>
>>
>> +#include "exynos_drm_crtc.h"
>>   #include "exynos_drm_drv.h"
>>
>>   /* returns true iff both arguments logically differs */
>> @@ -1041,10 +1042,20 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
>>   	return (ret < 0) ? ret : xfer.rx_done;
>>   }
>>
>> +static void exynos_dsi_host_pass_te(struct mipi_dsi_host *host)
>> +{
>> +	struct exynos_dsi *dsi = host_to_dsi(host);
>> +	struct drm_encoder *encoder = dsi->encoder;
>> +
>> +	if (dsi->state & DSIM_STATE_ENABLED)
>> +		exynos_drm_crtc_te_handler(encoder->crtc);
>> +}
>> +
>>   static const struct mipi_dsi_host_ops exynos_dsi_ops = {
>>   	.attach = exynos_dsi_host_attach,
>>   	.detach = exynos_dsi_host_detach,
>>   	.transfer = exynos_dsi_host_transfer,
>> +	.pass_te = exynos_dsi_host_pass_te,
>>   };
>>
>>   static int exynos_dsi_poweron(struct exynos_dsi *dsi)
>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> index 944f33f..3f21bea 100644
>> --- a/include/drm/drm_mipi_dsi.h
>> +++ b/include/drm/drm_mipi_dsi.h
>> @@ -49,6 +49,12 @@ struct mipi_dsi_msg {
>>    * @detach: detach DSI device from DSI host
>>    * @transfer: send and/or receive DSI packet, return number of received bytes,
>>    * 	      or error
>> + * @pass_te: call the crtc te_handler() callback from DSI host.
>> + *	     The panel generates tearing effect synchronization signal between
>> + *	     MCU and FB to display video images. And the display controller
>> + *	     should trigger to transfer video image at this signal. So the panel
>> + *	     receives the TE IRQ, then calls this function to notify it to the
>> + *	     display controller.
>>    */
>>   struct mipi_dsi_host_ops {
>>   	int (*attach)(struct mipi_dsi_host *host,
>> @@ -57,6 +63,7 @@ struct mipi_dsi_host_ops {
>>   		      struct mipi_dsi_device *dsi);
>>   	ssize_t (*transfer)(struct mipi_dsi_host *host,
>>   			    struct mipi_dsi_msg *msg);
>> +	void (*pass_te)(struct mipi_dsi_host *host);
>
> I've objected to this particular change before and that objection still
> stands. I don't see how this is related to DSI. It seems like an
> implementation detail of this particular setup and I think it should be
> handled differently (within the Exynos DSI controller implementation
> possibly).
>

Okay, I understand what you mean.
As you know, this function is called by panel TE interrupt handler, so 
it could be accessed by panel.
Do you have any good idea for panel to access exynos_drm_dsi directly 
without mipi_dis_host_ops?

Thank you.
Best regards YJ

> Laurent also asked you to split this up into two patches, one for the
> core part, the other for the Exynos driver parts, yet this patch
> contains both changes.
>
> Thierry
>
