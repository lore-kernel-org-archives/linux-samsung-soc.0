From: Anand Moon <moon.linux@yahoo.com>
Subject: Re: [PATCH 1/3] ARM: dts: exynos5422-odroidxu3: use cd-gpio method
 to detect sd-card
Date: Mon, 12 Oct 2015 14:47:32 +0000 (UTC)
Message-ID: <1111856990.2419183.1444661252893.JavaMail.yahoo@mail.yahoo.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
 <561B3739.4040701@samsung.com> <561B3A83.6090607@samsung.com>
Reply-To: Anand Moon <moon.linux@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <561B3A83.6090607@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jaehoon Chung <jh80.chung@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

On Monday, October 12, 2015 10:14 AM, Jaehoon Chung <jh80.chung@samsung.com> wrote:


Hi,

On 10/12/2015 01:29 PM, Krzysztof Kozlowski wrote:
> On 12.10.2015 00:46, Anand Moon wrote:
>> From: Jaehoon Chung <jh80.chung@samsung.com>
>>
>> To detect sd-card use the cd-gpio method.
>> It can decrease the interrupt for detecting sd-card.
>>
>> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>
>> ---
>> Changes based on git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git v4.4-next/dt-samsung branch
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> index 1af5bdc..26decbd 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> @@ -352,8 +352,10 @@
>>      samsung,dw-mshc-ciu-div = <3>;
>>      samsung,dw-mshc-sdr-timing = <0 4>;
>>      samsung,dw-mshc-ddr-timing = <0 2>;
>> +    cd-gpios = <&gpc2 2 GPIO_ACTIVE_HIGH>;
>> +    cd-inverted;
>>      pinctrl-names = "default";
>> -    pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
>> +    pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;

Don't do change this.

> 
> Anand,
> 
> You essentially reverted here af6ad88acbd6 ("ARM: dts: Mux XMMCnDATA[0]
> pad correctly for Exynos5420 boards"). Why? There is no explanation in
> the commit message about this.

I don't remember to send the patch relevant to this. Hmm...
Well, Is this patch really signed-off by me?

Best Regards,

Jaehoon Chung
> 
> Best regards,
> Krzysztof
> 

> 


Some how I don't receive these mail on my email id.

I have picked up these changes from tizen repository for OdroidXU3.
I have tested with this changes to detect UHS-I micro cd cards.
That's the reason for this email. 


If it's wrong then I will drop it.

-Anand Moon

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
