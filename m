From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 04/14] clk: max77686: Improve Maxim 77686 PMIC clocks
 binding
Date: Wed, 25 Jun 2014 20:13:20 +0200
Message-ID: <53AB1140.7070904@collabora.co.uk>
References: <1403202040-12641-1-git-send-email-javier.martinez@collabora.co.uk>	<1403202040-12641-5-git-send-email-javier.martinez@collabora.co.uk> <CAD=FV=VezCMpYiD6vj_SkPYVM30GWF_YiRZVGyLHDD0-EbD+7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VezCMpYiD6vj_SkPYVM30GWF_YiRZVGyLHDD0-EbD+7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Doug,

Thanks a lot for your feedback.

On 06/25/2014 08:06 PM, Doug Anderson wrote:
> Javier,
> 
> On Thu, Jun 19, 2014 at 11:20 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> @@ -33,6 +38,6 @@ Example: Clock consumer node
>>         foo@0 {
>>                 compatible = "bar,foo";
>>                 /* ... */
>> -               clock-names = "my-clock";
>> -               clocks = <&max77686 2>;
>> +               clock-names = "32khz_pmic";
>> +               clocks = <&max77686 MAX77686_CLK_PMIC>;
> 
> A minor comment here is that you probably shouldn't change "clock-names".
> 
> The "clock-names" is the consumer's concept of the clock name and not
> the producer's concept.  If this clock were specified as going into
> the TPM, for instance, the TPM might call it "32k-reference".  Then
> the TPM would get the clock by referring to this name in its driver.
> 
> -Doug
> 

You're right. I won't change the clock names in the next version of the patch-set.

Best regards,
Javier
