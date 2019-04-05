From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 2/8] soc: samsung: Exynos chipid driver update
Date: Fri, 5 Apr 2019 12:04:18 +0200
Message-ID: <5d80718b-57ad-33cd-80ff-03c01266a143@samsung.com>
References: <CGME20190404172229epcas2p25a819e37035b26ccf53613e880bdcacf@epcas2p2.samsung.com>
        <20190404171735.12815-1-s.nawrocki@samsung.com>
        <20190404171735.12815-3-s.nawrocki@samsung.com>
        <CAJKOXPcJrctz5E8GX2ke804FBifpfYm5D_=H4MguTg_Cq2CPng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcJrctz5E8GX2ke804FBifpfYm5D_=H4MguTg_Cq2CPng@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 4/5/19 11:22, Krzysztof Kozlowski wrote:
> On Thu, 4 Apr 2019 at 19:22, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>>
>> This patch adds definition of selected CHIP ID register offsets
>> and register bit field definitions for Exynos5422 SoC.
>>
>> exynos_chipid_read() helper function is added to allow reading
>> the CHIP ID block registers.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>  drivers/soc/samsung/exynos-chipid.c | 16 +++++-----
>>  drivers/soc/samsung/exynos-chipid.h | 48 +++++++++++++++++++++++++++++
>>  2 files changed, 57 insertions(+), 7 deletions(-)
>>  create mode 100644 drivers/soc/samsung/exynos-chipid.h
>>
>> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
>> index 5cb018807817..4920f0ef2c55 100644
>> --- a/drivers/soc/samsung/exynos-chipid.c
>> +++ b/drivers/soc/samsung/exynos-chipid.c
>> @@ -16,10 +16,7 @@

>> -#define EXYNOS_SUBREV_MASK     (0xF << 4)
>> -#define EXYNOS_MAINREV_MASK    (0xF << 0)
>> -#define EXYNOS_REV_MASK                (EXYNOS_SUBREV_MASK | EXYNOS_MAINREV_MASK)
>> -#define EXYNOS_MASK            0xFFFFF000
> 
> Create hex-addresses in first commit in lower case.

>> +static void __iomem *exynos_chipid_base;
> 
> No, this was removed in Pankaj's version v6 -> v7 and I do not want it
> to be file-scope. Having it file-scope is error prone and prevents
> having multiple instances (I do not expect having more than one but
> still code should be rather nicely generic).

I'm going to switch to using regmap so that will not be needed any 
more, together with exynos_chipid_read() helper. Then the header
file would be moved to include/linux/soc/samsung.
 
>> +unsigned int exynos_chipid_read(unsigned int offset)
>> +{
>> +       return readl_relaxed(exynos_chipid_base + offset);
>> +}

>> diff --git a/drivers/soc/samsung/exynos-chipid.h b/drivers/soc/samsung/exynos-chipid.h
>> new file mode 100644
>> index 000000000000..826a12c25fa2
>> --- /dev/null
>> +++ b/drivers/soc/samsung/exynos-chipid.h
>> @@ -0,0 +1,48 @@

>> +#define EXYNOS_CHIPID_REG_PRO_ID       0x00
>> + #define EXYNOS_SUBREV_MASK            (0xf << 4)
>> + #define EXYNOS_MAINREV_MASK           (0xf << 0)
>> + #define EXYNOS_REV_MASK               (EXYNOS_SUBREV_MASK | \
>> +                                        EXYNOS_MAINREV_MASK)
>> + #define EXYNOS_MASK                   0xfffff000
>> +
>> +#define EXYNOS_CHIPID_REG_PKG_ID       0x04
> 
> Can you comment that these are fields from this register?
> The same in second one.

OK, I will add some comment here.
 
>> + #define EXYNOS5422_IDS_OFFSET         24
>> + #define EXYNOS5422_IDS_MASK           0xff
-- 
Regards,
Sylwester
