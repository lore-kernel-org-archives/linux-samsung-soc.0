From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Samsung: Add Exynos4 device tree enabled board
 file
Date: Fri, 14 Oct 2011 07:22:15 -0500
Message-ID: <4E982977.7000305@gmail.com>
References: <1318342396-26178-1-git-send-email-thomas.abraham@linaro.org>
 <1318342396-26178-2-git-send-email-thomas.abraham@linaro.org>
 <20111013175110.GJ18574@ponder.secretlab.ca>
 <000201cc8a64$6775ae30$36610a90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <000201cc8a64$6775ae30$36610a90$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/14/2011 06:28 AM, Kukjin Kim wrote:


>>> diff --git a/arch/arm/mach-exynos4/Kconfig
> b/arch/arm/mach-exynos4/Kconfig
>>> index 0c5888a..39dc135 100644
>>> --- a/arch/arm/mach-exynos4/Kconfig
>>> +++ b/arch/arm/mach-exynos4/Kconfig
>>> @@ -304,6 +304,20 @@ config MACH_SMDK4412
>>>  	help
>>>  	  Machine support for Samsung SMDK4412
>>>
>>> +comment "Flattened Device Tree based board for Exynos4 based SoC"
>>> +
>>> +config MACH_EXYNOS4_DT
> 
> I'm not sure we can use 'MACH_EXYNOS4_DT' here because there are other
> EXYNOS4 SoCs such as EXYNOS4212 and EXYNOS4412. So if this cannot support
> other SoCs' boards, SMDK4212 and SMDK4412, we need to change the name.
> 
> And I wonder whether there is no problem with selecting this and other
> boards.

I think this should be fine assuming most things are common. Generally,
the differences can be handled by different DT's. The board compatible
string can be used to handle differences.

Rob
