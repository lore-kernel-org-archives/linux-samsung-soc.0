From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: remove the cd-gpios property for eMMC of
 odroid-xu3/4
Date: Tue, 22 Nov 2016 08:51:16 +0100
Message-ID: <7e072e61-0a14-ebee-03ac-2eff4f029848@samsung.com>
References: <20161121071032.10183-1-jh80.chung@samsung.com>
 <CGME20161121170629epcas3p4ef4f3b98d44d31f456d75c33715f6b4a@epcas3p4.samsung.com>
 <20161121170605.GA8181@kozik-lap>
 <9ecce088-b91d-d51a-5a19-33476961d2ea@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <9ecce088-b91d-d51a-5a19-33476961d2ea-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 22.11.2016 02:24, Jaehoon Chung wrote:
> On 11/22/2016 02:06 AM, Krzysztof Kozlowski wrote:
>> On Mon, Nov 21, 2016 at 04:10:32PM +0900, Jaehoon Chung wrote:
>>> Odroid-xu3/4 didn't need to use the cd-gpios for detecting card.
>>> Because Host controller has the CDETECT register through SDx_CDN line.
>>> Host controller can know whether card is inserted or not with this
>>> register.
>>>
>>> When i have checked the Odroid-xu3/4, they are using CDETECT register.
>>> (Not using exteranl cd-gpio.)
>> Makes sense. Just one question: the sd0_cd pinctrl setting should stay,
>> right?
> Right, It needs to use SD0_CD function.
> I have tested on Odroid-XU3/XU4.
>
> Tested with the below cases.
>
> 1) On boot with SD-card (without eMMC)
> - Inserted eMMC : Detected
> - Removed eMMC : Detected
>
> 2) On boot with Sd-card (with eMMC)
> - Detected
>
> 3) On boot with eMMC 
> - Detected

I suspect that MMC device (or its parts) should be always awake to keep
working CDETECT register. With cd-gpio it should be possible to power it
off when unused but still having detection working, am I right? I am not
familiar enough with the code to be certain that it improves PM but it
could be the case.

My other question is about polling thread, original patch was developed
to avoid polling thread which caused occasional hangs, crashes and
unnecessary work. Since then lot of mmc code changed and I do not follow
these changes. So my question is if this patch will not re-enable polling?

Regards
Andrzej

>
> Best Regards,
> Jaehoon Chung
>
>> Best regards,
>> Krzysztof
>>
>>> Fixes: fb1aeedb61ad ("ARM: dts: add mmc detect gpio for exynos5422-odroidxu3")
>>> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>>> index 9e63328..05b9afdd 100644
>>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>>> @@ -510,7 +510,6 @@
>>>  &mmc_0 {
>>>  	status = "okay";
>>>  	mmc-pwrseq = <&emmc_pwrseq>;
>>> -	cd-gpios = <&gpc0 2 GPIO_ACTIVE_LOW>;
>>>  	card-detect-delay = <200>;
>>>  	samsung,dw-mshc-ciu-div = <3>;
>>>  	samsung,dw-mshc-sdr-timing = <0 4>;
>>> -- 
>>> 2.10.1
>>>
>>
>>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
