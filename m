From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v8 1/3] ARM: EXYNOS: Add support for EXYNOS5410 SoC
Date: Thu, 24 Apr 2014 18:01:06 +0200
Message-ID: <53593542.9010106@samsung.com>
References: <1397459860-21869-1-git-send-email-t.dakhran@samsung.com>
 <1397459860-21869-2-git-send-email-t.dakhran@samsung.com>
 <5617478.sn2TYu7iO3@wuerfel> <534BCD88.4020108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <534BCD88.4020108@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tarek Dakhran <t.dakhran@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, Chander Kashyap <chander.kashyap@linaro.org>, Romain Naour <romain.naour@openwide.fr>, Tarek Dakhran <t.dakhran@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tarek,

On 14.04.2014 13:59, Tarek Dakhran wrote:
> On 04/14/2014 03:03 PM, Arnd Bergmann wrote:
>> On Monday 14 April 2014 11:17:38 Tarek Dakhran wrote:
>>> --- a/arch/arm/mach-exynos/exynos.c
>>> +++ b/arch/arm/mach-exynos/exynos.c
>>> @@ -159,6 +159,15 @@ static struct map_desc exynos5250_iodesc[]
>>> __initdata = {
>>>          },
>>>   };
>>> +static struct map_desc exynos5410_iodesc[] __initdata = {
>>> +       {
>>> +               .virtual        = (unsigned long)S5P_VA_SYSRAM_NS,
>>> +               .pfn            =
>>> __phys_to_pfn(EXYNOS5410_PA_SYSRAM_NS),
>>> +               .length         = SZ_4K,
>>> +               .type           = MT_DEVICE,
>>> +       },
>>> +};
>>> +
>>>   static struct map_desc exynos5_iodesc[] __initdata = {
>> NAK
>>
>> Why does this keep coming up?
>>
>>     Arnd
>>
> We need this memory region because boot address for exynos5410 located
> here, same as for 5250.
>

Is there really no way to map this region dynamically in the entity 
(driver, source file, whatever) that actually uses it? The goal is to 
get rid of all the static mappings entirely, so adding new one makes us 
further from it.

Best regards,
Tomasz
