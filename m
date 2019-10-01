From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: memory-controllers: Add Exynos5422
 DMC interrupts description
Date: Tue, 1 Oct 2019 17:58:52 +0200
Message-ID: <74f31100-7503-e333-fa51-ca218b45bb98@partner.samsung.com>
References: <20191001125436.24086-1-l.luba@partner.samsung.com>
 <CGME20191001125444eucas1p2e4254acf8434e1fadf0e208dbe62b2d7@eucas1p2.samsung.com>
 <20191001125436.24086-2-l.luba@partner.samsung.com>
 <20191001131807.GB30129@pi3>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191001131807.GB30129@pi3>
Content-Language: en-US
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, willy.mh.wolff.ml@gmail.com, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org



On 10/1/19 3:18 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 01, 2019 at 02:54:33PM +0200, Lukasz Luba wrote:
>> Add description for optional interrupt lines. It provides a new operation
>> mode, which uses internal performance counters interrupt when overflow.
>> This is more reliable than using default polling mode implemented in
>> devfreq.
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   .../bindings/memory-controllers/exynos5422-dmc.txt     | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
>> index 02aeb3b5a820..afc38aea6b1c 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
>> +++ b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
>> @@ -31,6 +31,13 @@ Required properties for DMC device for Exynos5422:
>>   	The register offsets are in the driver code and specyfic for this SoC
>>   	type.
>>   
>> +Optional properties for DMC device for Exynos5422:
>> +- interrupt-parent : The parent interrupt controller.
>> +- interrupts : Contains the IRQ line numbers for the DMC internal performance
>> +  event counters. Align with specification of the interrupt line(s) in the
>> +  interrupt-parent controller.
>> +- interrupt-names : List of IRQ names.
> 
> Since the names are important (not the order) they are part of the
> bindings and they must be listed here.

Good point, thanks. I will add it to the description.

Regards,
Lukasz
