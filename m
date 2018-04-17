From: andi@etezian.org
Subject: Re: [PATCH] ARM: dts: exynos: Update x and y properties for mms114
 touchscreen
Date: Wed, 18 Apr 2018 03:06:39 +0900
Message-ID: <f75382b5953a9f4f9f80bb0db5b2f249@etezian.org>
References: <CGME20180126060503epcas2p4befe2d3d43f4a2158b1e1a123bf7906f@epcas2p4.samsung.com>
 <20180126060454.18082-1-andi.shyti@samsung.com>
 <20180417153207.fgfg5f4msggbtiuu@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417153207.fgfg5f4msggbtiuu@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Simon Shields <simon@lineageos.org>, Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 18.04.2018 00:32, Krzysztof Kozlowski wrote:
> On Fri, Jan 26, 2018 at 03:04:54PM +0900, Andi Shyti wrote:
>> The mms114 binding [1] specifies that the 'x' and 'y' should be
>> called respectively 'touchscreen-size-x' and 'touchscreen-size-y'
>> in coherence with the touchscreen [2] binding.
>> 
>> Update the mms114 node for trats2 and trats dts according to the
>> binding.
>> 
>> [1] Documentation/devicetree/bindings/input/touchscreen/mms114.txt
>> [2] 
>> Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>> 
>> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
>> ---
>> Hi Krzysztof,
>> 
>> this patch depends on Simon's patchset [1] and must be applied after
>> that. If you want I can ping you when the patch gets or you can take
>> it in the next cycle.
>> 
>> Andi
>> 
>> [1] https://marc.info/?l=linux-kernel&m=151682273403098&w=2
>> 
> 
> Hi Andi,
> 
> As I understand, the dependencies are in and I can take this?

Thanks a lot, somehow I missed it,

Please take it.

Thank you,
Andi
