From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Remove unneeded unit names in
 Exynos5433 nodes
Date: Tue, 10 Jan 2017 16:03:53 -0300
Message-ID: <9ee4d297-51fd-fd37-e4e4-1a939a644201@osg.samsung.com>
References: <1484069912-6534-1-git-send-email-javier@osg.samsung.com>
 <1484069912-6534-4-git-send-email-javier@osg.samsung.com>
 <20170110185109.n3x25yxbaarzikcd@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170110185109.n3x25yxbaarzikcd@kozik-lap>
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

On 01/10/2017 03:51 PM, Krzysztof Kozlowski wrote:

[snip]

>>  
>> -		usbdrd30: usb@15400000  {
>> +		usbdrd30: usb-0  {
> 
> How about "usbdrd" instead of "usb-0"? It would be still quite a generic
> description of a class.
> 
>>  			compatible = "samsung,exynos5250-dwusb3";
>>  			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
>>  				<&cmu_fsys CLK_SCLK_USBDRD30>;
>> @@ -1332,7 +1332,7 @@
>>  			status = "disabled";
>>  		};
>>  
>> -		usbhost30: usb@15a00000 {
>> +		usbhost30: usb-1 {
> 
> usbhost?
> 

Indeed, these sounds better so I'll change for them.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
