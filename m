From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 3/8] pinctrl: samsung: Add support for pad retention
 control for Exynos5433 SoCs
Date: Mon, 30 Jan 2017 11:39:54 +0100
Message-ID: <91de6eca-f70f-d4c9-732e-c48621347ac5@samsung.com>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083402eucas1p187d3d31f62544fc46fae99fc5f74dbfe@eucas1p1.samsung.com>
 <1485419634-28331-4-git-send-email-m.szyprowski@samsung.com>
 <20170126194811.rori5j5hmclniqig@kozik-lap>
 <20170127180203.eacwbyb2noqjpmgw@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20170127180203.eacwbyb2noqjpmgw@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 2017-01-27 19:02, Krzysztof Kozlowski wrote:
> On Thu, Jan 26, 2017 at 09:48:11PM +0200, Krzysztof Kozlowski wrote:
>> On Thu, Jan 26, 2017 at 09:33:49AM +0100, Marek Szyprowski wrote:
>>> This patch adds support for retention control for Exynos5433 SoCs. Three
>>> groups of pins has been defined for retention control: common shared group
>>> for ALIVE, CPIF, eSE, FINGER, IMEM, NFC, PERIC, TOUCH pin banks and
>>> separate control for FSYS and AUD pin banks, for which PMU retention
>>> registers match whole banks.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/pinctrl/samsung/pinctrl-exynos.c    | 58 +++++++++++++++++++++++++++++
>>>   include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++++
> I already have some non-conflicting changes to exynos-regs-pmu.h in my
> branch. Now I want to add some more which will create conflicts.
>
> How about splitting the header to separate patch, so I will take it to
> my exynos-pmu branch?

Okay, I will split this into 2 patches.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
