From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC PATCH 05/14] ARM: dts: samsung-fimd: add I80 specific
 properties
Date: Thu, 17 Apr 2014 14:33:37 +0900
Message-ID: <534F67B1.2020001@samsung.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
 <1397540862-21359-6-git-send-email-yj44.cho@samsung.com>
 <1673300.nbbjNiKf1K@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1673300.nbbjNiKf1K@avalon>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Laurent

Thank you for the comment.

On 04/17/2014 06:26 AM, Laurent Pinchart wrote:
> Hi YoungJun,
>
> Thank you for the patch.
>
> On Tuesday 15 April 2014 14:47:33 YoungJun Cho wrote:
>> In case of using CPU interface panel, the relevant registers should be set.
>> So this patch adds relevant dt bindings.
>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   .../devicetree/bindings/video/samsung-fimd.txt     |    9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> b/Documentation/devicetree/bindings/video/samsung-fimd.txt index
>> 2dad41b..924c2e1 100644
>> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> @@ -44,6 +44,15 @@ Optional Properties:
>>   - display-timings: timing settings for FIMD, as described in document [1].
>>   		Can be used in case timings cannot be provided otherwise
>>   		or to override timings provided by the panel.
>> +- samsung,sysreg-phandle: handle to syscon used to control the system

Oops... I have to change "samsung,sysreg-phandle" to "samsung,sysreg".

>> registers +- vidout-i80-ldi: boolean to support i80 interface instead of
>> rgb one +- cs-setup: clock cycles for the active period of address signal
>> enable until +	chip select is enable in i80 interface
>> +- wr-setup: clock cycles for the active period of CS signal enable until
>> +	write signal is enable in i80 interface
>> +- wr-act: clock cycles for the active period of CS enable in i80 interface
>> +- wr-hold: clock cycles for the active period of CS disable until write
>> signal +	is disable in i80 interface
>
> Shouldn't the interface parameters be considered as a property of the slave
> device instead ? The bus master side is programmable, and different slaves
> would have different timing requirements. I think it would make more sense to
> specify the timings on the slave (panel) side and query them dynamically at
> runtime. Depending on the slave the timings could be hardcoded in the driver
> (as they're usually an intrinsic property of the slave) or partially or fully
> specified in the slave DT node.
>

Yes, you're right. These properties are related to panel in a sense.

But my intention is to use these properties to fimd node in the board
specific dts file, because it decides the interface with panel and
these are required by fimd only.

If dynamic query is more logical approach, I should find some ways
with considering probing order.

Thank you.
Best regards YJ

>>   The device node can contain 'port' child nodes according to the bindings
>> defined in [2]. The following are properties specific to those nodes:
>
