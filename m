From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v6 2/3] ARM: dts: add TOPEET itop elite based board
Date: Fri, 16 Sep 2016 14:09:15 -0400
Message-ID: <1e4335db-9004-bb7c-6dc1-e435e66b8126@osg.samsung.com>
References: <1473285535-21996-1-git-send-email-ayaka@soulik.info>
 <1473285535-21996-3-git-send-email-ayaka@soulik.info>
 <CGME20160916072303eucas1p2941ba2907605055f5ea5abb2e6891d77@eucas1p2.samsung.com>
 <6bd9905d-0818-a917-8b8e-6abce134a3d3@kernel.org>
 <865b9f84-385f-fea8-2e3d-2b31e3bfe84c@soulik.info>
 <20160916172110.GA7511@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160916172110.GA7511@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, ayaka <ayaka@soulik.info>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Randy,

On 09/16/2016 01:21 PM, Krzysztof Kozlowski wrote:

[snip]

>>>> +	
>>>> +	beep {
>>>> +		compatible = "pwm-beeper";
>>>> +		pwms = <&pwm 0 4000000 PWM_POLARITY_INVERTED>;
>>> I have serious doubts that you run this code... if it does not even
>>> compile. Sorry, I cannot accept code that does not compile and was not
>>> tested.
>>>
>>> Please, test your DTS on top of current Linux tree, which would be one of:
>>> 1. Linus' master branch: v4.8-rc6,
>>> 2. one of my branches (for-next, next/dt etc),
>> When I sent those patches, I tested in "Add linux-next specific files for
>> 20160907"
>
> OK, good, but please tell me why kbuild reported that build error?
>

I agree with Krzysztof, it doesn't seem that you tested the exact version
that was posted. You will need the following change to make the DTS build
in latest linux-next:

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index dd83689892ff..8559f891a740 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -14,6 +14,7 @@
 */
 
 /dts-v1/;
+#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos4412-itop-scp-core.dtsi"

So please squash that change and resend.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
