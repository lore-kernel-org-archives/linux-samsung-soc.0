From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/4] Fix problems with Exynos4412 ISP clocks
Date: Tue, 03 Oct 2017 08:03:02 +0200
Message-ID: <ec302c3d-c120-320a-dd58-4d26a9294907@samsung.com>
References: <CGME20171002104824eucas1p1f9795b5403b6cd599b1e33e9dc7b604f@eucas1p1.samsung.com>
        <20171002104759.25944-1-m.szyprowski@samsung.com>
        <20171002173631.lgkqfrtbacyzqeml@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171002173631.lgkqfrtbacyzqeml@kozik-lap>
Content-language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 2017-10-02 19:36, Krzysztof Kozlowski wrote:
> On Mon, Oct 02, 2017 at 12:47:55PM +0200, Marek Szyprowski wrote:
>> Exynos4412 ISP clock controller is located in the SOC area, which belongs
>> to ISP power domain. This was not properly handled by the current
>> Exynos4-clk driver. This patchset instantiates a separate clock driver
>> for those clocks, updates all clients of ISP clocks and ensures that
>> the driver is properly integrated in ISP power domin using runtime PM
>> feature of the clock framework.
>>
>> This finally solves all the mysterious freezes in accessing ISP clocks
>> when ISP power domain is disabled.
>>
>> The last patch breaks support for old dtbs. It can be applied when all
>> boards are updated. Exynos4412 ISP subsystem is only used by Trats2
>> boards, for which kernel is updated always together with the dtb file,
>> so the last patch can be applied to the next kernel release after merging
>> the DTS patch.
> I am fine with this approach. However I see that third patch (dts)
> depends on previous so it will also wait one cycle. arm-soc folks for
> some time do not accept code mixed with dts.
>
> Unless you can split dts into two patches: adding new clock controller
> and removing old. In such case the new clock could be applied in
> parallel to clk code changes.

DTS patch cannot be split into two patches without breaking ISP support,
because adding a new clock controller requires changes in the clients and
register resource size of the old one, so either old or new one has to be
fully defined. If arm-soc cannot pull mixed branches, then I'm okay with
postponing DTS changes by one release.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

