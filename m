From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4] ARM: dts: exynos: Enable HDMI for Arndale Octa board
Date: Wed, 31 Aug 2016 09:18:03 +0200
Message-ID: <28fd9360-47b9-5e96-cec3-dc01a47e7071@samsung.com>
References: <20160831060847.1350-1-woogyom.kim@gmail.com>
 <b6337c5b-90a3-21a3-a0b9-a5c4809e5ee1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <b6337c5b-90a3-21a3-a0b9-a5c4809e5ee1@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrzej Hajda <a.hajda@samsung.com>, Milo Kim <woogyom.kim@gmail.com>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/31/2016 08:54 AM, Andrzej Hajda wrote:
> On 08/31/2016 08:08 AM, Milo Kim wrote:
>> * GPIO for HDMI hot plug detect
>>   GPX3_7 is used. The HPD awareness is done when the GPIO is active high.
>>
>> * Enable HDMI block in Exynos5420
>>   HDMI VDD and PLL consume 1.0V LDO6 (PVDD_ANAIP_1V0) and HDMI oscillator
>>   requires 1.8V LDO7 (PVDD_ANAIP_1V8).
>>
>> * Support HDMI display data channel
>>   I2C #2 is assigned for the HDMI DDC. It enables the EDID access.
>>
>> Cc: Kukjin Kim <kgene@kernel.org>
>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-samsung-soc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
> 
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Thanks, applied with Andrzej's review.

Best regards,
Krzysztof
