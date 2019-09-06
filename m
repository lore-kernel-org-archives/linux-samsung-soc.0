From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v13 0/8] Exynos5 Dynamic Memory Controller driver
Date: Fri, 6 Sep 2019 10:47:38 +0200
Message-ID: <2a6cab9f-1f14-64da-ad5a-c5bc66aa77eb@partner.samsung.com>
References: <CGME20190821104316eucas1p2ecd715f3105921ec83e0acf1291201f8@eucas1p2.samsung.com>
        <20190821104303.32079-1-l.luba@partner.samsung.com>
        <20190904184037.GD12918@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904184037.GD12918@kozik-lap>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org



On 9/4/19 8:40 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 21, 2019 at 12:42:55PM +0200, Lukasz Luba wrote:
>> Hi all,
>>
>> This is v13 which makes cosmetic changes. It is based on current mainline
>> (v5.3-rc5) with with devfreq/for-next where there is a PPMU patch [1].
>>
>> The patch set adds support of Dynamic Memory Controller for Exynos5422 SoC.
>> The driver supports Dynamic Voltage and Frequency Scaling
>> for the DMC and DRAM. It also provides needed timings for different
>> speed operations of the DRAM memory.
>> There is also new generic code in of_memory and headers which allows to parse
>> LPDDR3 memories defined in device-tree.
>>
>> Here are the last changes suggested by Krzysztof during his review.
>> For the previous changes in older revisions please refer to [2], there is
>> more detailed change log.
>>
>> changes:
>> v13:
>> - skipped patch with chipID changes in DT, since it is not used anymore,
>> - removed license comment in of_memory.c since SPDX has been merged,
>> - aligned comment to the current fields in the structure,
>> - changed printed warning when timings are not found,
>>
>> Regards,
>> Lukasz Luba
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git/commit/?h=for-next&id=b617376df8f01c975dee66802f4da16291f92079
>> [2] https://lkml.org/lkml/2019/7/22/251
>>
> 
> Thanks, applied entire set (except last defconfig patch) to two topic
> branches, either for v5.4 or for v5.5 (it is quite late). I'll take the
> last defconfig separately.
> 
> Automated tools found few issues to fix, please send incremental
> patches.
OK, there will be around 3 patches with fixes.
> 
> In general, for new drivers always run automated checks - Smatch and
> Sparse. Coccinelle is also recommended. Checkpatch pointed missing
> compatible documentation - need to be fixed (see
> https://elixir.bootlin.com/linux/v5.3-rc7/source/Documentation/devicetree/bindings/eeprom/at25.txt
> as an example).
As I have responded in my previous email, I ignored it since Elpida
lpddr2 does not have bindings documentation. I will create the needed
documentation file in the follow up patch.

Regards,
Lukasz
