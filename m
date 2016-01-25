From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RESEND v2 1/2] clk: samsung: Don't build ARMv8 clock drivers on
 ARMv7
Date: Mon, 25 Jan 2016 18:10:31 +0900
Message-ID: <56A5E687.3060209@samsung.com>
References: <1453683021-6998-1-git-send-email-k.kozlowski@samsung.com>
 <1453683021-6998-2-git-send-email-k.kozlowski@samsung.com>
 <4282078.QlIpNj3Oa6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <4282078.QlIpNj3Oa6@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 25.01.2016 17:59, Arnd Bergmann wrote:
> On Monday 25 January 2016 09:50:20 Krzysztof Kozlowski wrote:
>>
>> +# ARM64 SoCs (e.g. Exynos5433, Exynos7):
>> +config EXYNOS_ARM64_COMMON_CLK
>> +       def_bool ARCH_EXYNOS
>> +       depends on ARM64 || COMPILE_TEST
>> +       select COMMON_CLK_SAMSUNG
>>
> 
> So you always enable it on ARM64 when ARCH_EXYNOS is enabled, but
> enable it silently on ARM32 when COMPILE_TEST is set?

Hmm... indeed it would better to make it toggle-able when COMPILE_TEST.

> That sounds wrong. How about
> 
> config EXYNOS_ARM64_COMMON_CLK
> 	bool "EXYNOS 64-bit clock support" if COMPILE_TEST
> 	default ARM64 && ARCH_EXYNOS
> 	depends on (ARM64 && ARCH_EXYNOS) || COMPILE_TEST
> 	select COMMON_CLK_SAMSUNG

Although this looks more complicated but it does the trick. Thanks for
the hint. Only one (not related directly to this change) issue - with
COMPILE_TEST the "EXYNOS 64-bit clock support" option goes above the
common clock framework (up to drivers section) because it is not part of
the Clocks menu. I'll fix it in v3.

Best regards,
Krzysztof
