From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: exynos: Add missing unit name to
 Exynos7 SoC node
Date: Tue, 10 Jan 2017 16:55:52 -0300
Message-ID: <e60bf634-d60d-7316-76a9-3b2f2f1480e8@osg.samsung.com>
References: <1484069912-6534-1-git-send-email-javier@osg.samsung.com>
 <1484069912-6534-2-git-send-email-javier@osg.samsung.com>
 <20170110184728.2nff4r634ics4wb3@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170110184728.2nff4r634ics4wb3@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/10/2017 03:47 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 10, 2017 at 02:38:30PM -0300, Javier Martinez Canillas wrote:
>> This patch fixes the following DTC warning about a mismatch
>> between a device node reg property and its unit name:
>>
>> Node /soc has a reg or ranges property, but no unit name
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> index 80aa60e38237..0d2fedc6ac2f 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> @@ -69,7 +69,7 @@
>>  		method = "smc";
>>  	};
>>  
>> -	soc: soc {
>> +	soc: soc@0 {
> 
> This looks unnatural, like a fix just to silence the DTC. Mostly de do
> not enumerate soc node, although there are few exceptions.
>

Yes, but OTOH arm32 Exynos SoCs just have an empty "ranges" property in their
soc device node (parent and child address space is the same, no translation)
so DTC doesn't complain about the unit address in those.

But others SoCs DTSI with a non-empty ranges property have an unit name in
their soc nodes, i.e for arm64 and arm32:

arch/arm64/boot/dts/marvell/berlin4ct.dtsi

arch/arm/boot/dts/da850.dtsi
 
> I would prefer ignore the warning... however I am happy to hear other opinions.
>

If is wrong/unnatural to have addresses for soc nodes then I think DTC should
be patched to ignore these (like it will be the case for the OPP nodes AFAIU).

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
