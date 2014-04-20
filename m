From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC PATCH v2 05/14] ARM: dts: samsung-fimd: add I80 specific
 properties
Date: Sun, 20 Apr 2014 09:34:44 +0900
Message-ID: <53531624.8070802@samsung.com>
References: <534F67B1.2020001@samsung.com>
 <1397735629-24028-1-git-send-email-yj44.cho@samsung.com>
 <53511B71.8090506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53511B71.8090506@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej

Thank you for comments.

On 04/18/2014 09:32 PM, Andrzej Hajda wrote:
> Hi again,
>
> On 04/17/2014 01:53 PM, YoungJun Cho wrote:
>> In case of using CPU interface panel, the relevant registers should be set.
>> So this patch adds relevant dt bindings.
>>
>> Changelog v2:
>> - Changes "samsung,sysreg-phandle" to "samsung,sysreg"
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   .../devicetree/bindings/video/samsung-fimd.txt     |    9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> index 2dad41b..6ea1adc 100644
>> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> @@ -44,6 +44,15 @@ Optional Properties:
>>   - display-timings: timing settings for FIMD, as described in document [1].
>>   		Can be used in case timings cannot be provided otherwise
>>   		or to override timings provided by the panel.
>> +- samsung,sysreg: handle to syscon used to control the system registers
>> +- vidout-i80-ldi: boolean to support i80 interface instead of rgb one
>> +- cs-setup: clock cycles for the active period of address signal enable until
>> +	chip select is enable in i80 interface
>> +- wr-setup: clock cycles for the active period of CS signal enable until
>> +	write signal is enable in i80 interface
>> +- wr-act: clock cycles for the active period of CS enable in i80 interface
>> +- wr-hold: clock cycles for the active period of CS disable until write signal
>> +	is disable in i80 interface
>
> As Laurent wrote earlier it would be good to consider providing these
> properties
> by panel. Panel can pass it to DSI probably via mipi_dsi_device
> structure. DSI to FIMD
> can use exynos drm_framework probably.
> Anyway if you add optional properties please add info about default
> value, ie when property
> is not present.

You and Laurent thought these CPU timings should be in panel.

Ok, how about that vidout-i80-ldi is remained in fimd board specific DT
entry and other CPU timings relevant properties are moved to panel for
considering probe order?

That's because the IRQ resource of fimd should be "lcd_sys" for I80
interface and decided in probe time(bind time after adopting super
device node).
But the fimd probe routine is prior to panel probe routine and
it is also ugly that fimd parses the properties of panel DT for that.

Do you have any better idea?

Thank you
Best regards YJ

>
> Regards
> Andrzej
>
>>
>>   The device node can contain 'port' child nodes according to the bindings defined
>>   in [2]. The following are properties specific to those nodes:
>
>
