From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v8 1/3] ARM: EXYNOS: initial board support for exynos5260
 SoC
Date: Wed, 16 Apr 2014 10:10:15 +0200
Message-ID: <534E3AE7.10907@gmail.com>
References: <1397620738-14431-1-git-send-email-rahul.sharma@samsung.com>	<1397620738-14431-2-git-send-email-rahul.sharma@samsung.com>	<534E3803.5010404@gmail.com>
 <CAK9yfHztqGWhUJ=PNc7L-epu48PkEM6=v6JFDZ1n52NBeOUB8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK9yfHztqGWhUJ=PNc7L-epu48PkEM6=v6JFDZ1n52NBeOUB8w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Pankaj Dubey <pankaj.dubey@samsung.com>, sunil joshi <joshi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Rahul Sharma <r.sh.open@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org



On 16.04.2014 10:08, Sachin Kamat wrote:
> Hi Tomasz,
>
> On 16 April 2014 13:27, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Rahul,
>>
>>
>> On 16.04.2014 05:58, Rahul Sharma wrote:
>>>
>>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>>
>>> This patch add basic arch side support for exynos5260 SoC.
>>>
>>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>>> ---
>>>    arch/arm/mach-exynos/Kconfig |    5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>>> index fc8bf18..bf4ed87 100644
>>> --- a/arch/arm/mach-exynos/Kconfig
>>> +++ b/arch/arm/mach-exynos/Kconfig
>>> @@ -84,6 +84,11 @@ config SOC_EXYNOS5250
>>>          help
>>>            Enable EXYNOS5250 SoC support
>>>
>>> +config SOC_EXYNOS5260
>>> +       bool "SAMSUNG EXYNOS5260"
>>> +       default y
>>> +       depends on ARCH_EXYNOS5
>>> +
>>>    config SOC_EXYNOS5420
>>>          bool "SAMSUNG EXYNOS5420"
>>>          default y
>>>
>>
>> Is this patch necessary now? After Sachin's consolidation series there are
>> no per SoC entries anymore.
>
> Kukjin still wanted individual SoCs to be selectable. Please refer [1].
>
> [1] http://www.spinics.net/lists/devicetree/msg27040.html

I don't think any valid reason was presented there. Features in code 
should not be selected using #ifdef CONFIG_ anymore, so I don't really 
see any reason to not proceed with this consolidation. Olof, Arnd?

Best regards,
Tomasz
