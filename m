From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] [media] exynos-gsc: Fix imprecise external abort due
 disabled power domain
Date: Fri, 20 Jan 2017 07:06:06 -0300
Message-ID: <c72965a4-d6e0-f3e7-1140-039274f7e60b@osg.samsung.com>
References: <1484699402-28738-1-git-send-email-javier@osg.samsung.com>
 <CGME20170118003022epcas3p34cf03bb6feb830c4fa231497f2536d0e@epcas3p3.samsung.com>
 <1484699402-28738-2-git-send-email-javier@osg.samsung.com>
 <cc9c6837-7141-b63c-ddf6-68252493df11@samsung.com>
 <842737f2-3faf-7b22-c480-93e183bbb670@osg.samsung.com>
 <d727576a-fbce-eb54-3b74-270c689b7fa3@osg.samsung.com>
 <c1d00b28-0252-0fb1-eb7c-5fc69035f12f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c1d00b28-0252-0fb1-eb7c-5fc69035f12f@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 01/20/2017 05:37 AM, Marek Szyprowski wrote:

[snip]

>>   I'll post a proper patch for the exynos5800.dtsi, to override the
>> clocks in the gsc_pd device node.
>>
>> I also see that the two power domains that fail to be disabled msc_pd
>> (power-domain@10044120) and isp_pd (power-domain@10044020) don't have
>> clocks defined in the exynos54xx.dtsi. I'll add clocks for those too.
> 
> Please send this patch instead of adding more clocks to the power domains.
> This way we will avoid adding more dependencies to userspace (DT ABI).
> Likely those clocks are also needed to access any device in that power
> domains.
> 
> Later, once the runtime PM for clocks get merged, a patch for exynos542x
> clocks driver can be made to replace IS_CRITICAL with proper runtime
> handling.
> 

Ok, I thought that we didn't want to mark more clocks as CLK_IGNORE_UNUSED
or CLK_IS_CRITICAL but I agree this can be done as a temporary workaround
until a proper runtime PM based solution gets merged.

> Best regards

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
