From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 1/8] soc: samsung: Add exynos chipid driver support
Date: Fri, 5 Apr 2019 10:49:46 +0200
Message-ID: <3a381f69-da67-384a-dfe2-22e38c5570f7@samsung.com>
References: <CGME20190404172224epcas2p21b449c0ae8e36f7e800ae67c18db35a2@epcas2p2.samsung.com>
        <20190404171735.12815-1-s.nawrocki@samsung.com>
        <20190404171735.12815-2-s.nawrocki@samsung.com>
        <CAJKOXPdtdvQg69PLO4+aGAWjth-NzGToJUUPN0Jw6=zTCz9Bbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdtdvQg69PLO4+aGAWjth-NzGToJUUPN0Jw6=zTCz9Bbw@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 4/5/19 08:53, Krzysztof Kozlowski wrote:
> On Thu, 4 Apr 2019 at 19:22, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>>
>> Exynos SoCs have Chipid, for identification of product IDs and SoC
>> revisions. This patch intends to provide initialization code for all
>> these functionalities, at the same time it provides some sysfs entries
>> for accessing these information to user-space.

>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> [m.szyprowski: for suggestion and code snippet of product_id_to_soc_id]
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> Toy need to add your SoB here.

Will correct that in next iteration.

>> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
>> new file mode 100644
>> index 000000000000..5cb018807817
>> --- /dev/null
>> +++ b/drivers/soc/samsung/exynos-chipid.c
>> @@ -0,0 +1,111 @@

>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
> 
> I commented Bartlomiej's patch which you included here. I did not
> receive any further feedback from him so I do not know whether he
> agrees with my comments or not... but if you send the same patch again
> without addressing these comments, I feel like ignored.
> 
> I stopped on first ignored comment.
> 
> Therefore please address be sure that you addressed my comments from
> Bartlomiej's patchset. If you do not agree with them, please let me
> know. The comments are here:
> https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=43565&state=*

I will drop that unneeded header inclusion in next iteration.  It was 
just my oversight, I somehow missed your previous comments.  And of
course your reviews are appreciated. 

-- 
Regards,
Sylwester
